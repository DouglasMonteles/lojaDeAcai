<%@page import="modelo.Comanda"%>
<%@page import="modelo.ComandaDAO"%>
<%
    Comanda c = new Comanda();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        ComandaDAO cDAO = new ComandaDAO();
        c = cDAO.carregarPorId(id);
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Alterar Comanda</title>
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
                      <h5 style="margin: 0 auto">Alterar Comanda</h5>
                </div>
            
            <div class="container">
            <div class="row">
                <form class="col s12" action="gerenciar_comanda.do" method="post">
                    <input type="hidden" name="tipo" value="alterar">
                    <input type="hidden" name="id" value="<%= c.getId() %>">
                    <div class="row">
                      <div class="input-field col s12">
                        <input id="nome" name="comanda" type="text" class="validate white-text" value="<%= c.getNome() %>" required>
                        <label for="nome" class="">Comanda</label>
                      </div>
                    </div>

                      <div class="row right-align">
                            <button class="btn waves-effect waves-light" type="submit" name="action">Alterar Comanda
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
