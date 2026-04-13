<?php
// Empêcher l'affichage direct des erreurs pour plus de sécurité en production
ini_set('display_errors', 1); // Mets à 0 une fois que tout fonctionne
error_reporting(E_ALL);

$host= "100.65.154.19";
$username = "dev_remote";
$pwd = "ezechiel";
$dbname = "ecotech_db";
$charset  = "utf8mb4";
try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=$charset", $username, $pwd);
    // On force PDO à lever des exceptions en cas d'erreur
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // On définit le mode de récupération par défaut en tableau associatif (plus simple)
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    
} catch (PDOException $e) {
    // Si c'est une requête API, on répond proprement en JSON
    if (strpos($_SERVER['REQUEST_URI'], '/api/') !== false) {
        header('Content-Type: application/json');
        echo json_encode([
            'status' => 'error', 
            'message' => 'Erreur de connexion BDD'
        ]);
    } else {
        // Pour les pages web classiques
        die("Erreur de connexion à la base de données.");
    }
    exit;
}
?>