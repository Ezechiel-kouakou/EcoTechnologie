<?php
$host= '#';
$username = '#';
$pwd = '';
$dbname = '#';
$charset  = 'utf8mb4';

$dsn= "mysql:host=$host;dbname=$dbname;charset=$charset";

try{
    $pdo = new pdo($dsn,$username,$pwd);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO:: ATTR_ERRMODE_EXCEPTION);
    echo "Connected successfully";
    header('Location: auth_ecotech.php');
}catch(PDOException $e){
    echo "Connection failed: " . $e->getMessage();  
}
?>