function showToast(message, type = 'success') {
    let container = document.getElementById('toast-container');
    if (!container) {
        container = document.createElement('div');
        container.id = 'toast-container';
        document.body.appendChild(container);
    }
    const toast = document.createElement('div');
    toast.className = `toast ${type}`;
    toast.innerText = message;
    container.appendChild(toast);
    setTimeout(() => { toast.remove(); }, 3000);
}
async function chargerMessages() {
    const res = await fetch("traitment_byservice.php");
    const data = await res.json();

    if (data.status === "success") {
        document.getElementById("displayService").innerText = data.service;
        
        // --- MISE À JOUR DES COMPTEURS SAAS ---
        const attenteEl = document.getElementById("count-attente");
        const traiteEl = document.getElementById("count-traite");
        if(attenteEl) attenteEl.innerText = data.stats.en_attente;
        if(traiteEl) traiteEl.innerText = data.stats.traite;
        // --------------------------------------

        const container = document.getElementById("listeMessages");

        if (data.messages.length === 0) {
            container.innerHTML = "<p style='color:; font-style: italic; font-family: Verdana, Geneva, Tahoma, sans-serif;'>vous n'avez aucun message en attente pour le service " + data.service +" actuellement.</p>";
            return;
        }

        container.innerHTML = data.messages
            .map((msg) => `
                <div class="card">
                    <div class="info-client">
                        <b>${msg.nom} ${msg.prenom}</b> - <i>${msg.type_demande}</i> - ${msg.date_envoi}
                    </div>
                    <p><strong>Message :</strong> ${msg.message}</p>
                    <textarea id="reply_text_${msg.id_msg}" placeholder="Tapez votre réponse ici..."></textarea>
                    <br>
                    <button onclick="envoyerReponse(${msg.id_msg})">je répond</button>
                </div>
            `).join("");
    } else {
        window.location.href = "ecotech_employe.html"; 
    }
}

async function envoyerReponse(idMsg) {
    const reponseField = document.getElementById(`reply_text_${idMsg}`);
    const reponse = reponseField.value;
    
    if (!reponse) {
        return showToast("Veuillez écrire une réponse.", "error"); 
    }

    const formData = new FormData();
    formData.append("id_msg", idMsg);
    formData.append("contenu_reponse", reponse);

    try {
        const res = await fetch("repondre_api.php", {
            method: "POST",
            body: formData,
        });
        const result = await res.json();

        if (result.status === "success") {
            showToast("Réponse enregistrée et envoyée au client !", "success");
            chargerMessages();
        } else {
            showToast("Erreur lors de l'enregistrement.", "error");
        }
    } catch (error) {
        showToast("Erreur de connexion au serveur.", "error");
    }
}

chargerMessages();