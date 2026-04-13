<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

// 1. Gestion du Preflight (CORS)
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

require_once 'config.php';
require_once 'JWTManager.php';

// Fonction de secours pour récupérer le header Authorization
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

// 2. Extraction et validation du Token
$authHeader = getAuthorizationHeader();
$id_client = null;

if ($authHeader && preg_match('/Bearer\s(\S+)/', $authHeader, $matches)) {
    $token = $matches[1];
    $userData = JWTManager::validate($token);
    
    if ($userData) {
        $id_client = $userData['user_id']; 
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Session expirée, reconnectez-vous']);
        exit;
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Accès non autorisé : Token manquant']);
    exit;
}

// 3. Récupération des données JSON envoyées
$json = file_get_contents('php://input');
$data = json_decode($json, true);

$id_produit    = $data['id_produit'] ?? null;
$categorie     = $data['categorie'] ?? 'produit';
$action        = $data['action'] ?? 'plus'; 
$prix          = $data['prix'] ?? null;

// --- LOGIQUE DE SÉCURITÉ POUR TABLE_ORIGINE ---
// Si le JS envoie table_origine, on la prend. Sinon on la déduit de la catégorie.
$table_origine = $data['table_origine'] ?? null;

if (!$table_origine || $table_origine === 'ecotechstock') {
    $cat = strtolower(trim($categorie));
    $map = [
        'telephone' => 'ecotechstock_tel',
        'sons'      => 'ecotechstock_sons',
        'produit'   => 'ecotechstock',
        'tv'        => 'ecotechstock_tv',
        'periph'    => 'ecotechstock_periphs'
    ];
    $table_origine = $map[$cat] ?? 'ecotechstock';
}

if (!$id_produit || !$id_client) {
    echo json_encode(['status' => 'error', 'message' => 'Données du produit manquantes']);
    exit;
}

try {
    // 4. Vérification de l'existence du produit dans le panier
    $checking = $pdo->prepare("SELECT id_parnier, quantite_souhaitee FROM ecotechparnier WHERE id_client = ? AND id_produit = ? AND categorie = ?");
    $checking->execute([$id_client, $id_produit, $categorie]);
    $resultat = $checking->fetch(PDO::FETCH_ASSOC);

    if ($resultat) {
        // --- MISE À JOUR QUANTITÉ ---
        if ($action === 'plus') {
            $sql = "UPDATE ecotechparnier SET quantite_souhaitee = quantite_souhaitee + 1 WHERE id_parnier = ?";
            $pdo->prepare($sql)->execute([$resultat['id_parnier']]);
            $msg = 'Quantité augmentée';
        } else {
            if ($resultat['quantite_souhaitee'] > 1) {
                $sql = "UPDATE ecotechparnier SET quantite_souhaitee = quantite_souhaitee - 1 WHERE id_parnier = ?";
                $pdo->prepare($sql)->execute([$resultat['id_parnier']]);
                $msg = 'Quantité diminuée';
            } else {
                $sql = "DELETE FROM ecotechparnier WHERE id_parnier = ?";
                $pdo->prepare($sql)->execute([$resultat['id_parnier']]);
                $msg = 'Produit supprimé du panier';
            }
        }
        echo json_encode(['status' => 'success', 'message' => $msg]);

    } else if ($action === 'plus') {
        // --- NOUVEAU PRODUIT ---
        if ($prix === null) {
            echo json_encode(['status' => 'error', 'message' => 'Prix manquant pour l\'ajout']);
            exit;
        }

        // INSERTION avec la variable $table_origine sécurisée plus haut
        $sqlInsert = "INSERT INTO ecotechparnier (id_client, id_produit, categorie, table_origine, quantite_souhaitee, prix_unitaire) VALUES (?, ?, ?, ?, 1, ?)";
        $inserting = $pdo->prepare($sqlInsert);
        $inserting->execute([$id_client, $id_produit, $categorie, $table_origine, $prix]);
        
        echo json_encode(['status' => 'success', 'message' => 'Produit ajouté avec table: ' . $table_origine]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Action impossible']);
    }

} catch(PDOException $e) {
    http_response_code(500);
    echo json_encode(['status' => 'error', 'message' => 'Erreur SQL : ' . $e->getMessage()]);
}
?>