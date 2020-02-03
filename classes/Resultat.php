<?php

    class Resultat {

        public static function getListRes($id_etu, $id_test, $id_quest) {
            $sql = "SELECT * FROM resultat WHERE id_etu = $id_etu AND id_test = $id_test AND id_quest = $id_quest;";
            $select = connect_db()->prepare($sql);
            $select->execute();
            return $select->fetchAll(PDO::FETCH_ASSOC);
        }

        public static function set($id_test, $id_etu, $id_quest, $id_rep) {

            // $sql = "SELECT count(*) as compteur FROM resultat WHERE id_etu = $id_etu AND id_quest = $id_quest AND id_rep = $id_rep;";
            // $select = connect_db()->prepare($sql);
            // $select->execute();
            // print_r(intval($select->fetch()['compteur']));
            // if(intval($select->fetch()['compteur']) <= 0) {
                $sql = "INSERT INTO resultat(id_test, id_etu, id_quest, date_res, id_rep) VALUES($id_test, $id_etu, $id_quest, NULL, $id_rep);";
                $select = connect_db()->prepare($sql);
                $select->execute();
        //}
            }

        public static function deletAll($id_etu, $id_test) {
            $sql = "SELECT * FROM resultat WHERE id_etu = $id_etu AND id_test = $id_test;";
            $select = connect_db()->prepare($sql);
            $select->execute();
            $liste = $select->fetchAll(PDO::FETCH_ASSOC);


            foreach($liste as $resultat) {
                $tmp = $resultat['id_res'];
                $sql = "DELETE FROM resultat WHERE id_res = $tmp;";
                $select = connect_db()->prepare($sql);
                $select->execute();
            }
        }

        
    }
?>