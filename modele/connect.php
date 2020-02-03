<?php
    require_once('data_base.php');
    
    function set_connected($isProf,$isConnected,$id){
        $sql='';
        if($isProf){
            $sql='UPDATE professeur SET bConnect = ? WHERE id_prof = ?';
        }
        else{
            $sql='UPDATE etudiant SET bConnect = ? WHERE id_etu = ?';
        }
        $update = connect_db()->prepare($sql);
        $update->execute(array($isConnected==true?1:0,$id));
    }


    function isProfesseur($login,$pass){
        $select = connect_db()->prepare('SELECT id_prof,nom,prenom FROM professeur WHERE login_prof=? AND pass_prof=?');
        $select->execute(array($login,md5($pass)));
        $row=$select->fetch(PDO::FETCH_NUM);
        if(!$row) return false;
        else{
            $_SESSION['id']=$row[0];
            $_SESSION['nom']=$row[1];
            $_SESSION['prenom']=$row[2];
            $_SESSION['isProf']=true;
            set_connected(true,true,$row[0]);
            return true;
        }
    }

    function isEtudiant($login,$pass){
        $select = connect_db()->prepare('SELECT id_etu,nom,prenom,num_grpe FROM etudiant WHERE login_etu=? AND pass_etu=?');
        $select->execute(array($login,md5($pass)));
        $row=$select->fetch(PDO::FETCH_NUM);
        if(!$row) return false;
        else{  
            $_SESSION['id']=$row[0];
            $_SESSION['nom']=$row[1];
            $_SESSION['prenom']=$row[2];
            $_SESSION['groupe']=$row[3];
            $_SESSION['isProf']=false;
            set_connected(false,true,$row[0]);
            return true;
        }
    }
?>