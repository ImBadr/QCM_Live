<!DOCTYPE html>
<html>
    <head>
        <title>Panel etudiant</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="./vue/bootstrap/css/bootstrap.min.css">
        <script src="./vue/bootstrap/js/jquery.min.js"></script>
        <script src="./vue/bootstrap/js/bootstrap.min.js"></script>
        <script src="./vue/js/etudiant/select.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <link rel="stylesheet" href="./vue/styles/session.css">
        <link rel="stylesheet" href="./vue/styles/board.css">
        <link rel="stylesheet" href="./vue/styles/etudiant/etu_global.css">
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
                <i class="fas fa-user-graduate"></i>
                <a>Nom :<span class="red-txt"> <?php echo utf8_encode($_SESSION['nom']);?></span></a>
                <a>Prénom : <span class="red-txt"> <?php echo utf8_encode($_SESSION['prenom']);?></span></a>
                <form action="index.php?controle=professeur&action=disconnect" method="post">
                    <input  class="btn btn-danger" type="submit" name="buttonDisconnect" value="Deconnexion">
                </form>
            </div>
            <div class="divider"></div>
            <!--ACTIONS-->
            <div class="board-actions">
                <h4>Actions</h4>
                <div class="session">
                <h4>Corrections des précédents testes</h4>
                <a for="list_test">Nom du test : </a>
                <form action="index.php?controle=etudiant&action=startCorrection" method="POST">
                    <select id="list_test_corr" name="test_corr" onchange="selectedTestCor()">
                        <?php 
                            foreach($list_des_tests_corr as $test_corr)
                            {
                                echo '<option value = "'.$test_corr['id_test'].'">'.$test_corr['titre_test'].'</option>';
                                echo '<option hidden value = "'.$test_corr['date_test'].'"></option>';
                            }
                        ?>
                    </select>
                    <a id="num_groupe">Date du test : <span class="red-txt"><span id="selectedTestCor"></span></span></a>
                    <button class="btn btn-success" type="submit" name="startCorrection" >Regarder la correction <i class="fas fa-play"></i> </button>
                </form> 
            </div>
            </div>
        </div>
        <div class="main">
            <div class="session">
                <a for="list_test">Nom du test : </a>
                <form action="index.php?controle=etudiant&action=startSession" method="POST">
                    <select id="list_test" name="test" onchange="selectedTest()">
                        <?php 
                            foreach($list_des_tests as $test)
                            {
                                echo '<option value = "'.$test['id_test'].'">'.$test['titre_test'].'</option>';
                                echo '<option hidden value = "'.$test['date_test'].'"></option>';
                            }
                        ?>
                    </select>
                    <a id="num_groupe">Date du test : <span class="red-txt"><span id="selectedTest"></span></span></a>
                    <button class="btn btn-success" type="submit" name="startSession" >Lancer le test <i class="fas fa-play"></i> </button>
                </form> 
            </div>
        </div>
    </body>
</html>


