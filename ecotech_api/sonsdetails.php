<?php
require_once 'config.php';
header('Content-Type: application/json');

$id = $_GET['id_produit'] ?? null;

if (!$id) {
    echo json_encode(['status' => 'error', 'message' => 'ID manquant']);
    exit;
}

try {
    $stmt = $pdo->prepare("SELECT n.*, s.quantite 
              FROM sons n 
              LEFT JOIN ecotechstock_sons s ON n.id_produit = s.id_produit WHERE n.id_produit = ?");
    $stmt->execute([$id]);
    $product = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($product) {
        $q = (int)$product['quantite'];

        if ($q >= 20) {
            $product['status'] = "Disponible ($q unités)";
            $product['status_color'] = "green";
        } elseif ($q > 0) {
            $product['status'] = "Quantité limitée ($q unités)";
            $product['status_color'] = "orange";
        } else {
            $product['status'] = "En rupture de stock";
            $product['status_color'] = "red";
        }
        echo json_encode(['status' => 'success', 'product' => $product]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Produit non trouvé']);
    }
} catch (PDOException $e) {
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}
?>