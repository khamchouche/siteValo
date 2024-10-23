<?php
session_start();

// On définit un login et un mot de passe de base
$login_valide = "moi";
$pwd_valide = "moi";

// On teste si nos variables sont définies
if (isset($_POST['login']) && isset($_POST['pwd'])) {
    // On vérifie les informations saisies
    if ($login_valide == $_POST['login'] && $pwd_valide == $_POST['pwd']) {
        // On enregistre les paramètres de notre visiteur comme variables de session
        $_SESSION['login'] = $_POST['login'];
        $_SESSION['pwd'] = $_POST['pwd'];
        // Redirection vers une page membre
        header('location:panier.php');
    } else {
        $erreur = "Membre non reconnu.";
    }
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Connexion</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="site.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Connexion</h1>

    <?php if (isset($erreur)): ?>
        <div class="alert alert-danger text-center">
            <?php echo $erreur; ?>
        </div>
    <?php endif; ?>

    <form action="connexion.php" method="post" class="mx-auto" style="max-width: 400px;">
        <div class="mb-3">
            <label>Votre login :</label>
            <input type="text" name="login" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Votre mot de passe :</label>
            <input type="password" name="pwd" class="form-control" required>
        </div>
        
        <div class="text-center">
            <button type="submit" class="btn btn-primary">Connexion</button>
        </div>
    </form>
</div>
</body>
</html>
