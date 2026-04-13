<?php
require_once 'config.php'; 

$order_ref = $_GET['ref'] ?? '';
$orderFound = false;
$order = null;

if (!empty($order_ref)) {
    $stmt = $pdo->prepare("SELECT * FROM ecotech_commandes WHERE session_commande = ? AND statut = 'paye'");
    $stmt->execute([$order_ref]);
    $order = $stmt->fetch();
    if ($order) { $orderFound = true; }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Merci pour votre achat - Ecotech</title>
    <script src="https://unpkg.com/@phosphor-icons/web"></script>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; text-align: center; padding-top: 50px; background-color: #f4f7f6; color: #333; }
        .success-container { background: white; display: inline-block; padding: 40px; border-radius: 12px; box-shadow: 0 10px 25px rgba(0,0,0,0.05); max-width: 500px; width: 90%; }
        .icon { color: #27ae60; font-size: 80px; margin-bottom: 10px; }
        .product-info { margin: 25px 0; padding: 20px; background: #f0fff4; border-radius: 10px; border: 1px solid #c6f6d5; text-align: left; }
        .btn-pdf { background-color: #001554; color: white; padding: 15px 30px; border: none; border-radius: 8px; cursor: pointer; text-decoration: none; font-weight: bold; display: inline-block; margin-top: 20px; transition: 0.3s; border: none; }
        .btn-pdf:hover { background-color: #002aab; transform: translateY(-2px); }
        
        /* STYLE DU POPUP SATISFACTION */
        .modal-satisfaction { 
            display: none; position: fixed; z-index: 10000; left: 0; top: 0; width: 100%; height: 100%; 
            background: rgba(0,0,0,0.8); backdrop-filter: blur(5px); align-items: center; justify-content: center; 
        }
        .modal-content { background: white; padding: 40px; border-radius: 20px; text-align: center; width: 90%; max-width: 400px; box-shadow: 0 20px 40px rgba(0,0,0,0.2); }
        .star-rating { display: flex; flex-direction: row-reverse; justify-content: center; gap: 10px; margin: 25px 0; }
        .star-rating i { font-size: 40px; color: #ddd; cursor: pointer; transition: 0.3s; }
        .star-rating i:hover, .star-rating i:hover ~ i, .star-rating i.active, .star-rating i.active ~ i { color: #f1c40f; }
        
        /* STYLE DU TOASTER + SHAKE */
        .toast-container { position: fixed; top: 20px; right: 20px; z-index: 10001; }
        .toast { background: #001554; color: white; padding: 15px 25px; border-radius: 8px; margin-bottom: 10px; display: flex; align-items: center; gap: 12px; transform: translateX(120%); transition: 0.4s; }
        .toast.show { transform: translateX(0); }
        .toast.error { background: #c0392b; animation: shake 0.5s both; }
        @keyframes shake { 0%, 100% { transform: translateX(0); } 20%, 60% { transform: translateX(-10px); } 40%, 80% { transform: translateX(10px); } }

        /* --- ADAPTATION MOBILE --- */
        @media (max-width: 600px) {
            body { padding-top: 20px; }
            .success-container { padding: 25px 15px; width: 95%; }
            .icon { font-size: 60px; }
            h1 { font-size: 1.5rem; }
            .product-info { padding: 15px; font-size: 0.9rem; }
            .btn-pdf { width: 100%; padding: 12px 10px; box-sizing: border-box; }
            .modal-content { padding: 25px 20px; width: 85%; }
            .star-rating { gap: 5px; }
            .star-rating i { font-size: 32px; }
            .toast-container { top: 10px; right: 10px; left: 10px; }
            .toast { width: 100%; max-width: none; padding: 12px 20px; font-size: 0.85rem; transform: translateY(-150%); }
            .toast.show { transform: translateY(0); }
        }
    </style>
</head>
<body>

    <div class="success-container">
        <?php if ($orderFound): ?>
            <div class="icon">✔</div>
            <h1>Paiement Confirmé !</h1>
            <p>Merci pour votre confiance. Votre commande est en cours de préparation.</p>
            
            <div class="product-info">
                <strong>Référence :</strong> <?php echo htmlspecialchars($order['session_commande']); ?><br>
                <strong>Montant :</strong> <?php echo number_format($order['montant_total'], 2, ',', ' '); ?> €
            </div>

            <p id="status-text">Votre facture va se télécharger automatiquement...</p>

            <button onclick="document.getElementById('autoPdfForm').submit();" class="btn-pdf">
                Télécharger la facture (PDF)
            </button>

            <form id="autoPdfForm" action="/ecotechnologie/ecotech_users_profil/users_profil_api/ecotech-invoice-manager.php" method="POST" target="hidden_iframe" style="display:none;">
                <input type="hidden" name="token" id="formToken">
                <input type="hidden" name="ref" value="<?php echo htmlspecialchars($order['session_commande']); ?>">
            </form>
            <iframe name="hidden_iframe" style="display:none;"></iframe>

        <?php else: ?>
            <div class="error-msg"><h1>Oups !</h1><p>Commande introuvable.</p></div>
        <?php endif; ?>
    </div>

    <div id="satisfactionPopup" class="modal-satisfaction">
        <div class="modal-content">
            <i class="ph-fill ph-chat-circle-dots" style="font-size: 50px; color: #001554;"></i>
            <h3>Votre avis compte !</h3>
            <p>Comment s'est passée votre expérience ?</p>
            <div class="star-rating">
                <i class="ph-fill ph-star" data-value="5"></i>
                <i class="ph-fill ph-star" data-value="4"></i>
                <i class="ph-fill ph-star" data-value="3"></i>
                <i class="ph-fill ph-star" data-value="2"></i>
                <i class="ph-fill ph-star" data-value="1"></i>
            </div>
            <button id="submitFeedback" class="btn-pdf" style="width: 100%;">Envoyer mon avis</button>
        </div>
    </div>

    <div id="toast-container" class="toast-container"></div>
<script>
    let selectedRating = 0;

    document.addEventListener("DOMContentLoaded", () => {
        localStorage.setItem("ecotech_cart_count", 0);
        
        const token = localStorage.getItem("ecotech_token");
        const form = document.getElementById('autoPdfForm');
        const tokenInput = document.getElementById('formToken');
        const popup = document.getElementById('satisfactionPopup');

        // console.log("DEBUG : Token récupéré ->", token);

        if (token && form && tokenInput) {
            tokenInput.value = token;
            form.submit();
            
            setTimeout(() => {
                if (popup.style.display !== 'flex') {
                    popup.style.display = 'flex';
                    popup.style.opacity = '0';
                    setTimeout(() => { popup.style.opacity = '1'; popup.style.transition = 'opacity 0.5s'; }, 50);
                }
            }, 6000);
        }

        document.querySelectorAll('.star-rating i').forEach(star => {
            star.addEventListener('click', (e) => {
                selectedRating = e.target.getAttribute('data-value');
                // console.log("DEBUG : Note sélectionnée ->", selectedRating);
                document.querySelectorAll('.star-rating i').forEach(s => s.classList.remove('active'));
                e.target.classList.add('active');
            });
        });

        document.getElementById('submitFeedback').addEventListener('click', () => {
            if(selectedRating === 0) {
                showToast("Veuillez choisir une note !", "error");
                return;
            }

            const token = localStorage.getItem("ecotech_token");
            // console.log("DEBUG : Envoi en cours...", { rating: selectedRating, token: token });

            fetch('../ecotech_api/ecotech-users-feedback.php', {
                method: 'POST',
                body: JSON.stringify({ rating: selectedRating, token: token }),
                headers: { 'Content-Type': 'application/json' }
            })
            .then(res => {
                //console.log("DEBUG : Statut HTTP ->", res.status);
                return res.json();
            })
            .then(data => {
                // console.log("DEBUG : Réponse Serveur ->", data);
                if(data.status === "success") {
                    showToast(data.message); // Message du serveur
                    setTimeout(() => { window.location.href = '../index.html'; }, 2000);
                } else {
                    // Si le serveur renvoie une erreur (ex: SQL), on l'affiche dans le Toast
                    showToast("Erreur : " + data.message, "error");
                }
            })
            .catch(err => {
                // console.error("DEBUG : Erreur Fetch ->", err);
                showToast("Impossible de joindre le serveur.", "error");
            });
        });
    });

    function showToast(message, type = 'success') {
        const container = document.getElementById('toast-container');
        const toast = document.createElement('div');
        toast.className = `toast ${type === 'error' ? 'error' : ''}`;
        toast.style.display = 'flex';
        toast.innerHTML = `<i class="ph-fill ${type === 'success' ? 'ph-check-circle' : 'ph-warning-octagon'}"></i><span>${message}</span>`;
        container.appendChild(toast);
        setTimeout(() => toast.classList.add('show'), 100);
        setTimeout(() => { 
            toast.classList.remove('show'); 
            setTimeout(() => toast.remove(), 400); 
        }, 4000);
    }
</script>
</body>
</html>