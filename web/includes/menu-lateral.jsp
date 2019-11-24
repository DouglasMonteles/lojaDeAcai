<%@page import="modelo.MenuDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Menu"%>
<%
    ArrayList<Menu> listMenu = new ArrayList<Menu>();
    try {
            MenuDAO mDAO = new MenuDAO();
            listMenu = mDAO.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>
<div class="collection">
    <%
        for(Menu m : listMenu) {
    %>
        <a href="<%= m.getLink() %>" class="collection-item waves-effect waves-purple"><%= m.getNome() %></a>
    <%
        }
    %>
</div>