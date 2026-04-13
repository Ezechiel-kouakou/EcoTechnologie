<?php
require_once '../config.php';
session_start();

$message = "";

// --- 1. GESTION DE LA DÉCONNEXION ---
if (isset($_GET['logout'])) {
    session_destroy();
    header("Location: portal_marchand.php");
    exit;
}

// --- 2. LOGIQUE D'INSCRIPTION / CONNEXION ---
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
    // INSCRIPTION (Ton code adapté)
    if (isset($_POST['register_merchant'])) {
        $owner = htmlspecialchars($_POST['owner_name']);
        $site = htmlspecialchars($_POST['site_name']);
        $email = htmlspecialchars($_POST['email']);
        $pass = password_hash($_POST['password'], PASSWORD_BCRYPT);

        try {
            // On ne génère PAS la clé à l'inscription, on attend qu'il clique sur le bouton dans son dashboard
            $stmt = $pdo->prepare("INSERT INTO merchants (owner_name, site_name, email, password) VALUES (?, ?, ?, ?)");
            $stmt->execute([$owner, $site, $email, $pass]);
            $message = "<div style='color:green;'>Compte créé avec succès ! Connectez-vous ci-dessous.</div>";
        } catch (PDOException $e) {
            $message = "<div style='color:red;'>Erreur : Cet email est déjà utilisé.</div>";
        }
    }

    // CONNEXION
    if (isset($_POST['login_merchant'])) {
        $email = htmlspecialchars($_POST['email']);
        $stmt = $pdo->prepare("SELECT * FROM merchants WHERE email = ?");
        $stmt->execute([$email]);
        $merchant = $stmt->fetch();

        if ($merchant && password_verify($_POST['password'], $merchant['password'])) {
            $_SESSION['merchant_id'] = $merchant['id'];
        } else {
            $message = "<div style='color:red;'>Identifiants incorrects.</div>";
        }
    }

    // GÉNÉRATION DE LA CLÉ (Le bouton "Unique")
   // GÉNÉRATION DE LA CLÉ (Le bouton "Unique")
if (isset($_POST['generate_api_key']) && isset($_SESSION['merchant_id'])) {
    $apiKey = bin2hex(random_bytes(16));
    $stmt = $pdo->prepare("UPDATE merchants SET api_key = ? WHERE id = ?");
    $stmt->execute([$apiKey, $_SESSION['merchant_id']]);
    
    // CRUCIAL : On redirige pour vider le cache du formulaire POST
    header("Location: portal_marchand.php?status=key_generated");
    exit;
}
}

// Récupérer les infos du marchand connecté
$currentMerchant = null;
if (isset($_SESSION['merchant_id'])) {
    $stmt = $pdo->prepare("SELECT * FROM merchants WHERE id = ?");
    $stmt->execute([$_SESSION['merchant_id']]);
    $currentMerchant = $stmt->fetch();
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>EcotechBank - Portail Partenaires</title>
    <style>
        body { font-family: sans-serif; background: #f4f4f4; padding: 50px; }
        .card { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); max-width: 500px; margin: auto; margin-bottom: 20px;}
        input { width: 95%; padding: 10px; margin: 10px 0; border: 1px solid #ddd; border-radius: 4px; }
        button { background: #001554; color: white; padding: 10px 20px; border: none; cursor: pointer; border-radius: 5px; width: 100%; }
        .btn-logout { background: #c0392b; width: auto; float: right; font-size: 12px; }
        .key-display { background: #eee; padding: 15px; border-left: 5px solid #001554; margin-top: 20px; word-break: break-all; font-family: monospace; }
        .blur { filter: blur(5px); transition: 0.3s; }
        .blur:hover { filter: blur(0); cursor: pointer; }
    </style>
</head>
<body>

<div class="container">

    <?php if (!$currentMerchant): ?>
        <div class="card">
            <h2>Connexion</h2>
            <form method="POST">
                <input type="email" name="email" placeholder="Email professionnel" required>
                <input type="password" name="password" placeholder="Mot de passe" required>
                <button type="submit" name="login_merchant">Se connecter</button>
            </form>
        </div>

        <div class="card">
            <h2>Devenir Partenaire</h2>
            <form method="POST">
                <input type="text" name="owner_name" placeholder="Votre Nom complet" required>
                <input type="text" name="site_name" placeholder="Nom de votre boutique" required>
                <input type="email" name="email" placeholder="Email professionnel" required>
                <input type="password" name="password" placeholder="Mot de passe" required>
                <button type="submit" name="register_merchant">Créer mon compte marchand</button>
            </form>
            <?php if ($message) echo $message; ?>
        </div>

    <?php else: ?>
        <div class="card">
    <h3>Ma Clé API</h3>
    <?php if (empty($currentMerchant['api_key'])): ?>
        <p style="color: orange;">Vous n'avez pas encore généré de clé API.</p>
        <form method="POST">
            <button type="submit" name="generate_api_key" style="background: #27ae60;">Générer ma Clé API</button>
        </form>
    <?php else: ?>
        <p>Votre clé est prête :</p>
        
        <div class="key-container" style="display: flex; gap: 10px; align-items: center; margin-top: 10px;">
            <div class="key-display blur" id="apiKey" style="flex-grow: 1; padding: 12px; background: #eee; border-left: 5px solid #001554; font-family: monospace;">
                <?= $currentMerchant['api_key'] ?>
            </div>
            <button onclick="copyKey()" style="width: auto; background: #34495e; padding: 10px;">Copier</button>
        </div>
        
        <p id="copyMessage" style="color: green; font-size: 12px; display: none; margin-top: 5px;">Clé copiée dans le presse-papier !</p>
        <p style="font-size: 11px; color: #7f8c8d; margin-top: 10px;">Note: Cette clé est unique pour votre boutique.</p>
    <?php endif; ?>
</div>
     <form method="GET">
            <button type="submit" name="logout" class="btn-logout">Se déconnecter</button>
        </form>
    <?php endif; ?>

</div>
<script>
function copyKey() {
    // On récupère le texte de la clé
    const keyText = document.getElementById('apiKey').innerText;
    
    // On utilise l'API Clipboard du navigateur
    navigator.clipboard.writeText(keyText).then(() => {
        const msg = document.getElementById('copyMessage');
        msg.style.display = 'block';
        
        // On cache le message après 2 secondes
        setTimeout(() => {
            msg.style.display = 'none';
        }, 2000);
    }).catch(err => {
        console.error('Erreur lors de la copie : ', err);
    });
}
</script>
</body>
</html>