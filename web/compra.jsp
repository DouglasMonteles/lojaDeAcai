<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="modelo.ItemVenda"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Venda"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="modelo.ProdutoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Produto"%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Compra</title>
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

              <div id="left-menu" class="col s3">
                  <%@include file="includes/menu-lateral.jsp"%>
              </div>
              
              <%
                Venda v = new Venda();
                Cliente c = new Cliente();

                try {
                    String op = request.getParameter("op");

                    if ("n".equals(op)) {
                        int id = Integer.parseInt(request.getParameter("id"));
                        ClienteDAO cDAO = new ClienteDAO();
                        c = cDAO.carregarPorId(id);

                        v.setCliente(c);
                        v.setVendedor(session_user);
                        v.setCarrinho(new ArrayList<ItemVenda>());
                        
                        session.setAttribute("venda", v);
                    } else {
                        v = (Venda) session.getAttribute("venda");
                    }
                } catch (Exception e) {
                    out.print("Erro: " + e);
                }
            %>

              <div class="col s9">
                  <div class="row center-align card-panel grey darken-4 white-text">
                      <h5 style="margin: 0 auto">Catálogo de Produtos
                        <span class="right right-align">
                            <a class="waves-effect waves-light btn modal-trigger purple" href="finalizar_venda.jsp">
                                <i class="small material-icons">add_shopping_cart</i>
                            </a>
                        </span>
                    </h5>
                </div>
                  
                  <%  
                    DecimalFormat df = new DecimalFormat("R$ #,##0.00");
                    ArrayList<Produto> listProd = new ArrayList<Produto>();

                    try {
                        ProdutoDAO pDAO = new ProdutoDAO();
                        listProd = pDAO.listar();
                    } catch (Exception e) {
                        out.print("Erro: " + e);
                    }
                %>
                  
                  <div class="row">
                    <%
                        for (Produto p : listProd) {
                    %>
                    <div class="col s12 m4" style="margin: 5px auto">
                        <div class="card" style="height: 60%">
                            <div class="card-image">
                                <img src="<%= p.getImgPath() %>" width="100" height="200">
                                    <form action="gerenciar_carrinho.do" method="post">
                                        <input type="hidden" name="id_produto" value="<%= p.getId() %>">
                                        <input type="hidden" name="opc" value="add">
                                        <div class="row">
                                            <div class="input-field col m12">
                                                <input id="qtd" name="qtd" type="number" min="1" value="1" class="center validate" required>
                                                <label for="qtd" class="">Quantidade</label>
                                            </div>
                                        </div>
                                        <button class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">add</i></button>
                                    </form>
                            </div>
                            <div class="card-content">
                                <span class="card-title black-text"><%= p.getNome() %></span>
                                <p><%= p.getDescricao() %></p>
                                <p class="green-text right-align" style="font-weight: bold; font-size: 14pt"><%= df.format(p.getPreco()) %></p>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
              </div>
            </div>
        </main>
        
        <%@include file="includes/rodape.jsp" %>

        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="node_modules/materialize-css/dist/js/materialize.js" type="text/javascript"></script>
        <script>
                <%
                    if (request.getAttribute("message") != null) {
                %>
                    M.toast({
                        html: "<label>${message}</label>",
                        classes: "white black-text"
                    });
                <%   
                    }
                    request.setAttribute("message", null);
                %>
                $(".button-collapse").sideNav();
        </script>
    </body>
</html>
