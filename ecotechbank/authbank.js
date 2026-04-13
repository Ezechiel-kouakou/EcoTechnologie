const EcotechBank_API = "/ecotechnologie/ecotechbank/ecotechbank_api/authbank.php";

// --- UTILITAIRES ---
const connectMessage = document.getElementById("notification-container");


function showToast(message, type = 'success') {
    let container = document.getElementById('notification-container');
    if (!container) {
        container = document.createElement('div');
        container.id = 'notification-container';
        document.body.appendChild(container);
    }
    const toast = document.createElement('div');
    toast.className = `toast ${type}`;
    toast.innerText = message;
    container.appendChild(toast);
    setTimeout(() => toast.remove(), 3000);
}


function getRedirectUrl(basePage) {
    const urlParams = new URLSearchParams(window.location.search);
    const amount = urlParams.get('amount');
    const details = urlParams.get('details'); 
    let targetUrl = basePage;
    let params = [];

    if (amount) params.push(`amount=${encodeURIComponent(amount)}`);
    if (details) params.push(`details=${encodeURIComponent(details)}`);

    // Si on a des paramètres, on les ajoute proprement avec un "?" ou "&"
    if (params.length > 0) {
        targetUrl += "?" + params.join("&");
    }

    return targetUrl;
}

document.addEventListener("DOMContentLoaded", () => {
    const token = localStorage.getItem("ecotech_token");
    const urlParams = new URLSearchParams(window.location.search);
    const isError = urlParams.get('error'); // On vérifie si on revient d'une erreur

    // Si un token est présent ET qu'on ne vient pas d'être renvoyé ici pour erreur
    if (token && !isError) {
        // On cache le formulaire pour une transition propre
        const loginCard = document.querySelector('.login-card');
        if(loginCard) loginCard.style.opacity = "0.2";

        showToast("Session reconnue. Accès sécurisé en cours...", "success");
         
connectMessage.innerHTML = `
            <div class="form-message-overlay">
                <div class="success-popup">
                    <i class="ph ph-check-circle"></i>
                    <p>Session reconnue. Accès sécurisé en cours...</p>
                    <div class="admin-spinner"></div>
                </div>
            </div>`;


        setTimeout(() => {
            // REDIRECTION : On emporte montant ET détails vers l'espace client
            window.location.href = getRedirectUrl("userSpaceBank.html");
        }, 1200);
    } 
    
    // Si on revient avec une erreur (session expirée par exemple), on nettoie
    if (isError) {
        localStorage.removeItem("ecotech_token");
         connectMessage.innerHTML = `<div class="form-message-overlay">
            <div class="error-popup">
            <i class="ph ph-warning-circle"></i>
            <p>Votre session a expiré.</p>
            <span>Veuillez réessayer.</span>
            <button class="retry-btn" onclick="this.parentElement.parentElement.style.display='none';">Se reconnecter</button>
            </div>
        </div>`;
    }
});

async function loginWithEcoTech() {
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value;

    if (!email || !password) {
        showToast("Identifiants requis", "error");
        return;
    }

    try {
        const response = await fetch(EcotechBank_API, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ email, password })
        });

        const result = await response.json();

        if (result.status === "success") {
            // 1. Stockage du nouveau badge de sécurité
            localStorage.setItem("ecotech_token", result.token); 
            localStorage.setItem("user", JSON.stringify(result.user));
        connectMessage.innerHTML = `<div class="form-message-overlay">
            <div class="success-popup">
            <i class="ph ph-check-circle"></i>
            <p>Connexion réussie. Bienvenue ${result.user.nom}.</p>
            <div class="admin-spinner"></div>
            </div>
            </div>`;
            
            
            setTimeout(() => {
                window.location.href = getRedirectUrl("userSpaceBank.html");
            }, 5000);
        } else {

  connectMessage.innerHTML = `<div class="form-message-overlay">
            <div class="error-popup">
            <i class="ph ph-warning-circle"></i>
            <p>${result.message}</p>
            <span>Veuillez réessayer.</span>
            <button class="retry-btn" onclick="this.parentElement.parentElement.style.display='none';">Réessayer</button>
            </div>
            </div>`;

            // showToast(result.message, "error");
        }
    } catch (error) {
        // console.error("Erreur Auth Bank:", error);

  connectMessage.innerHTML = `<div class="form-message-overlay">
            <div class="error-popup">
            <i class="ph ph-warning-circle"></i>
            <p>Oups!  le serveur bancaire est indisponible.Nos equipes technique sont mobilisées pour résoudre le problème au plus vite.</p>
            <button class="retry-btn" onclick="this.parentElement.parentElement.style.display='none';">Réessayer plus tard</button>
            </div>
            </div>`;

        // showToast("Serveur bancaire injoignable", "error");
    }
}