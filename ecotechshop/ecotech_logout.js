document.getElementById("logoutBtn").addEventListener("click", () => {
    // 1. On nettoie tout le stockage lié à EcoTech
    localStorage.removeItem("user");
    localStorage.removeItem("ecotech_token"); // CRUCIAL : on supprime le badge d'accès
    
    // 2. Optionnel : On peut aussi vider le panier si on veut une déconnexion totale
    // localStorage.removeItem("panier"); 

    // 3. Redirection propre
    // .replace est mieux que .href car il supprime la page actuelle de l'historique
    window.location.replace("auth_ecotech.html");
});