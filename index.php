<?php 
    require('./classes/Reponse.php');
    require('./classes/Test.php');
    require('./classes/Qcm.php');
    require('./classes/Question.php');
    require('./classes/Resultat.php');
    require('./classes/Note.php');
    session_start();
    
    if (isset($_GET['controle']) & isset($_GET['action'])) {
        if (isset($_SESSION['id']) & isset($_SESSION['nom']) & isset( $_SESSION['prenom'])) {
            $controle = $_GET['controle'];
            $action= $_GET['action'];
        }
        else{
            $controle = "utilisateur";
            $action= "ident";
        }
    }
    else {
       $controle = "utilisateur";
       $action= "ident";
    }
       
    require ('./controle/' . $controle . '.php');   
    $action (); 
?>
