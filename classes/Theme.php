<?php
  

    class Theme {

        private $_id_theme;
        private $_titre_theme;
        private $_desc_theme;

        function __construct($ce_que_renvoie_la_requete_sql) {
            $data = $ce_que_renvoie_la_requete_sql;
            $this->_id_theme = $data['id_theme'];
            $this->_titre_theme = $data['titre_theme'];
            $this->_desc_theme = $data['desc_theme'];
        }

        function _get_id_theme(){
            return $this->_id_theme;
        }
        function _get_titre_theme(){
            return $this->_titre_theme;
        }
        function _get_desc_theme(){
            return $this->_desc_theme;
        }

        public function _get_List_Theme() {
            $liste_theme = array();
            $sql = "SELECT * FROM theme ;";
            $select = connect_db()->prepare($sql);
            $select->execute();
            for($i = 0; $data = $select->fetch(); $i++) {
                $liste_theme[$i] = new Reponse($data);
            }
            $select->closeCursor();
            return $liste_theme;
        }

    }
?>