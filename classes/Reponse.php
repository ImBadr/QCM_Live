<?php

    class Reponse {

        private $_id_rep;
        private $_id_quest;
        private $_text_rep;
        private $_bValide;
        private $_bAutorise;

        function __construct($ce_que_renvoie_la_requete_sql) {
            $data = $ce_que_renvoie_la_requete_sql;
            $this->_id_rep = $data['id_rep'];
            $this->_id_quest = $data['id_quest'];
            $this->_texte_rep = $data['texte_rep'];
            $this->_bValide = $data['bvalide'];
            $this->_bAutorise = $data['bAutorise'];
        }

        public static function bValide($id_rep) {
            $sql = "SELECT bvalide FROM reponse WHERE id_rep = $id_rep;";
            $select = connect_db()->prepare($sql);
            $select->execute();
            return $select->fetch()['bvalide'];
        }

        function _get_valid() {
            return $this->_bValide;
        }
        function _get_id_rep() {
            return $this->_id_rep;
        }
        function _get_autorise(){
            return $this->_bAutorise;
        }
        
        /* On construit le string complet de l'objet sans les id's ni les attributs booléens
        qui pourront être appelés grâce aux méthodes _get_X() pour initialisation des checkboxs.
        */
        function __toString() {
            return (string)((string) $this->_texte_rep);
        }






    }
?>