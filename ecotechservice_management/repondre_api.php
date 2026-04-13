<?php
require_once 'config.php';
session_start();
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_msg = $_POST['id_msg'];
    $reponse = $_POST['contenu_reponse'];
    $staff_id = $_SESSION['staff_id'];
    $service = $_SESSION['staff_service'];

    $table = "ecotech_" . $service . "_messages";

    try {
        $sql = "UPDATE $table SET reponse = ?, repondu_par = ?, statut = 'traite' WHERE id_msg = ?";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$reponse, $staff_id, $id_msg]);

        echo json_encode(['status' => 'success']);
    } catch (PDOException $e) {
        echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
    }
}
?>