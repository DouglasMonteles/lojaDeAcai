<!DOCTYPE html>

<html lang="pt-br">
    <head>
        <title>Administração</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="node_modules/materialize-css/dist/css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="cyan">
        
        <!--Logo-->
        <%@include file="includes/menu-logo.jsp" %> 
        
        <main>
             <!-- Page Layout here -->
            <div class="row">

              <div class="col s3">
                  <%@include file="includes/menu-lateral.jsp"%>
              </div>

              <div class="col s12 m9">
                <!-- Teal page content  -->
                  <div class="card">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" src="img/coruja.png">
                    </div>
                    <div class="card-content">
                      <span class="card-title activator grey-text text-darken-4">Card Title<i class="material-icons right">more_vert</i></span>
                      <p><a href="#">This is a link</a></p>
                    </div>
                    <div class="card-reveal">
                      <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Card Title</span>
                      <p>Here is some more information about this product that is only revealed once clicked on.</p>
                    </div>
                  </div>
              </div>

            </div>
        </main>
        
        <%@include file="includes/rodape.jsp" %>
        
        <script src="node_modules/materialize-css/dist/js/materialize.js" type="text/javascript"></script>
        
        <script>
            $(".button-collapse").sideNav();
        </script>
    </body>
</html>
