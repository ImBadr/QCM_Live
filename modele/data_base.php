<?php 
    function connect_db()
    {
        $servername = "localhost";
        $username = "root";
        $password = "";
        try {
            $db = new PDO("mysql:host=$servername; dbname=qcm_live", $username, $password);
            $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }
    
        catch(PDOException $e) {
            echo "Connection échouée: " . $e->getMessage();
            die();
        }
        return $db;
    }
?>