<?php
if(!isset($hideNav)) {
    include_once("includes/navBar.php");
}
require_once("includes/config.php");
require_once("includes/classes/videoclass.php");

// Retrieve the id parameter from the URL
$id = isset($_GET['id']) ? $_GET['id'] : null;
$sid = isset($_GET['sid']) ? $_GET['sid'] : null;
$cid = isset($_GET['cid']) ? $_GET['cid'] : null;

// Check if id is set and is a valid integer
if ($id !== null && filter_var($id, FILTER_VALIDATE_INT)) {
    // Use $id to fetch video details from the database
    $query = $con->prepare("SELECT * FROM videos WHERE id = :id");
    $query->bindParam(':id', $id);
    $query->execute();
    $video = $query->fetch(PDO::FETCH_ASSOC);
    
    // Check if video exists
    if ($video) {
        // Video details
        $videolink = $video['videolink'];
        $episodeName = $video['episode_name'];

        // Output video player with fetched details
        ?>
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Video Playlist</title>
            <!-- Style CSS -->
            <link rel="stylesheet" href="video.css">
        </head>
        <body>
            <div class="main">
                <div class="video-container">
                    <div class="video-playlist-1">
                        <iframe width="640" height="360" src="<?php echo $videolink; ?>" frameborder="0" scrolling="0" allowfullscreen></iframe>
                        <h2 style="padding-top: 20px;"><?php echo $episodeName; ?></h2>
                    </div>
                </div>

                <div class="playlist-selector">
                    <h4 style="text-align: center;">EPISODES</h4>
                    <?php
                    // Display video playlist
                    $Videocontainer = new Videocontainer($con);
                    echo $Videocontainer->displayVideos($sid, $cid); // Pass $cid along with $sid
                    ?>
                </div>
            </div>
            <script src="./script.js"></script>
        </body>
  
        </html>
        <?php
        exit(); // Stop execution since video is found and displayed
    }
}

// If id parameter is not found or invalid, or video doesn't exist, display a message or redirect as needed
echo "Video not found."; // You can change this message as per your requirement
?>
