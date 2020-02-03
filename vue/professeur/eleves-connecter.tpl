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
                        <th class="th-sm">Genre</th>
                        <th class="th-sm">Nom</th>
                        <th class="th-sm">Prénom</th>
                        <th class="th-sm">Num groupe</th>
                        <th class="th-sm">Connecter</th>
                    </tr>
                    </thead>
                    <tbody>
                        <?php
                            foreach($students as $student){
                                echo '<tr>';
                                echo '<td>'. utf8_encode($student['genre']).'</td>';
                                echo '<td>'. utf8_encode($student['nom']).'</td>';
                                echo '<td>'. utf8_encode($student['prenom']).'</td>';
                                echo '<td>'. utf8_encode($student['num_grpe']).'</td>';
                                if($student['bConnect']==0){echo '<td><a style="visibility: hidden;">'.$student['bConnect'].'</a><span class="red-txt"><i class="fas fa-signal"></i></span></td>';}
                                else{echo '<td><a style="visibility: hidden;">'.$student['bConnect'].'</a><span class="green-txt"><i class="fas fa-signal"></i></span></td>';}
                                echo '</tr>';
                            }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>