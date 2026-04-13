// mes fonctions de profil utilisateur, génération de facture, etc.

(function() {
    const PROFIL_API_URL = "/ecotechnologie/ecotech_users_profil/users_profil_api/profil.php";

    function generateProSessionId() {
        const array = new Uint32Array(8); 
        window.crypto.getRandomValues(array);
        let longId = "";
        for (let i = 0; i < array.length; i++) {
            longId += array[i].toString(16).padStart(8, '0');
        }
        return longId.toUpperCase();
    }

  window.generateInvoice = function(description, montant, date) {
    let numMontant = parseFloat(montant);

    let montantFinal = numMontant > 0 ? -numMontant : numMontant;

    const form = document.createElement('form');
    form.method = 'POST';
    form.action = '/ecotechnologie/ecotech_users_profil/users_profil_api/ecotech-invoice-manager.php';
    form.target = '_blank';

    // console.log("Montant avant conversion:", montant);
    // console.log("Montant après conversion:", montantFinal);
    // console.log("Description:", description);
    // console.log("Date:", date);
    // console.log("Token:", localStorage.getItem("ecotech_token"));
    const params = {
        ref: description,
        montant: montantFinal.toFixed(2),
        date: date,
        token: localStorage.getItem("ecotech_token")
    };

    for (const key in params) {
        const input = document.createElement('input');
        input.type = 'hidden';
        input.name = key;
        input.value = params[key];
        form.appendChild(input);
    }

    document.body.appendChild(form);
    form.submit();
    document.body.removeChild(form);
};

    async function fetchUserProfile() {
        const loader = document.getElementById('loader');
        const dataContainer = document.getElementById('profile-data');
        const transactionHistory = document.getElementById('transaction-history');
        const token = localStorage.getItem("ecotech_token");
        
        const urlParams = new URLSearchParams(window.location.search);
        if (!urlParams.has('session_id')) {
            const longId = generateProSessionId();
            const proUrl = window.location.pathname + 
                           `?session_id=${longId}&view=account_settings&status=verified_session`;
            window.history.replaceState({path: proUrl}, '', proUrl);
        }
        if (!token) {
            if (loader) loader.innerHTML = "<span style='color:red'>Accès refusé. Veuillez vous reconnecter.</span>";
            return;
        }

        try {
            const response = await fetch(PROFIL_API_URL, {
                method: 'POST',
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ token: token })
            });

            if (!response.ok) throw new Error(`Erreur HTTP: ${response.status}`);

            const result = await response.json();

            if (result.status === 'success') {

                const userField = document.getElementById('view-username');
                const emailField = document.getElementById('view-email');

                if (userField) userField.textContent = result.data.username;
                if (emailField) emailField.textContent = result.data.email;

                if (transactionHistory) {
                    transactionHistory.innerHTML = ""; 

                    if (result.data.transactions && result.data.transactions.length > 0) {
                        result.data.transactions.forEach(tx => {

                            const dateObj = new Date(tx.date_transaction);
                            const dateString = dateObj.toLocaleDateString('fr-FR');
                            const timeString = dateObj.toLocaleTimeString('fr-FR', { hour: '2-digit', minute: '2-digit' });

                          const refPourPDF = tx.session_commande; 

const txCard = `
    <div class="transaction-card">
        <div class="tx-logo">
            <img src="../ecotechshop/ecotechshop_pictures/logo-ecotech.png" alt="EB" onerror="this.src='https://via.placeholder.com/40x40?text=EB'">
        </div>
        <div class="tx-details">
            <span class="tx-name">${tx.description}</span>
            <span class="tx-date">${dateString} • ${timeString}</span>
        </div>
        <div class="tx-amount">
            <span class="price">${tx.montant} €</span>
            <button class="btn-pdf" onclick="generateInvoice('${refPourPDF}', '${tx.montant}', '${tx.date_transaction}', this)">
                <i class="ph ph-download-simple"></i> Télécharger ma facture
            </button>
        </div>
    </div>
`;
                            transactionHistory.insertAdjacentHTML('beforeend', txCard);
                        });
                    } else {
                        transactionHistory.innerHTML = "<p style='text-align:center; color:#888; padding:20px;'>Aucun historique d'achat disponible.</p>";
                    }
                }

                if (loader) loader.style.display = 'none';
                if (dataContainer) dataContainer.style.display = 'block';

            } else {
                if (loader) loader.innerHTML = `<span style='color:red'>${result.message}</span>`;
            }
        } catch (error) {
            console.error("Erreur Profil:", error);
            if (loader) loader.innerHTML = "<span style='color:red'>Erreur de connexion au serveur sécurisé.</span>";
        }
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', fetchUserProfile);
    } else {
        fetchUserProfile();
    }
})();


function updateLastActivity() {
    localStorage.setItem('ecotech_last_activity', Date.now());
}

['mousedown', 'keydown', 'scroll', 'touchstart'].forEach(eventName => {
    document.addEventListener(eventName, updateLastActivity);
});

function checkSessionStatus() {
    const INACTIVITY_LIMIT = 3 * 60 * 60 * 1000; 
    const lastActivity = localStorage.getItem('ecotech_last_activity');
    const token = localStorage.getItem('ecotech_token');

    if (token && lastActivity) {
        const now = Date.now();
        const diff = now - parseInt(lastActivity);
        const restantMs = INACTIVITY_LIMIT - diff;

        // Calcul du format mm:ss
        const min = Math.max(0, Math.floor(restantMs / 60000));
        const sec = Math.max(0, Math.floor((restantMs % 60000) / 1000));

        // On nettoie la console et on affiche
        // console.clear(); 
        // console.log("--- Contrôle de Session Ecotech ---");
        // console.log(`Dernière activité : ${Math.floor(diff / 1000)}s`);
        // console.log(`Statut : ACTIVE (${min}m ${sec}s restantes)`);

        if (diff > INACTIVITY_LIMIT) {
            localStorage.removeItem('ecotech_token');
            localStorage.removeItem('ecotech_last_activity');
            window.location.href = "/ecotechnologie/session_expiree.html";
        }
    }
}

setInterval(checkSessionStatus, 1000);