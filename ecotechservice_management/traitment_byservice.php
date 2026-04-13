<?php
require_once 'config.php';
session_start();
header('Content-Type: application/json');

if (!isset($_SESSION['staff_id'])) {
    echo json_encode(['status' => 'error', 'message' => 'Accès refusé']);
    exit;
}

$service = $_SESSION['staff_service'];
$table = "ecotech_" . $service . "_messages";

try {
    // Ta requête d'origine pour les messages
    $stmt = $pdo->prepare("SELECT * FROM $table WHERE statut = 'en_attente' ORDER BY date_envoi DESC");
    $stmt->execute();
    $messages = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    // NOUVEAU : On compte les stats pour le Hero SaaS
    $stmtS = $pdo->prepare("SELECT statut, COUNT(*) as nb FROM $table GROUP BY statut");
    $stmtS->execute();
    $rows = $stmtS->fetchAll(PDO::FETCH_ASSOC);
    
    $stats = ['en_attente' => 0, 'traite' => 0];
    foreach($rows as $r) {
        $stats[$r['statut']] = (int)$r['nb'];
    }
    
    // On renvoie tout dans le même JSON
    echo json_encode([
        'status' => 'success', 
        'service' => $service, 
        'messages' => $messages,
        'stats' => $stats // Les chiffres pour tes boites
    ]);
} catch (PDOException $e) {
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}
?>