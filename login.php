<?php
require_once("includes/config.php");
require_once("includes/classes/FormSanitizer.php");
require_once("includes/classes/Constants.php");
require_once("includes/classes/Account.php");

$account = new Account($con);

    if(isset($_POST["submitButton"])) {

        $username = FormSanitizer::sanitizeFormUsername($_POST["username"]);
        $password = FormSanitizer::sanitizeFormPassword($_POST["password"]);
        
        $success = $account->login($username, $password);

        if($success) {
            $_SESSION["userLoggedIn"] = $username;
            header("Location: index.php");
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="signin.css">
</head>

<body >
  
    <div class="px-4 py-5 my-5 text-center"> 
        <div class="chngcol">
            <h1 class="display-2 fw-bold text-body-emphasis">Ben 10 series collection</h1>
        </div>
       </div>
       <div class="d-flex justify-content-center align-items-center py-4">
        <section class="logibox">
            <main class="form-signin w-100 m-auto text-center">
                <form method="POST">
                    <img class="mb-4" src="./Ben_10_Omnitrix.png" alt="" width="72" height="57">
                    <h1 class="h3 mb-5 fw-bold" style="font-family: 'Arial', sans-serif; color: #8cff00;"> SIGN IN HERE </h1>
                    <?php echo $account->getError(Constants::$loginFailed); ?>
                    <div class="form-floating mb-3">
                        <input type="text" name="username" placeholder="Username" value="<?php getInputValue("username"); ?>" required class="form-control" id="floatingInput" 
                            style="color: #000000;">
                        <label for="floatingInput" style="color: #000000;">Username</label>
                    </div>
                    <div class="form-floating">
                        <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password" 
                            style="color: #000000;">
                        <label for="floatingPassword" style="color: #000000;">Password</label>
                    </div>
    
              
                    <button class="btn btn-primary w-100 mt-3 mb-3 py-2" type="submit" name="submitButton" value="SUBMIT">Sign in</button>
    
                    <a href="register.php" class="signInMessage text-danger">Need an account? Sign up here!</a>
                </form>
            </main>
        </section>
    </div>
    
   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>

</html>


    

