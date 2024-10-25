<?php
session_start(); // Démarre la session

// Assurez-vous que le panier est initialisé
if (!isset($_SESSION['panier'])) {
    $_SESSION['panier'] = array('id' => array(), 'nom' => array(), 'rarete' => array(), 'prix' => array());
}

// Connexion à la base de données
$bdd = "khamchouche_bd";
$host = "lakartxela.iutbayonne.univ-pau.fr";
$user = "khamchouche_bd";
$pass = "khamchouche_bd";
$tableSkinValo = "valorant_skin";

$link = mysqli_connect($host, $user, $pass, $bdd) or die("Impossible de se connecter à la base de données");

// Traitement de l'ajout au panier
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['action']) && $_POST['action'] == 'ajouter') {
    // Ajouter l'article au panier
    $id = $_POST['id'];
    $nom = $_POST['nom'];
    $rarete = $_POST['rarete'];
    $prix = $_POST['prix'];

    if (!in_array($id, $_SESSION['panier']['id'])) {
        $_SESSION['panier']['id'][] = $id;
        $_SESSION['panier']['nom'][] = $nom;
        $_SESSION['panier']['rarete'][] = $rarete;
        $_SESSION['panier']['prix'][] = $prix;
        $_SESSION['message'] = "L'article '$nom' a été ajouté au panier.";
    } else {
        $_SESSION['message'] = "L'article '$nom' est déjà dans le panier.";
    }

    // Rediriger vers la page du panier après ajout
    header('Location: panier.php');
    exit();
}

// Récupérer l'ID du produit depuis l'URL

// Vérifier si 'id' est présent dans les paramètres de l'URL
if (isset($_GET['id'])) {
    $id = $_GET['id']; // Si 'id' existe, on l'affecte à $id
} else {
    $id = 1; // Sinon, on définit $id à 1 par défaut
} // Valeur par défaut si aucun ID n'est fourni

// Requête pour obtenir les détails du produit
$query = "SELECT * FROM $tableSkinValo WHERE id = $id";
$result = mysqli_query($link, $query);
$donnees = mysqli_fetch_assoc($result);
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


<div class="container mt-5">
    <?php if (isset($_SESSION['message'])): ?>
        <div class="alert alert-info text-center">
            <?php echo $_SESSION['message']; unset($_SESSION['message']); ?>
        </div>
    <?php endif; ?>

    <?php if ($donnees): ?>
        <h1 class="text-center mb-4">Détails du Skin <?php echo $donnees["nom"]; ?></h1>
        <div class="row">
            <div class="col-md-6 text-center">
                <img src="<?php echo $donnees["image"]; ?>" alt="<?php echo $donnees["nom"]; ?>" class="img-fluid img-detail">
            </div>
            <div class="col-md-6">
                <ul class="list-group">
                    <li class="list-group-item"><strong>Nom :</strong> <?php echo $donnees["nom"]; ?></li>
                    <li class="list-group-item"><strong>Type :</strong> <?php echo $donnees["type"]; ?></li>
                    <li class="list-group-item"><strong>Rareté :</strong> <?php echo $donnees["rarete"]; ?></li>
                    <li class="list-group-item"><strong>Prix :</strong> <?php echo $donnees["prix"]; ?> €</li>
                </ul>
                
                <!-- Formulaire pour ajouter au panier -->
                <form action="" method="POST" class="mt-4">
                    <input type="hidden" name="id" value="<?php echo $id; ?>">
                    <input type="hidden" name="nom" value="<?php echo $donnees["nom"]; ?>">
                    <input type="hidden" name="rarete" value="<?php echo $donnees["rarete"]; ?>">
                    <input type="hidden" name="prix" value="<?php echo $donnees["prix"]; ?>">
                    <input type="hidden" name="action" value="ajouter">
                    <button type="submit" class="btn btn-success">Ajouter au panier</button>
                </form>
            </div>
        </div>
    <?php else: ?>
        <h1 class="text-center">Produit non trouvé.</h1>
    <?php endif; ?>
    
    <div class="mt-3 text-center">
        <a href="panier.php" class="btn btn-secondary">Voir le panier</a>
        <a href="accueil.php" class="btn btn-primary">Retour à l'Accueil</a>
    </div>
</div>
</body>
</html>

<?php
// Fermez la connexion
mysqli_close($link);
?>
