<?php
require_once 'config.php';
    
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = json_decode(file_get_contents('php://input'), true);
    $username = $input['username'] ?? '';
    $email = $input['email'] ?? '';
    $password = $input['password'] ?? '';

    // --- NOUVEAU : GESTION DU MARCHAND ---
    $headers = getallheaders();
    $apiKey = $headers['X-API-KEY'] ?? $headers['x-api-key'] ?? null;
    $merchantId = null;

    if ($apiKey) {
        $stmtM = $pdo->prepare("SELECT id FROM merchants WHERE api_key = ?");
        $stmtM->execute([$apiKey]);
        $merchant = $stmtM->fetch();
        if (!$merchant) {
            echo json_encode(['status' => 'error', 'message' => 'Clé API invalide']);
            exit;
        }
        $merchantId = $merchant['id'];
    }
    // -------------------------------------

    if (empty($username) || empty($email) || empty($password)) {
        echo json_encode(['status' => 'error', 'message' => 'Tous les champs sont requis']);
        exit;
    }

    try {
        $pdo->beginTransaction();
        
        // On ajoute merchant_id dans l'INSERT (il sera NULL si inscription sur ton site)
        $stmt = $pdo->prepare("INSERT INTO users (username, email, password, merchant_id) VALUES (:username, :email, :password, :merchant_id)");
        $stmt->execute([
            ':username' => $username,
            ':email' => $email,
            ':password' => password_hash($password, PASSWORD_BCRYPT),
            ':merchant_id' => $merchantId
        ]);
        
        $userId = $pdo->lastInsertId();
        $solde_aleatoire = rand(1000, 10000);
        $numero_carte = "4000" . rand(10000000, 99999999) . rand(1000, 9999);
        $code_secret = rand(1000, 9999);

        $stmtBank = $pdo->prepare("INSERT INTO ecotechbank (id_client, solde_bancaire, numero_carte_ecotech, code_secret) VALUES (:id_client, :solde, :carte, :code)");
        $stmtBank->execute([
            ':id_client' => $userId,
            ':solde'     => $solde_aleatoire,
            ':carte'     => $numero_carte,
            ':code'      => $code_secret
        ]);
        
        $pdo->commit();

        echo json_encode([
            'status' => 'success', 
            'message' => 'Inscription réussie ! Un montant de ' . $solde_aleatoire . '€ a été crédité sur votre compte EcotechBank.',
            'merchant_mode' => ($merchantId ? true : false) // Pour savoir si ça vient d'une API
        ]);

    } catch (PDOException $e) {
        if ($pdo->inTransaction()) {
            $pdo->rollBack();
        }
        echo json_encode(['status' => 'error', 'message' => 'Erreur lors de l\'inscription : ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Méthode non autorisée']);
}
?>