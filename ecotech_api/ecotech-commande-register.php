<?php
// ecotech_api/save_order.php
require_once 'config.php';
require_once 'JWTManager.php';

header("Content-Type: application/json");

// Récupération des données JSON envoyées par le JS
$input = file_get_contents("php://input");
$data = json_decode($input, true);

$token = $data['token'] ?? '';

if ($userData = JWTManager::validate($token)) {
    try {
        // Préparation de l'insertion dans la table ecotech_commandes
        $stmt = $pdo->prepare("INSERT INTO ecotech_commandes 
            (id_client, session_commande, details_json, montant_total, statut) 
            VALUES (?, ?, ?, ?, 'attente')");
        
        $stmt->execute([
            $userData['user_id'],      
            $data['session_commande'], 
            $data['details_json'],     
            $data['montant_total']     
        ]);

        echo json_encode(["status" => "success"]);
    } catch (PDOException $e) {
        echo json_encode(["status" => "error", "message" => "Erreur BDD: " . $e->getMessage()]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Session expirée"]);
}