(function() {
    const LOADING_DELAY = 3000; 

    function init() {
        // --- NOUVEAU : GESTION URL STYLE PRO & AUTH ---
        gererUrlEtAuth();
        
        initContactPanel();
        initCollapsibles();
        simulateGlobalLoading();
    }

    // --- FONCTION AJOUTÉE POUR LE LOOK PRO ---
    function gererUrlEtAuth() {
        const token = localStorage.getItem("ecotech_token");
        const authContainer = document.getElementById("authButtons");

        if (token) {
            // 1. Look Pro : URL Longue
            const urlParams = new URLSearchParams(window.location.search);
            if (!urlParams.has('session_id')) {
                const array = new Uint32Array(4);
                window.crypto.getRandomValues(array);
                let longId = "";
                for (let i = 0; i < array.length; i++) {
                    longId += array[i].toString(16);
                }
                const proUrl = window.location.pathname + `?session_id=${longId}&view=main_hub&status=authenticated`;
                window.history.replaceState({path: proUrl}, '', proUrl);
            }

            // 2. Affichage Bouton Profil si utilisateur connecté
            if (authContainer) {
                authContainer.innerHTML = `
                    <div style="display: flex; gap: 10px; align-items: center;">
                        <button onclick="window.location.href='../ecotechnologie/ecotech_users_profil/monprofil.html'" 
                                style="background: #2ecc71; color: white; border: none; padding: 8px 15px; border-radius: 20px; cursor: pointer; font-weight: bold; display: flex; align-items: center; gap: 8px;">
                            <i class="fa-solid fa-circle-user"></i> Mon Compte
                        </button>
                    </div>
                `;
            }
        } else {
            // Bouton Connexion si  utilisateur non connecté
            if (authContainer) {
                authContainer.innerHTML = `
                    <button onclick="window.location.href='../ecotechnologie/ecotechshop/auth_ecotech.html'" 
                            style="background: transparent; color: white; border: 1px solid white; padding: 8px 15px; border-radius: 20px; cursor: pointer;">
                        Se connecter
                    </button>
                `;
            }
        }
    }

    function simulateGlobalLoading() {
        const searchInput = document.querySelector(".search-bar");
        const cartBadge = document.getElementById("cart-count");
        const categoriesContainer = document.querySelector(".categories-various");

        if (searchInput) {
            const input = searchInput.querySelector("input");
            input.disabled = true;
            input.placeholder = "Connexion au catalogue...";
            searchInput.style.opacity = "0.7";
        }

        let originalCategoriesHTML = "";
        if (categoriesContainer) {
            originalCategoriesHTML = categoriesContainer.innerHTML;
            categoriesContainer.innerHTML = `
                <div class="category-item">
                    <div class="skeleton skeleton-img"></div>
                    <div class="skeleton skeleton-title"></div>
                    <div class="skeleton skeleton-text"></div>
                    <div class="skeleton skeleton-text" style="width:50%"></div>
                </div>
            `.repeat(5);
        }

        setTimeout(() => {
            if (searchInput) {
                const input = searchInput.querySelector("input");
                input.disabled = false;
                input.placeholder = "Rechercher un produit...";
                searchInput.style.opacity = "1";
            }

            // On récupère le vrai compte du panier si possible
            if (cartBadge) {
                const count = localStorage.getItem("ecotech_cart_count") || "0";
                cartBadge.textContent = count; 
                cartBadge.style.display = count > 0 ? "flex" : "none";
            }

            if (categoriesContainer) {
                categoriesContainer.style.opacity = "0";
                categoriesContainer.innerHTML = originalCategoriesHTML;
                
                setTimeout(() => {
                    categoriesContainer.style.transition = "opacity 0.5s ease";
                    categoriesContainer.style.opacity = "1";
                }, 50);
            }
        }, LOADING_DELAY);
    }

    function initContactPanel() {
        window.openContactView = function() {
            const panel = document.getElementById("openContactView");
            document.body.style.overflow = "hidden";
            if (panel) panel.classList.add("active");
        };

        window.closeContactView = function() {
            const panel = document.getElementById("openContactView");
            document.body.style.overflow = "auto";
            if (panel) panel.classList.remove("active");
        };

        const deroulants = document.querySelectorAll(".user-question-btn");
        deroulants.forEach(btn => {
            btn.addEventListener("click", function () {
                this.classList.toggle("active");
                const contenu = this.nextElementSibling;
                contenu.style.display = (contenu.style.display === "block") ? "none" : "block";
            });
        });
    }

    function initCollapsibles() {
        const coll = document.querySelectorAll(".collapsible");
        coll.forEach(btn => {
            btn.addEventListener("click", function () {
                this.classList.toggle("active");
                const content = this.nextElementSibling;
                if (content.style.maxHeight) {
                    content.style.maxHeight = null;
                } else {
                    content.style.maxHeight = content.scrollHeight + "px";
                }
            });
        });
    }

    if (document.readyState === "loading") {
        document.addEventListener("DOMContentLoaded", init);
    } else {
        init();
    }
})();

const nav = document.getElementById("primary-nav");

window.addEventListener("scroll", () => {
  if (window.scrollY > 50) {
    nav.classList.add("scrolled");
  } else {
    nav.classList.remove("scrolled");
  }
});


async function loadDynamicFeedbacks() {
    try {
        const response = await fetch('/ecotechnologie/ecotech_api/ecotech-users-review.php?target=get_feedbacks');
        const result = await response.json();

        const container = document.getElementById('testimonials-container');
        
        if (result.status === 'success' && result.data.length > 0) {
            container.innerHTML = ""; // On vide le message de chargement

            result.data.forEach(fb => {
                // Création des étoiles (Jaunes pour la note, Grises pour le reste)
                let starsHTML = "";
                for (let i = 1; i <= 5; i++) {
                    const color = i <= fb.rating ? "#f1c40f" : "#e0e0e0";
                    starsHTML += `<i class="ph-fill ph-star" style="color: ${color}; font-size: 1.2rem;"></i>`;
                }

                // Génération d'un message automatique selon la note (Transparence)
                let message = "";
                if (fb.rating >= 4) message = "Expérience d'achat parfaite, je recommande EcoTech !";
                else if (fb.rating === 3) message = "Commande reçue. Service correct dans l'ensemble.";
                else message = "Expérience mitigée, j'espère une amélioration du service.";

                container.innerHTML += `
                    <div class="review-card" style="background: white; padding: 20px; border-radius: 6px; border: 1px solid #e0e0e0; shadow: 0 4px 12px rgba(0,0,0,0.1); margin: 10px;">
                        <div class="stars" style="margin-bottom: 10px;">${starsHTML}</div>
                        <p style="font-style: italic; color: #555;">"${message}"</p>
                        <div class="user-info" style="margin-top: 15px; display: flex; align-items: center; gap: 10px;">
                            <div class="avatar-circle" style="width: 35px; height: 35px; background: #001554; color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: bold; font-size: 0.8rem;">
                                ${fb.username.substring(0, 2).toUpperCase()}
                            </div>
                            <div>
                                <div style="font-weight: bold; font-size: 0.9rem;">${fb.username}</div>
                                <div style="font-size: 0.75rem; color: #27ae60;">Client vérifié</div>
                            </div>
                        </div>
                    </div>
                `;
            });
        } else {
            container.innerHTML = "<p>Aucun avis pour le moment.</p>";
        }
    } catch (error) {
        console.error("Erreur lors du chargement des avis :", error);
    }
}

// Lancer au chargement de la page
document.addEventListener("DOMContentLoaded", loadDynamicFeedbacks);