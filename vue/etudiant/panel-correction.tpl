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
    <link rel="stylesheet" href="./vue/styles/board.css">
    <link rel="stylesheet" href="./vue/styles/etudiant/etu_test.css">
    <link rel="stylesheet" href="./vue/styles/etudiant/eleves.css">
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
        <div class="board-actions">
            <h4>Actions :</h4>
            <form action="index.php?controle=etudiant&action=accueil" method="POST">
                <button class="btn btn-warning" type="submit" name="buttonBack"> Retour </button> 
            </form>
            <br>
            <br>
        </div> 
    </div>

    
    <div class="container">
        <table class="table"> 
            <thead class="thead-dark">
                <tr> 
                    <th scope="col"> <?php echo 'Test : ' . $test['titre_test'] . ' id: '. $test['id_test'] . ' | Date : ' . $test['date_test'] . ' | Groupe : ' . $test['num_grpe']; ?> </th>
                    <th scope="col"> <?php echo 'note test : ' . $note['note'] . '/20'; ?> </th>
                </tr>
            </thead>
            <?php foreach ($liste_quest as $question) { ?>
            <thead class="bg-warning">
                <tr>
                    <th scope="col"><?php echo $question['titre'] . ' ' . $question['texte'] . ' '; ?></th>
                    <th scope="col"></th>
                
                <tr>
            </thead>
            <tbody>
                <?php
                    $liste_rep = getListeReponses($question['id_quest']);
                    foreach ($liste_rep as $reponse) { 
                ?>
                    <tr>
                        <th scope="row"> <?php echo utf8_encode($reponse['texte_rep']); ?> </th>
                        <?php
                        foreach($liste_res as $resultat) {
                            
                            $bool = false;
                            
                            if($reponse['id_rep'] == $resultat['id_rep']) {
                                if ($reponse['bvalide'] == 1) {
                                    echo    '<td class="badge-success">' .  
                                        '<input  type="checkbox"  name="choix[]" value ="' . $question['id_quest'] . ' ' . $reponse['id_rep'] . '" disabled ="disabled" checked>';
                                }
                                else {
                                    echo '<td class="badge-danger">' .  
                                    '<input  type="checkbox"  name="choix[]" value ="' . $question['id_quest'] . ' ' . $reponse['id_rep'] . '" disabled ="disabled" checked>';
                                }
                                
                                $bool = true;
                                break;
                            }
                        }
                        if(!$bool) {
                            if ($reponse['bvalide'] == 1) {
                                echo    '<td class="badge-success">' .  
                                    '<input  type="checkbox"  name="choix[]" value ="' . $question['id_quest'] . ' ' . $reponse['id_rep'] . '" disabled ="disabled">';
                            }
                            else {
                                echo '<td class="badge-danger">' .  
                                '<input  type="checkbox"  name="choix[]" value ="' . $question['id_quest'] . ' ' . $reponse['id_rep'] . '"  disabled ="disabled">';
                            }
                        }
                            
                        }
                } ?>
                    </tr>
            </tbody>
        </table>
        <br>
        <br>
    </div>
    

</body>

</html>