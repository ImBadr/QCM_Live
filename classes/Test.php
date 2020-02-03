<?php
  

    class Test {

        private $_id_test;
        private $_id_prof;
        private $_num_grpe;
        private $_titre_test;
        private $_date_test;
        private $_bActif;
        private $_nb_qcm;

        function __construct($ce_que_renvoie_la_requete_sql) {
            $data = $ce_que_renvoie_la_requete_sql;
            $this->_id_test = $data['id_test'];
            $this->_id_prof = $data['id_prof'];
            $this->_num_grpe = $data['num_grpe'];
            $this->_titre_test = $data['titre_test'];
            $this->_date_test = $data['date_test'];
            $this->_bActif = $data['bActif'];
            $this->_bOpenCore = $data['bOpenCorr'];
            $this->_set_nb_qcm();
        }

        public static function getListQuestAutorise($id_test) {
            return Qcm::getListQuestAutorise($id_test);
        }

        public static function getBareme($id_test) {
            $table = Qcm::getListQuestAutorise($id_test);
            return 20 / count($table);
        }

        public static function Test_getTest($id_test) {
            $sql = "SELECT * FROM test WHERE test.id_test = $id_test;";
            $select = connect_db()->prepare($sql);
            return $select->fetchAll();
        }

        /* On ne set pas la liste de qcm, on utilise cette fonction pour en avoir le nombre sans l'instancier */
        private function _set_nb_qcm() {
            $sql = "SELECT COUNT(id_qcm) FROM qcm WHERE qcm.id_test = $this->_id_test;";
            $select = connect_db()->prepare($sql);
            $select->execute();
            $this->_nb_qcm = $select->fetch();
            $select->closeCursor();
        }

        public function _get_id_test() {
            return $this->_id_test;
        }
        
        public function _get_titre_test() {
            return $this->_titre_test;
        }
        public function _get_date_test() {
            return $this->_date_test;
        }
        public function _get_num_grpe() {
            return $this->_num_grpe;
        }
        public function _get_liste_qcm() {
            $liste_qcm = array();
            $sql = "SELECT * FROM qcm WHERE qcm.id_test = $this->_id_test;";
            $select = connect_db()->prepare($sql);
            $select->execute();
            for($i = 0; $data = $select->fetch(); $i++) {
                $liste_qcm[$i] = new Qcm($data);
            }
            $select->closeCursor();
            return $liste_qcm;
        }
        public function _get_bActif(){
            return $this->_bActif;
        }

        public static function GET_B_OPEN_CORR($id_test) {
            $sql = "SELECT bOpenCorr as essai FROM test WHERE id_test = $id_test;";
            $select = connect_db()->prepare($sql);
            $select->execute();
            return $select->fetch(PDO::FETCH_ASSOC);
        }

        public static function getListeQcm($id_test) {
            $liste_qcm = array();
            $sql = "SELECT * FROM reponse WHERE reponse.id_quest = $id_test;";
            $select = connect_db()->prepare($sql);
            $select->execute();
            for($i = 0; $data = $select->fetch(); $i++) {
                $liste_qcm[$i] = new Qcm($data);
                
            }
            $select->closeCursor();
            return $liste_qcm;
        }



        /* On construit le string complet de l'objet sans les id's ni les attributs booléens
        qui pourront être appelés grâce aux méthodes _get_X() pour initialisation des checkboxs.
        On pourrait facilement en faire des templates qu'on appel ici pour que le code soit plus propre.
        */
        function __toString() {
            
            
            echo "<pre>";
                print_r($this->_titre_test . ' ' . $this->_date_test . ' ' . $this->_num_grpe);
                print_r('<br>');
                foreach($this->_get_liste_qcm() as $qcm) {
                    print_r($qcm->__toString());
                    print_r('<br>');
                }
            echo "<pre>";
        }
    }
?>