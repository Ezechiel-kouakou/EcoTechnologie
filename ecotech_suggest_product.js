(function() {
    const API_URLS_PROMOS = [
        "/ecotechnologie/ecotech_api/ecotechphone.php",
        "/ecotechnologie/ecotech_api/ecotechtelevisions.php"
    ];

    const searchRoutes = {
        'smartphone': 'ecotechshop/ecotechphone.html',
        'telephone': 'ecotechshop/ecotechphone.html',
        'televisions': 'ecotechshop/ecotechtv.html',
        'ordinateur portable': 'ecotechshop/ecotechpc.html',
        'périphériques': 'ecotechshop/ecotechperiphs.html',
        'audio': 'ecotechshop/ecotechsons.html',
    };

    function init() {
        initSearchSuggestions();
        loadPromotionsSlider();
    }

    if (document.readyState === "loading") {
        document.addEventListener("DOMContentLoaded", init);
    } else {
        init();
    }

    function initSearchSuggestions() {
        const searchContainer = document.querySelector(".search-bar");
        const searchInput = searchContainer ? searchContainer.querySelector("input") : null;
        if (!searchContainer || !searchInput) return;

        let suggestionBox = document.getElementById("suggestion-results") || document.createElement("div");
        suggestionBox.id = "suggestion-results";
        suggestionBox.className = "suggestion-dropdown";
        if (!document.getElementById("suggestion-results")) searchContainer.appendChild(suggestionBox);

        searchInput.addEventListener("input", async (e) => {
            const query = e.target.value.trim();
            if (query.length < 2) { suggestionBox.style.display = "none"; return; }

            try {
                const res = await fetch(`/ecotechnologie/ecotech_suggest_product.php?q=${encodeURIComponent(query)}`);
                const data = await res.json();
                
                if (data.length > 0) {
                    suggestionBox.innerHTML = data.map(item => {
                        const catKey = item.categorie_nom.toLowerCase();
                        const destPage = searchRoutes[catKey] || `ecotech${catKey}.html`;

                        return `
                            <div class="suggestion-item" onclick="window.location.href='${destPage}'">
                                <img src="${item.image}" alt="${item.nom}" onerror="this.src='assets/no-image.png'">
                                <div class="suggest-info">
                                    <span class="suggest-name">${item.nom}</span>
                                </div>
                            </div>
                        `;
                    }).join('');
                    suggestionBox.style.display = "block";
                } else {
                    suggestionBox.style.display = "none";
                }
            } catch (err) { console.error("Erreur Suggestions:", err); }
        });
        document.addEventListener("click", (e) => {
            if (!searchContainer.contains(e.target)) suggestionBox.style.display = "none";
        });
    }

   async function loadPromotionsSlider() {
        const slider = document.getElementById("promoSlider");
        if (!slider) return;
        const MIN_LOADING_TIME = 3000;
        const startTime = Date.now();

        try {
            const requests = API_URLS_PROMOS.map(url => fetch(url).then(res => res.json()));
            const results = await Promise.all(requests);
            
            let allPromos = [];
            results.forEach(data => {
                if (data && data.status === 'success' && data.products) {
                    allPromos = [...allPromos, ...data.products.filter(p => p.pourcentage != null)];
                }
            });

            const elapsedTime = Date.now() - startTime;
            const remainingTime = Math.max(0, MIN_LOADING_TIME - elapsedTime);

            setTimeout(() => {
                if (allPromos.length === 0) {
                    slider.innerHTML = '<p style="text-align:center;width:100%">Aucune promotion trouvée.</p>';
                    return;
                }

                slider.innerHTML = allPromos.map(product => {
                    let detailPage = "phone_details.html"; 
                    const nameLower = product.nom.toLowerCase();

                    if (nameLower.includes('tv') || nameLower.includes('lg') || nameLower.includes('hisense')) {
                        detailPage = "tv_details.html";
                    } else if (nameLower.includes('portable') || nameLower.includes('asus') || nameLower.includes('hp')) {
                        detailPage = "pc_details.html";
                    }

                    return `
                        <div class="promo-card">
                            <div class="promo-tag">-${product.pourcentage}%</div>
                            <div class="promo-img-container">
                                <img src="${product.image}" alt="${product.nom}">
                            </div>
                            <div class="promo-info">
                                <div class="countdown-box">
                                    <i class="fa-solid fa-clock"></i> 
                                    <span class="timer" data-endtime="${product.date_fin || ''}">--:--:--</span>
                                </div>
                                <h4>${product.nom}</h4>
                                <div class="promo-prices">
                                    <span class="old-price">${product.prix}€</span>
                                    <span class="new-price">${product.prix_promo}€</span>
                                </div>
                                <button class="btn-promo-view" onclick="window.location.href='ecotechshop/${detailPage}?id=${product.id_produit}'">
                                    En profiter
                                </button>
                            </div>
                        </div>
                    `;
                }).join('');

                startGlobalCountdown();
                initAutoScroll(slider);
            }, remainingTime);

        } catch (error) { 
            console.error("Erreur Slider:", error);
            slider.innerHTML = '<p style="text-align:center;width:100%">Erreur de chargement des offres.</p>';
        }
    }
    function startGlobalCountdown() {
        const update = () => {
            document.querySelectorAll(".timer").forEach(t => {
                const endStr = t.getAttribute("data-endtime");
                if (!endStr || endStr === "null") return;

                const formattedDate = String(endStr).replace(/-/g, "/");
                const diff = new Date(formattedDate).getTime() - new Date().getTime();

                if (diff <= 0) { t.innerHTML = "Terminé"; return; }

                const d = Math.floor(diff / (1000 * 60 * 60 * 24));
                const h = Math.floor((diff / (1000 * 60 * 60)) % 24);
                const m = Math.floor((diff / (1000 * 60)) % 60);
                const s = Math.floor((diff / 1000) % 60);

                t.innerHTML = (d > 0 ? d + "j " : "") + 
                              `${h.toString().padStart(2,'0')}h ${m.toString().padStart(2,'0')}m ${s.toString().padStart(2,'0')}s`;
            });
        };
        setInterval(update, 1000);
        update();
    }

 function initAutoScroll(container) {
    let paused = false;

    container.onmouseenter = () => paused = true;
    container.onmouseleave = () => paused = false;


    container.addEventListener("touchstart", () => {
        paused = true;
    }, { passive: true });

    container.addEventListener("touchend", () => {
        setTimeout(() => paused = false, 2000);
    }, { passive: true });

    const scroll = () => {
        if (!paused) {
            container.scrollLeft += 1;
            

            if (container.scrollLeft >= (container.scrollWidth - container.clientWidth - 1)) {
                container.scrollLeft = 0;
            }
        }
        requestAnimationFrame(scroll);
    };
    
    requestAnimationFrame(scroll);
}
})();