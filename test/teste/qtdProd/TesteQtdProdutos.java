package teste.qtdProd;

import modelo.ProdutoDAO;

public class TesteQtdProdutos {

    public static void main(String[] args) throws Exception {
        ProdutoDAO pDAO = new ProdutoDAO();
        
        System.out.println(pDAO.qtdProdutos());
    }
    
}
