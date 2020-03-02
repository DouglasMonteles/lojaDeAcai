<%@page import="modelo.Comanda"%>
<%@page import="modelo.ComandaDAO"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Comanda> listComandas = new ArrayList<Comanda>();
    ComandaDAO cDAO = new ComandaDAO();
    try {
            listComandas = cDAO.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Comandas</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="node_modules/materialize-css/dist/css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        
        <script> 
            function excluir(id, nome) {
                if (window.confirm('Tem certeza que deseja excluir: ' + nome +  '?')) {
                    location.href="gerenciar_comanda.do?tipo=excluir&id=" + id;
                }
            }
            
            function add() {
                let comanda = document.getElementById("comanda").value;
                let soma = Number(comanda) + 1;
                
                document.getElementById("comanda").value = soma;
            }
            
            function remove() {
                let comanda = document.getElementById("comanda").value;
                let remove = Number(comanda) - 1;
                
                if (remove > 0) {
                    document.getElementById("comanda").value = remove;
                } else {
                    alert('Valor precisa ser MAIOR que ZERO');
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
                      <h5 style="margin: 0 auto">Comandas
                          <span class="right right-align">
                              <a class="waves-effect waves-light btn modal-trigger purple modal-trigger" href="#inserir" >
                                    <i class="small material-icons">add</i>
                              </a>
                          </span>
                      </h5>
                    </div>
                <table class="highlight z-depth-5 grey lighten-5 rounded">
                    <thead class="black lighten-3 white-text">
                        <tr>
                          <th>ID</th>
                          <th>Nome</th>
                          <th class="center-align">Status</th>
                          <th class="center-align">Opções</th>
                      </tr>
                    </thead>

                    <tbody>
                      
                        <%
                            for(Comanda itens : listComandas) {
                        %>
                            <tr>
                                <td><%= itens.getId() %></td>
                                <td style="font-weight: bold; font-size: 14pt">Comanda N° <%= itens.getNome() %></td>
                                <td class="center-align">
                                    <%
                                        if (itens.getStatus().equals("ativo")) {
                                    %>
                                    <a class="modal-trigger waves-effect waves-light btn modal-trigger red" href="registrar_situacao_venda_comanda.do?id=<%= itens.getId() %>">
                                        Fechar Comanda
                                    </a>
                                    <%
                                        } else {
                                            out.print("<span class='pink-text' style='font-weight: bold'>Comanda Fechada</span>");
                                        }
                                    %>
                                </td>
                                <td class="center-align">
                                    <a class="modal-trigger waves-effect waves-light btn modal-trigger orange" href="alterar_comanda.jsp?id=<%= itens.getId() %>">
                                        <i class="small material-icons">create</i>
                                    </a>
                                    <a href="#" class="waves-effect waves-light btn modal-trigger red" onclick="excluir(<%= itens.getId() %>, '<%= itens.getNome() %>')">
                                        <i class="small material-icons">delete</i>
                                    </a>
                                        <a href="compra_comanda.jsp?id=<%= itens.getId() %>&op=n" class="waves-effect waves-light btn modal-trigger green">
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
                        
         <!-- Modal Structure -->
        <div id="inserir" class="modal">
          <div class="modal-content">
            <h4>Criar Comanda</h4>
            <div class="container">
                <div class="row">
                    <form method="post" action="gerenciar_comanda.do" class="col s12">
                        <input type="hidden" name="tipo" value="inserir" />
                        <input type="hidden" name="id" value="0" />
                        <div class="input-field col s12">
                            <input id="comanda" type="number" name="comanda" id="comanda" min="1" max="999" value="1" class="validate" required>
                            <label for="comanda">Número da Comanda</label>
                        </div>
                        
                        <div class="input-field col s12">
                            <div class="col s6">
                                <button type="button" class="btn waves-block waves-effect btn-floating" style="margin: auto" onclick="add()">
                                    <i class="material-icons">add</i>
                                </button>
                            </div>
                            
                            <div class="col s6">
                                <button type="button" class="btn waves-block waves-effect btn-floating" style="margin: auto" onclick="remove()">
                                    <i class="material-icons">remove</i>
                                </button>
                            </div>
                        </div>
                        
                        <div class="row right-align">
                            <button type="submit" class="btn waves-effect blue" style="margin-top: 10%">Criar</button>
                        </div>
                    </form>
                </div>
            </div>
          </div>
          <div class="modal-footer">
            <a href="#!" class="modal-close waves-effect waves-green btn-flat">Fechar</a>
          </div>
        </div>
        
        <%@include file="includes/rodape.jsp" %>
        
        
        
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="node_modules/materialize-css/dist/js/materialize.js" type="text/javascript"></script>
        <script>
                $(document).ready(function() {
                    $('.modal').modal();
                     $(".button-collapse").sideNav();
                });
               
        </script>
    </body>
</html>
