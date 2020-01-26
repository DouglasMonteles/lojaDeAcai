<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
<%
    ArrayList<Perfil> listPerfil = new ArrayList<Perfil>();
    try {
            PerfilDAO pDAO = new PerfilDAO();
            listPerfil = pDAO.listar();
    } catch (Exception e) {
        out.print("Erro: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Inserir Usuário</title>
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
                      <h5 style="margin: 0 auto">Inserir Usuario</h5>
                </div>
            
            <div class="container">
            <div class="row">
                <form class="col s12" action="gerenciar_usuario.do" method="post">
                    <input type="hidden" name="tipo" value="inserir">
                    <input type="hidden" name="id" value="0">
                    <div class="row">
                      <div class="input-field col s12">
                        <input id="nome" name="nome" type="text" class="validate white-text" required>
                        <label for="nome" class="">Nome</label>
                      </div>
                    </div>

                    <div class="row">
                        <div class="input-field col s6">
                            <input id="login" name="login" type="text" class="validate white-text" required>
                            <label for="login">Login</label>
                          </div>

                        <div class="input-field col s6">
                            <input id="login" name="senha" type="password" class="validate white-text" required>
                            <label for="login">Senha</label>
                          </div>
                    </div>
                    
                    <div class="row">
                        <div class="input-field col s12">
                            <select name="id_perfil" required>
                                <option value="" disabled selected>Escolha um perfil</option>
                                <%
                                    for (Perfil p : listPerfil) {
                                %>
                                <option value="<%= p.getId() %>"><%= p.getNome() %></option>
                                <%
                                    }
                                %>
                            </select>
                            <label>Perfil</label>
                        </div>
                    </div>

                      <div class="row right-align">
                            <button class="btn waves-effect waves-light" type="submit" name="action">Inserir Usuário
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
                $(document).ready(function(){
                    $('select').formSelect();
                });
                $(".button-collapse").sideNav();
        </script>
    </body>
</html>
