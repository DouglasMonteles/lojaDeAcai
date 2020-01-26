<%@page import="modelo.MenuDAO"%>
<%
    Menu menu = new Menu();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        MenuDAO menuDAO = new MenuDAO();
        menu = menuDAO.carregarPorId(id);
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Alterar Menu</title>
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
                      <h5 style="margin: 0 auto">Alterar Menu</h5>
                </div>
            
            <div class="container">
            <div class="row">
                <form class="col s12" action="gerenciar_menu.do" method="post">
                    <input type="hidden" name="tipo" value="alterar">
                    <input type="hidden" name="id" value="<%= menu.getId() %>">
                    <div class="row">
                      <div class="input-field col s6">
                          <input id="nome" name="nome" type="text" value="<%= menu.getNome() %>" class="validate white-text" required>
                        <label for="nome" class="">Nome</label>
                      </div>
                      <div class="input-field col s6">
                          <input id="link" name="link" type="text" value="<%= menu.getLink() %>" class="validate white-text" required>
                        <label for="link">Link</label>
                      </div>
                    </div>

                      <div class="row">
                          <div class="input-field col s12">
                              <input id="icone" name="icone" type="text" value="<%= menu.getIcone() %>" class="validate white-text">
                              <label for="icone">Icone</label>
                            </div>
                      </div>

                      <div class="row right-align">
                            <button class="btn waves-effect waves-light" type="submit" name="action">Alterar Menu
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
        
        <script>
                $(".button-collapse").sideNav();
        </script>
    </body>
</html>
