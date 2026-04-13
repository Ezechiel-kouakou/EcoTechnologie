<?php
require_once 'config.php';
require_once 'JWTManager.php';
header('Content-Type: application/json');

$data = json_decode(file_get_contents('php://input'), true);
$email = $data['email'] ?? '';
$password = $data['password'] ?? '';

try {
    $stmt = $pdo->prepare("SELECT id, username, email, password FROM users WHERE email = ?");
    $stmt->execute([$email]);
    $user = $stmt->fetch();

    if ($user && password_verify($password, $user['password'])) {
        
 
        $payload = [
            'user_id'  => $user['id'],
            'username' => $user['username'],
            'email'    => $user['email'],
            'iat'      => time()
        ];

        $token = JWTManager::generate($payload);

        echo json_encode([
            'status' => 'success',
            'token' => $token,
            'user' => [
                'id' => $user['id'], 
                'nom' => $user['username'],
                'email' => $user['email']
            ]
        ]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Identifiants EcoTech incorrects']);
    }
} catch (PDOException $e) {
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}