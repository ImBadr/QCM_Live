<!DOCTYPE html>
<html>
    <head>
        <title>List élèves</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="./vue/bootstrap/css/bootstrap.min.css">
        <script src="./vue/bootstrap/js/jquery.min.js"></script>
        <script src="./vue/bootstrap/js/bootstrap.min.js"></script>
        <script src="./vue/bootstrap/js/mdb.min.js"></script>
        <script src="./vue/bootstrap/js/addons/datatables.min.js"></script>
        <link rel="stylesheet" href="./vue/styles/professeur/prof_global.css">
        <link rel="stylesheet" href="./vue/styles/board.css">
        <link href="./vue/bootstrap/css/addons/datatables.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <link href="./vue/styles/professeur/eleves.css" rel="stylesheet">
        <script src="./vue/js/professeur/eleves.js"></script>
        <link href="./vue/bootstrap/css/mdb.min.css" rel="stylesheet">
    </head>
    <body>
        
        <!--MENU GAUCHE-->
        <div class="board">
            <!--TITRE-->
            <div class="titre-board">
                <a>QCM <span class="red-txt">Live</span></a>
                <i class="fas fa-tasks"></i>
            </div>
            <div class="divider"></div>
            <!--UTILISATEUR-->
            <div class="board-user">
                <h4>Utilisateur :</h4>
                <i class="fas fa-chalkboard-teacher"></i>
                <a>Nom :<span class="red-txt"> <?php echo utf8_encode($_SESSION['nom']);?></span></a>
                <a>Prénom : <span class="red-txt"> <?php echo utf8_encode($_SESSION['prenom']);?></span></a>
                <form action="index.php?controle=professeur&action=disconnect" method="post">
                    <input  class="btn btn-danger" type="submit" name="buttonDisconnect" value="Deconnexion">
                </form>
            </div>
            <div class="divider"></div>
            <!--ACTIONS-->
            <div class="board-actions">
                <h4>Actions :</h4>
                <form action="index.php?controle=professeur&action=notes" method="POST">
                    <input type="hidden" name="id_test" value='<?php echo $_GET['id_test']; ?>' />
                    <button class="btn btn-warning" type="submit" name="buttonBack" onclick="goBack()"> Retour </button>
                </form> 
            </div>
        </div>

        <div class="tableau">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Questions - Réponses</th>
                        <th scope="col">Resultats</th>
                    </tr>
                </thead>
                <?php   foreach ($test->_get_liste_qcm() as $qcm) {
                $question = $qcm->_get_question(); ?>
                <thead class="bg-warning">
                    <tr>
                        <th scope="col"><?php echo utf8_encode($question->_get_texte()); ?></th>
                        <th scope="col"></th>
                    <tr>
                </thead>
                <?php   foreach ($question->_get_liste_reponses() as $reponse) { ?>
                <tbody class="bg-muted">
                    <tr><?php  $estpresent = false; 
                                foreach ($LesResultats as $resultat) {
                                    if ($resultat['id_rep'] == $reponse->_get_id_rep()) { $estpresent = true; }
                                }
                                if ($reponse->_get_valid() == 1) {
                                    echo    '<th scope="col" class="badge-success">' . utf8_encode($reponse->__toString()). '</th>';
                                    if ($estpresent == true) {
                                        echo    '<td class=""><i class="fas fa-check-circle green-text"></i></i></td>';
                                    }
                                    else {
                                        echo    '<td><i class="fas fa-times-circle red-text"></i></i></td>';
                                    }
                                } 
                                else {
                                    echo    '<th scope="col" class="badge-danger">' . utf8_encode($reponse->__toString()). '</th>';
                                    if ($estpresent == true) {
                                        echo    '<td><i class="fas fa-times-circle red-text"></i></td>';;
                                    }
                                    else {
                                        echo    '<td><i class="fas fa-check-circle green-text"></i></i></td>';
                                    }
                                }
                        } ?>
                    </tr>
                </tbody>
                <?php } ?>
            </table>
        </div>


    </body>
</html>