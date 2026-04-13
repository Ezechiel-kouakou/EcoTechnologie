<?php
// 1. On inclut le fichier de configuration du marchand
require_once 'marchands-config.php'; 

$message = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
    // On récupère les données du formulaire
    $data = [
        "username" => $_POST['username'],
        "email"    => $_POST['email'],
        "password" => $_POST['password']
    ];

    // 2. On utilise les constantes ECOTECH_API_URL et ECOTECH_API_KEY
    $ch = curl_init(ECOTECH_API_URL); 
    
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        "Content-Type: application/json",
        "X-API-KEY: " . ECOTECH_API_KEY // On concatène la constante ici
    ]);

    $response = curl_exec($ch);
    $result = json_decode($response, true);
    curl_close($ch);    

    if (isset($result['status']) && $result['status'] === 'success') {
        $message = "<div style='color:green;'>Bravo ! Inscrit sur EcotechBank via notre site. " . $result['message'] . "</div>";
    } else {
        $message = "<div style='color:red;'>Erreur API : " . ($result['message'] ?? 'Serveur injoignable') . "</div>";
    }
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>La Boutique de Kevin (Partenaire)</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background: #e9ecef; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .shop-box { background: white; padding: 40px; border-radius: 12px; shadow: 0 4px 20px rgba(0,0,0,0.1); width: 350px; text-align: center; }
        h1 { color: #333; font-size: 24px; }
        input { width: 100%; padding: 12px; margin: 8px 0; border: 1px solid #ddd; border-radius: 6px; box-sizing: border-box; }
        button { width: 100%; padding: 12px; background: #28a745; color: white; border: none; border-radius: 6px; cursor: pointer; font-weight: bold; }
        .footer { margin-top: 20px; font-size: 12px; color: #777; }
    </style>
</head>
<body>

<div class="shop-box">
    <h1>Kev'Shop</h1>
    <p>Inscrivez-vous pour acheter nos articles.</p>
    
    <form method="POST">
        <input type="text" name="username" placeholder="Pseudo" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Mot de passe" required>
        <button type="submit">S'inscrire (Bonus EcotechBank inclut)</button>
    </form>

    <?php echo $message; ?>

    <div class="footer">
        Propulsé par l'API <strong>EcotechBank</strong>
    </div>
</div>

</body>
</html>