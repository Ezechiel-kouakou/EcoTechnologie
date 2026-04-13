<?php
header('Content-Type: application/json');
require_once 'config.php';
require_once './ecotech_api/JWTManager.php';

$headers = array_change_key_case(getallheaders(), CASE_LOWER);
$token = str_replace('Bearer ', '', $headers['authorization'] ?? '');

if ($decoded = JWTManager::validate($token)) {
    $user_id = $decoded['user_id'];
    
    // On passe 'lu' à 1 pour toutes les notifs non lues de ce client
    $stmt = $pdo->prepare("UPDATE ecotech_notifications SET lu = 1 WHERE id_client = ? AND lu = 0");
    $stmt->execute([$user_id]);
    
    echo json_encode(['status' => 'success']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Non autorisé']);
}