
<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

require_once 'config.php';
require_once 'JWTManager.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = json_decode(file_get_contents('php://input'), true);
    $token = $input['token'] ?? '';

    if (empty($token)) {
        echo json_encode(['status' => 'error', 'message' => 'Token manquant']);
        exit;
    }

    try {
        $decoded = JWTManager::validate($token);
        if (!$decoded) {
            echo json_encode(['status' => 'error', 'message' => 'Session expirée']);
            exit;
        }

        $userId = $decoded['user_id'];

        // 1. Récupérer les infos de base de l'utilisateur
        $stmtUser = $pdo->prepare("SELECT username, email FROM users WHERE id = :id");
        $stmtUser->execute(['id' => $userId]);
        $user = $stmtUser->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            // 2. Récupérer les transactions AVEC la référence de commande associée
            // On lie 'banktransactions' et 'ecotech_commandes' via l'id_client
            // On utilise une marge de 10 secondes car les dates de création peuvent varier légèrement entre les deux tables
            $stmtTx = $pdo->prepare("
                SELECT 
                    bt.description, 
                    bt.montant, 
                    bt.date_transaction, 
                    ec.session_commande 
                FROM banktransactions bt
                LEFT JOIN ecotech_commandes ec ON bt.id_client = ec.id_client 
                AND ec.date_creation BETWEEN (bt.date_transaction - INTERVAL 10 SECOND) AND (bt.date_transaction + INTERVAL 10 SECOND)
                WHERE bt.id_client = :id 
                ORDER BY bt.date_transaction DESC 
                LIMIT 10
            ");
            
            $stmtTx->execute(['id' => $userId]);
            $transactions = $stmtTx->fetchAll(PDO::FETCH_ASSOC);

            echo json_encode([
                'status' => 'success',
                'data' => [
                    'username' => $user['username'],
                    'email' => $user['email'],
                    'transactions' => $transactions 
                ]
            ]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Utilisateur introuvable']);
        }

    } catch (Exception $e) {
        // En cas d'erreur SQL, on renvoie le message pour debugger si besoin
        echo json_encode(['status' => 'error', 'message' => 'Erreur technique : ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Méthode non autorisée']);
}