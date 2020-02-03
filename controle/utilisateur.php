<?php 

function ident() {
	$login=  isset($_POST['login'])?htmlspecialchars($_POST['login']):'';
	$pass=  isset($_POST['pass'])?htmlspecialchars($_POST['pass']):'';
	


	if  (count($_POST)==0){
		$error = false;
		require ("./vue/ident.tpl") ;
	}
	else {
		if(isProf($login,$pass)){
			$url = "index.php?controle=professeur&action=accueil";
			header ("Location:" .$url) ;
		}
		else if(isEtu($login,$pass)){
			$url = "index.php?controle=etudiant&action=accueil";
			header ("Location:" .$url) ;
		}
		else { 
			$_SESSION['id'] ='';
			$_SESSION['nom'] ='';
			$_SESSION['prenom'] ='';
			$error = true;
            require ("./vue/ident.tpl") ;
		}
	}	
}

function isProf($login,$pass) {
	include_once('./modele/connect.php');
	return isProfesseur($login,$pass);
}

function isEtu($login,$pass){
	include_once('./modele/connect.php');
	return isEtudiant($login,$pass);
}


?>
