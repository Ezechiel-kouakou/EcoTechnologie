<?php
$host= "100.65.154.19";
$username = "dev_remote";
$pwd = "ezechiel";
$dbname = "ecotech_db";
$charset  = "utf8mb4";

$dsn= "mysql:host=$host;dbname=$dbname;charset=$charset";

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=$charset", $username, $pwd);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}
?>