<?php
// ecotech-users-feedback.php
header('Content-Type: application/json');
require_once 'config.php';

try {
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    $rating = isset($data['rating']) ? intval($data['rating']) : 0;
    $token  = isset($data['token']) ? $data['token'] : '';

    $final_user_id = null; // Par défaut null (pour éviter le 0)

    if (!empty($token)) {
        // Décodage manuel du payload JWT
        $parts = explode('.', $token);
        if(count($parts) >= 2) {
            $payload = json_decode(base64_decode(str_replace(['-', '_'], ['+', '/'], $parts[1])), true);
            
            // On vérifie si c'est 'user_id' ou 'id' dans ton JWT
            if (isset($payload['user_id'])) {
                $final_user_id = intval($payload['user_id']);
            } elseif (isset($payload['id'])) {
                $final_user_id = intval($payload['id']);
            }
        }
    }

    // Préparation de l'insertion
    $sql = "INSERT INTO ecotech_feedbacks (user_id, rating, created_at) VALUES (:uid, :rating, NOW())";
    $stmt = $pdo->prepare($sql);
    
    // On lie les paramètres
    $stmt->bindValue(':uid', $final_user_id, $final_user_id === null ? PDO::PARAM_NULL : PDO::PARAM_INT);
    $stmt->bindValue(':rating', $rating, PDO::PARAM_INT);

    if ($stmt->execute()) {
        echo json_encode([
            "status" => "success", 
            "message" => "Avis enregistré avec succès !",
            "debug" => ["id_insere" => $final_user_id]
        ]);
    } else {
        $error = $stmt->errorInfo();
        throw new Exception("Erreur SQL : " . $error[2]);
    }

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        "status" => "error",
        "message" => $e->getMessage()
    ]);
}