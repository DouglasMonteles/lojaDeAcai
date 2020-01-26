<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    session.getAttribute("user_session");
    session.removeAttribute("user_session");
    
    response.sendRedirect("index.jsp");

%>