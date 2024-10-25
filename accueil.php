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
    
<div class="image-titre text-center">
    <img src="image/valorant.jpg" width="120" height="75" class="img-fluid" alt="Valorant Logo" /><br>
</div>

<div class="container mt-5">
    <h1 class="text-center mb-4">Liste des Skins Valorant</h1>
    <div class="row">
        <?php
        $compteur = 0;
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
            $compteur++;
            // Cette vérification n'est plus nécessaire si on utilise Bootstrap correctement
            // if ($compteur % 3 == 0) {
            //     echo "</div><div class='row'>";
            // }
        }
        ?>
    </div>
</div>

</body>
</html>
