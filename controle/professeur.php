<?php
    function accueil(){
        require ("./modele/request_prof.php") ;
        $list_des_tests = getListTest();
        require ("./vue/professeur/panel-professeur.tpl");
    }

    function disconnect(){
        require ("./modele/disconnect.php") ;
    }

    function newSession(){
        require ("./modele/request_prof.php") ;
        $list_groupes = getListGroupe();
        require ("./vue/professeur/add-session.tpl");
    }

    function addSession(){
        if((isset($_POST['titreTest'])&&$_POST['titreTest']!=null)&&(isset($_POST['groupe'])&&$_POST['groupe']!=null)){
            require ("./modele/request_prof.php");
            addTest(htmlspecialchars($_POST['titreTest']),htmlspecialchars($_POST['groupe']));
            $url = "index.php?controle=professeur&action=accueil";
            header ("Location:" .$url) ;
        }
        else{
            $url = "index.php?controle=professeur&action=newSession&error=1";
            header ("Location:" .$url) ;
        }
    }

    function startSession(){
        require ("./modele/request_prof.php");
        $_SESSION['id_test'] = $_POST['test'];
        $test = getTest(htmlspecialchars($_POST['test']));
        require ("./vue/professeur/panel-test.tpl");
    }

    function FormAddQuestion(){
        require ("./modele/request_prof.php") ;
        $list_des_themes = _get_List_Theme();
        $id_test = $_POST['id_test'];
        require ("./vue/professeur/afficher.tpl");
    }

    function addQuestion(){
        require ("./modele/request_prof.php");

        $theme = $_POST['theme'];
        $titre_question = $_POST['titre_question'];
        $text_question = $_POST['texte_question'];
        $id_test = $_POST['id_test'];
        $reponseCorrect = $_POST["reponseCorrect"];
        $reponseFausse = $_POST["reponseFausse"];
        

        $id_question = ajoutQuestion($theme, $titre_question, $text_question)['id_quest'];
        addQcm($id_test, $id_question);
        addReponses($reponseCorrect, $reponseFausse, $id_question);

        require ("./vue/professeur/addSuccess.tpl");
	}

    function students(){
        if(isset($_POST['groupe'])&&$_POST['groupe']!=null){
            require ("./modele/request_prof.php");
            $students = _get_students($_POST['groupe']);
            $id_test = $_POST['id_test'];
            require ("./vue/professeur/eleves-connecter.tpl");
        }
        else{
            $url = "index.php?controle=professeur&action=accueil";
            header ("Location:" .$url) ;
        }
    }

    function notes(){
        if((isset($_POST['id_test']) & $_POST['id_test']!=null)){
            require ("./modele/request_prof.php");
            $id_test = $_POST['id_test'];
            $liste_etudiant_test = _get_students_test($id_test);
            $moyenne = _get_moyenne($id_test);
            require ("./vue/professeur/notes.tpl");
        }
    }

    function resutlatsDetail(){
        require ("./modele/request_prof.php");
        $id_etudiant = $_GET['Id_Etudiant'];
        $id_test = $_GET['id_test'];
        $test = getTest(htmlspecialchars($_GET['id_test']));
        $LesResultats = _get_students_resultats($id_etudiant, $id_test);
        require ("./vue/professeur/resultatEtudiant.tpl");
    }

    function startSessionAfter($testRecupe){
        $test = getTest(htmlspecialchars($testRecupe));
        require ("./vue/professeur/panel-test.tpl");
    }

    function stopSession($testRecupe){
        $test = getTest(htmlspecialchars($testRecupe));
        require ("./vue/professeur/panel-test.tpl");
    }

  

    function refreshQuest(){
        require ("./modele/request_prof.php");
        $lsQCM = isset($_POST['ListQCM'])?$_POST['ListQCM']:null;
        $lsRep = isset($_POST['ListRep'])?$_POST['ListRep']:null;
        _updateReponse($lsRep,$_POST['id_test']);
        _updateQCM($lsQCM,$_POST['id_test']);
        startSessionAfter($_GET['test']);
    }

    function startTest(){
        if(isset($_POST['id_test'])){
            require ("./modele/request_prof.php");
            _start_test($_POST['id_test']);
        }
        startSessionAfter($_GET['test']);
    }

    function stopTest() {
        if(isset($_POST['id_test'])){
            require ("./modele/request_prof.php");
            _stop_test($_POST['id_test']);
        }
        stopSession($_GET['test']);
    }

    function openCorr() {
        if(isset($_POST['id_test'])){
            require ("./modele/request_prof.php");
            _open_corr($_POST['id_test']);
        }
        startSessionAfter($_GET['test']);
    }

    function closeCorr() {
        if(isset($_POST['id_test'])){
            require ("./modele/request_prof.php");
            _close_corr($_POST['id_test']);
        }
        startSessionAfter($_GET['test']);
    }
?>

