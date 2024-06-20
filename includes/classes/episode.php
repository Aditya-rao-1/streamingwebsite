<?php

class Episode {
    private $con, $username;

    public function __construct($con) {
        $this->con = $con;
    }

    public function displayEpisodes($sid, $cid) {
        $query = $this->con->prepare("SELECT * FROM episodes WHERE season = :sid and category_id = :cid");
        $query->bindParam(':sid', $sid);
        $query->bindParam(':cid', $cid);
        $query->execute();
    
        $html = "";
    
        while ($row = $query->fetch(PDO::FETCH_ASSOC)) {
            $html .= $this->getEpisodeHtml($row, $sid, $cid);
        }
    
        return $html;
    }
    
    private function getEpisodeHtml($sqlData, $sid, $cid) {
        $imagePath = $sqlData['image_path'];
        $episodeName = $sqlData['episode_name'];
        $releaseDate = $sqlData['release_date'];
        $description = $sqlData['description'];
        $id = $sqlData['id'];

        $html = '<div class="d-flex flex-row ms-5 me-5 mt-5 border border-secondary eps">';
        $html .= '<div class="ep1img">';
        $html .= '<a href="video.php?id=' . $id . '&sid=' . $sid . '&cid=' . $cid . '">';
        $html .= '<img src="' . $imagePath . '" alt="' . $episodeName . '">';

        $html .= '<div class="epbut"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
                    fill="currentColor" class="bi bi-play-circle-fill" viewBox="0 0 16 16">
                    <path id="oval-1"
                        d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M6.79 5.093A.5.5 0 0 0 6 5.5v5a.5.5 0 0 0 .79.407l3.5-2.5a.5.5 0 0 0 0-.814z" />
                </svg></div>';
        $html .= '</a>';
        $html .= '</div>';

        $html .= '<div class="ep1text ms-4 pt-3 textcol">';
        $html .= '<h3>' . $episodeName . '</h3>';
        $html .= '<p>' . $releaseDate . '</p>';
        $html .= '<p>' . $description . '</p>';
        $html .= '</div>';
        $html .= '</div>';

        return $html;
    }
}

?>