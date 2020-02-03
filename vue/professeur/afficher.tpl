<!DOCTYPE html>
<html>

<head>
    <title>Panel test</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="./vue/bootstrap/css/bootstrap.min.css">
    <script src="./vue/bootstrap/js/jquery.min.js"></script>
    <script src="./vue/bootstrap/js/bootstrap.min.js"></script>
    <script src="./vue/js/professeur/prof.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="stylesheet" href="./vue/styles/professeur/prof_global.css">
    <link rel="stylesheet" href="./vue/styles/professeur/prof_panel_prof.css">
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
            <h4>Utilisateur : </h4>
            <i class="fas fa-chalkboard-teacher"></i>
            <a>Nom :<span class="red-txt"> <?php echo utf8_encode($_SESSION['nom']);?></span></a>
            <a>Prénom : <span class="red-txt"> <?php echo utf8_encode($_SESSION['prenom']);?></span></a>
            <form action="index.php?controle=professeur&action=disconnect" method="post">
                <input class="btn btn-danger" type="submit" name="buttonDisconnect" value="Deconnexion">
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
            <br>
        </div> 
    </div>
    <!-- Ajout de question -->
    <div class="tableau">
        <form action="index.php?controle=professeur&action=addQuestion" method="post">  
            <input type="hidden" name="id_test" value='<?php echo $id_test; ?>' />
            <table class="table table-bordered" id="dynamic_field">
                <thead>
                    <tr>
                        <td class="bg-warning"> Titre Question :    <input class="form-control name_list" type="text" name="titre_question" required/></td>
                        <td class="bg-warning">Question :           <input class="form-control name_list" type="text" name="texte_question" required/></td>
                        <td class="bg-info">
                            <select class="form-control" data-style="btn-success" id="list_theme" name="theme" onchange="selectedTheme()">
                                <?php 
                                    foreach($list_des_themes as $theme)
                                    {
                                        echo '<option value = "'.$theme['id_theme'].'">'.$theme['titre_theme'].'</option>';
                                        echo '<option hidden value = "'.$theme['id_theme'].'"></option>';
                                    }
                                ?>
                            </select>
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan=2 class="bg-success"> Bonne Reponse : <input type="text" name="reponseCorrect[]" class="form-control name_list" required/></td>
                        <td class="bg-info"><button type="button" name="addGood" id="addGood" class="btn btn-success"><i class="fas fa-plus-circle"></i></button></td>
                    </tr>
                    <tr>
                        <td colspan=2 class="bg-danger">Mauvaise Reponse :<input type="text" name="reponseFausse[]" class="form-control name_list" required/></td>
                        <td class="bg-info"><button type="button" name="addBad" id="addBad" class="btn btn-danger"><i class="fas fa-plus-circle"></i></button></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" name="addQuestion" class="btn btn-info" value="Ajouter" />
        </form>
    </div>

    <script src="./vue/js/prof.js"></script>

</body>

</html>
