<?php
// On force l'affichage des erreurs pour voir s'il y a un souci caché
ini_set('display_errors', 1);
error_reporting(E_ALL);

$token = isset($_GET['token']) ? $_GET['token'] : 'Inconnu';
$status = isset($_GET['status']) ? $_GET['status'] : 'Erreur';
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Confirmation de paiement</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; padding: 50px; background: #f4f4f4; }
        .container { background: white; padding: 30px; border-radius: 10px; display: inline-block; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .success { color: green; font-weight: bold; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Merci pour votre achat !</h1>
        <p>Statut du paiement : <span class="success"><?php echo htmlspecialchars($status); ?></span></p>
        <p>Référence transaction : <code><?php echo htmlspecialchars($token); ?></code></p>
        <hr>
        <a href="panier.php">Retourner à la boutique</a>
    </div>
</body>
</html>