<?php
    // fichier php permettant de faire le lien entre les tpls etudiants (en génerant les variables dont ils ont besoin)
    // avec le fichier de requettes etudiant.


    function accueil(){
        require ("./modele/request_etu.php") ;
        $list_des_tests = getListTest();
        $list_des_tests_corr = getListTestCorr();
        require ("./vue/etudiant/panel-etudiant.tpl");
    }


    function startSession(){
        require ("./modele/request_etu.php");
        $test = getTest($_POST['test']);
        $_SESSION['id_test'] = $_POST['test'];
        $liste_quest_autorize = getListQuestAutorise($test['id_test']);
        $liste_res = getListResultPre($_SESSION['id'], $test['id_test']);
        require ("./vue/etudiant/panel-test.tpl");
    }

    function startCorrection(){
        require ("./modele/request_etu.php");
        $test = getTest($_POST['test_corr']);
        $_SESSION['id_test'] = $_POST['test_corr'];
        $liste_quest = getListQuestAutorise($test['id_test']);
        $liste_res = getListResultPre($_SESSION['id'], $test['id_test']);
        $note = getNote($_SESSION['id'], $_SESSION['id_test']);
        require ("./vue/etudiant/panel-correction.tpl");
    }

    function submit() {
        require ("./modele/request_etu.php");
        deletNote($_SESSION['id'], $_SESSION['id_test']);

        foreach($_POST['choix'] as $cle => $valeur){
            $tmp_valeur = $valeur;
            $tab = explode(" ", $valeur);
            Resultat::set($_SESSION['id_test'], $_SESSION['id'], $tab[0], $tab[1]);
        }

        setNote($_SESSION['id'], $_SESSION['id_test']);
        
        $list_des_tests = getListTest();
        require ("./vue/etudiant/panel-etudiant.tpl");
        
    }

    function deletNote($id_etu, $id_test) {
        Note::delet($id_etu, $id_test);
    }

    /* Méthode à appeler lors du submit d'un test par un etudiant */
    function setNote($id_etu, $id_test) {

        

        $note_test = 0;
        $pts_positifs = 0;
        $pts_negatifs = 0;
        $bareme_test = Test::getBareme($id_test);

        $liste_quest = Test::getListQuestAutorise($id_test);
        
        foreach($liste_quest as $question) {
            $note_qcm = 0;
            $bareme_question = Question::getBareme($question['id_quest'], $bareme_test);
            $list_rep = Resultat::getListRes($id_etu, $id_test, $question['id_quest']);

            
            foreach($list_rep as $reponse) {
                if(Reponse::bValide($reponse['id_rep'])== 1) {
                    $note_qcm += $bareme_question;
                    $pts_positifs++;
                }
                else {
                    $note_qcm -= $bareme_question / 2;
                    $pts_negatifs++;
                }

            }
            
            $note_test += $note_qcm;

        }
        // print_r(
        //     'note test :' . $note_test . 
        //     ' pts positifs : ' . $pts_positifs . 
        //     ' pts negatifs : ' . $pts_negatifs . 
        //     ' bareme test : ' . $bareme_test);
        Note::set($id_etu, $id_test, $note_test, ($pts_positifs - $pts_negatifs));
        //require('./vue/etudiant/testbenji.tpl');
    }

    function disconnect(){
        require ("./modele/disconnect.php") ;
    }
?>