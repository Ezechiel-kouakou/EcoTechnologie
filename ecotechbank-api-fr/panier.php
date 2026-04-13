<?php
if (isset($_POST['commander'])) {
    $apiKey = "9d4b4e36e28bdac67139ff98d097bc78"; 
    // VERIFIE BIEN CE CHEMIN : est-ce init_payment.php ou initiate_payment.php ?
    $apiUrl = "http://100.65.154.19:8081/init_payment.php";

    $postData = [
        "amount" => 100.00,
        "description" => "Achat Test Local",
        "return_url" => "http://localhost/ecotechnologie/ecotechbank-api-fr/merci.php"
    ];

    $ch = curl_init($apiUrl);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        "X-API-KEY: $apiKey", 
        "Content-Type: application/json"
    ]);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($postData));
    
    $rawResponse = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    $res = json_decode($rawResponse, true);

    if (isset($res['status']) && $res['status'] === 'success') {
        header("Location: " . $res['checkout_url']);
        exit;
    } else {
        echo "<h3>Erreur Détectée</h3>";
        echo "Code HTTP : " . $httpCode . "<br>";
        echo "Réponse brute du serveur : <pre>" . htmlspecialchars($rawResponse) . "</pre>";
        echo "Erreur JSON : " . json_last_error_msg();
    }
}
?>
<h1>Ma Boutique de Test</h1>
<form method="POST">
    <button name="commander" style="padding:10px 20px; background:blue; color:white; cursor:pointer;">
        Payer 100€ via EcoTechBank
    </button>
</form>