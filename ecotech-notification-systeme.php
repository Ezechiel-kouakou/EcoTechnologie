<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

require_once 'config.php';
require_once './ecotech_api/JWTManager.php';

// 1. Récupération du token (Headers ou URL pour le test)
$headers = array_change_key_case(getallheaders(), CASE_LOWER);
$authHeader = $headers['authorization'] ?? '';
$token = str_replace('Bearer ', '', $authHeader);

// Si pas de header, on regarde dans l'URL (pratique pour tes tests navigateurs)
if (!$token && isset($_GET['token'])) {
    $token = $_GET['token'];
}

if (!$token) {
    echo json_encode(['status' => 'error', 'message' => 'Token manquant']);
    exit;
}

try {
    // 2. Valider le token
    $decoded = JWTManager::validate($token); 

    if (!$decoded) {
        echo json_encode(['status' => 'error', 'message' => 'Token invalide ou expiré']);
        exit;
    }

    // --- LA CORRECTION EST ICI ---
    // On utilise $decoded car c'est là que JWTManager a stocké les infos
    $user_id = $decoded['user_id']; 

    // 3. Récupérer les notifications
    $stmt = $pdo->prepare("SELECT id_notif, titre, message, date_envoi, type_notif, lu
                           FROM ecotech_notifications 
                           WHERE id_client = ? 
                           ORDER BY date_envoi DESC LIMIT 10");
    $stmt->execute([$user_id]);
    $notifs = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode(['status' => 'success', 'notifs' => $notifs]);

} catch (Exception $e) {
    echo json_encode(['status' => 'error', 'message' => 'Erreur serveur : ' . $e->getMessage()]);
}