const ADMIN_API = "admin_management.php";
let ngrokInterval = null;
let demandesChart = null; 
const INACTIVITY_LIMIT = 2 * 60 * 60 * 1000; // 2 Heures

let currentData = [];      // Stocke les données complètes récupérées
let currentPage = 1;       // Page actuelle
const rowsPerPage = 7;


// --- 1. INITIALISATION ---
document.addEventListener("DOMContentLoaded", () => {
    // Vérification de sécurité immédiate
    const token = localStorage.getItem('ecotech_token');
    if (token) {
        updateLastActivity();
        gererUrlEtAuthAdmin(); // NOUVEAU : Application du style d'URL Pro
    } else {
        window.location.href = 'admin_auth.html';
        return;
    }

    chargerDonnees('list_stock', 'pc');
    
    // Cycle de rafraîchissement global du Dashboard (toutes les 10 secondes)
    refreshDashboardStats(); 
    setInterval(refreshDashboardStats, 10000); 

    // Surveillance de la session
    setInterval(checkSessionStatus, 5000);
    
    // Initialisation du profil
    afficherProfilAdmin();
    updateSidebarProfile();
});

// --- 2. GESTION DE LA SESSION, ACTIVITÉ & URL ---

function gererUrlEtAuthAdmin() {
    const urlParams = new URLSearchParams(window.location.search);
    
    if (!urlParams.has('session_id')) {
        const array = new Uint32Array(4);
        window.crypto.getRandomValues(array);
        let longId = "";
        for (let i = 0; i < array.length; i++) {
            longId += array[i].toString(16);
        }
        
        const proUrl = window.location.pathname + `?session_id=${longId}&view=admin_dashboard&access=granted`;
        window.history.replaceState({path: proUrl}, '', proUrl);
    }
}

function updateLastActivity() {
    localStorage.setItem('ecotech_last_activity', Date.now());
}

['mousedown', 'keydown', 'scroll', 'touchstart'].forEach(eventName => {
    document.addEventListener(eventName, updateLastActivity);
});

function checkSessionStatus() {
    const lastActivity = localStorage.getItem('ecotech_last_activity');
    const token = localStorage.getItem('ecotech_token');

    if (token && lastActivity) {
        const now = Date.now();
        const diff = now - parseInt(lastActivity);

        if (diff > INACTIVITY_LIMIT) {
            console.log("SESSION ADMIN EXPIRÉE");
            localStorage.removeItem('ecotech_token');
            localStorage.removeItem('ecotech_last_activity');
            window.location.href = "/ecotechnologie/ecotechadmin/ecotechadmin_api/session-expiree.html"; 
        }
    } else if (!token && !window.location.href.includes('admin_auth.html')) {
        window.location.href = 'admin_auth.html';
    }
}

function logoutAdmin() {
    document.getElementById('confirm-title').innerText = "Déconnexion";
    document.getElementById('confirm-message').innerText = "Voulez-vous vraiment quitter la session ?";
    const btnOk = document.getElementById('confirm-btn-ok');
    btnOk.onclick = async () => {
        await fetch(ADMIN_API, { method: 'POST', body: JSON.stringify({ action: 'logout' }) });
        localStorage.removeItem('ecotech_token');
        localStorage.removeItem('ecotech_last_activity');
        window.location.href = 'admin_auth.html';
    };
    openModal('modal-confirm');
}

// --- 3. LOGIQUE DE VUES ---
function cacherToutesLesVues() {
    if (ngrokInterval) { clearInterval(ngrokInterval); ngrokInterval = null; }
    
    const views = ['dashboard-view', 'main-table-section', 'messaging-view'];
    views.forEach(id => {
        const el = document.getElementById(id);
        if(el) el.style.display = 'none';
    });
}

function afficherDashboard() {
    cacherToutesLesVues();
    const title = document.getElementById("view-title");
    const actionBar = document.getElementById("action-bar");
    
    title.innerText = "Tableau de Bord Stratégique";
    actionBar.innerHTML = `<button class="btn-add" onclick="refreshDashboardStats()"><i class="fa-solid fa-rotate"></i> Actualiser</button>`;
    
    document.getElementById('dashboard-view').style.display = 'block';
    refreshDashboardStats();
}

function afficherMessaging() {
    cacherToutesLesVues();
    const msgView = document.getElementById('messaging-view');
    if(msgView) {
        msgView.style.display = 'block';
        document.getElementById('view-title').innerText = "Centre de Communication interne & Campagnes";
        document.getElementById("action-bar").innerHTML = "";
    } else {
        showToast("Erreur : Vue messaging introuvable dans le HTML", "error");
    }
}

// --- 4. LOGIQUE DASHBOARD (KPI & GRAPH) ---
// Variable globale pour stocker l'instance du graphique de fluctuation
let fluctuationChart = null;

async function refreshDashboardStats() {
    try {
        // 1. Récupération des stats classiques
        const response = await fetch(`${ADMIN_API}?target=get_dashboard_stats`);
        const data = await response.json();

        if (data.status === 'success') {
            document.getElementById('live-total-users').innerText = data.users_count;
            document.getElementById('live-total-orders').innerText = data.orders_count;
            document.getElementById('live-ca').innerText = data.revenue + " €";
            
            const pendingCa = document.getElementById('live-pending-ca');
            const pendingNb = document.getElementById('live-pending-nb');
            if(pendingCa) pendingCa.innerText = data.pending_revenue + " €";
            if(pendingNb) pendingNb.innerText = data.pending_count;

            if(document.getElementById('live-avg')) document.getElementById('live-avg').innerText = data.satisfaction.average;
            updateDemandesChart(data.demandes_stats);
        }

        // 2. NOUVEAU : Récupération des stats de fluctuation (Avril 2026)
        const responseExt = await fetch(`${ADMIN_API}?target=get_external_stats`);
        const dataExt = await responseExt.json();

        if (dataExt.status === 'success') {
            // Affichage de la commission totale (ajoute un élément avec cet ID dans ton HTML)
            const commEl = document.getElementById('live-commissions');
            if(commEl) commEl.innerText = dataExt.total_commission + " €";
            
            // Mise à jour de la courbe
            updateFluctuationChart(dataExt.chart_data, dataExt.y_axis_max);
        }

    } catch (e) { console.error("Erreur Dashboard:", e); }
}

function updateDemandesChart(stats) {
    const canvas = document.getElementById('demandesGraph');
    if (!canvas) return;
    const ctx = canvas.getContext('2d');
    if (demandesChart) demandesChart.destroy();

    demandesChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['En attente', 'Traitées'],
            datasets: [{
                label: 'Volume de demandes',
                data: [stats.en_attente, stats.traite],
                backgroundColor: ['#e74c3c', '#27ae60'],
                borderRadius: 6
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: { legend: { display: false } },
            scales: {
                y: { beginAtZero: true, grid: { display: false } },
                x: { grid: { display: false } }
            }
        }
    });
}

// --- COPIE CE BLOC ET INSÈRE-LE DANS TA SECTION 4 ---

function updateFluctuationChart(chartData, yMax) {
    const canvas = document.getElementById('fluctuationGraph');
    if (!canvas) return;
    const ctx = canvas.getContext('2d');

    // Création du gradient "Trading Style"
    const gradient = ctx.createLinearGradient(0, 0, 0, 400);
    gradient.addColorStop(0, 'rgba(0, 210, 255, 0.3)'); // Bleu néon
    gradient.addColorStop(1, 'rgba(0, 210, 255, 0)');   // Fondu vers noir

    if (fluctuationChart) fluctuationChart.destroy();

    fluctuationChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: chartData.labels,
            datasets: [{
                label: 'Ventes Externes',
                data: chartData.datasets,
                // Style de la ligne
                borderColor: '#00d2ff', 
                borderWidth: 3,
                tension: 0.4,
                fill: true,
                backgroundColor: gradient,
                // Points (uniquement au survol pour un look épuré)
                pointRadius: 0, 
                pointHitRadius: 20,
                pointHoverRadius: 6,
                pointHoverBackgroundColor: '#00d2ff',
                pointHoverBorderColor: '#fff',
                pointHoverBorderWidth: 3,
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            interaction: { intersect: false, mode: 'index' }, // Ligne verticale au survol
            scales: {
                y: {
                    beginAtZero: true,
                    max: yMax,
                    grid: { color: 'rgba(255, 255, 255, 0.05)', drawBorder: false },
                    ticks: { color: '#64748b', font: { family: 'monospace' } }
                },
                x: {
                    grid: { display: false },
                    ticks: { color: '#64748b' }
                }
            },
            plugins: {
                legend: { display: false } // On cache la légende pour faire "pro"
            }
        }
    });
}

// --- 5. CHARGEMENT & RENDU DES TABLES ---
async function chargerDonnees(target, category = 'pc') {
    cacherToutesLesVues();
    document.getElementById('main-table-section').style.display = 'block';

    const loader = document.getElementById('global-loader');
    if (loader) loader.style.display = 'flex';

    try {
        const response = await fetch(`${ADMIN_API}?target=${target}&cat=${category}`);
        const result = await response.json();
        if (result.status === 'success') {
            renderTable(target, (target === 'list_stock' ? result.products : result.data), category, result.table_stock);
        }
    } catch (e) { showToast("Erreur réseau", "error"); }
    
    if (loader) loader.style.display = 'none';
}

function renderTable(target, data, currentCat, tableStock) {
    const actionBar = document.getElementById("action-bar");
    const title = document.getElementById("view-title");
    
    currentData = data; 
    currentPage = 1; 

    actionBar.innerHTML = "";

    if (target === 'list_stock') {
        title.innerText = `Stocks : ${currentCat.toUpperCase()}`;
    } else if (target === 'list_staff') {
        title.innerText = "Collaborateurs";
        actionBar.innerHTML = `<button class="btn-add" onclick="openModal('modal-form-staff')"><i class="fa-solid fa-plus"></i> Nouveau</button>`;
    } else if (target === 'list_users') {
        title.innerText = "Gestion des Clients";
    }

    displayPage(target, currentCat, tableStock);
}

// --- 6. ACTIONS (STOCKS, STAFF, MESSAGERIE) ---
function ouvrirModifStock(id, table, nom, qte) {
    document.getElementById('stock-product-name').innerText = nom;
    document.getElementById('new-qte').value = qte;
    const btn = document.getElementById('stock-confirm-btn');
    btn.onclick = async () => {
        const nQte = document.getElementById('new-qte').value;
        const res = await fetch(ADMIN_API, { method: 'POST', body: JSON.stringify({ action: 'update_stock', id_produit: id, table_stock: table, quantite: nQte }) });
        if ((await res.json()).status === 'success') {
            showToast("Stock mis à jour");
            closeModal('modal-stock');
            const cat = table.includes('tel') ? 'tel' : table.includes('tv') ? 'tv' : table.includes('sons') ? 'son' : table.includes('periph') ? 'periph' : 'pc';
            chargerDonnees('list_stock', cat);
        }
    };
    openModal('modal-stock');
}

async function validerAjoutStaff() {
    const data = { 
        action: 'add_staff', 
        nom: document.getElementById('staff-nom').value, 
        prenom: document.getElementById('staff-prenom').value, 
        email: document.getElementById('staff-email').value, 
        service: document.getElementById('staff-service').value 
    };
    if (data.nom && data.email) {
        const res = await fetch(ADMIN_API, { method: 'POST', body: JSON.stringify(data) });
        if ((await res.json()).status === 'success') { 
            showToast("Employé ajouté"); 
            closeModal('modal-form-staff'); 
            chargerDonnees('list_staff'); 
        }
    } else { showToast("Veuillez remplir les champs", "error"); }
}

function supprimer(id, action, reload) {
    document.getElementById('confirm-title').innerText = "Confirmation";
    document.getElementById('confirm-message').innerText = "Voulez-vous vraiment supprimer cet élément ?";
    const btnOk = document.getElementById('confirm-btn-ok');
    btnOk.onclick = async () => {
        const res = await fetch(ADMIN_API, { method: 'POST', body: JSON.stringify({ action, id }) });
        if ((await res.json()).status === 'success') { 
            showToast("Suppression réussie"); 
            closeModal('modal-confirm'); 
            chargerDonnees(reload); 
        }
    };
    openModal('modal-confirm');
}

function ouvrirRelanceSpecifique(idUser, username) {
    afficherMessaging();
    const catSelect = document.getElementById('msg-category');
    const subjectInp = document.getElementById('msg-subject');
    const bodyTxt = document.getElementById('msg-body');

    if(catSelect) catSelect.value = 'relance';
    if(subjectInp) subjectInp.value = ` Rappel : Votre commande EcoTech attend votre validation`;
    if(bodyTxt) bodyTxt.value = `Bonjour ${username},\n\nNous avons remarqué que votre panier n'a pas encore été validé. Nos stocks sont limités, ne tardez pas à finaliser votre commande pour garantir la disponibilité de vos articles !\n\nA très vite sur EcoTech Shop.`;
    
    showToast(`Demande de relance effectuée pour ${username}`);
}

async function envoyerCampagne() {
    const category = document.getElementById('msg-category').value;
    const bodyText = document.getElementById('msg-body').value;
    const subject = document.getElementById('msg-subject').value;

    if(!bodyText || !subject) {
        showToast("Veuillez remplir le sujet et le message", "error");
        return;
    }

    if(!confirm(`Confirmer l'envoi de cette campagne (${category}) ?`)) return;

    try {
        const res = await fetch(ADMIN_API, {
            method: 'POST',
            body: JSON.stringify({
                action: 'envoyer_campagne',
                category: category,
                subject: subject,
                content: bodyText
            })
        });

        const result = await res.json();
        if(result.status === 'success') {
            showToast(`Campagne ${category} envoyée avec succès !`);
            document.getElementById('msg-body').value = "";
            document.getElementById('msg-subject').value = "";
        } else {
            showToast(result.message, "error");
        }
    } catch(e) { showToast("Erreur lors de l'envoi", "error"); }
}

// --- 7. MONITEUR RÉSEAU ---
async function monitorerNgrok() {
    cacherToutesLesVues();
    document.getElementById('main-table-section').style.display = 'block';

    const head = document.getElementById("table-head");
    const body = document.getElementById("table-body");
    const title = document.getElementById("view-title");
    const actionBar = document.getElementById("action-bar");

    title.innerHTML = "Moniteur Réseau Local <span class='badge-live' style='background:#27ae60; color:white; padding:2px 5px; border-radius:4px; font-size:0.6rem; animation:blink 1s infinite;'>SÉCURISÉ</span>";
    actionBar.innerHTML = `<button class="btn-add" style="background:#e74c3c" onclick="viderLogs()"><i class="fa-solid fa-trash"></i> Effacer les logs</button>`;
    
    head.innerHTML = "<th>Heure</th><th>Méthode</th><th>Route</th><th>Statut</th><th>Durée</th>";
    body.innerHTML = "<tr><td colspan='5' style='text-align:center;'>Initialisation du moniteur local...</td></tr>";

    ngrokInterval = setInterval(async () => {
        try {
            const response = await fetch('/ecotechnologie/ecotech_api/api_logs.php');
            const result = await response.json();
            
            if (result.status === 'success') {
                body.innerHTML = "";
                if (result.data.length === 0) {
                    body.innerHTML = "<tr><td colspan='5' style='text-align:center;'>Aucune requête enregistrée.</td></tr>";
                    return;
                }

                result.data.forEach(req => {
                    const statusColor = req.status >= 400 ? "#e74c3c" : "#27ae60";
                    const methodColor = req.method === 'POST' ? "#f39c12" : "#010454";
                    const date = new Date(req.created_at).toLocaleTimeString();

                    body.innerHTML += `
                        <tr style="font-family: monospace; font-size:0.85rem;">
                            <td>${date}</td>
                            <td><span style="color:${methodColor}; font-weight:bold;">${req.method}</span></td>
                            <td style="word-break:break-all;">${req.endpoint}</td>
                            <td style="font-weight:bold; color:${statusColor}">${req.status}</td>
                            <td>${parseFloat(req.duration).toFixed(2)} ms</td>
                        </tr>`;
                });
            }
        } catch (error) { 
            body.innerHTML = "<tr><td colspan='5' style='text-align:center; color:red;'>Erreur : Impossible de lire la table api_monitor_logs.</td></tr>"; 
        }
    }, 2000);
}

async function viderLogs() {
    if (!confirm("Voulez-vous vraiment effacer tout l'historique ?")) return;
    try {
        const response = await fetch('/ecotechnologie/ecotech_api/api_logs.php', {
            method: 'POST',
            body: JSON.stringify({ action: 'clear_logs' })
        });
        if ((await response.json()).status === 'success') showToast("Logs effacés !");
    } catch (error) { showToast("Erreur réseau", "error"); }
}

// --- 8. UTILITAIRES INTERFACE ---
function showToast(message, type = 'success') {
    const container = document.getElementById('toast-container');
    if(!container) return;
    const toast = document.createElement('div');
    toast.className = `toast ${type === 'error' ? 'error' : ''}`;
    const iconClass = type === 'success' ? 'ph-check-circle' : 'ph-warning-octagon';
    toast.innerHTML = `<i class="ph-fill ${iconClass}"></i><span>${message}</span>`;
    container.appendChild(toast);
    setTimeout(() => toast.classList.add('show'), 100);
    setTimeout(() => { 
        toast.classList.remove('show'); 
        setTimeout(() => toast.remove(), 400); 
    }, 3000);
}

function openModal(id) { const m = document.getElementById(id); if(m) m.style.display = 'flex'; }
function closeModal(id) { const m = document.getElementById(id); if(m) m.style.display = 'none'; }

function toggleSubmenu(element) {
    const parent = element.parentElement;
    document.querySelectorAll('.has-submenu').forEach(item => { if (item !== parent) item.classList.remove('open'); });
    parent.classList.toggle('open');
}

function displayPage(target, currentCat, tableStock) {
    const head = document.getElementById("table-head");
    const body = document.getElementById("table-body");
    
    body.innerHTML = "";
    
    const start = (currentPage - 1) * rowsPerPage;
    const end = start + rowsPerPage;
    const paginatedData = currentData.slice(start, end);

    if (target === 'list_stock') {
        head.innerHTML = "<th>Produit</th><th>Prix</th><th>Stock</th><th>Action</th>";
        paginatedData.forEach(p => {
            body.innerHTML += `<tr><td><strong>${p.nom}</strong></td><td>${p.prix}€</td><td style="font-weight:bold;">${p.quantite}</td><td><button class="btn-edit" onclick="ouvrirModifStock(${p.id_produit}, '${tableStock}', '${p.nom.replace(/'/g, "\\'")}', ${p.quantite})">Modifier</button></td></tr>`;
        });
    } else if (target === 'list_staff') {
        head.innerHTML = "<th>Nom</th><th>Email</th><th>Service</th><th>Action</th>";
        paginatedData.forEach(emp => {
            body.innerHTML += `<tr><td>${emp.nom} ${emp.prenom}</td><td>${emp.email}</td><td><span class="badge">${emp.service}</span></td><td><button class="btn-delete" onclick="supprimer(${emp.id_staff}, 'delete_staff', 'list_staff')">Supprimer</button></td></tr>`;
        });
    } else if (target === 'list_users') {
        head.innerHTML = "<th>Nom</th><th>Email</th><th>Etat Commande</th><th>Actions</th>";
        paginatedData.forEach(u => {
            let relanceBtn = u.has_pending > 0 
                ? `<button class="btn-edit" style="background:#f39c12; border:none;" onclick="ouvrirRelanceSpecifique(${u.id}, '${u.username.replace(/'/g, "\\'")}')"><i class="ph ph-bell"></i> Relancer</button>`
                : `<span class="badge" style="background:#f1f2f6; color:#a4b0be;">À jour</span>`;
            body.innerHTML += `<tr><td><strong>${u.username}</strong></td><td>${u.email}</td><td>${relanceBtn}</td><td><button class="btn-delete" onclick="supprimer(${u.id}, 'delete_user', 'list_users')">Supprimer</button></td></tr>`;
        });
    }

    renderPaginationControls(target, currentCat, tableStock);
}

function renderPaginationControls(target, currentCat, tableStock) {
    const totalPages = Math.ceil(currentData.length / rowsPerPage);
    const oldControls = document.getElementById('pagination-controls');
    if (oldControls) oldControls.remove();

    if (totalPages <= 1) return; 

    const paginationDiv = document.createElement('div');
    paginationDiv.id = 'pagination-controls';
    paginationDiv.style = "display:flex; justify-content:center; align-items:center; gap:15px; margin-top:15px; padding:10px;";

    paginationDiv.innerHTML = `
        <button class="btn-pagination" ${currentPage === 1 ? 'disabled' : ''} id="prevBtn">
            <i class="ph ph-caret-left"></i>
        </button>
        <span style="font-size:0.9rem; font-weight:bold;">Page ${currentPage} / ${totalPages}</span>
        <button class="btn-pagination" ${currentPage === totalPages ? 'disabled' : ''} id="nextBtn">
            <i class="ph ph-caret-right"></i>
        </button>
    `;

    document.getElementById('main-table-section').appendChild(paginationDiv);

    document.getElementById('prevBtn').onclick = () => {
        if (currentPage > 1) { currentPage--; displayPage(target, currentCat, tableStock); }
    };
    document.getElementById('nextBtn').onclick = () => {
        if (currentPage < totalPages) { currentPage++; displayPage(target, currentCat, tableStock); }
    };
}

// --- 9. RENDU DU PROFIL (SIDEBAR) ---

function afficherProfilAdmin() {
    const nom = localStorage.getItem('ecotech_admin_nom') || "ADMIN";
    const prenom = localStorage.getItem('ecotech_admin_prenom') || "EcoTech";
    const role = localStorage.getItem('ecotech_admin_role') || "Super Admin";
    const photoName = localStorage.getItem('ecotech_admin_photo');

    const profileContainer = document.getElementById('admin-sidebar-profile');
    
    if (profileContainer) {
        // Détermination de l'image à afficher
        let imgSrc = "../../ecotechshop/ecotechshop_pictures/default_icon_ecotech_user_1.png";
        if (photoName && photoName !== "null" && photoName !== "") {
            imgSrc = `${photoName}`;
        }

        profileContainer.innerHTML = `
            <div class="profile-wrapper">
                <div class="profile-names">
                    <img src="${imgSrc}" alt="Photo de profil" class="profile-pic">
                    <span class="p-nom">${nom.toUpperCase()}</span>
                    <span class="p-prenom">${prenom}</span>
                </div>
                <div class="profile-role">
                   ${role}
                </div>
            </div>
        `;
    }
}

function updateSidebarProfile() {
    const nom = localStorage.getItem('ecotech_admin_nom');
    const prenom = localStorage.getItem('ecotech_admin_prenom');
    const role = localStorage.getItem('ecotech_admin_role');
    const photoName = localStorage.getItem('ecotech_admin_photo');

    const profileNameElement = document.getElementById('admin-profile-name');
    const profileRoleElement = document.getElementById('admin-profile-role');
    const avatarContainer = document.querySelector('.admin-avatar');

    if (profileNameElement && nom) {
        profileNameElement.innerHTML = `<span class="u-nom">${nom.toUpperCase()}</span> ${prenom}`;
    }
    if (profileRoleElement && role) {
        profileRoleElement.innerText = role;
    }

    if (avatarContainer) {
        if (photoName && photoName !== "null" && photoName !== "") {
            const fullPath = `${photoName}`;
            avatarContainer.innerHTML = `<img src="${fullPath}" alt="Profil" style="width:100%; height:100%; border-radius:50%; object-fit:cover; border: 2px solid rgba(255,255,255,0.1);">`;
        } else {
            // Placeholder par défaut si aucune photo en base
            avatarContainer.innerHTML = `<i class="ph-fill ph-user-circle" style="font-size: 32px; color: #ccc;"></i>`;
        }
    }
}