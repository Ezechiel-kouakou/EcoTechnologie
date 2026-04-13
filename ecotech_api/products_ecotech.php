<?php
require_once 'config.php';
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    try {
        // CORRECTION : Suppression du double $sql = $sql =
        $sql = "SELECT 
                    p.id_produit, 
                    p.nom, 
                    p.prix, 
                    p.image, 
                    IFNULL(s.quantite, 0) as quantite, 
                    pr.pourcentage 
                FROM produit p 
                LEFT JOIN ecotechstock s ON p.id_produit = s.id_produit 
                LEFT JOIN promos pr ON p.id_produit = pr.id_produit_ref 
                     AND pr.table_origine = 'produit'
                ORDER BY p.id_produit DESC";
        
        $stmt = $pdo->query($sql);
        $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

        foreach ($products as &$product) {
            $q = (int)$product['quantite']; // On force l'entier pour la comparaison
            
            // Calcul du prix promo
            if (!empty($product['pourcentage'])) {
                $remise = $product['prix'] * ($product['pourcentage'] / 100);
                $product['prix_promo'] = round($product['prix'] - $remise, 2);
            } else {
                $product['prix_promo'] = null;
            }

            // Gestion des statuts de stock
            if ($q >= 20) {
                $product['status'] = "Disponible";
                $product['status_color'] = "green";
            } elseif ($q > 0 && $q <= 20) {
                $product['status'] = "Stock limité"; // Correction orthographe "limité"
                $product['status_color'] = "orange";   
            } else {
                $product['status'] = "En rupture de stock";
                $product['status_color'] = "red";
            }
        }

        // On s'assure qu'aucune erreur PHP parasite n'a été affichée avant le JSON
        ob_clean(); 
        echo json_encode(['status' => 'success', 'products' => $products]);
        exit;

    } catch (PDOException $e) {
        ob_clean();
        echo json_encode(['status' => 'error', 'message' => 'Database error: ' . $e->getMessage()]);
        exit;
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Method not allowed']);
    exit;
}
?>