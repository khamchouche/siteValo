<?php
session_start();
include 'secure_host.php'; // Vérifie si l'utilisateur est connecté

// Créer le panier si nécessaire
function creationPanier() {
    if (!isset($_SESSION['panier'])) {
        $_SESSION['panier'] = array('id' => array(), 'nom' => array(), 'rarete' => array(), 'prix' => array());
    }
}

creationPanier();

// Supprimer un article
if (isset($_GET['supprimer'])) {
    $id = $_GET['supprimer'];
    $index = array_search($id, $_SESSION['panier']['id']);

    if ($index !== false) {
        unset($_SESSION['panier']['id'][$index]);
        unset($_SESSION['panier']['nom'][$index]);
        unset($_SESSION['panier']['rarete'][$index]);
        unset($_SESSION['panier']['prix'][$index]);

        $_SESSION['panier']['id'] = array_values($_SESSION['panier']['id']);
        $_SESSION['panier']['nom'] = array_values($_SESSION['panier']['nom']);
        $_SESSION['panier']['rarete'] = array_values($_SESSION['panier']['rarete']);
        $_SESSION['panier']['prix'] = array_values($_SESSION['panier']['prix']);

        $_SESSION['message'] = "L'article a été supprimé du panier.";
    }

    header('Location: panier.php');
    exit();
}
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
        <a class="navbar-brand" href="accueil.php">Valorant Skins</a>
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

<div class="container mt-5">
    <h1 class="text-center">Mon Panier</h1>

    <?php if (isset($_SESSION['message'])): ?>
        <div class="alert alert-info text-center">
            <?php
            echo $_SESSION['message'];
            unset($_SESSION['message']);
            ?>
        </div>
    <?php endif; ?>

    <?php if (empty($_SESSION['panier']['id'])): ?>
        <div class="alert alert-warning text-center">
            Votre panier est vide. <br>
            <a href="accueil.php" class="btn btn-primary">Retour à l'Accueil</a>
        </div>
    <?php else: ?>
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Rareté</th>
                    <th>Prix</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($_SESSION['panier']['id'] as $key => $id): ?>
                    <tr>
                        <td><?php echo $id; ?></td>
                        <td><?php echo $_SESSION['panier']['nom'][$key]; ?></td>
                        <td><?php echo $_SESSION['panier']['rarete'][$key]; ?></td>
                        <td><?php echo $_SESSION['panier']['prix'][$key]; ?> €</td>
                        <td>
                            <a href="panier.php?supprimer=<?php echo $id; ?>" class="btn btn-danger">Supprimer</a>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>

        <div class="text-center">
            <?php if (isset($_SESSION['role']) && $_SESSION['role'] === 'user'): ?>
                <a href="paiement.php" class="btn btn-success">Procéder au Paiement</a>
            <?php else: ?>
                <div class="alert alert-danger">Vous devez être connecté en tant qu'utilisateur pour effectuer un paiement.</div>
            <?php endif; ?>
            <a href="accueil.php" class="btn btn-primary">Retour à l'Accueil</a>
        </div>
    <?php endif; ?>
</div>
</body>
</html>
