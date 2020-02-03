<!DOCTYPE html>
<html>

<head>
    <title>Panel test</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="./vue/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="stylesheet" href="./vue/styles/professeur/prof_global.css">
    <link rel="stylesheet" href="./vue/styles/professeur/prof_panel_prof.css">
    <link href="./vue/bootstrap/css/mdb.min.css" rel="stylesheet">
</head>

<body>

    
    <p><?php  
        print_r(
            'note test :' . $note_test . 
            ' pts positifs : ' . $pts_positifs . 
            ' pts negatifs : ' . $pts_negatifs . 
            ' bareme test : ' . $bareme_test .
            ' bareme question : ' . $bareme_question);
        
    ?></p>

</body>

</html>