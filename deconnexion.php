<?php
session_start(); // Démarre la session

// Détruire toutes les données de session
$_SESSION = []; // Réinitialise les variables de session
session_destroy(); // Détruit la session

// Rediriger vers la page de connexion ou d'accueil
header('Location: connexion.php'); // Changez ici vers accueil.php si nécessaire
exit();
?>
