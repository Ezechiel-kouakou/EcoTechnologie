<?php
require_once 'config.php';
header('Content-Type: application/json');

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'POST') {
    $service = $_POST['service'] ?? null;
    $nom = $_POST['nom'] ?? '';
    $prenom = $_POST['prenom'] ?? '';
    $type = $_POST['type_demande'] ?? '';
    $message = $_POST['message'] ?? '';
    $session_id = $_POST['session_id'] ?? '';

    if (!$service || !$message || !$session_id) {
        echo json_encode(['status' => 'error', 'message' => 'Service, message et session requis']);
        exit;
    }

    $table = "";
    switch ($service) {
        case 'customer': $table = "ecotech_customer_messages"; break;
        case 'info': $table = "ecotech_info_messages"; break;
        case 'sales': $table = "ecotech_sales_messages"; break;
        default: echo json_encode(['status' => 'error', 'message' => 'Service inconnu']); exit;
    }

    try {
        $stmt = $pdo->prepare("INSERT INTO $table (nom, prenom, type_demande, message, session_id) VALUES (:nom, :prenom, :type, :message, :session_id)");
        $stmt->execute([
            ':nom' => $nom,
            ':prenom' => $prenom,
            ':type' => $type,
            ':message' => $message,
            ':session_id' => $session_id
        ]);
        echo json_encode(['status' => 'success', 'message' => 'Votre message a été envoyé avec succès !']);
    } catch (PDOException $e) {
        echo json_encode(['status' => 'error', 'message' => 'Erreur : ' . $e->getMessage()]);
    }

} else if ($method === 'GET') {
    $service = $_GET['service'] ?? null;
    $session_id = $_GET['session_id'] ?? null;

    if (!$service || !$session_id) {
        echo json_encode(['status' => 'error', 'message' => 'Paramètres manquants']);
        exit;
    }

    $table = "";
    switch ($service) {
        case 'customer': $table = "ecotech_customer_messages"; break;
        case 'info': $table = "ecotech_info_messages"; break;
        case 'sales': $table = "ecotech_sales_messages"; break;
        default: echo json_encode(['status' => 'error', 'message' => 'Service inconnu']); exit;
    }

    try {
        $stmt = $pdo->prepare("SELECT * FROM $table WHERE session_id = ? ORDER BY date_envoi ASC");
        $stmt->execute([$session_id]);
        $messages = $stmt->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode(['status' => 'success', 'messages' => $messages]);
    } catch (PDOException $e) {
        echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
    }
}
?>