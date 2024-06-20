<?php
require_once("includes/config.php");
require_once("includes/classes/FormSanitizer.php");
require_once("includes/classes/Constants.php");
require_once("includes/classes/Account.php");

$account = new Account($con);

if(isset($_POST["submitButton"])) {
    $name = FormSanitizer::sanitizeFormString($_POST["name"]);
    $username = FormSanitizer::sanitizeFormUsername($_POST["uname"]);
    $password = FormSanitizer::sanitizeFormPassword($_POST["password"]);
    $re_password = FormSanitizer::sanitizeFormPassword($_POST["re_password"]);

    // Check if any field is empty
    if(empty($name) || empty($username) || empty($password) || empty($re_password)) {
        header("Location: index.php?error=empty");
        exit();
    }

    // Check if passwords match
    if($password !== $re_password) {
        header("Location: index.php?error=passwordsdontmatch");
        exit();
    }

    // Proceed with registration if all fields are filled
    $success = $account->register($name, $username, $password);

    if($success) {
        header("Location: index.php?success=signupsuccess");
        exit();
    } else {
        header("Location: index.php?error=signupfailed");
        exit();
    }
}



function getInputValue($name) {
    if(isset($_POST[$name])) {
        echo $_POST[$name];
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ben 10 series collection</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="signin.css">
</head>

<body>
    <div class="px-4 py-5 my-5 text-center">
        <div class="chngcol">
            <h1 class="display-2 fw-bold text-body-emphasis">Ben 10 series collection</h1>
        </div>
    </div>
    <div class="d-flex justify-content-center align-items-center py-4">
        <section class="logibox">
            <main class="form-signin w-100 m-auto text-center">
                <form method="POST" >
                    <img class="mb-4" src="./Ben_10_Omnitrix.png" alt="" width="72" height="57">
                    <h1 class="h3 mb-5 fw-bold" style="font-family: 'Arial', sans-serif; color: #8cff00;">REGISTER HERE</h1>

                    <?php
                    // Display error message if any field is empty
                    if(isset($_GET['error']) && $_GET['error'] === 'empty') {
                        echo "<div class='alert alert-danger'>All fields are required.</div>";
                    }
                    ?>

                    <div class="form-floating mb-3">
                        <?php echo $account->getError(Constants::$firstNameCharacters); ?>
                        <input type="text" name="firstName" placeholder="First name" value="<?php getInputValue("firstName"); ?>" required class="form-control" id="firstName" style="color: #000000;">
                        <label for="firstName" style="color: #000000;">First Name</label>
                    </div>

                    <div class="form-floating mb-3">
                        <?php echo $account->getError(Constants::$lastNameCharacters); ?>
                        <input type="text" name="lastName" placeholder="Last name" value="<?php getInputValue("lastName"); ?>" required class="form-control" id="lastName" style="color: #000000;">
                        <label for="lastName" style="color: #000000;">Last Name</label>
                    </div>

                    <div class="form-floating mb-3">
                        <?php echo $account->getError(Constants::$usernameCharacters); ?>
                        <?php echo $account->getError(Constants::$usernameTaken); ?>
                        <input type="text" name="username" placeholder="Username" value="<?php getInputValue("username"); ?>" required class="form-control" id="username" style="color: #000000;">
                        <label for="username" style="color: #000000;">Username</label>
                    </div>

                    <div class="form-floating mb-3">
                        <?php echo $account->getError(Constants::$emailsDontMatch); ?>
                        <?php echo $account->getError(Constants::$emailInvalid); ?>
                        <?php echo $account->getError(Constants::$emailTaken); ?>
                        <input type="email" name="email" placeholder="Email" value="<?php getInputValue("email"); ?>" required class="form-control" id="email" style="color: #000000;">
                        <label for="email" style="color: #000000;">Email</label>
                    </div>

                    <div class="form-floating mb-3">
                        <?php echo $account->getError(Constants::$passwordsDontMatch); ?>
                        <?php echo $account->getError(Constants::$passwordLength); ?>
                        <input type="password" name="password" placeholder="Password" required class="form-control" id="password" style="color: #000000;">
                        <label for="password" style="color: #000000;">Password</label>
                    </div>

                    <button class="btn btn-primary w-100 mt-5 mb-3 py-2" type="submit" name="submitButton" value="SUBMIT">REGISTER HERE </button>
    
                    <a href="login.php" class="signInMessage text-danger py-5">Already have an account? Sign in here!</a>
                </form>
            </main>
        </section>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>

</html>
