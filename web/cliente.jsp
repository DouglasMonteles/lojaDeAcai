<%@page import="modelo.Cliente"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Cliente> listClientes = new ArrayList<Cliente>();
    ClienteDAO uDAO = new ClienteDAO();
    try {
            listClientes = uDAO.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Clientes</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="node_modules/materialize-css/dist/css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        
        <script> 
            function excluir(id, nome) {
                if (window.confirm('Tem certeza que deseja excluir: ' + nome +  '?')) {
                    location.href="gerenciar_cliente.do?tipo=excluir&id=" + id;
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

              <div class="col s12 m9">
                  <div class="row center-align card-panel grey darken-4 white-text">
                      <h5 style="margin: 0 auto">Clientes
                          <span class="right right-align">
                              <a class="waves-effect waves-light btn modal-trigger purple" href="inserir_cliente.jsp">
                                  <i class="small material-icons">add</i>
                              </a>
                          </span>
                      </h5>
                    </div>
                <table class="highlight z-depth-5 grey lighten-5 rounded">
                    <thead class="black lighten-3 white-text">
                        <tr>
                          <th>Nome</th>
                          <th>Tel. Contato</th>
                          <th class="center-align">Opções</th>
                      </tr>
                    </thead>

                    <tbody>
                      
                        <%
                            for(Cliente itens : listClientes) {
                        %>
                            <tr>
                                <td><%= itens.getNome() %></td>
                                <td><%= itens.getTelContato()%></td>
                                <td class="center-align">
                                    <a class="modal-trigger waves-effect waves-light btn modal-trigger orange" href="alterar_cliente.jsp?id=<%= itens.getId() %>">
                                        <i class="small material-icons">create</i>
                                    </a>
                                    <a href="#" class="waves-effect waves-light btn modal-trigger red" onclick="excluir(<%= itens.getId() %>, '<%= itens.getNome() %>')">
                                        <i class="small material-icons">delete</i>
                                    </a>
                                        <a href="compra.jsp?id=<%= itens.getId() %>&op=n" class="waves-effect waves-light btn modal-trigger green">
                                        <i class="small material-icons">local_dining</i>
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
