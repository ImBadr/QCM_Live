<?php
  

    class Qcm {

        private $_id_qcm;
        private $_id_test;
        private $_id_quest;
        private $_bAutorise;
        private $_bBloque;
        private $_bAnnule;

        function __construct($ce_que_renvoie_la_requete_sql) {
            $data = $ce_que_renvoie_la_requete_sql;
            $this->_id_qcm = $data['id_qcm'];
            $this->_id_test = $data['id_test'];
            $this->_id_quest = $data['id_quest'];
            $this->_bAutorise = $data['bAutorise'];
            $this->_bBloque = $data['bBloque'];
            $this->_bAnnule = $data['bAnnule'];
        }

        public function _get_autorise(){
            return $this->_bAutorise;
        }

        public function _get_id_qcm(){
            return $this->_id_qcm;
        }

        function _get_question() : Question {

            $question;
            $sql = "SELECT * FROM question WHERE question.id_quest = $this->_id_quest;";
            $select = connect_db()->prepare($sql);
            $select->execute();
            $question = new Question($select->fetch());
            $select->closeCursor();
            return $question;
        }

        public static function getListQuestAutorise($id_test) {
            $sql = "SELECT * FROM question WHERE id_quest IN (SELECT id_quest FROM qcm WHERE id_test = $id_test AND bAutorise = 1)";
            $select = connect_db()->prepare($sql);
            $select->execute();
            return $select->fetchAll(PDO::FETCH_ASSOC);
        }

        function __toString() {
            $question = $this->_get_question()->__toString();
            return (string)($question);
        }
    }
?>