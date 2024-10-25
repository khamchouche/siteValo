<?php
session_start();
// include_once("connexion.php");

$erreur = '';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $num_carte = $_POST['num_carte'] ?? '';
    $date_expiration = $_POST['date_expiration'] ?? '';

    $num_carte = str_replace(' ', '', $num_carte);

    // Vérification que les champs ne sont pas vides
    if (empty($num_carte) || empty($date_expiration)) {
        $erreur = "Veuillez remplir tous les champs.";
    } else {
        // Vérification du numéro de carte 
        if (strlen($num_carte) != 16 || !is_numeric($num_carte) || $num_carte[0] != $num_carte[15]) {
            $erreur = "Le numéro de carte doit contenir 16 chiffres et le dernier chiffre doit être identique au premier.";
        }
        // Vérification de la date d'expiration
        else {
            $aujourdhui = new DateTime();
            $date_limite = $aujourdhui->add(new DateInterval('P3M'));
            $date_validite = DateTime::createFromFormat('m-Y', $date_expiration);
            
            if ($date_validite === false) {
                $erreur = "Format de date invalide.";
            } elseif ($date_validite <= $date_limite) {
                $erreur = "La date d'expiration doit être supérieure à " . $date_limite->format('m-Y') . ".";
            } else {
                // Paiement accepté
                $_SESSION['paiement_reussi'] = true;
                $_SESSION['ancien_panier'] = $_SESSION['panier'] ?? array(); // Sauvegarde de l'ancien panier
                $_SESSION['panier'] = array(
                    'id' => array(),
                    'nom' => array(),
                    'rarete' => array(),
                    'prix' => array()
                ); // Réinitialisation du panier
                header("Location: paiementOK.php");
                exit();
            }
        }
    }
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
    <h1 class="text-center">Paiement</h1>
    
    <?php if ($erreur): ?>
        <div class="alert alert-danger text-center">
            <?php echo $erreur; ?>
        </div>
    <?php endif; ?>

    <form method="POST" class="mx-auto" style="max-width: 400px;">
        <div class="mb-3">
            <label>Numéro de carte (16 chiffres) :</label>
            <input type="text" name="num_carte" maxlength="19" placeholder="1234 5678 1234 5678" class="form-control" required>
            <small class="form-text text-muted">Le dernier chiffre doit être identique au premier.</small>
        </div>
        <div class="mb-3">
            <label>Date d'expiration (MM-YYYY) :</label>
            <input type="text" name="date_expiration" placeholder="01-2025" class="form-control" required>
            <small class="form-text text-muted">La date doit être supérieure à <?php echo (new DateTime())->add(new DateInterval('P3M'))->format('m-Y'); ?></small>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-success">Payer</button>
            <a href="panier.php" class="btn btn-secondary">Retour au Panier</a>
        </div>
    </form>
</div>
</body>
</html>