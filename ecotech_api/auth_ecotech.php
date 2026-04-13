<?php
// 1. En-têtes de sécurité et Configuration CORS
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *"); // Autorise les requêtes de n'importe quelle source
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

// 2. Gestion du Preflight (indispensable pour les requêtes fetch modernes)
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

require_once 'config.php';
require_once 'JWTManager.php'; 
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = json_decode(file_get_contents('php://input'), true);
    
    $useremail = isset($input['email']) ? trim($input['email']) : '';
    $password = isset($input['password']) ? $input['password'] : '';

    if (empty($useremail) || empty($password)) {
        echo json_encode(['status' => 'error', 'message' => 'Email et mot de passe requis']);
        exit;
    }
    
    try {
        $stmt = $pdo->prepare("SELECT id, username, email, password FROM users WHERE email = :email");
        $stmt->execute(['email' => $useremail]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            if (password_verify($password, $user['password'])) {

                $payload = [
                    'user_id'  => $user['id'],
                    'username' => $user['username'],
                    'email'    => $user['email'],
                    'iat'      => time()
                ];

                $token = JWTManager::generate($payload);

                echo json_encode([
                    'status' => 'success', 
                    'message' => 'Connexion réussie',
                    'token' => $token,
                    'user' => [
                        'email' => $user['email'],
                        'nom' => $user['username'] 
                    ]
                ]);
                exit;

            } else {
                echo json_encode(['status' => 'error', 'message' => 'Oups! votre email ou mot de passe incorrects veuillez réessayer.']);
                exit;
            }
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Oups! Aucun compte trouvé avec cet email de reessayer.']);
            exit;
        }
    } catch (PDOException $e) {

        echo json_encode(['status' => 'error', 'message' => 'Erreur technique de base de données']);
        exit;
    }
} else {
    http_response_code(405);
    echo json_encode([
        'status' => 'error', 
        'message' => 'Méthode non autorisée. Reçue : ' . $_SERVER['REQUEST_METHOD']
    ]);
    exit;
}