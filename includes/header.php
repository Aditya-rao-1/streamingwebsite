<?php
require_once("includes/config.php");

require_once("includes/classes/CategoryContainers.php");
require_once("includes/classes/User.php");
require_once("includes/classes/ErrorMessage.php");


if(!isset($_SESSION["userLoggedIn"])) {
    header("Location: register.php");
}

$userLoggedIn = $_SESSION["userLoggedIn"];
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BenflixHub</title>
    <link rel="stylesheet" href="index.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Rowdies:wght@700&display=swap" rel="stylesheet">
</head>
<?php
if(!isset($hideNav)) {
    include_once("includes/navBar.php");
}
?>

<body style="background-color:  #100e17;">

    <div id="carouselExampleInterval" class="carousel slide " data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active" data-bs-interval="5000">
                <img src="./ca.png" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item" data-bs-interval="5000">
                <img src="./u.png" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item" data-bs-interval="5000">
                <img src="./ui.png" class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval"
            data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval"
            data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <div class="imghold"
        style="background: #000000;  background: -webkit-linear-gradient(to left, #0f9b0f, #000000);  background: linear-gradient(to left, #0f9b0f, #000000);">
        <div class="sd"></div>
        <div class="img2">

            <div class="text">
                <p class="p1">welcome to <span class="fancy">ben 10 </span> </p>
                <span class="fancy"> series collection</span>
            </div>
            <div class="sp">Enjoy exciting journey through episodes, characters, and exclusive content <p>- your
                    ultimate destination for all things Ben 10!</p>
                <button type="button" class="btn btn-danger btn-lg butn">WATCH NOW </button>
            </div>
        </div>
    </div>
    <div class="custom-body">
        <div>

        </div>
        <div class="gridx">
            <div class="column">
                <img src="./imgs/fire.jpg" alt="">
                <img src="./imgs/ghostfreak.jpg" alt="">
                <img src="./imgs/diamondhead.jpg" alt="">
                <img src="./imgs/s.png" alt="">

            </div>
            <div class="column">
                <img src="./imgs/pxfuel.jpg" alt="">
                <img src="./imgs/df.jpg" alt="">
                <img src="./imgs/pxfuel (1).jpg" alt="">
                <img src="./imgs/a1.jpg" alt="">
                <img src="./imgs/a5.jpg" alt="">
                <img src="./imgs/a3.jpg" alt="">

                <img src="./imgs/a7.jpg" alt="">
            </div>
            <div class="column">
                <img src="./imgs/diamondhead.jpg" alt="">
                <img src="./imgs/a2.jpg" alt="">

                <img src="./imgs/a5.jpg" alt="">
                <img src="./imgs/fire.jpg" alt="">
                <img src="./imgs/a7.jpg" alt="">
                <img src="./imgs/pxfuel.jpg" alt="">
                <img src="./imgs/a4.jpg" alt="">
            </div>

            <div class="column">
                <img src="./imgs/a7.jpg" alt="">
                <img src="./imgs/a4.jpg" alt="">
                <img src="./imgs/ghostfreak.jpg" alt="">
                <img src="./imgs/a2.jpg" alt="">
                <img src="./imgs/pxfuel (1).jpg" alt="">
                <img src="./imgs/df.jpg" alt="">
                <img src="./imgs/pxfuel (1).jpg" alt="">
            </div>
            <div class="column">
                <img src="./imgs/diamondhead.jpg" alt="">
                <img src="./imgs/a1.jpg" alt="">
                <img src="./imgs/pxfuel.jpg" alt="">
                <img src="./imgs/ghostfreak.jpg" alt="">
            </div>
        </div>
    </div>
    <br>
    <div class="py-5 asdf"
        style="background: #000000a3;  background: -webkit-linear-gradient(to left, #0f9b0f, #000000);  background: linear-gradient(to left, #0f9b0f, #000000);">
        <div class="display-5 d-flex justify-content-center mt-5 mb-5 fw-bold text-light asd">
            SERIES COLLECTIONS
        </div>
        <div class="page-containerr">

            <div class="wrapper">
                <?php

$categoriesContainer = new CategoryContainers($con); // Assuming $con is your database connection

echo $categoriesContainer->showCategories(); // Display categories dynamically
?>

            </div>

        </div>
    </div>
    <hr>

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
    <script src="index.js"></script>
</body>

</html>