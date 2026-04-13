<?php
session_start();

// 1. Vérifier que le panier n'est pas vide
if (!isset($_SESSION['total_a_payer']) || $_SESSION['total_a_payer'] <= 0) {
    header("Location: panier.php");
    exit;
}

// 2. Préparer l'appel à TON API (EcoTechBank)
$apiUrl = "http://100.65.154.19/init_payment.php";
$apiKey = "9d4b4e36e28bdac67139ff98d097bc78"; // Sa clé API

$data = [
    "amount"      => $_SESSION['total_a_payer'],
    "description" => "Commande Digital Games de " . $_SESSION['pseudo'],
    "return_url"  => "http://100.78.7.26/Projets dev/confirmation.php" // Où il revient après
];

// 3. Envoi de la requête à ton serveur
$ch = curl_init($apiUrl);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    "X-API-KEY: $apiKey",
    "Content-Type: application/json"
]);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));

$response = curl_exec($ch);
$httpCode = curl_getinfo($ch, http_code: CURLINFO_HTTP_CODE);
curl_close($ch);

$result = json_decode($response, true);

// 4. Redirection vers ton guichet bancaire (bank_checkout.php)
if ($httpCode === 200 && isset($result['checkout_url'])) {
    header("Location: " . $result['checkout_url']);
    exit;
} else {
    // Si ça échoue, on affiche l'erreur
    die("Erreur Banque (" . $httpCode . ") : " . ($result['message'] ?? "Serveur indisponible"));
}