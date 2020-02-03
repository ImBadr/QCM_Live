<!DOCTYPE html>
<html>
    <head>
        <title>Ajouter une session de test</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="./vue/bootstrap/css/bootstrap.min.css">
        <script src="./vue/bootstrap/js/jquery.min.js"></script>
        <script src="./vue/bootstrap/js/bootstrap.min.js"></script>
        <script src="./vue/js/prof.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <link rel="stylesheet" href="./vue/styles/professeur/prof_global.css">
        <link rel="stylesheet" href="./vue/styles/professeur/prof_add_session.css">
        <link rel="stylesheet" href="./vue/styles/board.css">
        <link href="./vue/bootstrap/css/mdb.min.css" rel="stylesheet">
    </head>
    <body>
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
                <form action="index.php?controle=professeur&action=accueil" method="POST">
                    <button class="btn btn-danger" type="submit" name="annulerSession">Annuler la création</button>
                </form>
            </div>
        </div>
        <div class="add">
            <form action="index.php?controle=professeur&action=addSession" method="POST">
                <label for="titreTest">Titre de la session de test : </label>
                <input id="input-text" type="text" name="titreTest">
                <label for="groupe">Groupe de la session de test : </label>
                <select id="groupe" name="groupe">
                    <?php 
                        foreach($list_groupes as $groupe)
                        {
                            echo '<option value = "'.$groupe['num_grpe'].'">'.$groupe['num_grpe'].'</option>';
                        }
                    ?>
                </select>
                <input class="btn btn-success" type="submit" name="addSession" value="Ajouter le test">
            </form>
            <?php 
            if(isset($_GET['error'])&&$_GET['error']==1)
                echo('<div class="alert alert-danger" role="alert">Veuillez choisir le titre de la session</div>');
            ?> 
        </div>
    </body>
</html>