<?php
// ecotechbank_api/paiement_succes.php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once 'config.php';
require_once 'JWTManager.php';

// 1. RÉCUPÉRATION DES PARAMÈTRES
$token = $_GET['token'] ?? null;
$session_ref = $_GET['session_commande'] ?? null;
$id_client_direct = $_GET['id_client_direct'] ?? null;

$id_client = null;

// Diagnostic si page blanche
if (!$session_ref) {
    die("Erreur : session_commande manquante dans l'URL.");
}

// 2. IDENTIFICATION DU CLIENT (JWT ou Direct)
if ($id_client_direct) {
    $id_client = $id_client_direct;
} elseif ($token) {
    $userData = JWTManager::validate($token);
    if ($userData) {
        $id_client = $userData['user_id'];
    }
}

if (!$id_client) {
    die("Erreur : Impossible d'identifier le client (token invalide ou id_client_direct manquant).");
}

try {
    $pdo->beginTransaction();

    // 3. VÉRIFICATION COMMANDE EXTERNE (api_orders)
    $stmtExt = $pdo->prepare("SELECT * FROM api_orders WHERE order_token = ?");
    $stmtExt->execute([$session_ref]);
    $externalOrder = $stmtExt->fetch();

    if ($externalOrder) {
        // C'EST UN SITE TIERS
        $amount = $externalOrder['amount_total'];

        // --- OPTIONNEL : DÉBIT DU SOLDE (Sécurité) ---
        $updateBank = $pdo->prepare("UPDATE ecotechbank SET solde_bancaire = solde_bancaire - ? WHERE id_client = ? AND solde_bancaire >= ?");
        $updateBank->execute([$amount, $id_client, $amount]);
        
        if ($updateBank->rowCount() === 0) {
            throw new Exception("Solde insuffisant ou client introuvable.");
        }

        // Mise à jour de la commande
        $updateExt = $pdo->prepare("UPDATE api_orders SET status = 'success', buyer_id = ? WHERE order_token = ?");
        $updateExt->execute([$id_client, $session_ref]);

        // Historique
        $stmtHist = $pdo->prepare("INSERT INTO banktransactions (id_client, description, montant) VALUES (?, ?, ?)");
        $desc = "Paiement externe : " . ($externalOrder['description'] ?? 'Achat');
        $stmtHist->execute([$id_client, $desc, -$amount]);

        $pdo->commit();

        // REDIRECTION VERS LE MARCHAND
        $separator = (parse_url($externalOrder['return_url'], PHP_URL_QUERY)) ? "&" : "?";
        header("Location: " . $externalOrder['return_url'] . $separator . "status=success&token=" . $session_ref);
        exit;
    } 

    // 4. LOGIQUE INTERNE (Si ce n'est pas une commande api_orders)
    $stmt = $pdo->prepare("UPDATE ecotech_commandes SET statut = 'paye' WHERE session_commande = ? AND id_client = ?");
    $stmt->execute([$session_ref, $id_client]);

    $stmtDel = $pdo->prepare("DELETE FROM ecotechparnier WHERE id_client = ?");
    $stmtDel->execute([$id_client]);

    $pdo->commit();

    header("Location: /ecotechnologie/ecotechshop/thank.php?ref=" . urlencode($session_ref));
    exit;

} catch (Exception $e) {
    if ($pdo->inTransaction()) $pdo->rollBack();
    die("Erreur fatale : " . $e->getMessage());
}