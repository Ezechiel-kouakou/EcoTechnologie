<?php
require_once 'config.php';
session_start();
header('Content-Type: application/json');

$action = $_GET['action'] ?? '';

if ($action === 'register') {
    $nom = $_POST['nom'] ?? null;
    $prenom = $_POST['prenom'] ?? null;
    $email = $_POST['email'] ?? null;
    $pass_brut = $_POST['password'] ?? null;
    $service = $_POST['service'] ?? null;

    if (!$email || !$pass_brut) {
        echo json_encode(['status' => 'error', 'message' => 'Données manquantes dans le formulaire']);
        exit;
    }

    $password = password_hash($pass_brut, PASSWORD_DEFAULT);

    try {
        $stmt = $pdo->prepare("INSERT INTO ecotech_employes (nom, prenom, email, password, service) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([$nom, $prenom, $email, $password, $service]);
        echo json_encode(['status' => 'success', 'message' => 'Compte créé']);
    } catch (PDOException $e) {
        echo json_encode(['status' => 'error', 'message' => 'Email déjà utilisé ou erreur DB']);
    }
} 

if ($action === 'login') {
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';

    $stmt = $pdo->prepare("SELECT * FROM ecotech_employes WHERE email = ?");
    $stmt->execute([$email]);
    $user = $stmt->fetch();

    if ($user && password_verify($password, $user['password'])) {
        $_SESSION['staff_id'] = $user['id_staff'];
        $_SESSION['staff_nom'] = $user['nom'];
        $_SESSION['staff_service'] = $user['service'];
        echo json_encode(['status' => 'success', 'service' => $user['service']]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Identifiants incorrects']);
    }
}
?>