<?php
// Informations de connexion à la base de données
$host = "lakartxela.iutbayonne.univ-pau.fr"; // Remplace par ton hôte si nécessaire
$user = "khamchouche_bd"; // Nom d'utilisateur de la base de données
$pass = "khamchouche_bd"; // Mot de passe de la base de données
$bdd = "khamchouche_bd"; // Nom de la base de données

// Connexion à la base de données
$link = mysqli_connect($host, $user, $pass, $bdd);

// Vérification de la connexion
if (!$link) {
    die("Échec de la connexion : " . mysqli_connect_error());
}

?>