<?php
require_once 'config.php';
header('Content-Type: application/json');

try {
    $query = "SELECT p.*, s.quantite 
              FROM ecotechperiphs p 
              LEFT JOIN ecotechstock_periphs s ON p.id_produit = s.id_produit";
    
    $stmt = $pdo->query($query);
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($products as &$product) {
        $product['quantite'] = isset($product['quantite']) ? (int)$product['quantite'] : 0;
        
        if ($product['quantite'] >= 20) {
            $product['status'] = "Disponible";
            $product['status_color'] = "green";
        } elseif ($product['quantite'] > 0) {
            $product['status'] = "Stock limité";
            $product['status_color'] = "orange";
        } else {
            $product['status'] = "En rupture de stock";
            $product['status_color'] = "red";
        }
    }

    echo json_encode(['status' => 'success', 'products' => $products]);
    exit;

} catch (PDOException $e) {
    echo json_encode(['status' => 'error', 'message' => 'Erreur DB : ' . $e->getMessage()]);
    exit;
}
?>