<?php 
    require ("data_base.php");

    function getListTest() {
        $sql="SELECT id_test,titre_test,num_grpe FROM test WHERE id_prof=?;";
        $select = connect_db()->prepare($sql);
        $select->execute(array($_SESSION['id']));
        return $select->fetchAll();
    }


    function getListGroupe() {
        $sql="SELECT * FROM groupe;";
        $select = connect_db()->prepare($sql);
        $select->execute();
        return $select->fetchAll();
    }

    function addTest($titre,$groupe) {
        $insert = connect_db()->prepare("INSERT INTO test (`id_prof`,`num_grpe`,`titre_test`,`bActif`,`date_test`) VALUES (?,?,?,?,?);");
        $insert->execute(array($_SESSION['id'],$groupe,$titre,0,date("Y-m-d")));
    }

    function getAllQuest($id_test) {
        $sql="SELECT question.*,reponse.* FROM question, qcm, reponse WHERE qcm.id_test = ? AND qcm.id_quest = question.id_quest AND reponse.id_quest = question.id_quest";
        $select = connect_db()->prepare($sql);
        $select->execute(array($id_test));
        return $select->fetchAll();
    }


    function getTest($id_test) {
        $sql = "SELECT * FROM test WHERE test.id_test = $id_test;";
        $select = connect_db()->prepare($sql);
        $select->execute();
        $test = new Test ($select->fetch());
        $select->closeCursor();
        return $test;
    }

    /* Retournera une questions et ses réponses liées à un qcm
    ça permettra d'utiliser la même question avec différents choix de réponse */
    function _get_qcm($id_qcm) {
        
        $sql = "SELECT * FROM qcm WHERE qcm.id_qcm = $id_qcm;";
        $select = connect_db()->prepare($sql);
        $select->execute();
        $qcm = new Qcm ($select->fetch());
        $select->closeCursor();
        return $qcm;
    }

    /* Retournera une liste de réponses liées à une question*/
    function _get_question($id_quest) {
        
        $sql = "SELECT * FROM question WHERE question.id_quest = $id_quest;";
        $select = connect_db()->prepare($sql);
        $select->execute();
        $question = new Question ($select->fetch());
        $select->closeCursor();
        return $question;
    }
    
    function _get_List_Theme(){
        $select = connect_db()->prepare("SELECT * FROM theme; ");
        $select->execute();
        return $select->fetchAll();
    }

    function _get_students($groupe){
        $sql = "SELECT etudiant.* FROM etudiant WHERE num_grpe = ?;";
        $select = connect_db()->prepare($sql);
        $select->execute(array($groupe));
        return $select->fetchAll();
    }

    function _get_students_test($id_test){
        $select = connect_db()->prepare("SELECT DISTINCT(e.nom), n.*, e.* FROM etudiant as e, resultat as r, note as n WHERE r.id_test = ? AND r.id_etu = e.id_etu AND n.id_etu = r.id_etu AND n.id_test = r.id_test;");
        $select->execute(array($id_test));
        return $select->fetchAll();
    }

    function _get_moyenne($id_test){
        $select = connect_db()->prepare("SELECT AVG(note) FROM note WHERE id_test = ?;");
        $select->execute(array($id_test));
        return $select->fetch();
    }

    function _get_students_resultats($id_etudiant, $id_test){
        $select = connect_db()->prepare("SELECT * FROM resultat WHERE id_etu = ? AND id_test = ?;");
        $select->execute(array($id_etudiant, $id_test));
        return $select->fetchAll();
    }

    function _updateQCM($listQCM,$id_test){
        $sql = "UPDATE qcm SET qcm.bAutorise = 0 WHERE qcm.id_test = ?";
        $update = connect_db()->prepare($sql);
        $update->execute(array($id_test));
        if($listQCM!=null){
            foreach($listQCM as $qcm){
                $sql = "UPDATE qcm SET qcm.bAutorise = 1 WHERE qcm.id_qcm = ?";
                $update = connect_db()->prepare($sql);
                $update->execute(array($qcm));
            }
        }
    }

    function _updateReponse($listRep,$id_test){
        $sql = "UPDATE reponse,qcm SET reponse.bAutorise = 0 WHERE reponse.id_quest = qcm.id_quest AND qcm.id_test = ? AND bValide = 0";
        $update = connect_db()->prepare($sql);
        $update->execute(array($id_test));
        if($listRep!=null){
            foreach($listRep as $rep){
                $sql = "UPDATE reponse SET bAutorise = 1 WHERE id_rep = ?";
                $update = connect_db()->prepare($sql);
                $update->execute(array($rep));
            }
        }
    }



    function _start_test($id_test){
        _close_corr($id_test);
        $sql = "UPDATE test SET test.bActif = 1 WHERE test.id_test = ?";
        $update = connect_db()->prepare($sql);
        $update->execute(array($id_test));
    }

    function _stop_test($id_test){
        $sql = "UPDATE test SET test.bActif = 0 AND test.bTermine = 1 WHERE test.id_test = ?";
        $update = connect_db()->prepare($sql);
        $update->execute(array($id_test));
    }

    function _open_corr($id_test){
        $sql = "UPDATE test SET test.bOpenCorr = 1 WHERE test.id_test = ?";
        $update = connect_db()->prepare($sql);
        $update->execute(array($id_test));
    }

    function _close_corr($id_test){
        $sql = "UPDATE test SET test.bOpenCorr = 0 WHERE test.id_test = ?";
        $update = connect_db()->prepare($sql);
        $update->execute(array($id_test));
    }

    function ajoutQuestion($id_theme, $titre_question, $texte_question){
        /*On ajoute la question dans la base de données */
        $add_question = connect_db()->prepare("INSERT INTO `question` (`id_theme`,`titre`,`texte`,`bmultiple`) VALUE (?,?,?,?);");
        $add_question->execute(array($id_theme, $titre_question, $texte_question, 0));
        /* On récupère l'ID de cette question et on le RETURN */
        $sql = connect_db()->prepare("SELECT * FROM question WHERE question.texte = ?;");
        $sql->execute(array($texte_question));
        return $sql->fetch();
    }

    function addQcm($id_test, $id_question){
        $add_qcm = connect_db()->prepare("INSERT INTO `qcm` (`id_test`,`id_quest`,`bAutorise`,`bBloque`, `bAnnule`) VALUE (?,?,?,?,?);");
        $add_qcm->execute(array($id_test, $id_question, 1, 0, 0));
    }

    function addReponses($reponseCorrect, $reponseFausse, $id_question){
        /* Ajout des bonnes réponses en premier */
        $number = count($reponseCorrect);
        if($number > 0) {  
            for($i=0; $i<$number; $i++) {
                $BonneReponse =  $reponseCorrect[$i];
                if(trim($reponseCorrect[$i] != '')) {
                    $add_qcm_bonne_reponse = connect_db()->prepare("INSERT INTO `reponse` (`id_quest`,`texte_rep`,`bvalide`) VALUE (?,?,?);");
                    $add_qcm_bonne_reponse->execute(array($id_question, $BonneReponse, 1));
                }
            }
        }

        /* Ajout des mauvaise réponse */
        $number2 = count($reponseFausse);
        if($number2 > 0) {  
            for($i=0; $i<$number2; $i++) {
                $MauvaiseReponse =  $reponseFausse[$i];
                if(trim($reponseFausse[$i] != '')) {
                    $add_qcm_reponse_autre = connect_db()->prepare("INSERT INTO `reponse` (`id_quest`,`texte_rep`,`bvalide`) VALUE (?,?,?);");
                    $add_qcm_reponse_autre->execute(array($id_question, $MauvaiseReponse, 0));
                }
            }
        }
    }

?>