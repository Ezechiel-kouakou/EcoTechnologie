const EcoTech_API_URL = "http://localhost/ecotechnologie/ecotech_api/phonedetails.php";
const urlParams = new URLSearchParams(window.location.search);
const productId = urlParams.get('id'); 

async function fetchProductDetails() {
    if (!productId) {
        console.error("Aucun ID trouvé dans l'URL");
        document.body.innerHTML = "<h1>Erreur : Aucun produit sélectionné</h1>";
        return;
    }

    try {
        const response = await fetch(`${EcoTech_API_URL}?id_produit=${productId}`);
        const data = await response.json();

        if (data.status === 'success') {
            const p = data.product;

            document.getElementById("productName").innerText = p.nom;
            document.getElementById("productDescription").innerText = p.description;
            document.getElementById("productImage").src = p.image;
            document.getElementById("productPrice").innerText = p.prix + " €";
            document.getElementById("productCategory").innerText = "Catégorie : " + p.categories;

            const statusEl = document.getElementById("productStatus");
            statusEl.innerText = p.status;
            statusEl.style.color = p.status_color;
            statusEl.style.fontWeight = "bold";
            const imgEl = document.getElementById("productImage");
            if (imgEl && p.image) {
                imgEl.src = p.image;
            }

        } else {
            document.getElementById("productDetails").innerHTML = `<h1>Erreur : ${data.message}</h1>`;
        }
    } catch (error) {
        console.error("Erreur lors du chargement :", error);
        document.getElementById("productDetails").innerHTML = "<h1>Erreur de connexion au serveur</h1>";
    }
}
document.addEventListener("DOMContentLoaded", fetchProductDetails);