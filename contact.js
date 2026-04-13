if (!localStorage.getItem('ecotech_session')) {
    localStorage.setItem('ecotech_session', 'sess_' + Math.random().toString(36).substr(2, 9));
}
const sessionID = localStorage.getItem('ecotech_session');

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

async function afficherFormulaire(service) {
    document.getElementById("contactArea").style.display = "block";
    document.getElementById("choixService").value = service; 
    document.getElementById("serviceTitle").innerHTML = "Contacter le service : " + service;

    chargerMessages(service);
}
async function chargerMessages(service) {
    try {
        const res = await fetch(`/ecotechnologie/ecotechservice_management/service_api/contact_api.php?service=${service}&session_id=${sessionID}`);
        const data = await res.json();
        
        const display = document.getElementById("chatDisplay");
        if (!display) return;

        display.innerHTML = ''; 
        display.style.display = 'block';

        if (data.messages) {
            data.messages.forEach(msg => {
                display.innerHTML += `
                    <div style="text-align:right; margin-bottom:10px;">
                        <span style="background:#e1ffc7; padding:8px; border-radius:10px; display:inline-block;">
                            <b>Moi:</b> ${msg.message}
                        </span>
                    </div>`;

                if (msg.reponse) {
                    display.innerHTML += `
                        <div style="text-align:left; margin-bottom:10px;">
                            <span style="background:#f1f1f1; padding:8px; border-radius:10px; display:inline-block;">
                                <b>EcoTech Support:</b> ${msg.reponse}
                            </span>
                        </div>`;
                }
            });
            display.scrollTop = display.scrollHeight;
        }
    } catch (error) {
        console.error("Erreur de chargement des messages:", error);
    }
}

document.getElementById("contactForm").addEventListener("submit", async (e) => {
    e.preventDefault(); 

    const service = document.getElementById("choixService").value;
    const formData = new FormData();
    formData.append("service", service);
    formData.append("nom", document.getElementById("nom").value);
    formData.append("prenom", document.getElementById("prenom").value);
    formData.append("type_demande", "Demande Standard");
    formData.append("message", document.getElementById("message").value);
    formData.append("session_id", sessionID);

    try {
        const res = await fetch("/ecotechnologie/ecotechservice_management/service_api/contact_api.php", {
            method: "POST",
            body: formData
        });
        const data = await res.json();

        if (data.status === "success") {
            showToast("Message envoyé avec succès!", "success");
            document.getElementById("message").value = "";
            chargerMessages(service); 
        } else {
            showToast("Erreur: " + data.message, "error");
        }
    } catch (error) {
        console.error("Erreur:", error);
        showToast("Erreur de communication avec le serveur.", "error");
    }
});