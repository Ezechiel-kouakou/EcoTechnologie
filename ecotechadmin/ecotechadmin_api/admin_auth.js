const MIN_LOADER_TIME = 800; 

const Loader = {
    show: () => {
        const el = document.getElementById("global-loader");
        if (el) el.style.display = "flex";
    },
    hide: () => {
        const el = document.getElementById("global-loader");
        if (el) el.style.display = "none";
    }
};

(function injectLoader() {
    if (!document.getElementById("global-loader")) {
        const loaderHTML = `
            <div id="global-loader">
                <div class="spinner"></div>
                <div class="loader-text" style="margin-top: 15px; color: #fff; font-family: sans-serif;">Accès Admin en cours...</div>
            </div>`;
        document.body.insertAdjacentHTML("afterbegin", loaderHTML);
    }
})();

const originalFetch = window.fetch;
window.fetch = async (...args) => {
    Loader.show();
    const timer = new Promise(resolve => setTimeout(resolve, MIN_LOADER_TIME));
    try {
        const response = await originalFetch(...args);
        await timer;
        return response;
    } finally {
        Loader.hide();
    }
};

const ADMIN_API_URL = "admin_management.php";

document.getElementById("adminLoginForm").addEventListener("submit", async (e) => {
    e.preventDefault();

    const emailInput = document.getElementById("adminEmail").value.trim();
    const passwordInput = document.getElementById("adminPassword").value;
    const connectMessage = document.getElementById("adminLoginMessage");

    try {
        const response = await fetch(ADMIN_API_URL, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                action: "login",
                email: emailInput,
                password: passwordInput,
            }),
        });

        const data = await response.json();

      if (data.status === 'success') {
            // 1. On enregistre le token envoyé par le PHP (admin_auth.php)
            localStorage.setItem("ecotech_token", data.token); 
            
            // 2. On initialise l'heure de début pour le décompte d'inactivité
            localStorage.setItem("ecotech_last_activity", Date.now());

            localStorage.setItem("ecotech_admin_nom", data.nom);
            localStorage.setItem("ecotech_admin_prenom", data.prenom);
            localStorage.setItem("ecotech_admin_role", data.role);
            localStorage.setItem("ecotech_admin_photo", data.photo || 'assets/profile-placeholder.png');
    

            localStorage.setItem("admin_session", "active"); 
            
            connectMessage.innerHTML = `
            <div class="form-message-overlay">
                <div class="success-popup">
                    <i class="ph ph-check-circle"></i>
                    <p>Connexion réussie. Bienvenue, ${data.prenom}.</p>
                    <span>Redirection vers le tableau de bord...</span>
                    <div class="admin-spinner"></div>
                </div>
            </div>`;

            setTimeout(() => {
                window.location.href = "admin_dashboard.html";
            }, 1000);
        } else {
            connectMessage.innerHTML = `<div class="form-message-overlay">
            <div class="error-popup">
            <i class="ph ph-warning-circle"></i>
            <p>${data.message}</p>
            <span>Veuillez réessayer.</span>
            <button class="retry-btn" onclick="this.parentElement.parentElement.style.display='none';">Réessayer</button>
            </div>
            </div>`;
        }
    } catch (error) {
        console.error("Erreur:", error);
        connectMessage.innerHTML = `<div class="form-message-overlay">
        <div class="error-popup">
        <i class="ph ph-warning-circle"></i>
        <p style="color: #e74c3c;" class="form-message">Oups! impossible de joindre le serveur d'administration nos équipes techniques sont mobilisées pour résoudre le problème.</p>
        <span>Veuillez réessayer.</span>
        <button class="retry-btn" onclick="this.parentElement.parentElement.style.display='none';">Réessayer plus tard</button>
        </div>
        </div>`;
    }
});