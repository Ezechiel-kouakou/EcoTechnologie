conception, Architecture et Developpement

**Conception et architecture base de données**

_conception DB_

DB_name : ecotech_DB
DB_tableDefined :clients, products, commandes, promotion_applied
DB_rowsNumber : 4 rows

_Architecture_

l'architecture données renferme les relation entre les table a partir du MCD(modèle conceptuel de Données) celui-ci faisant office de MLD(Modèle logique de données).
**NB**: dans notre cas on à fait le MLD avant le MCD
MLD avant MCD :
**MLD**

CLIENT (id_client)
0,n
|
PASSER
|
1,1
COMMANDE (id_commande)
|
| 1,n
CONTENIR
| 0,n
PRODUIT (id_produit)

COMMANDE (1,1) —— appartient —— (0,n) PERIODE

PERIODE (1,1) —— reçoit —— (0,n) PROMOTION
PROMOTION (1,1) —— définit —— (1,1) REDUCTION

COMMANDE (1,1) —— livrée par —— (0,1) LIVRAISON

CLIENT(id_client, nom, prenom, annee_naissance, email, password, status)

PRODUIT(id_produit, nom, prix, details, date_ajout, heure_ajout)

COMMANDE(id_commande, date_commande, id_client, id_periode)

LIGNE_COMMANDE(id_commande, id_produit, quantite, prix_unitaire)

PERIODE(id_periode, saison, date_debut, date_fin)

PROMOTION(id_promo, type_promo, date_debut, date_fin, id_periode)

REDUCTION(id_reduction, taux_reduction, id_promo)

LIVRAISON(id_livraison, date_livraison, id_commande)

**structure**

**CLIENT**

id_client (PK)

nom

prenom

annee_naissance

email

password

status

**PRODUIT**

id_produit (PK)

nom_produit

prix_produit

details_produit

date_ajout

heure_ajout

**COMMANDE**

id_commande (PK)

date_commande

periode_commande

**PERIODE**

id_periode (PK)

saison
(hiver, printemps, été, automne)

date_debut

date_fin

**PROMOTION**

id_promo (PK)

type_promo

date_debut

date_fin

REDUCTION

id_reduction (PK)

taux_reduction

**LIVRAISON**

id_livraison (PK)

date_livraison
