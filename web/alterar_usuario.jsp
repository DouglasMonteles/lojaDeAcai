<%@page import="modelo.UsuarioDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
<%
    Usuario u = new Usuario();
    ArrayList<Perfil> listPerfil = new ArrayList<Perfil>();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        
        UsuarioDAO uDAO = new UsuarioDAO();
        u = uDAO.carregarPorId(id);
        
        PerfilDAO pDAO = new PerfilDAO();
        listPerfil = pDAO.listar();
        
    } catch (Exception e) {
        out.print("Erro: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Alterar Usuário</title>
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
                      <h5 style="margin: 0 auto">Alterar Usuário</h5>
                </div>
            
            <div class="container">
            <div class="row">
                <form class="col s12" action="gerenciar_usuario.do" method="post">
                    <input type="hidden" name="tipo" value="alterar">
                    <input type="hidden" name="id" value="<%=  u.getId() %>">
                    <div class="row">
                      <div class="input-field col s12">
                          <input id="nome" name="nome" type="text" value="<%= u.getNome() %>" class="validate white-text" required>
                        <label for="nome" class="">Nome</label>
                      </div>
                    </div>

                    <div class="row">
                        <div class="input-field col s6">
                            <input id="login" name="login" type="text" value="<%= u.getLogin() %>" class="validate white-text" required>
                            <label for="login">Login</label>
                          </div>

                        <div class="input-field col s6">
                            <input id="login" name="senha" type="password" value="<%= u.getSenha() %>" class="validate white-text" required>
                            <label for="login">Senha</label>
                          </div>
                    </div>
                    
                    <div class="row">
                        <div class="input-field col s12">
                            <select name="id_perfil" required>
                                <option value="" disabled selected>Escolha um perfil</option>
                                <%
                                    for (Perfil p : listPerfil) {
                                        String selected = "";
                                        
                                        if (u.getPerfil().getId() == p.getId()) {
                                            selected = "selected";
                                        }
                                        
                                %>
                                <option <%= selected %> value="<%= p.getId()%>"><%= p.getNome() %></option>
                                <%
                                    }
                                %>
                            </select>
                            <label>Perfil</label>
                        </div>
                    </div>

                      <div class="row right-align">
                            <button class="btn waves-effect waves-light" type="submit" name="action">Alterar Usuário
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
                $(document).ready(function(){
                    $('select').formSelect();
                });
                $(".button-collapse").sideNav();
        </script>
    </body>
</html>
