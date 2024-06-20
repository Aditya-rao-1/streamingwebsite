<?php
require_once("includes/navBar.php");

ob_start(); // Start output buffering

require_once("includes/header.php");

ob_end_clean(); // Clean (erase) the output buffer
require_once("includes/navBar.php");
require_once("includes/paypalConfig.php");
require_once("includes/classes/Account.php");
require_once("includes/classes/User.php");
require_once("includes/classes/FormSanitizer.php");
require_once("includes/classes/Constants.php");
require_once("includes/classes/BillingDetails.php");

$user = new User($con, $userLoggedIn);

$detailsMessage = "";
$passwordMessage = "";
$subscriptionMessage = "";

if(isset($_POST["saveDetailsButton"])) {
    $account = new Account($con);

    $firstName = FormSanitizer::sanitizeFormString($_POST["firstName"]);
    $lastName = FormSanitizer::sanitizeFormString($_POST["lastName"]);
    $email = FormSanitizer::sanitizeFormEmail($_POST["email"]);

    if($account->updateDetails($firstName, $lastName, $email, $userLoggedIn)) {
        $detailsMessage = "<div class='alertSuccess'>
                                Details updated successfully!
                            </div>";
    }
    else {
        $errorMessage = $account->getFirstError();

        $detailsMessage = "<div class='alertError'>
                                $errorMessage
                            </div>";
    }
}

if(isset($_POST["savePasswordButton"])) {
    $account = new Account($con);

    $oldPassword = FormSanitizer::sanitizeFormPassword($_POST["oldPassword"]); 
    $newPassword = FormSanitizer::sanitizeFormPassword($_POST["newPassword"]);
    $newPassword2 = FormSanitizer::sanitizeFormPassword($_POST["newPassword2"]);

    if($account->updatePassword($oldPassword, $newPassword, $newPassword2, $userLoggedIn)) {
        $passwordMessage = "<div class='alertSuccess'>
                                Password updated successfully!
                            </div>";
    }
    else {
        $errorMessage = $account->getFirstError();

        $passwordMessage = "<div class='alertError'>
                                $errorMessage
                            </div>";
    }
}

if (isset($_GET['success']) && $_GET['success'] == 'true') {
    $token = $_GET['token'];
    $agreement = new \PayPal\Api\Agreement();

    $subscriptionMessage = "<div class='alertError'>
                            Something went wrong!
                        </div>";
  
    try {
      // Execute agreement
      $agreement->execute($token, $apiContext);

        $result = BillingDetails::insertDetails($con, $agreement, $token, $userLoggedIn);
        $result = $result && $user->setIsSubscribed(1);

        if($result) {
            $subscriptionMessage = "<div class='alertSuccess'>
                            You're all signed up!
                        </div>";
        }


    } catch (PayPal\Exception\PayPalConnectionException $ex) {
      echo $ex->getCode();
      echo $ex->getData();
      die($ex);
    } catch (Exception $ex) {
      die($ex);
    }
  } 
  else if (isset($_GET['success']) && $_GET['success'] == 'false') {
    $subscriptionMessage = "<div class='alertError'>
                            User cancelled or something went wrong!
                        </div>";
  }

?>

<style>
   body{
    background-color: #141414;
   } 
.settingsContainer {
    padding-top: 60px;
    background-color: transparent;
    width: 80%;
    margin-left: auto;
    margin-right: auto;
}

.settingsContainer h2 {
    color: #fff;
    margin-top: 0;
}

.settingsContainer .formSection {
    display: flex;
    flex-direction: column;
    margin: 20px 0;
    border-bottom: 1px solid #dedede;
    padding-bottom: 20px;
}

.settingsContainer form input[type="text"],
.settingsContainer form input[type="email"],
.settingsContainer form input[type="password"] {
    width: 300px;
    height: 40px;
    font-size: 15px;
    margin: 5px 0;
    border: none;
    border-radius: 3px;
    padding: 0 5px;
}

.settingsContainer form input[type="submit"] {
    background-color: #dc1928;
    width: 100px;
    height: 40px;
}

.alertSuccess,
.alertError {
    margin: 10px 0;
}

.alertError {
    color: #dc1928;
}

.alertSuccess {
    color: #2ecc71;
}

.formSection h3 {
    padding: 0;
    color: #fff;
    font-size: 20px;
}
.textboxContainer {
    padding: 100px 50px;
}
.menu-bar {
    border-radius: 25px;
    height: fit-content;
    display: inline-flex;
    backdrop-filter: blur(1px);
    align-items: center;
    padding: 0 10px;
    margin: 0px 0 0 0;

  }
 
  
  .menu-bar li {
    list-style: none;
    color: white;
    font-family: sans-serif;
    font-weight: bold;
    padding: 12px 16px;
    margin: 0 8px;
    position: relative;
    cursor: pointer;
    white-space: nowrap;
  }
  
  .menu-bar li::before {
    content: " ";
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
    z-index: -1;
    transition: 0.2s;
    border-radius: 25px;
  }
  
  .menu-bar li:hover::before {
    background: linear-gradient(to bottom, #f7f7f7, #ffffff);
    box-shadow: 0px 3px 20px 0px black;
    transform: scale(1.2);
  }
  
  .menu-bar li:hover {
    color: black;
  
  }

</style>

<div class="settingsContainer column">

    <div class="formSection">

        <form method="POST">

            <h2>User details</h2>
            
            <?php

            $firstName = isset($_POST["firstName"]) ? $_POST["firstName"] : $user->getFirstName();
            $lastName = isset($_POST["lastName"]) ? $_POST["lastName"] : $user->getLastName();
            $email = isset($_POST["email"]) ? $_POST["email"] : $user->getEmail();
            ?>

            <input type="text" name="firstName" placeholder="First name" value="<?php echo $firstName; ?>">
            <input type="text" name="lastName" placeholder="Last name" value="<?php echo $lastName; ?>">
            <input type="email" name="email" placeholder="Email" value="<?php echo $email; ?>">

            <div class="message">
                <?php echo $detailsMessage; ?>
            </div>
            
            <input type="submit" name="saveDetailsButton" value="Save">


        </form>

    </div>

    <div class="formSection">

        <form method="POST">

            <h2>Update password</h2>

            <input type="password" name="oldPassword" placeholder="Old password">
            <input type="password" name="newPassword" placeholder="New password">
            <input type="password" name="newPassword2" placeholder="Confirm new password">

            <div class="message">
                <?php echo $passwordMessage; ?>
            </div>

            <input type="submit" name="savePasswordButton" value="Save">


        </form>

    </div>

    <div class="formSection">
        <h2>Subscription</h2>

        <div class="message">
            <?php echo $subscriptionMessage; ?>
        </div>

        <?php

        if($user->getIsSubscribed()) {
            echo "<h3>You are subscribed! Go to PayPal to cancel.</h3>";
        }
        else {
            echo "<a href='billing.php'>Subscribe to Reeceflix</a>";
        }
        ?>
    </div>

</div>
