<?php
if (!isset($hideNav)) {
    include_once("includes/navBar.php");
}
require_once("includes/config.php");
require_once("includes/classes/episode.php");

$sid = isset($_GET['sid']) ? $_GET['sid'] : null;
$cid = isset($_GET['cid']) ? $_GET['cid'] : null;

if ($sid !== null && filter_var($sid, FILTER_VALIDATE_INT)) {
    // Use $sid to fetch episode details from the database
    $query = $con->prepare("SELECT * FROM episodes WHERE season = :sid");
    $query->bindParam(':sid', $sid);
    $query->execute();
    $episode = $query->fetch(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>classic</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Black+Ops+One&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="classic.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
</head>

<body style="background-color: black;">

    <div class="bgimg">
        <div class="py-2 h1sea">
            <h1 class="display-5 fw-bold">BEN 10 CLASSIC</h1>
        </div>
        <section class="btnsea">
            <div class="dropdown ">
                <button class="btn btn-primary btn-lg dropdown-toggle" type="button" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    season <?php echo $sid; ?>
                </button>
                <ul class="dropdown-menu dropdown-menu-dark">
    <li><a class="dropdown-item" href="classic.php?sid=1&cid=<?php echo $cid; ?>" style="text-decoration: none;">season 1</a></li>
    <li><a class="dropdown-item" href="classic.php?sid=2&cid=<?php echo $cid; ?>" style="text-decoration: none;">season 2</a></li>
    <li><a class="dropdown-item" href="classic.php?sid=3&cid=<?php echo $cid; ?>" style="text-decoration: none;">season 3</a></li>
    <li><a class="dropdown-item" href="classic.php?sid=4&cid=<?php echo $cid; ?>" style="text-decoration: none;">season 4</a></li>
</ul>

            </div>
        </section>

        <div class="para1">
            <p class="fw-bold">Ben, a ten-year-old, discovers the Omnitrix after a meteor crash, granting him the power
                to
                transform into ten heroes. With cousin Gwen and secretive grandpa Max, they face galactic threats,
                battling
                Vilgax and outsmarting Dr. Animo. Ben learns crucial lessons about responsibility and teamwork in a
                vibrant
                rollercoaster of a first season, etching a young hero's journey into our hearts.</p>
            <span class="text-decoration-underline">IMDB 7.5</span>
            <span class="text-decoration-underline">2005</span>
            <span class="text-decoration-underline">13 episodes</span>
        </div>
        <a href="video.php?id=1&sid=<?php echo $sid; ?>" style="text-decoration: none; color:inherit;"> <button type="button"
                class="btn btn-lg btn-success playbtn">
                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor"
                    class="bi bi-play-circle-fill" viewBox="0 0 16 16">
                    <path
                        d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M6.79 5.093A.5.5 0 0 0 6 5.5v5a.5.5 0 0 0 .79.407l3.5-2.5a.5.5 0 0 0 0-.814z" />
                </svg>PLAY</button></a>
    </div>

    <!-- episode content -->
    <div class="epi text-decoration-underline">
        <h3>Episodes</h3>
    </div>
    <?php 
    $episodeObj = new Episode($con);
    echo $episodeObj->displayEpisodes($sid, $cid);
    ?>
  
    <div class="d-flex justify-content-center py-2">

        <span><img src="./logo.png" alt=""></span>

    </div>
    <div class="d-flex gap-5 justify-content-center py-5">

        <span class=" text-light">Terms and Privacy Notice</span>
        <span class=" text-light">Help</span>
        <span class=" text-light">Send us feedback</span>
        <span class=" text-light">© 2023 Company, Inc</span>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous">
    </script>
      <script src="./script.js"></script>
</body>

</html>

<?php
    exit(); // Stop execution after displaying content
}

// If $sid parameter is not found or invalid, display an error message
echo "Invalid or missing 'sid' parameter."; // You can change this message as per your requirement
?>