<?php
    require ('connect.php');
    set_connected($_SESSION['isProf'],false,$_SESSION['id']);
    session_destroy();
    $url = "./index.php";
    header ("Location:" .$url) ;
?>