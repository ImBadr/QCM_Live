<?php
  

    class Note {

        public static function set($id_etu, $id_test, $note_test, $note2_test) {
            $sql = "SELECT count(*) FROM note WHERE id_etu = $id_etu AND id_test = $id_test;";
            $select = connect_db()->prepare($sql);
            $select->execute();
            if($select->fetch()['count(*)'] == 0) {
                $sql = "INSERT INTO Note(id_etu, id_test, note, note2) Value($id_etu, $id_test, $note_test, $note2_test);";
                $select = connect_db()->prepare($sql);
                $select->execute();
            }
            //else message d'erreur
        }

        public static function delet($id_etu, $id_test) {
            Resultat::deletAll($id_etu, $id_test);
        }

    }
?>