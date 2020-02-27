package teste.paginacao;

import modelo.ProdutoDAO;

public class TestePaginacao {

    public static void main(String[] args) throws Exception {
        ProdutoDAO vDAO = new ProdutoDAO();
        
        System.out.println(vDAO.listarPorPaginacao(2, 0));
    }
    
}
