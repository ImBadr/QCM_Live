<!DOCTYPE html>
<html>

<head>
    <title>Panel test</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="./vue/bootstrap/css/bootstrap.min.css">
    <script src="./vue/bootstrap/js/jquery.min.js"></script>
    <script src="./vue/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="stylesheet" href="./vue/styles/etudiant/etu_test.css">
    <link rel="stylesheet" href="./vue/styles/etudiant/etu_global.css">
    <link rel="stylesheet" href="./vue/styles/switch.css">
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
            <i class="fas fa-user-graduate"></i>
            <a>Nom :<span class="red-txt"> <?php echo utf8_encode($_SESSION['nom']);?></span></a>
            <a>Prénom : <span class="red-txt"> <?php echo utf8_encode($_SESSION['prenom']);?></span></a>
            <form action="index.php?controle=etudiant&action=disconnect" method="post">
                <input class="btn btn-danger" type="submit" name="buttonDisconnect" value="Deconnexion">
            </form>
        </div>

        <div class="divider"></div>

        <!--ACTIONS-->

    </div> 
     
    
    <div class="tableau">
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    
                    <th scope="col"><?php
                        
                        
                            echo 'Test : ' . $test['titre_test'] . ' id: '. $test['id_test'] . ' | Date : ' . $test['date_test'] . ' | Groupe : ' . $test['num_grpe'];

                        ?>
                        </th>
                    <th scope="col"></th>

                </tr>
            </thead>
            <form action="index.php?controle=etudiant&action=submit" method="post">
            <?php
               
                foreach ($liste_quest_autorize as $question) {
            ?>
                <thead class="bg-warning">
                    <tr>
                        <th scope="col"><?php echo $question['titre'] . ' ' . $question['texte'] . ' '; ?></th>
                        <th scope="col"></th>
                    
                    <tr>
                </thead>
                <tbody>
                    <?php
                        $liste_rep_autorise = getListeReponsesAutorise($question['id_quest']);
                        shuffle($liste_rep_autorise);
                        foreach ($liste_rep_autorise as $reponse) { 
                    ?>
                        <tr>
                            <th scope="row"> <?php echo utf8_encode($reponse['texte_rep']); ?> </th>
                            <?php
                            $bool = false;
                            foreach($liste_res as $resultat) {
                                $bool = false;
                                
                                if($reponse['id_rep'] == $resultat['id_rep']) {
                                    echo '<td>';
                                    echo '<div class="switch_box box_1">';
                                    echo '<input type="checkbox" class="switch_1" name="choix[]" value ="' . $question['id_quest'] . ' ' . $reponse['id_rep'] . '" checked>';
                                    echo '</div>';
                                    $bool = true;
                                    break;
                                }
                            }
                            if(!$bool) {
                                echo '<td>';
                                echo '<div class="switch_box box_1">';
                                echo '<input type="checkbox" class="switch_1" name="choix[]" value ="' . $question['id_quest'] . ' ' . $reponse['id_rep'] . '">';
                                echo '</div>';
                            }
                                
                            }
                    } ?>
                        </tr>
                </tbody>
        </table>
        
        
            <input class="btn btn-success" type="submit" name="submit" value="Envoyer">
        </form>

        <br>
        <br>

    </div>

</body>

</html>