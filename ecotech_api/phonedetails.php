<?php
require_once 'config.php';
header('Content-Type: application/json');

$id = $_GET['id_produit'] ?? null;

if (!$id) {
    echo json_encode(['status' => 'error', 'message' => 'ID manquant']);
    exit;
}

try {
    $stmt = $pdo->prepare("SELECT t.*, st.quantite 
              FROM telephone t 
              LEFT JOIN ecotechstock_tel st ON t.id_produit = st.id_produit WHERE t.id_produit = ?");
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
            $product['status_color'] = "";
        }
        echo json_encode(['status' => 'success', 'product' => $product]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Produit non trouvé']);
    }
} catch (PDOException $e) {
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}
?>