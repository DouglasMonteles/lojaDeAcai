<%@page import="modelo.UsuarioDAO"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Usuario> listUsuarios = new ArrayList<Usuario>();
    UsuarioDAO uDAO = new UsuarioDAO();
    try {
            listUsuarios = uDAO.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Usuarios</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="node_modules/materialize-css/dist/css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        
        <script> 
            function excluir(id, nome) {
                if (window.confirm('Tem certeza que deseja excluir: ' + nome +  '?')) {
                    location.href="gerenciar_usuario.do?tipo=excluir&id=" + id;
                }
            }
        </script>
        
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

              <div class="col s9">
                  <div class="row center-align card-panel grey darken-4 white-text">
                      <h5 style="margin: 0 auto">Usuários
                          <span class="right right-align">
                              <a class="waves-effect waves-light btn modal-trigger purple" href="inserir_usuario.jsp">
                                  <i class="small material-icons">add</i>
                              </a>
                          </span>
                      </h5>
                    </div>
                <table class="highlight z-depth-5 grey lighten-5 rounded">
                    <thead class="black lighten-3 white-text">
                        <tr>
                          <th>Nome</th>
                          <th>Login</th>
                          <th class="center-align">Opções</th>
                      </tr>
                    </thead>

                    <tbody>
                      
                        <%
                            for(Usuario itens : listUsuarios) {
                        %>
                            <tr>
                                <td><%= itens.getNome() %></td>
                                <td><%= itens.getLogin()%></td>
                                <td class="center-align">
                                    <a class="modal-trigger waves-effect waves-light btn modal-trigger orange" href="alterar_usuario.jsp?id=<%= itens.getId() %>">
                                        <i class="small material-icons">create</i>
                                    </a>
                                    <a href="#" class="waves-effect waves-light btn modal-trigger red" onclick="excluir(<%= itens.getId() %>, '<%= itens.getNome() %>')">
                                        <i class="small material-icons">delete</i>
                                    </a>
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
        
        
        
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="node_modules/materialize-css/dist/js/materialize.js" type="text/javascript"></script>
        <script>
                $(".button-collapse").sideNav();
        </script>
    </body>
</html>
