<?php

//try catch ou if test_connexion si session exiset 
//sino header locatipn die fin redirection fichier 
//secure a include si y  a pas de co (session)

//test si la session de l'utilisateur est deja connecter
if (!isset($_SESSION['login'])) {
    header('Location: connexion.php');
    exit();
}


?>