<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start(); // Démarre la session si elle n'est pas déjà active
}

// Vérifie si la session de l'utilisateur est déjà connectée
if (!isset($_SESSION['role'])) {
    header('Location: connexion.php');
    exit();
}
?>
