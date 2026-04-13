document.addEventListener("DOMContentLoaded", () => {
    // --- SÉLECTEURS ---
    const burgerBtn = document.getElementById("burgerBtn");
    const navMenu = document.getElementById("navMenu");
    const menuOverlay = document.getElementById("menuOverlay");
    const closeMenuBtn = document.getElementById("closeMenuBtn");

    const dropBtn = document.querySelector('.dropbtn');
    const dropdownContent = document.querySelector('.dropdown-content');
    const dropdownParent = document.querySelector('.dropdown');

    const searchToggle = document.getElementById("searchToggle");
    const searchContainer = document.getElementById("searchContainer");
    const searchInput = searchContainer ? searchContainer.querySelector('input') : null;
    const suggestionDropdown = document.querySelector(".suggestion-dropdown");

    // --- FONCTIONS MENU BURGER ---
    function openMenu() {
        if (!navMenu || !menuOverlay) return;
        navMenu.classList.add("active");
        menuOverlay.classList.add("active");
        
        // Bloque le scroll de la page en arrière-plan
        document.body.style.overflow = "hidden";

        // Ferme la recherche si elle est ouverte
        if (searchContainer) {
            searchContainer.classList.remove("active");
            if(suggestionDropdown) suggestionDropdown.style.display = "none";
        }
    }

    function closeMenu() {
        if (!navMenu || !menuOverlay) return;
        navMenu.classList.remove("active");
        menuOverlay.classList.remove("active");
        
        // Réactive le scroll de la page
        document.body.style.overflow = "auto";
        
        // Ferme aussi le catalogue s'il était ouvert dans le burger
        if (dropdownContent) dropdownContent.classList.remove('show');
    }

    // Événements d'ouverture/fermeture
    if (burgerBtn) burgerBtn.addEventListener("click", openMenu);
    if (closeMenuBtn) closeMenuBtn.addEventListener("click", closeMenu);
    if (menuOverlay) menuOverlay.addEventListener("click", closeMenu);

    // --- GESTION DU CATALOGUE (DROP-DOWN) ---
    if (dropBtn) {
        dropBtn.addEventListener('click', (e) => {
            e.preventDefault();
            e.stopPropagation(); // Empêche la fermeture accidentelle du menu
            
            dropdownContent.classList.toggle('show');
            dropdownParent.classList.toggle('active');
        });
    }

    // --- FERMETURE AU CLIC EXTÉRIEUR OU LIEN ---
    if (navMenu) {
        navMenu.addEventListener("click", (e) => {
            const link = e.target.closest("a");
            // Ferme le menu burger seulement si c'est un lien direct (pas le bouton catalogue)
            if (link && !link.closest('.dropdown-content')) {
                closeMenu();
            }
        });
    }

    document.addEventListener("click", (e) => {
        // Ferme le catalogue si on clique en dehors
        if (dropdownParent && !dropdownParent.contains(e.target)) {
            dropdownContent.classList.remove('show');
            dropdownParent.classList.remove('active');
        }

        // Ferme la barre de recherche si on clique en dehors
        if (searchContainer && !searchContainer.contains(e.target)) {
            searchContainer.classList.remove("active");
            if(suggestionDropdown) suggestionDropdown.style.display = "none";
        }
    });

    // --- BARRE DE RECHERCHE ET SUGGESTIONS ---
    if (searchToggle && searchContainer) {
        searchToggle.addEventListener("click", (e) => {
            e.stopPropagation();
            searchContainer.classList.toggle("active");
            
            if (searchContainer.classList.contains("active") && searchInput) {
                searchInput.focus();
            }
        });

        if (searchInput && suggestionDropdown) {
            searchInput.addEventListener("input", (e) => {
                if (e.target.value.length > 0) {
                    suggestionDropdown.style.display = "block";
                } else {
                    suggestionDropdown.style.display = "none";
                }
            });
        }

        // Cache les suggestions au scroll
        window.addEventListener("scroll", () => {
            if (suggestionDropdown && suggestionDropdown.style.display === "block") {
                suggestionDropdown.style.display = "none";
            }
        }, { passive: true });
    }
});