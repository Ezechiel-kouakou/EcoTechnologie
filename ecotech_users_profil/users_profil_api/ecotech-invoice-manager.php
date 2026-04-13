<?php
error_reporting(E_ALL & ~E_DEPRECATED);
ob_start();

require('../fpdf/fpdf.php'); 
require_once 'JWTManager.php';
require_once 'config.php'; 

function clean($text) {
    return iconv('UTF-8', 'windows-1252//TRANSLIT', $text);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $token = $_POST['token'] ?? '';
    $ref = trim($_POST['ref'] ?? ''); 
    $decoded = JWTManager::validate($token);

    if (!$decoded) { 
        ob_end_clean(); 
        die("Erreur : Session invalide ou token manquant."); 
    }

    $userId = $decoded['user_id'];


    $stmt = $pdo->prepare("SELECT * FROM ecotech_commandes WHERE session_commande = ? AND id_client = ?");
    $stmt->execute([$ref, $userId]);
    $commande = $stmt->fetch();

    if (!$commande) {
        ob_end_clean();
        // DEBUG : On affiche ce qu'on cherchait pour comprendre
        die("Erreur : Commande introuvable. (Ref cherchée: '$ref', ID Client cherché: '$userId')");
    }

    // Décoder le JSON des articles
    $articles = json_decode($commande['details_json'], true);
    $montantTotal = floatval($commande['montant_total']);

    // Initialisation PDF
    $pdf = new FPDF('P', 'mm', 'A4');
    $pdf->AddPage();
    $pdf->SetAutoPageBreak(true, 20);
    $font = 'Helvetica';

    // --- EN-TÊTE ---
    $logo = '../../ecotechshop/ecotechshop_pictures/logo-ecotech.png'; 
    if (file_exists($logo)) {
        $pdf->Image($logo, 10, 10, 40);
    }

    $pdf->SetFont($font, 'B', 18);
    $pdf->SetTextColor(0, 21, 84);
    $pdf->Cell(0, 15, clean('FACTURE COMMERCIALE'), 0, 1, 'R');
    
    $pdf->SetFont($font, '', 9);
    $pdf->SetTextColor(120, 120, 120);
    $pdf->Cell(0, 5, clean('Réf Commande : ') . $ref, 0, 1, 'R');
    $pdf->Cell(0, 5, clean('Date : ') . date('d/m/Y H:i', strtotime($commande['date_creation'])), 0, 1, 'R');

    $pdf->Ln(25);

    // --- BLOC ADRESSES ---
$pdf->SetTextColor(0, 0, 0);
$pdf->SetFont($font, 'B', 10);
$pdf->Cell(95, 7, clean('Emetteur :'), 0, 0);
$pdf->Cell(95, 7, clean('DESTINATAIRE :'), 0, 1);

$pdf->SetFont($font, '', 10);
// Vendeur
$pdf->Cell(95, 5, clean('Ecotech Technologie SAS'), 0, 0);

// Client : On affiche le username ou le prenom stocké dans le token
$nomAffiche = ucfirst(explode('@', $decoded['email'])[0]);
    $pdf->Cell(95, 5, clean($nomAffiche), 0, 1);

$pdf->Cell(95, 5, clean('Service Client - Sannois'), 0, 0);
$pdf->Cell(95, 5, clean($decoded['email']), 0, 1);
    
    $pdf->Cell(95, 5, clean('contact@ecotech.fr'), 0, 1);

    $pdf->Ln(15);

    // --- TABLEAU DE COMMANDE ---
    $pdf->SetFillColor(0, 21, 84);
    $pdf->SetTextColor(255, 255, 255);
    $pdf->SetDrawColor(200, 200, 200);
    $pdf->SetFont($font, 'B', 9);

    $pdf->Cell(20, 10, clean('Banque'), 1, 0, 'C', true);
    $pdf->Cell(85, 10, clean('Désignation de l\'article'), 1, 0, 'C', true);
    $pdf->Cell(25, 10, clean('Prix Unit.'), 1, 0, 'C', true);
    $pdf->Cell(20, 10, clean('Qté'), 1, 0, 'C', true);
    $pdf->Cell(40, 10, clean('Total HT'), 1, 1, 'C', true);

    $pdf->SetTextColor(50, 50, 50);
    $pdf->SetFont($font, '', 9);
    
    // 2. BOUCLE SUR LES ARTICLES REÇUS DU JSON
    foreach ($articles as $item) {
        $nom = $item['nom'];
        $qte = intval($item['qty']);
        $pu = floatval($item['pu']);
        $sousTotal = $pu * $qte;

        $currentX = $pdf->GetX();
        $currentY = $pdf->GetY();

        // Cellule Banque (logo) - on réserve une largeur de 20mm et une hauteur de 18mm pour que le logo soit bien centré verticalement
       $hauteurLigne = 20; 

        $pdf->Cell(20, $hauteurLigne, '', 1, 0, 'C');
        $bankIcon = '../../ecotechshop/ecotechshop_pictures/logo-ecotechBank.png';
        if (file_exists($bankIcon)) {

            $pdf->Image($bankIcon, $currentX + 3, $currentY + 2, 16); 
        }

        $pdf->Cell(85, $hauteurLigne, clean(' ' . $nom), 1, 0, 'L');
        $pdf->Cell(25, $hauteurLigne, number_format($pu, 2, ',', ' ') . clean(' €'), 1, 0, 'C');
        $pdf->Cell(20, $hauteurLigne, $qte, 1, 0, 'C');
        $pdf->Cell(40, $hauteurLigne, number_format($sousTotal, 2, ',', ' ') . clean(' €'), 1, 1, 'R');
    }

    // --- RÉCAPITULATIF FINAL ---
    $pdf->Ln(5);
    $pdf->SetFont($font, 'B', 11);
    $pdf->Cell(150, 12, clean('MONTANT TOTAL (TTC) '), 0, 0, 'R');
    
    $pdf->SetFillColor(245, 245, 245);
    $pdf->SetTextColor(0, 21, 84);
    $pdf->Cell(40, 12, number_format($montantTotal, 2, ',', ' ') . clean(' €'), 1, 1, 'R', true);

    // --- BAS DE PAGE ---
    $pdf->Ln(15);
    $pdf->SetFont($font, 'B', 10);
    $pdf->SetTextColor(39, 174, 96); // Vert
    $pdf->Cell(0, 5, clean('PAIEMENT CONFIRMÉ ET SÉCURISÉ'), 0, 1, 'L');
    
    $pdf->SetFont($font, 'I', 9);
    $pdf->SetTextColor(100, 100, 100);
    $pdf->Cell(0, 5, clean('Transaction validée via EcotechBank Secure v3 - ID: ') . bin2hex(random_bytes(8)), 0, 1, 'L');

    // la partie resever au gerants de la societé pour les contacter en cas de probleme ou pour les remercier de leur confiance

$pdf->Ln(10);
$pdf->SetDrawColor(0, 21, 84);
$pdf->SetFillColor(252, 252, 252);
$pdf->SetFont($font, 'B', 10);
$pdf->Cell(0, 8, clean('Équipe de Gestion du Projet :'), 'T', 1, 'L');

$pdf->SetFont($font, '', 9);
$pdf->SetTextColor(50, 50, 50);

$pdf->Cell(95, 5, clean('Gérant 1 : Ezechiel Kouakou'), 0, 0);
$pdf->Cell(95, 5, clean('Gérant 2 : Amadou Olaniran'), 0, 1);
$pdf->Cell(0, 5, clean('Programme Expert du numérique - BTS SIO - Projet Académique 2026'), 0, 1);

    $pdf->SetY(-30);
    $pdf->SetFont($font, '', 8);
    $pdf->SetTextColor(150, 150, 150);
    $pdf->MultiCell(0, 4, clean("Ecotech Technologie SAS - Villejuif, France\nSiret : 854 221 000 00012 - TVA Intracommunautaire : FR 45 854221000\nMerci de votre confiance."), 0, 'C');

    ob_end_clean();
    $pdf->Output('D', 'Facture_Ecotech_' . $ref . '.pdf');
}