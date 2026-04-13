<?php
require_once 'config.php';
ini_set('display_errors', 0); // Sécurité en prod

$token = $_GET['token'] ?? null;

// 1. On récupère la commande
$stmt = $pdo->prepare("SELECT o.*, m.site_name FROM api_orders o JOIN merchants m ON o.seller_id = m.id WHERE o.order_token = ?");
$stmt->execute([$token]);
$order = $stmt->fetch();

if (!$order) die("Erreur : Jeton de paiement invalide.");

$error = "";

// 2. Logique de connexion et de vérification
if (isset($_POST['login_and_pay'])) {
    $numero_carte = $_POST['numero_carte'];
    $code_secret = $_POST['code_secret'];

    // On récupère le client ET son solde
    $stmtAuth = $pdo->prepare("SELECT id_client, solde_bancaire FROM ecotechbank WHERE numero_carte_ecotech = ? AND code_secret = ?");
    $stmtAuth->execute([$numero_carte, $code_secret]);
    $user = $stmtAuth->fetch();

    if ($user) {
        // --- LA VÉRIFICATION CRUCIALE ---
        if ($user['solde_bancaire'] >= $order['amount_total']) {
            // Tout est OK : On redirige vers le script qui fait les UPDATE SQL
            // On utilise une redirection propre ou ton formulaire JS
            ?>
            <form id="final_pay" action="/ecotechnologie/ecotechbank/ecotechbank_api/paiement_succes.php" method="GET">
                <input type="hidden" name="id_client_direct" value="<?= $user['id_client'] ?>">
                <input type="hidden" name="session_commande" value="<?= $token ?>">
            </form>
            <script>document.getElementById('final_pay').submit();</script>
            <?php
            exit;
        } else {
            $error = "Solde insuffisant pour effectuer ce paiement.";
        }
    } else {
        $error = "Identifiants bancaires incorrects.";
    }
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Paiement Sécurisé EcotechBank</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f7f6; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .card { background: white; padding: 30px; border-radius: 12px; box-shadow: 0 4px 20px rgba(0,0,0,0.1); width: 380px; }
        .merchant { color: #666; font-size: 14px; text-align: center; }
        .price { font-size: 32px; font-weight: bold; text-align: center; margin: 15px 0; color: #333; }
        input { width: 100%; padding: 12px; margin: 10px 0; border: 1px solid #ddd; border-radius: 6px; box-sizing: border-box; }
        .btn { background: #1a73e8; color: white; border: none; padding: 14px; width: 100%; border-radius: 6px; cursor: pointer; font-weight: bold; }
        .error { color: red; font-size: 13px; text-align: center; }
    </style>
</head>
<body>
<div class="card">
    <div class="merchant">Paiement pour <strong><?= htmlspecialchars($order['site_name']) ?></strong></div>
    <div class="price"><?= number_format($order['amount_total'], 2, ',', ' ') ?> €</div>
    
    <?php if($error) echo "<p class='error'>$error</p>"; ?>

    <form method="POST">
        <label>Numéro de carte Ecotech :</label>
        <input type="text" name="numero_carte" placeholder="4000..." required>
        
        <label>Code secret :</label>
        <input type="password" name="code_secret" placeholder="****" required>
        
        <button type="submit" name="login_and_pay" class="btn">Se connecter et Payer</button>
    </form>
    
    <p style="text-align:center;"><a href="<?= $order['return_url'] ?>" style="color:#888; font-size:12px;">Annuler</a></p>
</div>
</body>
</html>