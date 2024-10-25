<?php
session_start();
include 'bd_connexion.php'; // Fichier de connexion à la base de données

// Ajout d'un skin
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action'])) {
    $nom = $_POST['nom'];
    $image = $_POST['image'];
    $rarete = $_POST['rarete']; // Nouveau champ pour la rareté

    // Ajout à la base de données
    if ($_POST['action'] === 'ajouter') {
        $ajout_skin_stmt = $link->prepare("INSERT INTO valorant_skin (nom, image, rarete) VALUES (?, ?, ?)");
        $ajout_skin_stmt->bind_param("sss", $nom, $image, $rarete);
        $ajout_skin_stmt->execute();
    }

    // Modification d'un skin
    if ($_POST['action'] === 'modifier') {
        $id = $_POST['id'];
        $modifier_skin_stmt = $link->prepare("UPDATE valorant_skin SET nom = ?, image = ?, rarete = ? WHERE id = ?");
        $modifier_skin_stmt->bind_param("sssi", $nom, $image, $rarete, $id);
        $modifier_skin_stmt->execute();
    }

    // Suppression d'un skin
    if ($_POST['action'] === 'supprimer') {
        $id = $_POST['id'];
        $supprimer_skin_stmt = $link->prepare("DELETE FROM valorant_skin WHERE id = ?");
        $supprimer_skin_stmt->bind_param("i", $id);
        $supprimer_skin_stmt->execute();
    }
}

// Récupération des skins
$query = "SELECT * FROM valorant_skin";
$result_skins = mysqli_query($link, $query);
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Skins Valorant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="site.css">
</head>
<body>

<div class="container mt-5">
    <h1 class="text-center mb-4">Gestion des Skins Valorant</h1>

    <h2>Ajouter un Skin</h2>
    <form method="POST" class="mb-4">
        <input type="text" name="nom" placeholder="Nom du skin" required>
        <input type="text" name="image" placeholder="URL de l'image" required>
        <input type="text" name="rarete" placeholder="Rareté" required> 
        <input type="hidden" name="action" value="ajouter">
        <button type="submit" class="btn btn-primary">Ajouter</button>
    </form>

    <h2>Liste des Skins</h2>
    <div id="skinList" class="row">
        <?php while ($donnees = mysqli_fetch_assoc($result_skins)) : ?>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="<?php echo $donnees['image']; ?>" alt="<?php echo $donnees['nom']; ?>" class="card-img-top" style="height: 200px; object-fit: cover;">
                    <div class="card-body">
                        <h5 class="card-title"><?php echo $donnees['nom']; ?></h5>
                        <p>Rareté : <?php echo $donnees['rarete']; ?></p>

                        <form method="POST" style="display:inline;">
                            <input type="hidden" name="id" value="<?php echo $donnees['id']; ?>">
                            <input type="hidden" name="action" value="supprimer">
                            <button type="submit" onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce skin ?');" class="btn btn-danger">Supprimer</button>
                        </form>

                        <button onclick="document.getElementById('modifierForm-<?php echo $donnees['id']; ?>').style.display='block'" class="btn btn-warning">Modifier</button>

                        <div id="modifierForm-<?php echo $donnees['id']; ?>" style="display:none;">
                            <h6>Modifier le Skin</h6>
                            <form method="POST">
                                <input type="hidden" name="id" value="<?php echo $donnees['id']; ?>">
                                <input type="text" name="nom" value="<?php echo $donnees['nom']; ?>" required>
                                <input type="text" name="image" value="<?php echo $donnees['image']; ?>" required>
                                <input type="text" name="rarete" value="<?php echo $donnees['rarete']; ?>" required> 
                                <input type="hidden" name="action" value="modifier">
                                <button type="submit" class="btn btn-primary">Modifier</button>
                                <button type="button" onclick="document.getElementById('modifierForm-<?php echo $donnees['id']; ?>').style.display='none'" class="btn btn-secondary">Annuler</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        <?php endwhile; ?>
    </div>
</div>

</body>
</html>
