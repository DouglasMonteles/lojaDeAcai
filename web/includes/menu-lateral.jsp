<%@page import="modelo.Menu"%>
<%@page  import="modelo.Usuario" %>

<%
    Usuario session_user = null;
    if (session.getAttribute("user_session") == null) {
        response.sendRedirect("index.jsp");
    } else {
    
    try {
            session_user = (Usuario) session.getAttribute("user_session");
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>

<div id="menu-lateral"><!-- navbar content here  --> 
       <ul class="collection with-header">
        <li class="collection-header">
            <h6>Usuário(a): <%= session_user.getNome() %></h6>
            <h6>Perfil: <%= session_user.getPerfil().getNome() %></h6>
        </li>
        <%
            for (Menu user_menu : session_user.getPerfil().getMenu()) {
        %>
        <a href="<%= user_menu.getLink() %>" class="collection-item waves-effect">
            <div><%= user_menu.getNome() %><span class="secondary-content"><i class="material-icons"><%= user_menu.getIcone() %></i></span></div>
        </a>
        <%
            }
        %>
      </ul>
</div>

<ul id="slide-out" class="sidenav">
    <li>
        <div class="user-view">
            <div class="background">
                <img src="img/officer.jpg">
            </div>
            
            <a href="#user">
                <img class="circle" src="img/user_default.png">
            </a>
            <a href="#name"><span class="black-text name"><%= session_user.getNome() %></span></a>
        </div>
    </li>
    
    <ul class="collection">
        <%
            for (Menu user_menu : session_user.getPerfil().getMenu()) {
        %>
        <a href="<%= user_menu.getLink() %>" class="collection-item waves-effect">
            <div><%= user_menu.getNome() %><span class="secondary-content"><i class="material-icons"><%= user_menu.getIcone() %></i></span></div>
        </a>
        <%
            }
        %>
    </ul>
</ul>

<%
    }
%>
