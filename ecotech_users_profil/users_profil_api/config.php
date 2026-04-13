<?php
$host= "100.65.154.19";
$username = "dev_remote";
$pwd = "ezechiel";
$dbname = "ecotech_db";
$charset  = "utf8mb4";

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=$charset", $username, $pwd);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    header('Content-Type: application/json');
    echo json_encode([
        'status' => 'error', 
        'message' => 'Erreur de connexion BDD : ' . $e->getMessage()
    ]);
    exit;
}
?>