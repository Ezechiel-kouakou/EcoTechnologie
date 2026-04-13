<?php
require_once 'config.php';
require_once 'JWTManager.php'; 
header('Content-Type: application/json');

$headers = apache_request_headers();
$authHeader = $headers['Authorization'] ?? '';
$id_client = null;

if (preg_match('/Bearer\s(\S+)/', $authHeader, $matches)) {
    $token = $matches[1];
    $userData = JWTManager::validate($token);
    
    if ($userData) {
        $id_client = $userData['user_id']; 
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Session expirée.']);
        exit;
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Accès refusé.']);
    exit;
}

try {
    $pdo->beginTransaction();

    // 1. RÉCUPÉRATION DU PANIER AVEC LA TABLE DE STOCK CORRESPONDANTE
    // IMPORTANT : J'ai ajouté 'table_origine' qui doit être une colonne dans ton panier
    // Si tu n'as pas cette colonne, il faudra la rajouter à ta table 'ecotechparnier'
    $stmtItems = $pdo->prepare("SELECT id_produit, quantite_souhaitee, prix_unitaire, table_origine FROM ecotechparnier WHERE id_client = ?");
    $stmtItems->execute([$id_client]);
    $panierItems = $stmtItems->fetchAll();

    $montant = 0;
    foreach ($panierItems as $item) {
        $montant += ($item['quantite_souhaitee'] * $item['prix_unitaire']);
    }

    if (empty($panierItems) || $montant <= 0) {
        throw new Exception("Votre panier est vide.");
    }

    // 2. VÉRIFICATION ET DÉBIT BANCAIRE
    $stmt = $pdo->prepare("SELECT solde_bancaire FROM ecotechbank WHERE id_client = ? FOR UPDATE");
    $stmt->execute([$id_client]);
    $compte = $stmt->fetch();

    if (!$compte || $compte['solde_bancaire'] < $montant) {
        throw new Exception("Solde insuffisant.");
    }

    $updateBank = $pdo->prepare("UPDATE ecotechbank SET solde_bancaire = solde_bancaire - ? WHERE id_client = ?");
    $updateBank->execute([$montant, $id_client]);

    // 3. MISE À JOUR DYNAMIQUE DES STOCKS (Multi-tables)
    foreach ($panierItems as $item) {
        $tableDest = $item['table_origine']; // Ex: 'ecotechstock_tel'
        
        // Liste blanche des tables autorisées pour éviter les injections SQL
        $allowedTables = ['ecotechstock', 'ecotechstock_tel', 'ecotechstock_tv', 'ecotechstock_sons', 'ecotechstock_periphs'];
        
        if (in_array($tableDest, $allowedTables)) {
            // Ici on utilise 'quantite' car c'est le nom dans ton code admin
            $updateStock = $pdo->prepare("UPDATE $tableDest SET quantite = quantite - ? WHERE id_produit = ?");
            $updateStock->execute([$item['quantite_souhaitee'], $item['id_produit']]);
        }
    }

    // 4. VIDAGE DU PANIER
    $clearCart = $pdo->prepare("DELETE FROM ecotechparnier WHERE id_client = ?");
    $clearCart->execute([$id_client]);

    // Historique
    $stmtHist = $pdo->prepare("INSERT INTO banktransactions (id_client, description, montant) VALUES (?, 'Achat EcoTechShop Multicatégorie', ?)");
    $stmtHist->execute([$id_client, -$montant]);

    $pdo->commit();
    echo json_encode(['status' => 'success', 'message' => 'Paiement et stocks mis à jour.']);

} catch (Exception $e) {
    if ($pdo->inTransaction()) $pdo->rollBack();
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}