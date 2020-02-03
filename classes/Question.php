<?php

    class Question {

        private $_id_quest;
        private $_id_theme;
        private $_titre;
        private $_texte;
        private $_bmultiple;
        private $_nb_reponses;

        function __construct($ce_que_renvoie_la_requete_sql) {
            $data = $ce_que_renvoie_la_requete_sql;
            $this->_id_quest = $data['id_quest'];
            $this->_id_theme = $data['id_theme'];
            $this->_titre = $data['titre'];
            $this->_texte = $data['texte'];
            $this->_bmultiple = $data['bmultiple'];
            $this->_set_nb_reponses();
        }

        public function _get_id_quest() {
            return $this->_id_quest;
        }
        public function _get_id_theme() {
            return $this->_id_theme;
        }
        public function _get_titre() {
            return $this->_titre;
        }
        public function _get_texte() {
            return $this->_texte;
        }
        public function _get_bmultiple() {
            return $this->_bmultiple;
        }

        private function _set_nb_reponses() {
            $sql = "SELECT COUNT(id_rep) FROM reponse WHERE reponse.id_quest = $this->_id_quest;";
            $select = connect_db()->prepare($sql);
            $select->execute();
            $this->_nb_reponses = $select->fetch();
            $select->closeCursor();
        }

        public function _get_liste_reponses() {

            $liste_reponse = array();
            $sql = "SELECT * FROM reponse WHERE reponse.id_quest = $this->_id_quest;";
            $select = connect_db()->prepare($sql);
            $select->execute();
            for($i = 0; $data = $select->fetch(); $i++) {
                $liste_reponse[$i] = new Reponse($data);
            }
            $select->closeCursor();
            return $liste_reponse;
        }

        public static function getListeReponses($id_quest) {

            $liste_reponse = array();
            $sql = "SELECT * FROM reponse WHERE reponse.id_quest = $id_quest;";
            $select = connect_db()->prepare($sql);
            $select->execute();
            return $select->fetchAll();
        }

        public static function getBareme($id_quest, $bareme_test) {
            $sql = "SELECT count(*) FROM reponse WHERE reponse.id_quest = $id_quest AND bValide = true;";
            $select = connect_db()->prepare($sql);
            return $bareme_test / $select->execute();
        }

        /* On construit le string complet de l'objet sans les id's ni les attributs booléens
        qui pourront être appelés grâce aux méthodes _get_X() pour initialisation des checkboxs.
        On pourrait facilement en faire des templates qu'on appel ici pour que le code soit plus propre.
        */
        function __toString() {
            
            print_r($this->_titre . ' ' . $this->_texte . ' ');
            print_r('<br>');
            foreach($this->_get_liste_reponses() as $reponse) {
                print_r($reponse->__toString());
                print_r('<br>');
            }
        }

        
    }
?>