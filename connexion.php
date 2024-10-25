<?php
session_start();
$error_message = ""; // Initialise un message d'erreur

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Vérification simple : utilisateurs prédéfinis
    if ($username === 'admin' && $password === 'admin') {
        $_SESSION['role'] = 'admin';
        header('Location: accueil.php'); // Redirige vers la page d'accueil
        exit();
    } elseif ($username === 'user' && $password === 'user') {
        $_SESSION['role'] = 'user';
        header('Location: accueil.php'); // Redirige vers la page d'accueil
        exit();
    } else {
        $error_message = "Nom d'utilisateur ou mot de passe incorrect.";
    }
}
?>

<!-- Formulaire de connexion -->
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion - Skins Valorant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"> 
    <link rel="stylesheet" href="site.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="accueil.php">Valorant Skins</a>
        <div class="collapse navbar-collapse">
            <div class="ms-auto">
                <?php if (!isset($_SESSION['role'])): ?>
                    <a href="connexion.php" class="btn btn-success">Connexion</a>
                <?php else: ?>
                    <a href="deconnexion.php" class="btn btn-danger">Déconnexion</a>
                <?php endif; ?>
            </div>
            <?php if (isset($_SESSION['role']) && $_SESSION['role'] === 'admin'): ?>
                <div class="text-center mt-4">
                    <a href="gestion_skin.php" class="btn btn-warning">Gérer les skins</a>
                </div>
            <?php endif; ?>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <h2>Connexion</h2>
    <?php if ($error_message): ?>
        <div class="alert alert-danger"><?php echo $error_message; ?></div>
    <?php endif; ?>
    <form action="connexion.php" method="POST">
        <div class="mb-3">
            <label for="username" class="form-label">Nom d'utilisateur :</label>
            <input type="text" name="username" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Mot de passe :</label>
            <input type="password" name="password" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Se connecter</button>
    </form>
</div>
</body>
</html>
