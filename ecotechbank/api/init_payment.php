<?php
// Désactiver l'affichage des erreurs HTML pour ne pas casser le JSON
ini_set('display_errors', 0);
error_reporting(E_ALL);

require_once 'config.php'; // Vérifie que le chemin vers config.php est bon
header('Content-Type: application/json');

// Récupération de la clé API de manière universelle
$apiKey = $_SERVER['HTTP_X_API_KEY'] ?? '';

try {
    // 1. Vérification du marchand
    if (empty($apiKey)) {
        throw new Exception("Clé API absente des headers.");
    }

    $stmt = $pdo->prepare("SELECT id FROM merchants WHERE api_key = ?");
    $stmt->execute([$apiKey]);
    $merchant = $stmt->fetch();

    if (!$merchant) {
        throw new Exception("Marchand non reconnu (Clé API invalide).");
    }

    // 2. Lecture du JSON envoyé
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    if (!$data || !isset($data['amount'])) {
        throw new Exception("Données de paiement invalides ou incomplètes.");
    }

    $token = bin2hex(random_bytes(16));

    // 3. Insertion dans la table orders
    // Assure-toi que la table 'orders' a bien ces colonnes !
    $stmtOrder = $pdo->prepare("INSERT INTO api_orders (order_token, seller_id, amount_total, description, return_url, status) VALUES (?, ?, ?, ?, ?, 'pending')");
    
    $stmtOrder->execute([
        $token,
        $merchant['id'],
        $data['amount'],
        $data['description'] ?? 'Achat sans description',
        $data['return_url'],
    ]);

    echo json_encode([
        'status' => 'success',
        'checkout_url' => 'http://localhost/ecotechnologie/ecotechbank/api/bank_checkout.php?token=' . $token
    ]);

} catch (Exception $e) {
    echo json_encode([
        'status' => 'error',
        'message' => $e->getMessage()
    ]);
}