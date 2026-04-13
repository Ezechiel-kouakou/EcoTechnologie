const EcoTech_API_URL = "/ecotechnologie/ecotech_api/ecotechphone.php";
const EcotechCART_URL = "/ecotechnologie/ecotech_api/ecotech_panier.php";
const CATEGORIE_NOM = "telephone";
const DETAILS_PAGE = "phone_details.html";

// --- FONCTIONS DE GESTION SESSION PRO ---
/**
 * Génère un identifiant de session long et complexe
 */
function generateProSessionId() {
    const array = new Uint32Array(8); 
    window.crypto.getRandomValues(array);
    let longId = "";
    for (let i = 0; i < array.length; i++) {
        longId += array[i].toString(16).padStart(8, '0');
    }
    return longId.toUpperCase();
}

/**
 * Injecte les paramètres de session dans l'URL sans recharger la page
 */
function injectProSessionUrl() {
    const urlParams = new URLSearchParams(window.location.search);
    if (!urlParams.has('session_id')) {
        const longId = generateProSessionId();
        urlParams.set('session_id', longId);
        urlParams.set('view', 'mobile_catalog');
        urlParams.set('status', 'active_session');
        
        const proUrl = window.location.pathname + '?' + urlParams.toString();
        window.history.replaceState({path: proUrl}, '', proUrl);
    }
}
// ---------------------------------------

/**
 * Met à jour le badge du panier dans la navigation
 */
function updateCartBadge() {
    let count = localStorage.getItem("ecotech_cart_count") || 0;
    const badge = document.getElementById("cart-count");
    
    if (badge) {
        badge.innerText = count;
        badge.style.display = count > 0 ? "flex" : "none";
    }
}

/**
 * Notification Toast
 */
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
    setTimeout(() => {
        toast.remove();
    }, 3000);
}

/**
 * Navigation et Session
 */
function gererAffichageNav() {
    const authContainer = document.getElementById("authButtons");
    const navMenu = document.getElementById("navMenu");

    if (!authContainer) return;

    const userData = localStorage.getItem("user");

    const oldDynamicItems = document.querySelectorAll(".dynamic-auth");
    oldDynamicItems.forEach(el => el.remove());

    if (userData) {
        const user = JSON.parse(userData);

        authContainer.innerHTML = `
        <div class="user-info">
            <div class="user-name">
                <img 
                    src="/ecotechnologie/ecotechshop/ecotechshop_pictures/default_icon_ecotech_user.png"
                    alt="icon utilisateur"
                    onclick="window.location.href='/ecotechnologie/ecotech_users_profil/monprofil.html'"
                >
            </div>
        </div>`;

        if (navMenu) {
            navMenu.insertAdjacentHTML("beforeend", `
                <li class="dynamic-auth">
                    <a href="#" onclick="logout()">
                        <i class="fa-solid fa-right-from-bracket"></i> Déconnexion
                    </a>
                </li>
            `);
        }

    } else {
        authContainer.innerHTML = `
        <div class="user-info">
            <div class="user-name">
                <img 
                    src="/ecotechnologie/ecotechshop/ecotechshop_pictures/default_icon_ecotech_user.png"
                    alt="icon utilisateur"
                >
            </div>
        </div>`;

        if (navMenu) {
            navMenu.insertAdjacentHTML("beforeend", `
                <li class="dynamic-auth">
                    <a href="../ecotechnologie/ecotechshop/auth_ecotech.html">
                        <i class="fa-solid fa-right-to-bracket"></i> Connexion
                    </a>
                </li>
                <li class="dynamic-auth">
                    <a href="../ecotechnologie/ecotechshop/register_ecotech.html">
                        <i class="fa-solid fa-user-plus"></i> Inscription
                    </a>
                </li>
            `);
        }
    }
}

function logout() {
    localStorage.removeItem("user");
    localStorage.removeItem("ecotech_token");
    localStorage.removeItem("ecotech_cart_count");
    window.location.reload();
}

/**
 * Ajout au Panier
 */
async function ajouterAuPanier(idProduit, nom, prix, image, categorie) {
    const token = localStorage.getItem("ecotech_token");

    if (token) {
        try {
            const response = await fetch(EcotechCART_URL, {
                method: "POST",
                headers: { 
                    "Content-Type": "application/json",
                    "Authorization": "Bearer " + token 
                },
                body: JSON.stringify({
                    id_produit: idProduit,
                    categorie: categorie,
                    prix: prix,
                    action: 'plus'
                })
            });

            const result = await response.json();
            
            if (result.status === 'success') {
                showToast(nom + " ajouté au panier !");
                let currentCount = parseInt(localStorage.getItem("ecotech_cart_count") || 0);
                localStorage.setItem("ecotech_cart_count", currentCount + 1);
                updateCartBadge();
            } else if (result.message.includes("Session expirée")) {
                showToast("Session expirée. Reconnexion...", "error");
                localStorage.removeItem("ecotech_token");
                setTimeout(() => window.location.href = "auth_ecotech.html", 2000);
            } else {
                showToast(result.message, "error");
            }
        } catch (error) {
            console.error("Erreur:", error);
            showToast("Le serveur ne répond pas", "error");
        }
    } 
    else {
        let invite = JSON.parse(localStorage.getItem("panier_invite")) || [];
        const index = invite.findIndex(i => i.id_produit === idProduit && i.categorie === categorie);

        if (index > -1) {
            invite[index].quantite_souhaitee++;
        } else {
            invite.push({
                id_produit: idProduit,
                nom: nom,
                prix: prix,
                image: image,
                categorie: categorie,
                quantite_souhaitee: 1
            });
        }
        localStorage.setItem("panier_invite", JSON.stringify(invite));
        showToast(nom + " ajouté (mode invité)");
        
        let totalInvite = invite.reduce((acc, item) => acc + item.quantite_souhaitee, 0);
        localStorage.setItem("ecotech_cart_count", totalInvite);
        updateCartBadge();
    }
}

/**
 * Fetch et Affichage des téléphones
 */
async function fecthProducts() {
    const productsList = document.getElementById("productList");
    if (!productsList) return;

    try {
        const res = await fetch(EcoTech_API_URL);
        const data = await res.json();
        
        productsList.innerHTML = ""; 
        
        if (data.status !== 'success' || !data.products) {
            productsList.innerHTML = '<p style="text-align:center; grid-column: 1/-1;">Aucun téléphone disponible pour le moment.</p>';
            return;
        }

        data.products.forEach((product) => {
            const item = document.createElement("div");
            item.className = "product-card"; 
            
            let prixFinal = product.prix;
            let prixHTML = `<p class="price">${product.prix}€</p>`;
            let badgePromo = "";

            if (product.pourcentage && parseInt(product.pourcentage) > 0) {
                prixFinal = product.prix_promo;
                badgePromo = `<div class="promo-badge" style="position:absolute; top:10px; left:10px; background:#ff3b3b; color:white; padding:5px 10px; font-weight:bold; border-radius:5px; z-index:2; box-shadow: 0 2px 4px rgba(0,0,0,0.2);">-${product.pourcentage}%</div>`;
                prixHTML = `
                    <p class="price">
                        <span style="text-decoration:line-through; color:#999; font-size:0.85em; margin-right:8px;">${product.prix}€</span> 
                        <span style="color:#ff3b3b; font-weight:bold;">${product.prix_promo}€</span>
                    </p>`;
            }

            const escapedNom = product.nom.replace(/'/g, "\\'");

            item.innerHTML = `
                <div class="product-image-container" style="position:relative;">
                    ${badgePromo}
                    <img src="${product.image}" alt="${product.nom}">
                </div>
                <div class="product-info-container">
                    <h3>${product.nom}</h3>
                    ${prixHTML}
                    <span class="status-badge" style="background-color: ${product.status_color}22; color: ${product.status_color}; border: 1px solid ${product.status_color}55; padding: 2px 6px; border-radius: 4px; font-size: 0.75em;">
                        ${product.status}
                    </span>
                    <div class="product-actions">
                        <button onclick="window.location.href='${DETAILS_PAGE}?id=${product.id_produit}'" class="btn-details">
                            Voir les détails
                        </button>
                        <button class="add-to-cart btn-add" 
                            ${product.quantite <= 0 ? 'disabled' : ''} 
                            onclick="ajouterAuPanier(${product.id_produit}, '${escapedNom}', ${prixFinal}, '${product.image}', '${CATEGORIE_NOM}')">
                            ${product.quantite <= 0 ? 'Indisponible' : 'Ajouter au panier'}
                        </button>
                    </div>
                </div>
            `;
            productsList.appendChild(item);
        });
    } catch (error) {
        console.error("Erreur Fetch:", error);
        showToast("Impossible de charger le catalogue mobile", "error");
    }
}

// --- ÉCOUTEURS D'ÉVÉNEMENTS ---
document.addEventListener("DOMContentLoaded", () => {
    injectProSessionUrl(); // On injecte l'ID session dès le chargement
    gererAffichageNav();
    fecthProducts();
    updateCartBadge(); 
});

window.addEventListener('storage', (e) => {
    if (e.key === 'ecotech_cart_count') {
        updateCartBadge();
    }
});