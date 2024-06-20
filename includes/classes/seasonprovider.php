<?php

class Videocontainer {
    private $con;

    public function __construct($con) {
        $this->con = $con;
    }

    public function displayseason() {
        if ($this->con) {
            $query = $this->con->prepare("SELECT * FROM episode");
            $query->execute();

            $html = "";

            while($row = $query->fetch(PDO::FETCH_ASSOC)) {
                $html .= $this->getdisplayseason($row);
            }

            return $html;
        } else {
            return "Database connection not available.";
        }
    }


}
    ?>