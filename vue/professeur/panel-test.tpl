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
    <link rel="stylesheet" href="./vue/styles/switch.css">
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
            <a>Nom : <span class="red-txt"> <?php echo utf8_encode($_SESSION['nom']); ?></span></a>
            <a>Prénom : <span class="red-txt"> <?php echo utf8_encode($_SESSION['prenom']); ?></span></a>

            <form action="index.php?controle=professeur&action=disconnect" method="post">
                <input class="btn btn-danger" type="submit" name="buttonDisconnect" value="Deconnexion">
            </form>
        </div>

        <div class="divider"></div>

        <!--ACTIONS-->
        <div class="board-actions">
            <h4>Actions :</h4>
            <form action="index.php?controle=professeur&action=accueil" method="POST">
                <button class="btn btn-warning" type="submit" name="buttonBack"> Retour </button> 
            </form>
            <form action="index.php?controle=professeur&action=FormAddQuestion" method="post">
                <input type="hidden" name="id_test" value='<?php echo $test->_get_id_test(); ?>'/>
                <button type="submit" name="FormAddQuestion" class="btn btn-success">Ajouter une Question</button>
            </form>
            <form action="index.php?controle=professeur&action=students" method="POST">
                <input hidden type="text" value="<?php echo $test->_get_num_grpe();?>" name="groupe">
                <input type="hidden" name="id_test" value='<?php echo $test->_get_id_test(); ?>'/>
                <button class="btn btn-success" type="submit" name="students">Liste étudiants</button>
            </form>
            <form action="index.php?controle=professeur&action=notes" method="POST">
                <input type="hidden" name="id_test" value='<?php echo $test->_get_id_test(); ?>'/>
                <button class="btn btn-success" type="submit" name="notes">Notes étudiants</button>
            </form>
            <?php   
                if($test->_get_bActif()==0) {
                    echo '<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">Lancer le test</button>';
                    if(Test::GET_B_OPEN_CORR($_SESSION['id_test'])['essai'] == 0)
                        echo '<br><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal5">Ouvrir correction</button>';
                    if(Test::GET_B_OPEN_CORR($_SESSION['id_test'])['essai'] == 1)
                        echo '<br><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal5">Fermer la correction</button>';
                }
                    if($test->_get_bActif()==1)
                    echo '<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">Arreter le test</button>';
            ?> 
            <?php   
                
            ?> 
        </div> 
    </div>
     
    
    <div class="tableau">
        <form method="post" action="index.php?controle=professeur&action=refreshQuest&test=<?php echo $test->_get_id_test(); ?>">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col"><?php echo 'Test : ' . $test->_get_titre_test()  . ' | Date : ' . $test->_get_date_test() . ' | Groupe : ' . $test->_get_num_grpe(); ?></th>
                        <th scope="col"></th>
                        <th scope="col">Afficher</th>
                    </tr>
                </thead>
                    <?php   foreach ($test->_get_liste_qcm() as $qcm) {
                    $question = $qcm->_get_question(); ?>
                    <thead class="bg-warning">
                        <tr>
                            <th scope="col"><?php echo '<dfd class="font-weight-bold">Titre : </dfd>'.$question->_get_titre() . ' <dfd class="font-weight-bold">Question : </dfd>' . $question->_get_texte() . ' '; ?></th>
                            <th scope="col"></th>
                            <th scope="col"><?php  echo '<div class="switch_box box_1">';
                                echo '<input type="checkbox" class="switch_1" name="ListQCM[]" value ="'.$qcm->_get_id_qcm().'"'; 
                            ?>
                            <?php if($qcm->_get_autorise()==1){echo 'checked' ;}  echo '>';?>
                            </div>
                            </th>
                        <tr>
                    </thead>
                    <?php   foreach ($question->_get_liste_reponses() as $reponse) { ?>
                    <tbody class="bg-muted">
                        <tr>
                            <th scope="col"> <?php echo utf8_encode($reponse->__toString()); ?> </th>
                            <?php   if ($reponse->_get_valid() == true) {
                                        echo '<td class="badge-success"><i class="fas fa-check-circle"></td><td></td>';
                                    } else {
                                        echo '<td class="badge-danger"><i class="fas fa-times-circle"></i></td>';
                                        echo '<td><div class="switch_box box_1"><input type="checkbox" class="switch_1" name="ListRep[]" value="'.$reponse->_get_id_rep().'"';
                                        if($reponse->_get_autorise() == 1){echo 'checked' ;} echo '>';
                                        echo '</div></td>';
                                    }
                            } ?>
                        </tr>
                    </tbody>
                    <?php } ?>
                    
                
            </table>
            <input type="hidden" name="id_test" value='<?php echo $test->_get_id_test(); ?>'/>
            <?php 
                if($test->_get_bActif()==0) echo '<input class="btn btn-success" type="submit" name="buttonConfirmed" value="Confirmer les modifications">';
            ?>
            
        </form>
        <br>
        <br>

    </div> 
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <?php 
        if($test->_get_bActif()==0) {
            echo '<div class="modal-dialog" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Lancer le test</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Voulez-vous vraiment lancer le test?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal">Annuler</button>
                    <form action="index.php?controle=professeur&action=startTest&test=' . $test->_get_id_test() . '" method="POST">
                        <input type="hidden" name="id_test" value="' . $test->_get_id_test() . '"/>
                        <button class="btn btn-danger" type="submit" name="startTest">Lancer le test</button>
                    </form>
                </div>
                </div>
            </div>';
        }
        else {
            echo '<div class="modal-dialog" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Lancer le test</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Voulez-vous vraiment arreter le test?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal">Annuler</button>
                    <form action="index.php?controle=professeur&action=stopTest&test= ' . $test->_get_id_test() . '" method="POST">
                        <input type="hidden" name="id_test" value="' . $test->_get_id_test() . '"/>
                        <button class="btn btn-danger" type="submit" name="stopTest">Arreter le test</button>
                    </form>
                </div>
                </div>
            </div>';
        }

        ?>

    </div>         
    <div class="modal fade" id="exampleModal5" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <?php
            if(Test::GET_B_OPEN_CORR($_SESSION['id_test'])['essai'] == 0) {
                echo '<div class="modal-dialog" role="document">
                    <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ouvrir correction</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Voulez-vous ouvrir la correction ?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" data-dismiss="modal">Annuler</button>
                        <form action="index.php?controle=professeur&action=openCorr&test=' . $test->_get_id_test() . '" method="POST">
                            <input type="hidden" name="id_test" value="' . $test->_get_id_test() . '"/>
                            <button class="btn btn-danger" type="submit" name="openCorr">Ouvrir la correction</button>
                        </form>
                    </div>
                    </div>
                </div>';
            }
            else {
                echo '<div class="modal-dialog" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Fermer correction</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Voulez-vous fermer la correction ?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal">Annuler</button>
                    <form action="index.php?controle=professeur&action=closeCorr&test=' . $test->_get_id_test() . '" method="POST">
                        <input type="hidden" name="id_test" value="' . $test->_get_id_test() . '"/>
                        <button class="btn btn-danger" type="submit" name="closeCorr">Fermer la correction</button>
                    </form>
                </div>
                </div>
                </div>';
            }
        ?>
    </div>                          
</body>

</html>