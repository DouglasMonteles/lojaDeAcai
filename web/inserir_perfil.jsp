<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Inserir Perfil</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="node_modules/materialize-css/dist/css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="grey darken-2">
        
        <!--Logo-->
        <%@include file="includes/menu-logo.jsp" %> 
        
        <main>
             <!-- Page Layout here -->
            <div class="row">

              <div class="col s3">
                  <%@include file="includes/menu-lateral.jsp"%>
              </div>

            <div class="col s12 m9 grey darken-4">
                <div class="row center-align card-panel grey darken-1white-text">
                      <h5 style="margin: 0 auto">Inserir Perfil</h5>
                </div>
            
            <div class="container">
            <div class="row">
                <form class="col s12" action="gerenciar_perfil.do" method="post">
                    <input type="hidden" name="tipo" value="inserir">
                    <input type="hidden" name="id" value="0">
                    <div class="row">
                      <div class="input-field col s12">
                        <input id="nome" name="nome" type="text" class="validate white-text" required>
                        <label for="nome" class="">Nome</label>
                      </div>
                    </div>

                      <div class="row">
                          <div class="input-field col s12">
                              <input id="desc" name="descricao" type="text" class="validate white-text">
                              <label for="desc">Descrição</label>
                            </div>
                      </div>

                      <div class="row right-align">
                            <button class="btn waves-effect waves-light" type="submit" name="action">Inserir Perfil
                              <i class="material-icons right">send</i>
                            </button>
                      </div>
                  </form>
              </div>
            </div>
            </div>
          </div>
        </main>
        
        <%@include file="includes/rodape.jsp" %>
        
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="node_modules/materialize-css/dist/js/materialize.js" type="text/javascript"></script>
        <script>
                $(".button-collapse").sideNav();
        </script>
    </body>
</html>
