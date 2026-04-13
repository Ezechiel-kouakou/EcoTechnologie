<?php
header('Content-Type: application/json');
session_start();
require_once 'config.php';

/**
 * Fonction pour charger les variables d'environnement depuis le fichier .env
 */
// function loadEnv($path) {
//     if (!file_exists($path)) return;
//     $lines = file($path, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
//     foreach ($lines as $line) {
//         if (strpos(trim($line), '#') === 0) continue; // Ignore les commentaires
//         $parts = explode('=', $line, 2);
//         if (count($parts) === 2) {
//             $_ENV[trim($parts[0])] = trim($parts[1]);
//         }
//     }
// }

// // Chargement du fichier .env (ajuste le chemin si nécessaire)
// loadEnv(__DIR__ . '/.env');

// $ADMIN_EMAIL_ENV = $_ENV['ADMIN_EMAIL'] ?? 'admin@ecotech.fr';
// $ADMIN_PASS_ENV  = $_ENV['ADMIN_PASSWORD'] ?? '1234';

$method = $_SERVER['REQUEST_METHOD'];

// --- PARTIE POST : ACTIONS (LOGIN, UPDATE, DELETE, MESSAGING) ---
if ($method === 'POST') {
    $input = json_decode(file_get_contents('php://input'), true);
    $action = $input['action'] ?? '';

    // Autoriser l'action 'login' sans être connecté, sinon bloquer
    if (!isset($_SESSION['admin_logged_in']) && $action !== 'login') {
        http_response_code(401);
        exit(json_encode(['status' => 'error', 'message' => 'Session expirée ou non autorisée']));
    }

    try {
        if ($action === 'login') {
            $email = $input['email'] ?? '';
            $password = $input['password'] ?? '';

            // 1. On cherche l'admin par son email
            $stmt = $pdo->prepare("SELECT * FROM ecotech_admins WHERE email = ? LIMIT 1");
            $stmt->execute([$email]);
            $admin = $stmt->fetch();

            // 2. Vérification : l'admin existe et le mot de passe correspond au hash MySQL
            if ($admin && password_verify($password, $admin['password_hash'])) {
                
                $_SESSION['admin_logged_in'] = true;
                $_SESSION['admin_id'] = $admin['id_admin'];
                
                // On génère le token pour le JS
                $admin_token = bin2hex(random_bytes(16));
                
                // 3. On renvoie les infos pour l'affichage du profil
                echo json_encode([
                    'status' => 'success',
                    'token' => $admin_token,
                    'nom' => $admin['nom'],
                    'prenom' => $admin['prenom'],
                    'role' => $admin['role'],
                    'photo' => $admin['photo'] ?? null
                ]);
            } else {
                echo json_encode(['status' => 'error', 'message' => 'Email ou mot de passe incorrect']);
            }
        } 
        elseif ($action === 'logout') {
            session_destroy();
            echo json_encode(['status' => 'success']);
        }
        elseif ($action === 'update_stock') {
            $stmt = $pdo->prepare("UPDATE {$input['table_stock']} SET quantite = ? WHERE id_produit = ?");
            $stmt->execute([$input['quantite'], $input['id_produit']]);
            echo json_encode(['status' => 'success']);
        }
        elseif ($action === 'add_staff') {
            $stmt = $pdo->prepare("INSERT INTO ecotech_employes (nom, prenom, email, service) VALUES (?, ?, ?, ?)");
            $stmt->execute([$input['nom'], $input['prenom'], $input['email'], $input['service']]);
            echo json_encode(['status' => 'success']);
        }
        elseif ($action === 'delete_staff') {
            $stmt = $pdo->prepare("DELETE FROM ecotech_employes WHERE id_staff = ?");
            $stmt->execute([$input['id']]);
            echo json_encode(['status' => 'success']);
        }
        elseif ($action === 'delete_user') {
            $stmt = $pdo->prepare("DELETE FROM users WHERE id = ?");
            $stmt->execute([$input['id']]);
            echo json_encode(['status' => 'success']);
        }
        elseif ($action === 'envoyer_campagne') {
            $category = $input['category'];
            $subject = $input['subject'];
            $content = $input['content'];

            if ($category === 'relance') {
                $stmt = $pdo->query("SELECT DISTINCT u.id, u.email FROM users u 
                                     INNER JOIN ecotech_commandes c ON u.id = c.id_client 
                                     WHERE c.statut = 'attente'");
            } else {
                $stmt = $pdo->query("SELECT id, email FROM users");
            }

            $users = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if (empty($users)) {
                echo json_encode(['status' => 'error', 'message' => 'Aucun destinataire trouvé.']);
                exit;
            }

            $stmtInsert = $pdo->prepare("INSERT INTO ecotech_notifications (id_client, titre, message, type_notif) VALUES (?, ?, ?, ?)");
            foreach ($users as $user) {
                $stmtInsert->execute([$user['id'], $subject, $content, $category]);
            }

            echo json_encode(['status' => 'success', 'message' => count($users) . " notification(s) envoyée(s)."]);
        }
    } catch (Exception $e) { 
        echo json_encode(['status' => 'error', 'message' => $e->getMessage()]); 
    }
    exit;
}

// --- PARTIE GET : RECUPERATION DES DATA ---
if ($method === 'GET') {
    if (!isset($_SESSION['admin_logged_in'])) { 
        http_response_code(401); 
        exit(json_encode(['status' => 'error', 'message' => 'Non autorisé'])); 
    }
    
    $target = $_GET['target'] ?? '';
    
    try {
       if ($target === 'get_dashboard_stats') {
            $total_users = $pdo->query("SELECT COUNT(*) FROM users")->fetchColumn();

            $stmtCmd = $pdo->query("SELECT 
                SUM(CASE WHEN statut = 'paye' THEN montant_total ELSE 0 END) as CA,
                COUNT(CASE WHEN statut = 'paye' THEN 1 END) as nb_paye,
                SUM(CASE WHEN statut = 'attente' THEN montant_total ELSE 0 END) as manque_a_gagner,
                COUNT(CASE WHEN statut = 'attente' THEN 1 END) as nb_attente
                FROM ecotech_commandes");
            $cmdData = $stmtCmd->fetch();

            $demandes_stats = ['en_attente' => 0, 'traite' => 0];
            $services = ['info', 'commercial', 'customer']; 
            foreach ($services as $srv) {
                $table = "ecotech_" . $srv . "_messages";
                try {
                    $stmtS = $pdo->query("SELECT statut, COUNT(*) as nb FROM $table GROUP BY statut");
                    while ($row = $stmtS->fetch()) {
                        if ($row['statut'] == 'en_attente') $demandes_stats['en_attente'] += (int)$row['nb'];
                        if ($row['statut'] == 'traite') $demandes_stats['traite'] += (int)$row['nb'];
                    }
                } catch (Exception $e) { }
            }

            $stmtScore = $pdo->query("SELECT AVG(rating) as avg, COUNT(*) as total FROM ecotech_feedbacks");
            $feedback = $stmtScore->fetch();

            echo json_encode([
                'status' => 'success',
                'users_count' => $total_users,
                'revenue' => round((float)($cmdData['CA'] ?? 0), 2),
                'orders_count' => (int)($cmdData['nb_paye'] ?? 0),
                'pending_revenue' => round((float)($cmdData['manque_a_gagner'] ?? 0), 2),
                'pending_count' => (int)($cmdData['nb_attente'] ?? 0),
                'satisfaction' => ['average' => round($feedback['avg'] ?? 0, 1), 'total' => (int)($feedback['total'] ?? 0)],
                'demandes_stats' => $demandes_stats
            ]);
        }
        elseif ($target === 'list_stock') {
            $cat = $_GET['cat'] ?? 'pc';
            $map = [
                'pc'     => ['view' => 'vue_stock_pc',     'real' => 'ecotechstock'],
                'tel'    => ['view' => 'vue_stock_tel',    'real' => 'ecotechstock_tel'],
                'tv'     => ['view' => 'vue_stock_tv',     'real' => 'ecotechstock_tv'],
                'son'    => ['view' => 'vue_stock_son',    'real' => 'ecotechstock_sons'],
                'periph' => ['view' => 'vue_stock_periph', 'real' => 'ecotechstock_periphs']
            ];
            $source = $map[$cat]['view'];
            $stmt = $pdo->query("SELECT * FROM $source ORDER BY quantite ASC");
            echo json_encode(['status' => 'success', 'products' => $stmt->fetchAll(PDO::FETCH_ASSOC), 'table_stock' => $map[$cat]['real']]);
        } 
        elseif ($target === 'list_staff') {
            $stmt = $pdo->query("SELECT * FROM ecotech_employes ORDER BY nom ASC");
            echo json_encode(['status' => 'success', 'data' => $stmt->fetchAll(PDO::FETCH_ASSOC)]);
        }
        elseif ($target === 'list_users') {
            $sql = "SELECT u.id, u.username, u.email, 
                    (SELECT COUNT(*) FROM ecotech_commandes WHERE id_client = u.id AND statut = 'attente') as has_pending
                    FROM users u ORDER BY u.username ASC";
            $stmt = $pdo->query($sql);
            echo json_encode(['status' => 'success', 'data' => $stmt->fetchAll(PDO::FETCH_ASSOC)]);
        }
        elseif ($target === 'get_external_stats') {
            // 1. Calcul des dates pour Avril 2026
            $date_start = '2026-04-01 00:00:00';
            $date_end   = '2026-04-30 23:59:59';

            // 2. Initialisation des jours de la semaine (Lundi à Dimanche)
            $days_labels = ['Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche'];
            $stats_ventes = array_fill(0, 7, 0); // [0,0,0,0,0,0,0]

            // 3. Requête pour compter les ventes externes par jour
            // On utilise description LIKE 'Paiement externe%' ou 'Paiement marchand%' selon ton script précédent
            $sql = "SELECT WEEKDAY(date_transaction) as jour_index, COUNT(*) as nb_ventes, SUM(ABS(montant)) as volume 
                    FROM banktransactions 
                    WHERE description LIKE '%externe%' 
                    AND date_transaction BETWEEN ? AND ?
                    GROUP BY jour_index";
            
            $stmt = $pdo->prepare($sql);
            $stmt->execute([$date_start, $date_end]);
            $results = $stmt->fetchAll();

            $total_ventes_mois = 0;
            foreach ($results as $row) {
                // WEEKDAY renvoie 0 pour Lundi, 6 pour Dimanche
                $stats_ventes[$row['jour_index']] = (int)$row['nb_ventes'];
                $total_ventes_mois += (int)$row['nb_ventes'];
            }

            // 4. Calcul de l'ordonnée maximale (Y-axis)
            // Par défaut 100, augmente de 100 si on dépasse
            $max_sales = max($stats_ventes);
            $y_axis_max = (floor($max_sales / 100) + 1) * 100;

            // 5. Calcul des commissions (5% des montants externes)
            $sqlComm = "SELECT SUM(ABS(montant)) * 0.05 as total_comm 
                        FROM banktransactions 
                        WHERE description LIKE '%externe%' 
                        AND date_transaction BETWEEN ? AND ?";
            $stmtComm = $pdo->prepare($sqlComm);
            $stmtComm->execute([$date_start, $date_end]);
            $total_commission = (float)$stmtComm->fetchColumn();

            echo json_encode([
                'status' => 'success',
                'chart_data' => [
                    'labels' => $days_labels,
                    'datasets' => $stats_ventes
                ],
                'y_axis_max' => $y_axis_max,
                'total_commission' => round($total_commission, 2),
                'total_ventes_mois' => $total_ventes_mois
            ]);
        }
         else {
            echo json_encode(['status' => 'error', 'message' => 'Cible inconnue']);
        }
    } catch (Exception $e) {
        echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
    }
    exit;
}