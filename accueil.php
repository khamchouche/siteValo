<?php
session_start(); 
// Connexion à la base de données
$bdd = "khamchouche_bd";
$host = "lakartxela.iutbayonne.univ-pau.fr";
$user = "khamchouche_bd";
$pass = "khamchouche_bd";
$tableSkinValo = "valorant_skin";

$link = mysqli_connect($host, $user, $pass, $bdd) or die("Impossible de se connecter à la base de données");
// Création de la requête
$query = "SELECT * FROM $tableSkinValo";
$result = mysqli_query($link, $query);
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


<div class="image-titre text-center mt-4">
    <img src="image/valorant.jpg" width="120" height="75" class="img-fluid" alt="Valorant Logo" /><br>
</div>

<div class="container mt-5">
    <h1 class="text-center mb-4">Liste des Skins Valorant</h1>
    <div class="row">
        <?php
        while ($donnees = mysqli_fetch_assoc($result)) {
            $id = $donnees["id"];
            $nom = $donnees["nom"];
            $image = $donnees["image"];
            ?>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="<?php echo $image; ?>" class="card-img-top" alt="<?php echo $nom; ?>">
                    <div class="card-body text-center">
                        <h5 class="card-title"><?php echo $nom; ?></h5>
                        <a href="details.php?id=<?php echo $id; ?>" class="btn btn-primary">Voir détails</a>
                    </div>
                </div>
            </div>
            <?php
        }
        ?>
    </div>
</div>

</body>
</html>
