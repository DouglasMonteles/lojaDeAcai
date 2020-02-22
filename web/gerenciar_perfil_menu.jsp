<%@page import="modelo.PerfilDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Perfil"%>
<%
    Perfil p = new Perfil();
    ArrayList<Menu> menuNaoPerfil = new ArrayList<Menu>();
    
    try {
        
        int id_perfil = Integer.parseInt(request.getParameter("id"));
        PerfilDAO pDAO = new PerfilDAO();
        p = pDAO.carregarPorId(id_perfil);
        menuNaoPerfil = pDAO.menusNaoPerfil(id_perfil);
        
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Gerenciar perfil com menu</title>
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

              <div class="col s12 m9">
                <div class="row center-align card-panel grey darken-4 white-text">
                    <h5 style="margin: 0 auto">Gerenciar Perfil e Menu (<%= p.getNome() %>)</h5>
                </div>
                  
                <div class="row">
                    <div class="col s6 red darken-4">
                        <div class="row center-align card-panel grey darken-4 white-text">
                            <h5 style="margin: 0 auto">Menus não vinculados</h5>
                        </div>
                        <form method="post" action="gerenciar_perfil_menu.do">
                            <input type="hidden" name="tipo" value="vincular">
                            <input type="hidden" name="id_perfil" value="<%= p.getId() %>">
                            <div class="input-field col s12">
                                <select name="id_menu" required>
                                    <option value="" disabled selected>Escolha a funcionalidade</option>
                                    <%
                                        for (Menu listItem : menuNaoPerfil) {
                                    %>
                                    <option value="<%= listItem.getId() %>"><%= listItem.getNome() %></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <label>Selecione o menu que deseja vincular</label>
                                <br>
                                <div class="row right-align">
                                    <button type="submit" class="waves-effect waves-light btn green">
                                        Vincular <i class="material-icons right">send</i>
                                    </button>
                                </div>
                           </div>
                        </form>
                    </div>
                                
                    <div class="col s6 blue">
                        <div class="row center-align card-panel grey darken-4 white-text">
                            <h5 style="margin: 0 auto">Menus já vinculados</h5>
                        </div>
                        <div class="container center-block">
                            <div class="row">
                                <ul class="collection">
                                    <%
                                        for (Menu listItem : p.getMenu()) {
                                    %>
                                    <li class="collection-item">
                                        <div>
                                            <%= listItem.getNome() %>
                                            <a href="gerenciar_perfil_menu.do?tipo=desvincular&id_perfil=<%= p.getId() %>&id_menu=<%= listItem.getId() %>" class="secondary-content tooltipped" data-position="left" data-tooltip="Desvincular">
                                                <i class="material-icons">autorenew</i>
                                            </a>
                                        </div>
                                    </li>
                                    <%
                                        }
                                    %>
                                </ul>
                            </div>
                        </div>
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
                    $('.tooltipped').tooltip();
                });
                  
                $(".button-collapse").sideNav();
        </script>
    </body>
</html>
