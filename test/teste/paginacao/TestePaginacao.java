package teste.paginacao;

import modelo.VendaDAO;

public class TestePaginacao {

    public static void main(String[] args) throws Exception {
        VendaDAO vDAO = new VendaDAO();
        
        System.out.println(vDAO.listarPorPaginação(5, 6));
    }
    
}
