<?php
class CategoryContainers {

    private $con;

    public function __construct($con) {
        $this->con = $con;
    }

    public function showCategories() {
        $query = $this->con->prepare("SELECT * FROM categories" );
        $query->execute();

        $html = "";

        while($row = $query->fetch(PDO::FETCH_ASSOC)) {
            $html .= $this->getCategoryHtml($row);
        }

        return $html;
    }

    private function getCategoryHtml($sqlData) {
        $name = $sqlData["name"];
        $description = $sqlData["description"];
        $image_path = $sqlData["image_path"];
        $link = $sqlData["link"];
        $cid = $sqlData["id"];

        $html = "<div class='cardoo'>
                    <img src='$image_path' alt='$name'>
                    <div class='info'>
                        <h1>$name</h1>
                        <p>$description</p>
                        <a href='$link?sid=1&cid=$cid'><button>WATCH NOW</button></a>
                    </div>
                </div>";

        return $html;
    }
}
?>
