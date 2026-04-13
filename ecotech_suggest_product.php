<?php
ob_start(); 

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

ini_set('display_errors', 1);
error_reporting(E_ALL);

require_once 'config.php'; 

$query = $_GET['q'] ?? '';

if (strlen(trim($query)) < 2) {
    echo json_encode([]);
    exit;
}

try {

    $searchTerm = "%" . strtoupper(trim($query)) . "%";

    $sql = "
        SELECT id_produit, nom, prix, image, 'Ordinateur Portable' as categorie_nom 
        FROM produit WHERE UPPER(nom) LIKE :q1
        
        UNION ALL
        
        SELECT id_produit, nom, prix, image, 'Smartphone' as categorie_nom 
        FROM telephone WHERE UPPER(nom) LIKE :q2
        
        UNION ALL
        
        SELECT id_produit, nom, prix, image, 'Audio' as categorie_nom 
        FROM sons WHERE UPPER(nom) LIKE :q3
        
        UNION ALL
        
        SELECT id_produit, nom, prix, image, 'TV' as categorie_nom 
        FROM televisions WHERE UPPER(nom) LIKE :q4
        
        UNION ALL
        
        SELECT id_produit, nom, prix, image, 'Périphériques' as categorie_nom 
        FROM ecotechperiphs WHERE UPPER(nom) LIKE :q5
        
        ORDER BY nom ASC
        LIMIT 10
    ";

    $stmt = $pdo->prepare($sql);
    
    $stmt->bindValue(':q1', $searchTerm);
    $stmt->bindValue(':q2', $searchTerm);
    $stmt->bindValue(':q3', $searchTerm);
    $stmt->bindValue(':q4', $searchTerm);
    $stmt->bindValue(':q5', $searchTerm);
    
    $stmt->execute();
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($results as &$row) {
        $row['prix'] = number_format((float)$row['prix'], 2, '.', '') . '€';
        if (empty($row['image'])) {
            $row['image'] = 'assets/default_product.png';
        }
    }

    ob_clean(); 
    echo json_encode($results);

} catch (PDOException $e) {
    ob_clean();
    echo json_encode(["error_sql" => $e->getMessage()]);
}
exit;