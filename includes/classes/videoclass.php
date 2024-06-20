<?php

class Videocontainer {
    private $con;

    public function __construct($con) {
        $this->con = $con;
    }

    public function displayVideos($sid, $cid) {
        if ($this->con) {
            $query = $this->con->prepare("SELECT * FROM videos WHERE season = :sid AND category_id = :cid");
            $query->bindParam(':sid', $sid);
            $query->bindParam(':cid', $cid);
            $query->execute();

            $html = "";

            while($row = $query->fetch(PDO::FETCH_ASSOC)) {
                $html .= $this->getVideoHtml($row, $sid, $cid);
            }

            return $html;
        } else {
            return "Database connection not available.";
        }
    }

    private function getVideoHtml($sqlData, $sid, $cid) {
        $videolink = $sqlData['videolink'];
        $imagePath = $sqlData['image_path'];
        $episodeName = $sqlData['episode_name'];
        $id = $sqlData['id'];
    
        $html = '<a href="video.php?id=' . $id . '&sid=' . $sid . '&cid=' . $cid . '" style="text-decoration: none;">';
       
        $html .= '<button class="select-video active">';
        $html .= '<img src="' . $imagePath . '" alt="">';
        $html .= '<h5>' . $episodeName . '</h5>';
        $html .= '</button></a>';
    
        return $html;
    }
    
}

?>
