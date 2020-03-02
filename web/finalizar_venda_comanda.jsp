<%@page import="modelo.VendaComandaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ItemVendaComanda"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="modelo.Produto"%>
<%@page import="modelo.VendaComanda"%>
<%
    DecimalFormat df = new DecimalFormat("R$ #,##0.00");
    
    VendaComanda v = new VendaComanda();
    Produto p = new Produto();
    
    ArrayList<ItemVendaComanda> list = new ArrayList<ItemVendaComanda>();
    
    int id = Integer.parseInt(request.getParameter("id"));
    
    try {            
        VendaComandaDAO vDAO = new VendaComandaDAO();
        list = vDAO.listarCarrinho(id);
        
        v = (VendaComanda) session.getAttribute("venda_comanda");
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Finalização da Venda por Comanda</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="node_modules/materialize-css/dist/css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        
        <script> 
            function verificaCarrinho(totalPagar, id) {
                if (totalPagar !== 0.0) {
                    location.href="finalizar_venda_comanda.do?comanda="+id;
                } else {
                    alert('Carrinho vazio! Efetue alguma compra');
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
                      <h5 style="margin: 0 auto">Produtos
                          <span class="left left-align">
                              <a class="waves-effect waves-light btn modal-trigger purple" href="javascript:history.back()">
                                  <i class="small material-icons">arrow_back</i>
                              </a>
                          </span>
                      </h5>
                    </div>
                <table class="highlight z-depth-5 grey lighten-5 rounded">
                    <thead class="black lighten-3 white-text">
                        <tr>
                          <th>#</th>
                          <th>Produto</th>
                          <th>Qtd</th>
                          <th>Valor Unit.</th>
                          <th>Valor Total</th>
                          <th class="center-align">Opções</th>
                      </tr>
                    </thead>

                    <tbody>
                      
                        <%
                            int cont = 0;
                            double valorTotal = 0.0;
                            double totalPagar = 0.0;
                            
                            for(ItemVendaComanda iv : list) {
                        %>
                            <tr>
                                <!--<td><img width="80" height="50" src="<%-- itens.getImgPath() --%>"></td>-->
                                <td><%= cont + 1 %></td>
                                <td><%= iv.getProduto().getNome() %></td>
                                <td><%= iv.getQtd() %></td>
                                <td><%= df.format(iv.getValor()) %></td>
                                <td><%= df.format(valorTotal = iv.getValor() * iv.getQtd()) %></td>
                                <td class="center-align">
                                    <a class="modal-trigger waves-effect waves-light btn modal-trigger orange" href="gerenciar_carrinho_comanda.do?opc=del&id=<%= iv.getId() %>&comanda=<%= iv.getComanda() %>">
                                        <i class="small material-icons">remove_circle</i>
                                    </a>
                                </td>
                            </tr>
                        <%
                                totalPagar += valorTotal; 
                                cont++;
                            }
                        %>
                        <tr>
                            <td>
                                <a class="modal-trigger waves-effect waves-light btn modal-trigger red" href="gerenciar_carrinho_comanda.do?opc=cancel&comanda=<%= id %>">
                                    Cancelar
                                </a>
                            </td>
                            <td>
                                <a class="modal-trigger waves-effect waves-light btn modal-trigger green" href="javascript:history.back()">
                                    Continuar Comprando
                                </a>
                            </td>
                            <td>
                                <a class="modal-trigger waves-effect waves-light btn modal-trigger blue" href="#" onclick="verificaCarrinho(<%= totalPagar %>, <%= id %>)">
                                    Finalizar Venda
                                </a>
                            </td>
                            <td class="right-align" style="font-weight: bold">Total a Pagar: </td>
                            <td class="green-text center-align" style="font-size: 18pt; font-weight: bold"><%= df.format(totalPagar) %></td>
                        </tr>
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
