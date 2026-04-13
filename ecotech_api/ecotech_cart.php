<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

require_once 'config.php';
require_once 'JWTManager.php';

function getAuthorizationHeader() {
    $headers = null;
    if (isset($_SERVER['Authorization'])) {
        $headers = trim($_SERVER['Authorization']);
    } elseif (isset($_SERVER['HTTP_AUTHORIZATION'])) {
        $headers = trim($_SERVER['HTTP_AUTHORIZATION']);
    } elseif (function_exists('apache_request_headers')) {
        $requestHeaders = apache_request_headers();
        if (isset($requestHeaders['Authorization'])) {
            $headers = trim($requestHeaders['Authorization']);
        }
    }
    return $headers;
}

$authHeader = getAuthorizationHeader();
$id_client = null;

if ($authHeader && preg_match('/Bearer\s(\S+)/', $authHeader, $matches)) {
    $token = $matches[1];
    $userData = JWTManager::validate($token);
    
    if ($userData) {
        $id_client = $userData['user_id'];
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Session expirée']);
        exit;
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Token manquant']);
    exit;
}

try {
    $stmt = $pdo->prepare("SELECT id_produit, quantite_souhaitee, categorie, prix_unitaire FROM ecotechparnier WHERE id_client = ?");
    $stmt->execute([$id_client]);
    $items = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $final_cart = [];
    $total_general = 0;

    foreach ($items as $item) {
        $allowed_tables = ['telephone', 'sons', 'televisions', 'produit'];
        $table = in_array($item['categorie'], $allowed_tables) ? $item['categorie'] : 'produit';

        $detailsStmt = $pdo->prepare("SELECT nom, image FROM $table WHERE id_produit = ?");
        $detailsStmt->execute([$item['id_produit']]);
        $details = $detailsStmt->fetch(PDO::FETCH_ASSOC);

        if ($details) {
            $total_produit = $item['prix_unitaire'] * $item['quantite_souhaitee'];
            $total_general += $total_produit;

            $final_cart[] = [
                'id_produit' => $item['id_produit'],
                'nom'        => $details['nom'],
                'prix'       => $item['prix_unitaire'], 
                'image'      => $details['image'],
                'quantite'   => $item['quantite_souhaitee'],
                'categorie'  => $item['categorie'],
                'total_item' => $total_produit
            ];
        }
    }

    echo json_encode([
        'status' => 'success', 
        'cart' => $final_cart, 
        'total' => $total_general
    ]);

} catch (PDOException $e) {
    echo json_encode(['status' => 'error', 'message' => 'Erreur technique']);
}
?>