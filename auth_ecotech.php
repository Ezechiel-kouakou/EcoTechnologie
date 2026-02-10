<?php
require_once 'config.php';
session_start();

if(isset($_POST['submit'])){
    $email = htmlspecialchars($_POST['email']); 
    $mdp = $_POST['mot_de_passe'];

    $request = $pdo->prepare("SELECT * FROM client WHERE email = ?");
    $request->bind_param('s',$email);
    $request->execute();
    $resultat = $request->get_result();
    if($resultat->num_rows > 0){
    $users = $resultat->fetch_assoc();
    
    if(password_verify($mdp, $users['mot_de_passe'])){
       $_SESSION['id'] = $users['id'];
       $_SESSION['email'] = $users['email'];
       $_SESSION['nom'] = $users['nom'];

    $message_error = "connexion reussie , vous serez rediriger vers  la page d'accueil dans quelques secondes...";
   }else{
    $message_error = "Mot de passe incorrect ou email incorrect ";
     }
}

}

?>