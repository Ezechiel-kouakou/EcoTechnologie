<?php
// api_public.php
header('Content-Type: application/json');
require_once 'config.php'; // Ta connexion PDO

$target = $_GET['target'] ?? '';

try {
    if ($target === 'get_feedbacks') {
        // La requête de jointure demandée
        $sql = "SELECT f.rating, u.username, f.created_at 
                FROM ecotech_feedbacks f
                JOIN users u ON f.user_id = u.id 
                ORDER BY f.created_at DESC 
                LIMIT 4";
        
        $stmt = $pdo->query($sql);
        $feedbacks = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode([
            "status" => "success",
            "data" => $feedbacks
        ]);
    }
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        "status" => "error", 
        "message" => $e->getMessage()
    ]);
}