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
        <link href="./vue/bootstrap/css/addons/datatables.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <link href="./vue/styles/professeur/eleves.css" rel="stylesheet">
        <script src="./vue/js/professeur/table.js"></script>
        <link rel="stylesheet" href="./vue/styles/board.css">
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
                <form action="index.php?controle=professeur&action=startSession" method="POST">
                    <input type="hidden" name="test" value='<?php echo $id_test; ?>' />
                    <button class="btn btn-warning" type="submit" name="buttonBack" onclick="goBack()"> Retour </button>
                </form> 
            </div>
        </div>

        <div class="container">
            <div class="table">
                <table id="dtBasicExample" class="table table-striped table-hover table-bordered" cellspacing="0" width="100%">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col" class="th-sm">Nom</th>
                            <th scope="col" class="th-sm">Prénom</th>
                            <th scope="col" class="th-sm">Groupe</th>
                            <th scope="col" class="th-sm">Résultats</th>
                            <th scope="col" class="th-sm">Note</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                            foreach($liste_etudiant_test as $etudiants){
                                echo '<tr>';
                                echo '<td scope="col">'. utf8_encode($etudiants['nom']).'</td>';
                                echo '<td scope="col">'. utf8_encode($etudiants['prenom']).'</td>';
                                echo '<td scope="col">'. utf8_encode($etudiants['num_grpe']).'</td>';
                                echo '<td scope="col"><a href="index.php?controle=professeur&action=resutlatsDetail&Id_Etudiant='.$etudiants['id_etu'].'&id_test='.$id_test.'"><span class="badge badge-info"> Voir les résultats </span></a></td>';
                                echo '<td scope="col">'. $etudiants['note'].'/20 | '. $etudiants['note2'].' pts</td>';
                                echo '</tr>';
                            }
                        ?>
                    </tbody>
                    <tbody>
                        <tr>
                            <td colspan="4" scope="col">Moyenne de la classe</td>
                            <td scope="col"><?php echo $moyenne[0]; ?></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <br>
        <br>
        
    </body>
</html>