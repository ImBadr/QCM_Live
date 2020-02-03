<!DOCTYPE html>
<html>
    <head>
        <title>Identification</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="./vue/bootstrap/css/bootstrap.min.css">
        <script src="./vue/bootstrap/js/jquery.min.js"></script>
        <script src="./vue/bootstrap/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <link rel="stylesheet" href="./vue/styles/ident.css">
        <link href="./vue/bootstrap/css/mdb.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <br>
            <div class="titre">
                <a class="text-center">QCM <span class="red-txt">Live</span></a>
                <i class="fas fa-tasks"></i>
            </div>
            <div class="logo">
                <img id="descartes" src="./vue/images/logo_descartes.png">
            </div>
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card card-signin my-5">
                        <div class="card-body">
                            <h5 class="card-title text-center">Identification</h5>
                            <form class="form-signin" action="" method="post">
                                <div class="form-label-group">
                                    <label for="inputLogin">Entrez votre login</label>
                                    <input type="text" name="login" id="inputLogin" class="form-control" placeholder="Login" required autofocus>
                                </div>
                                <div class="form-label-group">
                                    <label for="inputPassword">Entrez votre mot de passe</label>
                                    <input type="password" name="pass" id="inputPassword" class="form-control" placeholder="Mot de passe" required>
                                </div>
                                <?php 
                                    if($error==true)
                                        echo('<div class="alert alert-danger" role="alert">Mot de passe ou login incorrect !</div>');
                                ?>
                                <button class="btn btn-lg btn-red btn-block text-uppercase" type="submit">Connexion</button>
                            </form>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>            
    </body>
</html>