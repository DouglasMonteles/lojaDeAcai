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
            <div class="row">
                <form class="col s12" action="gerenciar_produto.do" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="tipo" value="inserir">
                    <input type="hidden" name="id" value="0">
                    <div class="row">
                        <div class="input-field col s12">
                          <input id="nome" name="nome" type="text" class="validate white-text" required>
                          <label for="nome" class="">Nome</label>
                        </div>
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
          </div>
        </main>
        
        <%@include file="includes/rodape.jsp" %>
        
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="node_modules/materialize-css/dist/js/materialize.js" type="text/javascript"></script>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.maskMoney.js"></script>
        
        <script>
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
