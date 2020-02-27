<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ItemVenda"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.VendaDAO"%>
<%@page import="modelo.Venda"%>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/y à's' HH:mm:ss");
    DecimalFormat df = new DecimalFormat("R$ #,##0.00");
    
    ArrayList<ItemVenda> list = new ArrayList<ItemVenda>();
    Venda v = new Venda();
    
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        
        VendaDAO vDAO = new VendaDAO();
        v = vDAO.carregarPorId(id);
        list = vDAO.listarCarrinho(id);
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
            
            <div class="container" style="font-size: 9pt">
               <div class="row">
                    <ul class="collection with-header">
                        <li class="collection-header"><h4 class="center-align" style="font-size: 12pt">Good Açaí</h4></li>
                        <li class="collection-item"><div>Id da Venda:<span class="secondary-content"><%=  v.getId() %></span></div></li>
                        <li class="collection-item"><div>Data da Venda:<span class="secondary-content"><%=  sdf.format(v.getDataVenda()) %></span></div></li>
                        <li class="collection-item"><div>Data do Pagamento:<span class="secondary-content"><%=  sdf.format(v.getDataPagamento()) %></span></div></li>
                        <li class="collection-item"><div>Vendedor:<span class="secondary-content"><%=  v.getVendedor().getNome() %></span></div></li>
                        <li class="collection-item"><div>Cliente:<span class="secondary-content"><%=  v.getCliente().getNome() %></span></div></li>
                        <li class="collection-item"><div>Localização:<span class="secondary-content">Quadra 604 conjunto 02 casa 15 - Recanto das Emas, Brasília - DF, 72640-402</span></div></li>
                        <li class="collection-header"><h4 class="center-align" style="font-size: 12pt">Produtos</h4></li>
                        
                        <table class="collection-item responsive-table">
                            <thead>
                                <tr>
                                    <th>Produto</th>
                                    <th>Preço Unit.</th>
                                    <th>Qtd.</th>
                                    <th>Total Individual</th>
                                </tr>
                            </thead>

                            <tbody>
                                <%
                                    double total = 0.0;
                                    double totPagar = 0.0;
                                    
                                    for (ItemVenda iv : list) {
                                %>
                                <tr>
                                    <td><%= iv.getProduto().getNome() %></td>
                                    <td><%= df.format(iv.getProduto().getPreco()) %></td>
                                    <td><%= iv.getQtd() %></td>
                                    <td><%= df.format(total = iv.getValor() * iv.getQtd()) %></td>
                                </tr>
                                <%
                                        totPagar += total;
                                    }
                                %>
                            </tbody>
                        </table>
                        <li class="collection-item">
                            <div class="right-align" style="font-weight: bold; font-size: 16pt">Total a pago: <%= df.format(totPagar) %></div>
                        </li>
                    </ul>
               </div> 
                        
                <center><a href="#" style="margin-bottom: 10px" onClick="javascript:history.back()" class="btn orange waves-effect waves-light">voltar</a></center>
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
