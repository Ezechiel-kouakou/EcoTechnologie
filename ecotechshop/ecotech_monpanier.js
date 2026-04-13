// --- FONCTIONS UTILITAIRES ---

/**
 * AJOUT : Mapping pour convertir la catégorie en nom de table SQL réel
 */
/**
 * CORRECTION : On utilise les noms exacts affichés sur ton écran
 */
function obtenirNomTableReel(categorie) {
    // On force en minuscule et on enlève les espaces au cas où
    const cat = categorie.toLowerCase().trim();
    
    const map = {
        'produit': 'ecotechstock',        // Pour l'ordinateur ASUS
        'telephone': 'ecotechstock_tel',   // Pour l'iPhone
        'sons': 'ecotechstock_sons',       // Pour le casque Avizar
        'tv': 'ecotechstock_tv',
        'periph': 'ecotechstock_periphs'
    };

    // Si on trouve dans la map, on renvoie, sinon on met ecotechstock par défaut
    return map[cat] || 'ecotechstock';
}

function updateCartBadge() {
    const count = localStorage.getItem("ecotech_cart_count") || 0;
    const badge = document.getElementById("cart-count"); 
    if(badge) {
        badge.innerText = count;
        badge.style.display = count > 0 ? "flex" : "none";
    }
}

function showToast(message, type = 'success') {
    const container = document.getElementById('toast-container');
    if(!container) return;

    const toast = document.createElement('div');
    toast.className = `toast ${type === 'error' ? 'error' : ''}`;
    
    const iconClass = type === 'success' ? 'ph-check-circle' : 'ph-warning-octagon';
    
    toast.innerHTML = `
        <i class="ph-fill ${iconClass}"></i>
        <span>${message}</span>
    `;

    container.appendChild(toast);
    setTimeout(() => toast.classList.add('show'), 100);
    setTimeout(() => { 
        toast.classList.remove('show'); 
        setTimeout(() => toast.remove(), 400); 
    }, 3000);
}

// --- INITIALISATION ---

document.addEventListener("DOMContentLoaded", () => {
    chargerPanier();

    const btnPayer = document.getElementById("checkoutBtn");
    if(btnPayer) {
        btnPayer.addEventListener("click", procederAuPaiement);
    }
});

// --- LOGIQUE DU PANIER ---

async function chargerPanier() {
    const token = localStorage.getItem("ecotech_token");
    let invite = JSON.parse(localStorage.getItem("panier_invite")) || [];

    if (token && invite.length > 0) {
        for (const item of invite) {
            try {
                await fetch("/ecotechnologie/ecotech_api/ecotech_panier.php", {
                    method: "POST",
                    headers: { 
                        "Content-Type": "application/json",
                        "Authorization": "Bearer " + token 
                    },
                    body: JSON.stringify({ 
                        id_produit: item.id_produit, 
                        categorie: item.categorie || 'produit', 
                        // AJOUT : on envoie la table réelle pour remplir la colonne en BDD
                        table_origine: obtenirNomTableReel(item.categorie),
                        prix: item.prix, 
                        action: 'plus' 
                    })
                });
            } catch (e) { console.error("Erreur synchro invité:", e); }
        }
        localStorage.removeItem("panier_invite");
        invite = []; 
    }

    if (token) {
        try {
            const res = await fetch(`/ecotechnologie/ecotech_api/ecotech_cart.php`, {
                method: "GET",
                headers: { "Authorization": "Bearer " + token }
            });
            const data = await res.json();
            if (data.status === 'success' && data.cart && data.cart.length > 0) {
                renderCart(data.cart); 
            } else {
                showEmptyCart();
            }
        } catch (error) {
            console.error("Erreur serveur:", error);
            showEmptyCart();
        }
    } else {
        invite.length > 0 ? renderCart(invite) : showEmptyCart();
    }
}

function renderCart(items) {
    const container = document.getElementById("cartItemsContainer");
    const totalPrixEl = document.getElementById("totalPrix");
    const totalArticlesEl = document.getElementById("totalArticles");
    if (!container) return;

    let html = "";
    let totalMontant = 0;
    let totalQuantite = 0;

    items.forEach(item => {
        const prix = parseFloat(item.prix || item.prix_unitaire) || 0;
        const qte = parseInt(item.quantite || item.quantite_souhaitee || 0);
        const categorie = item.categorie || 'produit';
        
        totalMontant += (prix * qte);
        totalQuantite += qte;
        
        html += `
            <div class="cart-card" data-nom="${item.nom}" data-prix-u="${prix}" data-qte="${qte}">
                <div class="cart-card-left">
                    <h3>${item.nom}</h3>
                    <p class="cart-details">Prix: ${prix.toFixed(2)}€ | Rayon: ${categorie}</p>
                    <div class="cart-controls">
                        <button onclick="modifierQuantite(${item.id_produit}, 'moins', '${categorie}')" class="btn-qty">-</button>
                        <span class="qty-display"><strong>${qte}</strong></span>
                        <button onclick="modifierQuantite(${item.id_produit}, 'plus', '${categorie}')" class="btn-qty">+</button>
                    </div>
                </div>
                <div class="cart-card-right">
                    <img src="${item.image}" alt="${item.nom}" style="width:80px; height:80px; object-fit:cover; border-radius:8px;">
                </div>
            </div>`;
    });

    container.innerHTML = html;
    if(totalPrixEl) totalPrixEl.innerText = `${totalMontant.toFixed(2)}€`;
    if(totalArticlesEl) totalArticlesEl.innerText = totalQuantite;
    
    localStorage.setItem("ecotech_cart_count", totalQuantite);
    updateCartBadge();
}

async function modifierQuantite(idProduit, action, categorie) {
    const token = localStorage.getItem("ecotech_token");

    if (token) {
        try {
            await fetch("/ecotechnologie/ecotech_api/ecotech_panier.php", {
                method: "POST",
                headers: { 
                    "Content-Type": "application/json",
                    "Authorization": "Bearer " + token 
                },
                body: JSON.stringify({ 
                    id_produit: idProduit, 
                    action: action,
                    categorie: categorie,
                    // AJOUT : on envoie la table réelle ici aussi
                    table_origine: obtenirNomTableReel(categorie)
                })
            });
            chargerPanier();
        } catch (err) {
            showToast("Erreur de connexion", "error");
        }
    } 
    else {
        let invite = JSON.parse(localStorage.getItem("panier_invite")) || [];
        const index = invite.findIndex(item => item.id_produit == idProduit);

        if (index !== -1) {
            if (action === 'plus') {
                invite[index].quantite = (parseInt(invite[index].quantite) || 0) + 1;
            } else {
                invite[index].quantite = (parseInt(invite[index].quantite) || 0) - 1;
                if (invite[index].quantite <= 0) {
                    invite.splice(index, 1);
                }
            }
            localStorage.setItem("panier_invite", JSON.stringify(invite));
            chargerPanier(); 
        }
    }
}

async function procederAuPaiement() {
    const btnPayer = document.getElementById("checkoutBtn");
    const token = localStorage.getItem("ecotech_token");
    const totalPrixEl = document.getElementById("totalPrix");   
    
    if (!token) {
        showToast("Veuillez vous connecter pour payer", "error");
        setTimeout(() => window.location.href = "auth_ecotech.html", 1500);
        return;
    }

    const montantTotal = totalPrixEl ? totalPrixEl.innerText.replace(/[^\d.]/g, '') : "0";
    
    if (parseFloat(montantTotal) <= 0) {
        showToast("Votre panier est vide", "error");
        return;
    }

    const items = document.querySelectorAll(".cart-card");
    const panierData = [];
    items.forEach(card => {
        panierData.push({
            nom: card.getAttribute("data-nom"),
            qty: card.getAttribute("data-qte"),
            pu: card.getAttribute("data-prix-u")
        });
    });

    const sessionRef = "ECO-" + Math.random().toString(36).substr(2, 9).toUpperCase();
    localStorage.setItem("temp_session_commande", sessionRef);

    if(btnPayer) {
        btnPayer.disabled = true;
        btnPayer.innerText = "Traitement...";
    }

    try {
        const saveRes = await fetch("/ecotechnologie/ecotech_api/ecotech-commande-register.php", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                token: token,
                session_commande: sessionRef,
                details_json: JSON.stringify(panierData),
                montant_total: montantTotal
            })
        });

        const saveResult = await saveRes.json();

        if (saveResult.status === "success") {
            const params = new URLSearchParams();
            params.append("amount", montantTotal);
            params.append("session_commande", sessionRef);
            params.append("auth_provider", "ecotech_secure_v3");

            const urlBanque = `../ecotechbank/userSpaceBank.html?${params.toString()}`;
            window.location.href = urlBanque;
        } else {
            throw new Error(saveResult.message || "Erreur lors de l'enregistrement");
        }
    } catch (e) {
        console.error("Erreur de paiement:", e);
        showToast("Erreur : " + e.message, "error");
        if(btnPayer) {
            btnPayer.disabled = false;
            btnPayer.innerText = "Procéder au paiement";
        }
    }
}

function showEmptyCart() {
    const container = document.getElementById("cartItemsContainer");
    if (container) {
        container.innerHTML =
         `
            <div class="empty-cart-state">
                <svg xmlns="http://www.w3.org/2000/svg" width="96" height="96" fill="#d1d5db" viewBox="0 0 256 256">
                    <path d="M222.14,105.85l-26.05,95.51A24,24,0,0,1,173,220H83a24,24,0,0,1-23.12-18.65L33.86,105.85a16,16,0,0,1,15.48-20.21H206.66a16,16,0,0,1,15.48,20.21ZM160,48a32,32,0,0,0-64,0,8,8,0,0,0,16,0,16,16,0,0,1,32,0,8,8,0,0,0,16,0Z"></path>
                </svg>
                <h3>Votre panier est vide</h3>
                <p>Explorez nos produits et trouvez votre bonheur technologique !</p>
            </div>
        `;
    }
    if (window.phosphor) {
        window.phosphor.update(); 
    }
    
    if (document.getElementById("totalPrix")) document.getElementById("totalPrix").innerText = "0.00€";
    if (document.getElementById("totalArticles")) document.getElementById("totalArticles").innerText = "0";
    
    localStorage.setItem("ecotech_cart_count", 0);
    updateCartBadge();
}