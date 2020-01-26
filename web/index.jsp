<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="node_modules/materialize-css/dist/css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="grey lighten-1">
        
        <nav style="margin-bottom: 20px">
          <div class="nav-wrapper grey darken-4">
            <a href="#" class="brand-logo">Logo</a>
          </div>
        </nav>
        
        <main>
            <div class="container">
                <div class="row z-depth-5 w5 grey darken-4" style="margin: 80px auto">
                    <div class="col s12" style="margin: 20px auto">
                        <div class="col s1"></div>
                        <form class="col s10" method="post" action="gerenciar_login.do">
                            <input type="hidden" name="type" value="login">
                          <div class="row">
                            <div class="input-field col s12">
                              <input id="login" type="text" class="validate white-text" name="login" required>
                              <label for="login">Login</label>
                            </div>
                          </div>

                        <div class="row">
                            <div class="input-field col s12">
                                <input id="password" type="password" class="validate white-text" name="password" required>
                                <label for="password">Senha</label>
                            </div>
                          </div>
                        <div class="right-align">    
                            <button class="btn waves-effect waves-light" type="submit" name="action">Entrar
                                <i class="material-icons right">send</i>
                            </button>
                        </div>
                        </form>
                    </div>
                  </div>
            </div>
        </main>
        
        <footer class="page-footer grey darken-4">
          <div class="container">
            <div class="row">
              <div class="col l6 s12">
                <h5 class="white-text">Footer Content</h5>
                <p class="grey-text text-lighten-4">You can use rows and columns here to organize your footer content.</p>
              </div>
              <div class="col l4 offset-l2 s12">
                <h5 class="white-text">Links</h5>
                <ul>
                  <li><a class="grey-text text-lighten-3" href="#!">Link 1</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">Link 2</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">Link 3</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">Link 4</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="footer-copyright">
            <div class="container">
            © 2014 Copyright Text
            <a class="grey-text text-lighten-4 right" href="#!">More Links</a>
            </div>
          </div>
        </footer>
        <script src="node_modules/materialize-css/dist/js/materialize.js" type="text/javascript"></script>
    </body>
</html>
