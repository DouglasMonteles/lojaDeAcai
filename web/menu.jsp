<%
    ArrayList<Menu> listMenus = new ArrayList<Menu>();
    try {
            MenuDAO mDAO = new MenuDAO();
            listMenus = mDAO.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Menus</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="node_modules/materialize-css/dist/css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="indigo lighten-4">
        
        <!--Logo-->
        <%@include file="includes/menu-logo.jsp" %> 
        
        <main>
             <!-- Page Layout here -->
            <div class="row">

              <div class="col s3">
                  <%@include file="includes/menu-lateral.jsp"%>
              </div>

              <div class="col s9">
                  <div class="row center-align card-panel grey darken-1white-text">
                      <h5 style="margin: 0 auto">Menu <span class="right right-align"><a class="waves-effect waves-light btn modal-trigger orange" href="#modal1"><i class="small material-icons">add</i></a></span></h5>
                    </div>
                <table class="highlight z-depth-5 grey lighten-5 rounded">
                    <thead class="black lighten-3 white-text">
                        <tr>
                          <th>Nome</th>
                          <th>Link</th>
                          <th class="center-align">Opções</th>
                      </tr>
                    </thead>

                    <tbody>
                      
                        <%
                            for(Menu itens : listMenus) {
                        %>
                            <tr>
                                <td><%= itens.getNome() %></td>
                                <td><%= itens.getLink() %></td>
                                <td class="center-align">
                                    <a href="alterar_menu.jsp?id=<%= itens.getId() %>"><i class="small material-icons">create</i></a>
                                    <a href="excluir_menu.jsp?id=<%= itens.getId() %>"><i class="small material-icons">delete</i></a>
                                </td>
                            </tr>
                        <%
                            }
                        %>
                      
                    </tbody>
                  </table>
              </div>

            </div>
        </main>
        
        <%@include file="includes/rodape.jsp" %>
        
        <!-- Modal Structure -->
        <div id="modal1" class="modal modal-fixed-footer">
          <div class="modal-content">
            <h4 class="center-align">Adicionar Menu</h4>
            
                <div class="row">
                <form class="col s12" action="gerenciar_menu.do">
                    <input type="hidden" name="tipo" value="inserir">
                  <div class="row">
                    <div class="input-field col s6">
                      <input id="nome" name="nome" type="text" class="validate">
                      <label for="nome">Nome</label>
                    </div>
                    <div class="input-field col s6">
                      <input id="link" name="link" type="text" class="validate">
                      <label for="link">Link</label>
                    </div>
                  </div>
                    
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="icone" name="icone" type="text" class="validate">
                            <label for="icone">Icone</label>
                          </div>
                    </div>
                    
                    <div class="row right-align">
                          <button class="btn waves-effect waves-light" type="submit" name="action">Adicionar Menu
                            <i class="material-icons right">send</i>
                          </button>
                    </div>
                </form>
            </div>
          </div>
          <div class="modal-footer">
            <a href="#!" class=" left-align modal-close waves-effect waves-green btn">Fechar</a>
          </div>
        </div>
        
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="node_modules/materialize-css/dist/js/materialize.js" type="text/javascript"></script>
        <script>
                $('.modal').modal();
                $(".button-collapse").sideNav();
        </script>
    </body>
</html>
