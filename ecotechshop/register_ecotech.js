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
                <div class="loader-text">Inscription en cours...</div>
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

const EcoTech_API_URL ="/ecotechnologie/ecotech_api/register_ecotech.php";

document.getElementById("FormulaireInscription").addEventListener("submit", async (e) => {
    e.preventDefault();

    const usernameInput = document.getElementById("username").value;
    const emailInput = document.getElementById("email").value;
    const passwordInput = document.getElementById("password").value;
    const messages = document.getElementById("authMessage");

    try { 
        const response = await fetch(EcoTech_API_URL, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                username : usernameInput,
                password : passwordInput,
                email : emailInput,
            }),
        });
        const data = await response.json();

      if (data.status === 'success') {
    const popupHTML = `
        <div id="success-overlay" class="overlay">
            <div class="success-popup">
                <i class="fas fa-check-circle success-icon"></i>
                <p>Inscription réussie !</p>
                <span class="subtext">${data.message}</span>
                <div class="progress-bar"></div> </div>
        </div>`;
    document.body.insertAdjacentHTML("beforeend", popupHTML);
    messages.innerHTML = `
        <div class="btn-connect" style="margin-top: 20px;">
            <button type="button" onclick="window.location.href = 'auth_ecotech.html'">
                Se connecter maintenant
            </button>
        </div>`;
    setTimeout(() => {
        const overlay = document.getElementById('success-overlay');
        if (overlay) {
            overlay.classList.add('hidden');
            setTimeout(() => overlay.remove(), 500);
        }
    }, 3000);

    document.getElementById("FormulaireInscription").reset();           
        } else {
            messages.innerHTML = `<p style="color:red;">${data.message}</p>`;
        }
    } catch(error) {
        messages.innerHTML = `<p style="color:red;">Une erreur s'est produite lors de l'inscription.</p>`;
    }
});