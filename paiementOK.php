<?php
session_start();

// Vérification que le paiement a bien été effectué
if (!isset($_SESSION['paiement_reussi']) || $_SESSION['paiement_reussi'] !== true) {
    header('Location: accueil.php'); // Redirige vers l'accueil si pas de paiement
    exit();
}

// Récupération de l'ancien panier pour affichage
if (isset($_SESSION['ancien_panier'])) {
    $ancien_panier = $_SESSION['ancien_panier'];
} else {
    $ancien_panier = array();
}

// Réinitialisation des variables de session liées au paiement
unset($_SESSION['paiement_reussi']);
unset($_SESSION['ancien_panier']);

$confirmation_message = "Votre paiement a été confirmé. Merci pour votre achat !";
?>
<!DOCTYPE html>
<html lang="fr"> 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil Skins Valorant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"> <!-- Lien vers Bootstrap -->
    <link rel="stylesheet" href="site.css"> <!-- Lien vers le CSS -->
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Valorant Skins</a>
        <div class="collapse navbar-collapse">
            <div class="ms-auto">
                <!-- Lien vers la page de connexion -->
                <?php if (!isset($_SESSION['role'])): ?>
                    <a href="connexion.php" class="btn btn-success">Connexion</a>
                <?php else: ?>
                    <a href="deconnexion.php" class="btn btn-danger">Déconnexion</a>
                <?php endif; ?>
            </div>
            <!-- Lien vers la page de gestion des skins, visible uniquement pour l'administrateur -->
            <?php if (isset($_SESSION['role']) && $_SESSION['role'] === 'admin'): ?>
                <div class="text-center mt-4">
                    <a href="gestion_skin.php" class="btn btn-warning">Gérer les skins</a>
                </div>
            <?php endif; ?>
        </div>
    </div>
</nav>


<div class="container text-center mt-5">
    <h1>Confirmation de paiement</h1>

    <div class="alert alert-success mt-4">
        <?php echo $confirmation_message; ?>
    </div>

    <?php if (!empty($ancien_panier['nom'])): ?>
        <h2>Récapitulatif de votre commande</h2>
        <ul class="list-group mt-3">
            <?php foreach ($ancien_panier['nom'] as $index => $nom): ?>
                <li class="list-group-item">
                    <?php echo $nom; ?> - <?php echo $ancien_panier['prix'][$index]; ?> €
                </li>
            <?php endforeach; ?>
        </ul>
    <?php endif; ?>

    <a href="accueil.php" class="btn btn-primary mt-4">Retour à l'accueil</a>
</div>

</body>
</html>