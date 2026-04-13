/* ==========================================
   GESTION DES MODALES (Légal, Cookies, etc.)
   ========================================== */
var usingRulesModal = document.getElementById("usingRulesModal");
var privacyPolicyModal = document.getElementById("privacyPolicyModal");
var cookiesPolicyModal = document.getElementById("cookiesPolicyModal");
var legalMentionsModal = document.getElementById("legalMentionsModal");

function openUsingRules() { usingRulesModal.style.display = "block"; }
function closeUsingRules() { usingRulesModal.style.display = "none"; }

function openPrivacyPolicy() { privacyPolicyModal.style.display = "block"; }
function closePrivacyPolicy() { privacyPolicyModal.style.display = "none"; }

function openCookiesPolicy() { cookiesPolicyModal.style.display = "block"; }
function closeCookiesPolicy() { cookiesPolicyModal.style.display = "none"; }

function openLegalMentions() { legalMentionsModal.style.display = "block"; }
function closeLegalMentions() { legalMentionsModal.style.display = "none"; }

// Fermeture au clic sur le fond de la modale
window.onclick = function(event) {
    if (event.target == usingRulesModal) { usingRulesModal.style.display = "none"; } 
    else if (event.target == privacyPolicyModal) { privacyPolicyModal.style.display = "none"; }
    else if (event.target == cookiesPolicyModal) { cookiesPolicyModal.style.display = "none"; }  
    else if (event.target == legalMentionsModal) { legalMentionsModal.style.display = "none"; }
} 

// Fermeture via la croix (classe .close)
document.addEventListener('click', function(event) {
    if (event.target.classList.contains('close')) {
        if (usingRulesModal) usingRulesModal.style.display = "none";
        if (privacyPolicyModal) privacyPolicyModal.style.display = "none";
        if (cookiesPolicyModal) cookiesPolicyModal.style.display = "none";
        if (legalMentionsModal) legalMentionsModal.style.display = "none";
    }
});


document.addEventListener("DOMContentLoaded", () => {
    const notifBtn = document.getElementById("notifBtn");
    const notifDropdown = document.getElementById("notifDropdown");
    const notifList = document.getElementById("notifList");
    const notifCount = document.getElementById("notif-count");

    // 1. Charger les notifications au démarrage
    loadNotifications();

    // 2. Gérer le clic sur la cloche
    notifBtn.addEventListener("click", async (e) => {
        e.stopPropagation();
        
        // On bascule l'affichage du menu
        const isOpening = !notifDropdown.classList.contains("show");
        notifDropdown.classList.toggle("show");

        // Si on ouvre le menu, on marque comme lu en BDD
        if (isOpening) {
            await markAsRead();
        }
    });

    // Fermer le menu si on clique ailleurs
    document.addEventListener("click", () => {
        notifDropdown.classList.remove("show");
    });

    async function loadNotifications() {
        const token = localStorage.getItem("ecotech_token");
        if (!token) return;

        try {
            const response = await fetch("ecotech-notification-systeme.php", {
                method: "GET",
                headers: { "Authorization": "Bearer " + token }
            });
            
            const data = await response.json();

            if (data.status === "success") {
                renderNotifications(data.notifs);
            }
        } catch (error) {
            console.error("Erreur Fetch :", error);
        }
    }

    async function markAsRead() {
        const token = localStorage.getItem("ecotech_token");
        try {
            // ATTENTION : vérifie bien le nom de ton fichier PHP (ecotech-notif-read.php)
            await fetch("ecotech-notif-read.php", { 
                method: "POST",
                headers: { "Authorization": "Bearer " + token }
            });

            // Une fois marqué en BDD, on cache le badge
            notifCount.style.display = "none";
            notifCount.textContent = "0";
        } catch (error) {
            console.error("Erreur lors de la mise à jour :", error);
        }
    }

    function renderNotifications(notifs) {
        if (!notifs || notifs.length === 0) {
            notifList.innerHTML = '<p class="empty-msg">Aucune notification</p>';
            notifCount.style.display = "none";
            return;
        }

        // Compter uniquement les notifications non lues (où lu == 0)
        const unreadCount = notifs.filter(n => parseInt(n.lu) === 0).length;

        if (unreadCount > 0) {
            notifCount.textContent = unreadCount;
            notifCount.style.display = "block";
        } else {
            notifCount.style.display = "none";
        }

        // Génération du HTML (On remplace n.statut par n.lu)
        notifList.innerHTML = notifs.map(n => `
            <div class="notif-item ${parseInt(n.lu) === 0 ? 'unread' : ''}">
                <div class="notif-icon-type">
                    <i class="${getIconByType(n.type_notif)}"></i>
                </div>
                <div class="notif-text">
                    <strong>${n.titre}</strong>
                    <p>${n.message}</p>
                    <span class="notif-date">${formatDate(n.date_envoi)}</span>
                </div>
            </div>
        `).join('');
    }

    function getIconByType(type) {
        switch(type) {
            case 'promo': return 'ph ph-tag-fill';
            case 'alerte': return 'ph ph-warning-fill';
            case 'relance': return 'ph ph-arrow-counter-clockwise-fill'; // Ajout pour tes relances
            default: return 'ph ph-info-fill';
        }
    }

    function formatDate(dateStr) {
        if(!dateStr) return "";
        const date = new Date(dateStr);
        return date.toLocaleDateString('fr-FR', { day: 'numeric', month: 'short', hour: '2-digit', minute: '2-digit' });
    }
});

const topnav = document.querySelector(".topnav");
let lastScroll = 0;

window.addEventListener("scroll", () => {
    const currentScroll = window.scrollY;

    // 1. Effet visuel simple (opacité ou couleur)
    if (currentScroll > 50) {
        topnav.classList.add("scrolled");
    } else {
        topnav.classList.remove("scrolled");
    }

    // 2. Disparition dynamique
    // Si on descend et qu'on a dépassé 150px de hauteur
    if (currentScroll > lastScroll && currentScroll > 150) {
        topnav.style.transform = "translateY(-100%)"; // Cache la barre vers le haut
        topnav.style.opacity = "0";
    } 
    // Si on remonte
    else {
        topnav.style.transform = "translateY(0)";
        topnav.style.opacity = "1";
    }

    lastScroll = currentScroll;
});