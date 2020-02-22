<%@page import="modelo.TipoProdutoDAO"%>
<%@page import="modelo.TipoProduto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ProdutoDAO"%>
<%@page import="modelo.Produto"%>
<%
    Produto p = new Produto();
    ArrayList<TipoProduto> list = new ArrayList<TipoProduto>();
    
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        ProdutoDAO pDAO = new ProdutoDAO();
        p = pDAO.carregarPorId(id);

        TipoProdutoDAO tpDAO = new TipoProdutoDAO();
        list = tpDAO.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Alterar Produto</title>
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

            <div class="col s12 m9 grey darken-4">
                <div class="row center-align card-panel grey darken-1white-text">
                      <h5 style="margin: 0 auto">Alterar Produto</h5>
                </div>
            
            <div class="container">
            <div class="row">
                <form class="col s12" action="gerenciar_produto.do" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="tipo" value="alterar">
                    <input type="hidden" name="id" value="<%= p.getId() %>">
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="nome" name="nome" type="text" value="<%= p.getNome() %>" class="validate white-text" required>
                          <label for="nome" class="">Nome</label>
                        </div>
                          
                        <div class="input-field col s6">
                            <select name="id_tipo">
                                <option value="" disabled selected>Escolha</option>
                                <%
                                    String selected;
                                    
                                    for (TipoProduto tp : list) {
                                    
                                    if (p.getTipoProduto().getId() == tp.getId()) {
                                        selected = "selected";
                                    } else {
                                        selected = "";
                                    }
                                %>
                                <option <%= selected %> value="<%= tp.getId() %>"><%= tp.getNome() %></option>
                                <%
                                    }
                                %>
                            </select>
                            <label>Tipo</label>
                        </div>
                    </div>

                      <div class="row">
                          <div class="input-field col s12">
                              <input id="desc" name="descricao" value="<%= p.getDescricao() %>" type="text" class="validate white-text">
                              <label for="desc">Descrição</label>
                            </div>
                      </div>
                    
                    <div class="row">
                          <div class="input-field col s3">
                              <input id="preco" name="preco" type="text" min="0" max="999" step="0.01" value="<%= p.getPreco() %>" class="validate white-text">
                              <label for="preco">Preço (R$)</label>
                            </div>
                        
                            <div class="file-field input-field col s9">
                                <div class="btn">
                                    <span>Imagem</span>
                                    <input type="file" name="img" multiple required>
                                </div>
                                    <div class="file-path-wrapper">
                                        <input class="file-path validate white-text" name="img_name" type="text" placeholder="nome do arquivo" value="">
                                    </div>
                            </div>
                      </div>
                              
                        <div class="container">
                            <div class="row center-align">
                                <img class="materialboxed" width="450" src="<%= p.getImgPath() %>">
                            </div>
                        </div>

                      <div class="row right-align">
                            <button class="btn waves-effect waves-light" type="submit" name="action">Alterar Produto
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
        
         <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
        <script src="js/jquery.maskMoney.js"></script>
        
        <script>
            $(document).ready(function(){
                $('select').formSelect();
                $('.modal').modal();
              });
              
            $(function(){
                $("#preco").maskMoney({
                    symbol: 'R$ ', 
                    showSymbol: false, 
                    thousands: '', 
                    decimal: '.', 
                    symbolStay: true
                });
            });
        </script>
        
    </body>
</html>
