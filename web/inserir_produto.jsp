<%@page import="modelo.TipoProdutoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.TipoProduto"%>
<%
    ArrayList<TipoProduto> list = new ArrayList<TipoProduto>();
    
    try {
        TipoProdutoDAO tpDAO = new TipoProdutoDAO();
        list = tpDAO.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Inserir Produto</title>
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
                      <h5 style="margin: 0 auto">Inserir Produto</h5>
                </div>
            
            <div class="container">
            
                <form class="col s12" action="gerenciar_produto.do" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="tipo" value="inserir">
                    <input type="hidden" name="id" value="0">
                    <div class="row">
                        <div class="input-field col s6">
                          <input id="nome" name="nome" type="text" class="validate white-text" required>
                          <label for="nome" class="">Nome</label>
                        </div>
                        
                        <div class="input-field col s5">
                            <select name="id_tipo">
                                <option value="" disabled selected>Escolha</option>
                                <%
                                    for (TipoProduto tp : list) {
                                %>
                                <option value="<%= tp.getId() %>"><%= tp.getNome() %></option>
                                <%
                                    }
                                %>
                            </select>
                            <label>Tipo</label>
                        </div>
                            
                        <div class="input-field col s1">
                            <a href="#form_tp" class="btn waves-effect waves-light orange rounded modal-trigger">Outro</a>
                        </div>

                      <div class="row">
                          <div class="input-field col s12">
                              <input id="desc" name="descricao" type="text" class="validate white-text" required>
                              <label for="desc">Descrição</label>
                            </div>
                      </div>
                    
                    <div class="row">
                          <div class="input-field col s3">
                              <input id="preco" name="preco" type="text" min="0" max="999" step="0.01" value="0,00" class="validate white-text" required>
                              <label for="preco">Preço (R$)</label>
                            </div>
                        
                            <div class="file-field input-field col s9">
                                <div class="btn">
                                    <span>Imagem</span>
                                    <input type="file" name="img" required>
                                </div>
                                    <div class="file-path-wrapper">
                                        <input class="file-path validate" type="text" placeholder="nome do arquivo">
                                    </div>
                            </div>
                      </div>

                      <div class="row right-align">
                            <button class="btn waves-effect waves-light" type="submit" name="action">Inserir Produto
                              <i class="material-icons right">send</i>
                            </button>
                      </div>
                  </form>
              </div>
            
            </div>
          </div>
        </main>
                            
        <!-- Modal Structure -->
        <div id="form_tp" class="modal">
          <div class="modal-content">
            <h4 class="center-align">Cadastro de Novo Tipo de Produto</h4>
            <div class="container center-block">
                <div class="row">
                    <form class="col s12" method="post" action="gerenciar_tipo_produto.do">
                      <div class="row">
                        <div class="input-field col s12">
                            <input id="tp" name="tipo_prod" type="text" class="validate" required>
                            <label for="tp">Tipo de Produto</label>
                          </div>
                      </div>
                    <div class="row right-align">
                        <button type="submit" class="right-align waves-effect btn">Cadastrar</button>
                    </div>
                    </form>
                </div>
            </div>
          <div class="modal-footer">
              <a href="#!" class="modal-close waves-effect btn-flat red">Fechar</a>
          </div>
        </div>
    </div>
        
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
        
        <script>
                $(".button-collapse").sideNav();
        </script>
    </body>
</html>
