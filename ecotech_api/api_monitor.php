<?php
// On enregistre le temps de départ dès le début de l'exécution
$start_time = microtime(true);

// CRUCIAL : On vérifie si la fonction n'a pas déjà été chargée par Apache
if (!function_exists('track_api_request')) {

    function track_api_request() {
        global $start_time;
        
        // On calcule la durée juste avant la fin
        $end_time = microtime(true);
        $duration = round(($end_time - $start_time) * 1000, 2); 

        $status = http_response_code(); 
        $method = $_SERVER['REQUEST_METHOD'] ?? 'UNKNOWN';
        $endpoint = $_SERVER['REQUEST_URI'] ?? 'UNKNOWN';
        $timestamp = date('Y-m-d H:i:s');
        
        // Récupération des données POST (JSON ou autre)
        $payload = file_get_contents('php://input');

        try {
            // Connexion BDD
            $db = new PDO('mysql:host=localhost;dbname=ecotech_db;charset=utf8', 'root', '');
            $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            
            $sql = "INSERT INTO api_monitor_logs (method, endpoint, status, duration, payload, created_at) 
                    VALUES (?, ?, ?, ?, ?, ?)";
            $stmt = $db->prepare($sql);
            $stmt->execute([$method, $endpoint, $status, $duration, $payload, $timestamp]);
            
        } catch (Exception $e) {
            // En cas d'erreur BDD, on ne bloque pas l'affichage du site
            // On pourrait loguer l'erreur dans un fichier texte ici si besoin
        }
    }

    // On enregistre la fonction pour qu'elle s'exécute à la toute fin du script
    register_shutdown_function('track_api_request');
}
?>