<%@page import="modelo.ItemVenda"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="modelo.Produto"%>
<%@page import="modelo.Venda"%>
<%
    DecimalFormat df = new DecimalFormat("R$ #,##0.00");
    
    Venda v = new Venda();
    Produto p = new Produto();
    
    try {
        v = (Venda) session.getAttribute("venda");
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Finalização da Venda</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="node_modules/materialize-css/dist/css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        
        <script> 
            function verificaCarrinho(totalPagar) {
                if (totalPagar !== 0.0) {
                    location.href="finalizar_venda.do";
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

              <div class="col s9">
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
                            
                            for(ItemVenda iv : v.getCarrinho()) {
                        %>
                            <tr>
                                <!--<td><img width="80" height="50" src="<%-- itens.getImgPath() --%>"></td>-->
                                <td><%= cont + 1 %></td>
                                <td><%= iv.getProduto().getNome() %></td>
                                <td><%= iv.getQtd() %></td>
                                <td><%= df.format(iv.getValor()) %></td>
                                <td><%= df.format(valorTotal = iv.getValor() * iv.getQtd()) %></td>
                                <td class="center-align">
                                    <a class="modal-trigger waves-effect waves-light btn modal-trigger orange" href="gerenciar_carrinho.do?opc=del&index=<%= cont %>">
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
                                <a class="modal-trigger waves-effect waves-light btn modal-trigger red" href="cliente.jsp">
                                    Cancelar
                                </a>
                            </td>
                            <td>
                                <a class="modal-trigger waves-effect waves-light btn modal-trigger green" href="compra.jsp?op=c">
                                    Continuar Comprando
                                </a>
                            </td>
                            <td>
                                <a class="modal-trigger waves-effect waves-light btn modal-trigger blue" href="#" onclick="verificaCarrinho(<%= totalPagar %>)">
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
