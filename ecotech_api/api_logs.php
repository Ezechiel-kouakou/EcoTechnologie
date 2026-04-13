<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

try {
    $db_logs = new PDO("mysql:host=localhost;dbname=ecotech_db;charset=utf8", "root", "");
    $db_logs->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // --- CAS 1 : SUPPRESSION DES LOGS (POST) ---
    $input = json_decode(file_get_contents('php://input'), true);
    
    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($input['action']) && $input['action'] === 'clear_logs') {
        $db_logs->exec("TRUNCATE TABLE api_monitor_logs");
        echo json_encode(["status" => "success", "message" => "Logs effacés"]);
        exit;
    }

    // --- CAS 2 : RÉCUPÉRATION DES LOGS (GET) ---
    $query = "SELECT * FROM api_monitor_logs ORDER BY created_at DESC LIMIT 50";
    $stmt = $db_logs->query($query);
    $logs = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode([
        "status" => "success",
        "data" => $logs
    ]);

} catch (PDOException $e) {
    echo json_encode(["status" => "error", "message" => $e->getMessage()]);
}
?>