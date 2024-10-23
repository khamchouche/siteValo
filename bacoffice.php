<?php
session_start();

// Fonction pour créer le panier si nécessaire
function creationPanier() {
    if (!isset($_SESSION['panier'])) {
        $_SESSION['panier'] = array('id' => array(), 'nom' => array(), 'rarete' => array(), 'prix' => array());
    }
}

// Fonction pour ajouter un article au panier
function ajouterArticle($id, $nom, $rarete, $prix) {
    creationPanier();
    if (!in_array($id, $_SESSION['panier']['id'])) {
        $_SESSION['panier']['id'][] = $id;
        $_SESSION['panier']['nom'][] = $nom;
        $_SESSION['panier']['rarete'][] = $rarete;
        $_SESSION['panier']['prix'][] = $prix;
    }
}

// Fonction pour supprimer un article du panier
function supprimerArticle($id) {
    creationPanier();
    $index = array_search($id, $_SESSION['panier']['id']);
    if ($index !== false) {
        unset($_SESSION['panier']['id'][$index]);
        unset($_SESSION['panier']['nom'][$index]);
        unset($_SESSION['panier']['rarete'][$index]);
        unset($_SESSION['panier']['prix'][$index]);

        // Réindexer les tableaux
        $_SESSION['panier']['id'] = array_values($_SESSION['panier']['id']);
        $_SESSION['panier']['nom'] = array_values($_SESSION['panier']['nom']);
        $_SESSION['panier']['rarete'] = array_values($_SESSION['panier']['rarete']);
        $_SESSION['panier']['prix'] = array_values($_SESSION['panier']['prix']);
        
        return true; // Indique que la suppression a réussi
    }
    return false; // Indique que la suppression a échoué
}

// Traitement des actions (ajout ou suppression)
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $action = $_POST['action'];

    if ($action == 'ajouter') {
        ajouterArticle($_POST['id'], $_POST['nom'], $_POST['rarete'], $_POST['prix']);
        $_SESSION['message'] = "L'article '" . $_POST['nom'] . "' a été ajouté au panier.";
    } elseif ($action == 'supprimer') {
        if (supprimerArticle($_POST['id'])) {
            $_SESSION['message'] = "L'article a été supprimé du panier.";
        } else {
            $_SESSION['message'] = "Erreur: L'article n'a pas pu être supprimé.";
        }
    }

    // Redirection vers la page du panier après l'ajout ou suppression
    header('Location: panier.php');
    exit();
}
?>
