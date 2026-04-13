// --- CONFIGURATION ---
const BANK_DETAILS_API = "/ecotechnologie/ecotechbank/ecotechbank_api/bankdetail.php";
const PAYMENT_API = "/ecotechnologie/ecotechbank/ecotechbank_api/ecotechprocess_paiement.php";
const CART_TOTAL_API = "/ecotechnologie/ecotech_api/ecotech_cart.php"; 
const wait = (ms) => new Promise(resolve => setTimeout(resolve, ms));

let currentAmountToPay = 0;

// --- NOTIFICATIONS ---
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
    setTimeout(() => toast.remove(), 3000);
}

// --- INITIALISATION AU CHARGEMENT ---
document.addEventListener("DOMContentLoaded", async () => {
    const urlParams = new URLSearchParams(window.location.search);
    
    // --- SÉCURITÉ CRITIQUE : SAUVEGARDE IMMÉDIATE ---
    let session_commande = urlParams.get('session_commande');
    
    if (session_commande && session_commande !== "null" && session_commande !== "") {
        localStorage.setItem("temp_session_commande", session_commande);
        // console.log("✅ Session détectée et stockée :", session_commande);
    } else {
        // Récupération de secours
        session_commande = localStorage.getItem("temp_session_commande") || '';
        // console.log("ℹ️ Session récupérée du storage :", session_commande);
    }
    
    const amountFromUrl = urlParams.get('amount') || '';

    // --- GENERATION URL STYLE PRO (On force la présence des données dans l'URL affichée) ---
    if (!urlParams.has('session_id')) {
        const array = new Uint32Array(4);
        window.crypto.getRandomValues(array);
        let longId = "";
        for (let i = 0; i < array.length; i++) {
            longId += array[i].toString(16);
        }
        
        // On construit l'URL PRO en s'assurant que session_commande n'est pas "undefined"
        const finalSession = session_commande || localStorage.getItem("temp_session_commande") || '';
        
        const newUrl = window.location.pathname + 
            `?session_id=${longId}&auth_provider=ecotech_secure_v3&amount=${amountFromUrl}&session_commande=${finalSession}`;
        
        window.history.replaceState({path: newUrl}, '', newUrl);
    }

    const token = localStorage.getItem("ecotech_token");
    const mainContent = document.getElementById("mainContent");
    const loader = document.getElementById("loader");

    if (!token) { 
        window.location.href = "authbank.html"; 
        return; 
    }

    if(mainContent) mainContent.style.opacity = "0";
    if(loader) loader.style.display = "block";

    try {
        // 1. AFFICHAGE DU MONTANT
        if (amountFromUrl) {
            currentAmountToPay = parseFloat(amountFromUrl);
        } else {
            const cartResponse = await fetch(CART_TOTAL_API, {
                headers: { "Authorization": "Bearer " + token }
            });
            const cartData = await cartResponse.json();
            if (cartData.status === "success") currentAmountToPay = parseFloat(cartData.total);
        }

        if (currentAmountToPay > 0) {
            const payArea = document.getElementById("paymentArea");
            const pendAmt = document.getElementById("pendingAmount");
            if(payArea) payArea.style.display = "block";
            if(pendAmt) pendAmt.innerText = currentAmountToPay.toFixed(2);
        }

        // 2. INFOS BANCAIRES
        const response = await fetch(BANK_DETAILS_API, {
            method: "GET",
            headers: { "Authorization": "Bearer " + token }
        });
        const result = await response.json();

        if (result.status === "success") {
            await wait(800); 
            const bank = result.data;
            const transactions = result.transactions || [];

            document.getElementById("userSolde").innerText = `${parseFloat(bank.solde_bancaire).toFixed(2)} €`;
            document.getElementById("cardHolder").innerText = bank.username.toUpperCase();
            
            const formattedCard = bank.numero_carte_ecotech.match(/.{1,4}/g).join(' ');
            document.getElementById("cardNumber").innerText = formattedCard;

            const historyDiv = document.getElementById("transactionList");
            if (transactions.length > 0) {
                let html = `<table style="width:100%; border-collapse: collapse;">`;
                transactions.forEach(t => {
                    const date = new Date(t.date_transaction).toLocaleDateString('fr-FR');
                    const color = t.montant < 0 ? "#ff4d4d" : "#2ecc71"; 
                    html += `
                        <tr style="border-bottom: 1px solid rgba(255,255,255,0.1); height: 45px;">
                            <td style="color: #c6c6c6; font-size: 0.9em; width: 100px;">${date}</td>
                            <td style="font-weight: 500;color: #ffffff;">${t.description}</td>
                            <td style="text-align: right; color: ${color}; font-weight: 500;">
                                ${t.montant > 0 ? '+' : ''}${parseFloat(t.montant).toFixed(2)} €
                            </td>
                        </tr>`;
                });
                html += `</table>`;
                historyDiv.innerHTML = html;
            } else {
                historyDiv.innerHTML = `<p style="color: #999; text-align: center">Aucune transaction récente.</p>`;
            }

            if(loader) loader.style.display = "none";
            if(mainContent) {
                mainContent.style.transition = "opacity 0.5s ease-in";
                mainContent.style.opacity = "1";
            }
        }
    } catch (error) {
        console.error("Erreur Dashboard:", error);
        if(loader) loader.style.display = "none";
        showToast("Erreur de synchronisation", "error");
    }
});

// --- ACTION DE PAIEMENT ---
async function validerPaiement() {
    const token = localStorage.getItem("ecotech_token");
    
    // On récupère de la source la plus sûre (LocalStorage)
    const session_commande = localStorage.getItem("temp_session_commande"); 
    const urlParams = new URLSearchParams(window.location.search);
    
    const montantFinal = urlParams.get('amount') || currentAmountToPay;

    if (!session_commande || session_commande === "null" || session_commande === "") {
        alert("Erreur critique : La référence de commande est perdue. Retournez au panier.");
        return;
    }

    if (!confirm(`Confirmez-vous le règlement de ${parseFloat(montantFinal).toFixed(2)} € ?`)) return;

    try {
        const response = await fetch(PAYMENT_API, {
            method: "POST",
            headers: { 
                "Content-Type": "application/json",
                "Authorization": "Bearer " + token 
            },
            body: JSON.stringify({ amount: montantFinal }) 
        });

        const result = await response.json();
        
        if (result.status === "success") {
            showToast("Paiement validé !");

            setTimeout(() => { 
                const targetParams = new URLSearchParams();
                targetParams.append("token", token);
                targetParams.append("amount", montantFinal);
                targetParams.append("session_commande", session_commande);

                // On ne vide le storage QUE si on est sûr de partir vers le succès
                localStorage.removeItem("temp_session_commande");

                // On redirige vers paiement_succes.php (situé dans ecotechbank_api/)
                const finalUrl = `ecotechbank_api/paiement_succes.php?${targetParams.toString()}`;
                
                // console.log("🚀 Redirection vers le succès :", finalUrl);
                window.location.href = finalUrl;
            }, 1500);
        } else {
            showToast(result.message, "error");
        }
    } catch (e) {
        console.error("Erreur transaction:", e);
        showToast("Serveur bancaire indisponible", "error");
    }
}