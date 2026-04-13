<div align="center">
  <img src="../ecotechnologie/ecotechshop/ecotechshop_pictures/logo-ecotech.png" alt="Logo Ecotech" width="250">

# 🌿 EcoTech Ecosystem

**Une plateforme Full-Stack : E-Commerce, Fintech & CRM**

[![Database](https://img.shields.io/badge/MySQL-9.1-001554?style=for-the-badge&logo=mysql)](https://www.mysql.com/)
[![Backend](https://img.shields.io/badge/PHP-8.3-001554?style=for-the-badge&logo=php)](https://www.php.net/)
[![Status](https://img.shields.io/badge/Architecture-31_Tables-27ae60?style=for-the-badge)]()

</div>

---

## 📌 Vision du Projet

L'objectif d'**EcoTech** est de centraliser trois services majeurs au sein d'une interface unique et sécurisée. Le projet repose sur une architecture robuste de **31 tables SQL**, garantissant une séparation nette des responsabilités (**SoC**).

- **🛒 EcoTech Shop** : Une marketplace technologique complète avec gestion de stocks temps réel.
- **💳 EcoTech Bank** : Infrastructure bancaire propriétaire et passerelle de paiement API.
- **🎧 EcoTech Support** : Service client (CRM) et monitoring administratif.

---

## 🏗️ Architecture des Données (`ecotech_db`)

La base de données est segmentée en pôles métier pour maximiser la scalabilité.

### 1. Pôle E-Commerce & Logistique

Gère le catalogue, le panier et la synchronisation granulaire des stocks.

- **Catalogue** : `PRODUIT`, `ECOTECHPERIPHS`, `SONS`, `TELEPHONE`, `TELEVISIONS`.
- **Stocks** : Tables dédiées par catégorie (`ECOTECHSTOCK_*`).
- **Ventes** : `ECOTECHPARNIER` et `ECOTECH_COMMANDES`.
- **Marketing** : `PROMOS`, `ECOTECH_FEEDBACKS`, `ECOTECH_NOTIFICATIONS`.

### 2. Pôle Fintech : EcoTech Bank

Infrastructure monétaire permettant des transactions sécurisées internes et externes.

- **Core Banking** : `ECOTECHBANK` (Comptes), `BANKTRANSACTIONS` (Historique).
- **Paiement Tiers** : `MERCHANTS` et `API_ORDERS` (Passerelle API).

### 3. Pôle Administration & Support

- **CRM** : `ECOTECH_CUSTOMER_MESSAGES`, `ECOTECH_SALES_MESSAGES`.
- **Staff** : `ECOTECH_EMPLOYES`, `ECOTECH_ADMINS`.
- **Logs** : `API_MONITOR_LOGS` (Surveillance des flux).

---

## 📊 Modélisation & Optimisation

### Modèle Conceptuel (MCD)

- **Utilisateur ↔ Banque** : Chaque utilisateur possède un compte bancaire unique ($1,1$).
- **Utilisateur ↔ Panier** : Un utilisateur détient un panier actif ($0,1$).
- **Banque ↔ Transactions** : Historisation automatique ($0,N$).
- **Admin ↔ Stock** : Gestion centralisée.

### ⚡ Vues SQL (Performance)

Pour simplifier l'affichage Front-End, nous utilisons des vues consolidées qui évitent les jointures lourdes :
`VUE_STOCK_PC`, `VUE_STOCK_TV`, `VUE_STOCK_TEL`, `VUE_STOCK_SON`.

---

## 🔐 Sécurité & Intégrité

- **Authentification** : Rôles hiérarchisés (Admin, Employé, Client).
- **Financier** : Système de double entrée pour les transactions.
- **API Monitoring** : Surveillance active des appels externes pour prévenir les abus.

---

## 🛠️ Stack Technique

- **Backend** : PHP 8.3 / MySQL 9.1
- **Frontend** : HTML5, CSS3 (Custom DA), JavaScript ES6
- **Architecture** : API REST Interne & JWT

---

## 👥 Contributeurs

- **Votre Nom / Équipe** — _Développement Full-Stack & Architecture DB_

---

> [!IMPORTANT]
> **Note sur la structure :** 31 tables peuvent paraître impressionnantes, mais elles représentent la séparation nette des responsabilités. Chaque service possède son propre espace de données, rendant la maintenance bien plus simple qu'une base monolithique.

<div align="center">
  <sub>&copy; 2026 Ecotech Technologie - Tous droits réservés.</sub>
</div>
