<?php 
    require ("data_base.php");

    function getListTest() {
        $sql="SELECT id_test,titre_test,date_test FROM test WHERE num_grpe = ? AND bActif = 1;";
        $select = connect_db()->prepare($sql);
        $select->execute(array($_SESSION['groupe']));
        return $select->fetchAll();
    }
    function getListTestCorr() {
        $sql="SELECT id_test,titre_test,date_test FROM test WHERE num_grpe = ? AND bOpenCorr = 1;";
        $select = connect_db()->prepare($sql);
        $select->execute(array($_SESSION['groupe']));
        return $select->fetchAll();
    }

    function getTest($id_test) {
        $sql = "SELECT * FROM test WHERE test.id_test = $id_test;";
        $select = connect_db()->prepare($sql);
        $select->execute();
        return $select->fetch(PDO::FETCH_ASSOC);
    }

    function getNote($id_etu, $id_test) {
        $sql = "SELECT * FROM note WHERE id_etu = $id_etu AND id_test = $id_test;";
        $select = connect_db()->prepare($sql);
        $select->execute();
        return $select->fetch(PDO::FETCH_ASSOC);
    }
    
    function getListQuestAutorise($id_test) {
        $list_quest = array();
        $sql = "SELECT * FROM question WHERE id_quest IN (SELECT id_quest FROM qcm WHERE id_test = $id_test AND bAutorise = 1)";
        $select = connect_db()->prepare($sql);
        $select->execute();
        return $select->fetchAll(PDO::FETCH_ASSOC);
    }
   
    function getListeReponses($id_quest) {

        $liste_reponse = array();
        $sql = "SELECT * FROM reponse WHERE reponse.id_quest = $id_quest;";
        $select = connect_db()->prepare($sql);
        $select->execute();
        return $select->fetchAll(PDO::FETCH_ASSOC);
    }

    function getListeReponsesAutorise($id_quest) {

        $liste_reponse = array();
        $sql = "SELECT * FROM reponse WHERE reponse.id_quest = $id_quest AND bAutorise = 1;";
        $select = connect_db()->prepare($sql);
        $select->execute();
        return $select->fetchAll(PDO::FETCH_ASSOC);
    }

    function setResultat($id_test, $id_etu, $id_quest, $id_rep) {
            $sql = "INSERT INTO resultat(id_test, id_etu, id_quest, date_res, id_rep) VALUES($id_test, $id_etu, $id_quest, NULL, $id_rep);";
            $select = connect_db()->prepare($sql);
            $select->execute();
        }

    function getListResultPre($id_etu, $id_test) {
        $liste_reponse = array();
        $sql = "SELECT * FROM resultat WHERE id_etu = $id_etu AND id_test = $id_test;";
        $select = connect_db()->prepare($sql);
        $select->execute();
        return $select->fetchAll(PDO::FETCH_ASSOC);
    }

?>

