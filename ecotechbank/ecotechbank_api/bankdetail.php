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
        echo json_encode(['status' => 'error', 'message' => 'Session expirée']);
        exit;
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Identification requise']);
    exit;
}

try {

    $stmt = $pdo->prepare("SELECT b.solde_bancaire, b.numero_carte_ecotech, u.username 
                           FROM ecotechbank b
                           JOIN users u ON b.id_client = u.id 
                           WHERE b.id_client = ?");
    $stmt->execute([$id_client]);
    $bankData = $stmt->fetch(PDO::FETCH_ASSOC);

    $stmtTrans = $pdo->prepare("SELECT description, montant, date_transaction 
                                FROM banktransactions 
                                WHERE id_client = ? 
                                ORDER BY date_transaction DESC 
                                LIMIT 10");
    $stmtTrans->execute([$id_client]);
    $transactions = $stmtTrans->fetchAll(PDO::FETCH_ASSOC);

    if ($bankData) {
        echo json_encode([
            "status" => "success",
            "data" => $bankData,
            "transactions" => $transactions
        ]);
    } else {
        echo json_encode(["status" => "error", "message" => "Aucun compte bancaire lié à ce profil"]);
    }

} catch (Exception $e) {
    echo json_encode(["status" => "error", "message" => "Erreur lors de la récupération des données"]);
}