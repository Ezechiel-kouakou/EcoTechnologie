<?php 
session_start();
// On inclut le fichier qui contient ECOTECH_API_KEY et ECOTECH_API_URL
require_once 'marchands-config.php'; 

$erreur = '';
$succes = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Récupération des données du formulaire HTML
    $pseudo   = $_POST['pseudo'] ?? '';
    $email    = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';

    if (empty($pseudo) || empty($email) || empty($password)) {
        $erreur = "Veuillez remplir tous les champs.";
    } else {
        // --- PRÉPARATION DES DONNÉES POUR TON SERVEUR ---
        // Ton register attend 'username', 'email' et 'password' en JSON
        $data = json_encode([
            'username' => $pseudo,
            'email'    => $email,
            'password' => $password
        ]);

        // --- APPEL API VIA CURL ---
        $ch = curl_init(ECOTECH_API_URL);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_TIMEOUT, 10);
        
        // Headers indispensables : Content-Type JSON + Ta Clé API
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Content-Type: application/json',
            'Content-Length: ' . strlen($data),
            'X-API-KEY: ' . ECOTECH_API_KEY
        ]);

        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $curlError = curl_error($ch);
        curl_close($ch);

        // --- ANALYSE DE LA RÉPONSE ---
        if ($response === false) {
            $erreur = "Le serveur Ecotech est injoignable : " . $curlError;
        } else {
            $resultat = json_decode($response, true);

            // Ton serveur renvoie 'status' => 'success' ou 'error'
            if (isset($resultat['status']) && $resultat['status'] === 'success') {
                // Succès ! On affiche le message de ton serveur (avec le solde)
                $succes = $resultat['message'];
                // Redirection après 3 secondes pour laisser le temps de lire le message
                header('Refresh: 3; url=connexion.php');
            } else {
                // Erreur renvoyée par le serveur (ex: "Tous les champs sont requis" ou "Clé API invalide")
                $erreur = $resultat['message'] ?? "Une erreur inconnue est survenue.";
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription - Digital Games</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@500;700&display=swap" rel="stylesheet">
</head>
<body>

    <nav>
        <div class="logo-container">
            <a href="index.php"><img src="assets/img/logo.jpg" alt="Logo Digital Games" class="site-logo"></a>
        </div>
        <div class="nav-links">
            <a href="index.php">Accueil</a>
            <a href="contact.php">Contact</a>
            <a href="panier.php" class="cart-btn">🛒 Panier</a>
        </div>
    </nav>

    <div class="container" style="min-height: 60vh; display: flex; justify-content: center; align-items: center; margin-top: 40px; margin-bottom: 40px;">
        
        <div style="background: #1a1c24; padding: 40px; border-radius: 8px; border: 1px solid #2a2c35; width: 100%; max-width: 400px; box-shadow: 0 4px 15px rgba(0,0,0,0.5);">
            <h1 style="color: #fff; text-align: center; margin-bottom: 30px; font-size: 32px;">Créer un compte</h1>
            
            <?php if ($erreur): ?>
                <div style="background: rgba(255, 71, 87, 0.1); border: 1px solid #ff4757; color: #ff4757; padding: 12px; border-radius: 4px; text-align: center; margin-bottom: 20px; font-size: 14px;">
                 <?php echo htmlspecialchars($erreur); ?>
                </div>
            <?php endif; ?>

            <?php if ($succes): ?>
                <div style="background: rgba(46, 204, 113, 0.1); border: 1px solid #2ecc71; color: #2ecc71; padding: 12px; border-radius: 4px; text-align: center; margin-bottom: 20px; font-size: 14px;">
                    <?php echo htmlspecialchars($succes); ?>
                </div>
            <?php endif; ?>

            <form action="" method="POST" style="display: flex; flex-direction: column; gap: 20px;">
                
                <div>
                    <label style="color: #b3b3b3; font-size: 14px; margin-bottom: 5px; display: block;">Pseudo</label>
                    <input type="text" name="pseudo" placeholder="Votre pseudo" required style="width: 100%; padding: 12px; border-radius: 4px; border: 1px solid #333; background: #2a2c35; color: white; box-sizing: border-box;">
                </div>

                <div>
                    <label style="color: #b3b3b3; font-size: 14px; margin-bottom: 5px; display: block;">Adresse E-mail</label>
                    <input type="email" name="email" placeholder="contact@email.com" required style="width: 100%; padding: 12px; border-radius: 4px; border: 1px solid #333; background: #2a2c35; color: white; box-sizing: border-box;">
                </div>

                <div>
                    <label style="color: #b3b3b3; font-size: 14px; margin-bottom: 5px; display: block;">Mot de passe</label>
                    <input type="password" name="password" placeholder="••••••••" required style="width: 100%; padding: 12px; border-radius: 4px; border: 1px solid #333; background: #2a2c35; color: white; box-sizing: border-box;">
                </div>

                <button type="submit" style="width: 100%; padding: 15px; border: none; background: #ff4757; color: white; font-weight: bold; cursor: pointer; font-size: 18px; border-radius: 4px; margin-top: 10px;">
                    S'INSCRIRE
                </button>
                
            </form>

            <p style="text-align: center; margin-top: 25px; color: #b3b3b3;">
                Déjà un compte ? <a href="connexion.php" style="color: #ff4757; text-decoration: none; font-weight: bold;">Se connecter</a>
            </p>
        </div>

    </div>

    <footer style="text-align: center; padding: 20px; color: #666; font-size: 14px;">
        &copy; <?php echo date('Y'); ?> Digital Games - Système de paiement Ecotech sécurisé.
    </footer>

</body>
</html>