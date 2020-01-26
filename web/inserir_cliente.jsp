<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Inserir Cliente</title>
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

            <div class="col s9 grey darken-4">
                <div class="row center-align card-panel grey darken-1white-text">
                      <h5 style="margin: 0 auto">Inserir Cliente</h5>
                </div>
            
            <div class="container">
            <div class="row">
                <form class="col s12" action="gerenciar_cliente.do" method="post">
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
                            <input id="tel" name="tel_contato" type="text" class="validate white-text">
                            <label for="tel">Tel. Contato</label>
                          </div>
                    </div>

                      <div class="row right-align">
                            <button class="btn waves-effect waves-light" type="submit" name="action">Inserir Cliente
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
        
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
        
        <script>
                $(document).ready(function(){
                    $('#tel').mask('(61) 00000-0000');
                });
        </script>
    </body>
</html>
