<?php
// get_satisfaction_score.php
header('Content-Type: application/json');
require_once 'config.php'; // Ta connexion $pdo

try {
    // On calcule la moyenne et le nombre total d'avis en une seule requête
    $sql = "SELECT AVG(rating) as moyenne, COUNT(*) as total FROM ecotech_feedbacks";
    $stmt = $pdo->query($sql);
    $result = $stmt->fetch();

    // On prépare une réponse propre
    // Si pas d'avis, on renvoie 0.0 pour éviter les erreurs d'affichage
    $moyenne = $result['moyenne'] ? round($result['moyenne'], 1) : 0.0;
    $total = $result['total'] ?? 0;

    echo json_encode([
        "status" => "success",
        "average" => $moyenne,
        "total_reviews" => $total
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        "status" => "error",
        "message" => $e->getMessage()
    ]);
}