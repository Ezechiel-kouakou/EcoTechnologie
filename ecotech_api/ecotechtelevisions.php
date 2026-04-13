<?php
require_once 'config.php';
header('Content-Type: application/json');

try {
    $query = "SELECT t.*, s.quantite, pr.pourcentage, pr.date_fin 
              FROM televisions t 
              LEFT JOIN ecotechstock_tv s ON t.id_produit = s.id_produit
              LEFT JOIN promos pr ON t.id_produit = pr.id_produit_ref 
                   AND pr.table_origine = 'televisions'
                   AND (pr.date_fin IS NULL OR pr.date_fin > NOW())";
    
    $stmt = $pdo->query($query);
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($products as &$product) {
        $product['quantite'] = isset($product['quantite']) ? (int)$product['quantite'] : 0;
        
        if (!empty($product['pourcentage'])) {
            $remise = $product['prix'] * ($product['pourcentage'] / 100);
            $product['prix_promo'] = round($product['prix'] - $remise, 2);
        } else {
            $product['prix_promo'] = null;
        }

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

    ob_clean(); 
    echo json_encode(['status' => 'success', 'products' => $products]);
    exit;

} catch (PDOException $e) {
    echo json_encode(['status' => 'error', 'message' => 'Erreur DB : ' . $e->getMessage()]);
    exit;
}
?>