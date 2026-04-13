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

document.addEventListener("DOMContentLoaded", () => {
    if (!document.getElementById("global-loader")) {
        const loaderHTML = `
            <div id="global-loader">
                <div class="spinner"></div>
                <div class="loader-text" style="margin-top: 15px; color: #001554; font-family: sans-serif;">Connexion en cours...</div>
            </div>`;
        document.body.insertAdjacentHTML("afterbegin", loaderHTML);
    }
});

const originalFetch = window.fetch;
window.fetch = async (...args) => {
    Loader.show();
    const timer = new Promise(resolve => setTimeout(resolve, MIN_LOADER_TIME));
    try {
        const [response] = await Promise.all([originalFetch(...args), timer]);
        return response;
    } finally {
        Loader.hide();
    }
};

window.addEventListener("beforeunload", () => Loader.show());

const EcoTech_API_URL = "/ecotechnologie/ecotech_api/auth_ecotech.php";

document.getElementById("loginForm").addEventListener("submit", async (e) => {
    e.preventDefault();

    const emailInput = document.getElementById("email").value.trim();
    const passwordInput = document.getElementById("password").value;
    const connectMessage = document.getElementById("loginMessage");

    if (!emailInput.includes("@")) {
        // connectMessage.innerHTML = `<p style="color: red;">Veuillez entrer un email valide.</p>`;
            showToast(" Veuillez entrer un email valide.", "error");
        return;
    }

    try {
        const response = await fetch(EcoTech_API_URL, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                email: emailInput,
                password: passwordInput,
            }),
        });

        const contentType = response.headers.get("content-type");
        if (!contentType || !contentType.includes("application/json")) {
            throw new TypeError("Le serveur n'a pas renvoyé de JSON valide");
        }

        const data = await response.json();

        if (data.status === 'success') {
            // --- MODIFICATIONS JWT ICI ---
            
            // 1. On stocke le TOKEN (Le badge de sécurité)
            localStorage.setItem("ecotech_token", data.token); 
            
            // 2. On stocke les infos utilisateur (Pour l'affichage du nom dans la nav)
            // On s'assure de ne pas stocker l'ID ici si on veut être puriste JWT, 
            // car le serveur le retrouvera dans le token.
            localStorage.setItem("user", JSON.stringify(data.user)); 
            
            // 3. (Optionnel) Nettoyage d'un éventuel ancien panier invité si besoin
            // localStorage.removeItem("panier_invite"); 

            connectMessage.innerHTML = `
                <div id="success-overlay" class="overlay">
                    <div class="success-popup">
                        <i class="fas fa-check-circle success-icon"></i>
                        <p>Connexion réussie !</p>
                        <span class="subtext">Préparation de votre espace...</span>
                        <div class="spinner"></div>
                    </div>
                </div>`;

            setTimeout(() => {
                window.location.href = "../index.html";
            }, 3000);

        } else {
            connectMessage.innerHTML = `<div class="form-message-overlay">
            <div class="error-popup">
            <i class="ph ph-warning-circle"></i>
            <p style="color: red;">${data.message}</p>
            <button class="retry-btn">Réessayer</button>
            </div>
            </div>`;
            setTimeout(() => {
    const retryBtn = document.querySelector(".retry-btn");
    if (retryBtn) {
        retryBtn.addEventListener("click", () => {
            const overlay = document.querySelector(".form-message-overlay");
            if (overlay) overlay.remove(); // mieux que display:none

            // Reset du formulaire (optionnel mais pro)
            document.getElementById("password").value = "";
            document.getElementById("password").focus();
        });
    }
}, 0);
            // showToast("Erreur de connexion.", "error");
        }
    } catch (error) {
        console.error("Erreur:", error);
        connectMessage.innerHTML = `<div class="form-message-overlay">
        <div class="error-popup">
        <i class="ph ph-warning-circle"></i>
        <p style="color: red;">Oups! impossible de joindre le serveur d'authentification nos équipes techniques sont mobilisées pour résoudre le problème.</p>
        <button class="retry-btn">Réessayer plus tard</button>
        </div>
        </div>`;

        setTimeout(() => {
    const retryBtn = document.querySelector(".retry-btn");
    if (retryBtn) {
        retryBtn.addEventListener("click", () => {
            const overlay = document.querySelector(".form-message-overlay");
            if (overlay) overlay.remove(); // mieux que display:none

            // Reset du formulaire (optionnel mais pro)
            document.getElementById("password").value = "";
            document.getElementById("password").focus();
        });
    }
}, 0);
        // showToast("Erreur de communication avec le serveur.", "error");
    }
});

function showToast(message, type = 'success') {
    const container = document.getElementById('toast-container');
    if(!container) return;

    const toast = document.createElement('div');
    // On applique la classe error si besoin, sinon rien
    toast.className = `toast ${type === 'error' ? 'error' : ''}`;
    
    // On utilise les classes d'icônes de ton thank.php
    const iconClass = type === 'success' ? 'ph-check-circle' : 'ph-warning-octagon';
    
    toast.innerHTML = `
        <i class="ph-fill ${iconClass}"></i>
        <span>${message}</span>
    `;

    container.appendChild(toast);

    // Animation d'entrée
    setTimeout(() => toast.classList.add('show'), 100);

    // Suppression automatique
    setTimeout(() => { 
        toast.classList.remove('show'); 
        setTimeout(() => toast.remove(), 400); 
    }, 3000);
}