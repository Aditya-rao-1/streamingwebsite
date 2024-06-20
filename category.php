<?php
require_once("includes/header.php");
require_once("includes/CategoryContainers.php"); // Include the PHP file containing the CategoryContainers class

if(!isset($_GET["id"])) {
    ErrorMessage::show("No id passed to page");
}

$containers = new CategoryContainers($con, $userLoggedIn);
echo $containers->showCategory($_GET["id"]);
?>
