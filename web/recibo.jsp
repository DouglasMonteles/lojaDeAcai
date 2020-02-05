<%@page import="modelo.VendaDAO"%>
<%@page import="modelo.Venda"%>
<%
    Venda v = new Venda();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        
        VendaDAO vDAO = new VendaDAO();
        v = vDAO.carregarPorId(id);
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Recibo</title>
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
            <div class="container">
               <div class="row">
                    <ul class="collection with-header">
                        <li class="collection-header"><h4>Good Açaí</h4></li>
                        <li class="collection-item"><div>Alvin<span class="secondary-content">Texto</span></div></li>
                    </ul>
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
