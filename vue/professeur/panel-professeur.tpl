<!DOCTYPE html>
<html>
    <head>
        <title>Panel professeur</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="./vue/bootstrap/css/bootstrap.min.css">
        <script src="./vue/bootstrap/js/jquery.min.js"></script>
        <script src="./vue/bootstrap/js/bootstrap.min.js"></script>
        <script src="./vue/js/professeur/prof.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <link rel="stylesheet" href="./vue/styles/session.css">
        <link rel="stylesheet" href="./vue/styles/board.css">
        <link rel="stylesheet" href="./vue/styles/professeur/prof_global.css">
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
                <form action="index.php?controle=professeur&action=newSession" method="POST">
                    <button class="btn btn-success" type="submit" name="newSession"> Créer un test <i class="fas fa-plus-circle"></i></button>
                </form>
            </div>
        </div>
        <div class="main">
            <div class="session">
                <a for="list_test">Nom du test : </a>
                <form action="index.php?controle=professeur&action=startSession" method="POST">
                    <select id="list_test" name="test" onchange="selectedTest()">
                        <?php 
                            foreach($list_des_tests as $test)
                            {
                                echo '<option value = "'.$test['id_test'].'">'.$test['titre_test'].'</option>';
                                echo '<option hidden value = "'.$test['num_grpe'].'"></option>';
                            }
                        ?>
                    </select>
                    <a id="num_groupe">Groupe lier au test : <span class="red-txt"><span id="selectedTest"></span></span></a>
                    <button class="btn btn-success" type="submit" name="startSession" >Parametrer le test <i class="fas fa-play"></i> </button>
                </form> 
            </div>
            
        </div>

        

    </body>
</html>