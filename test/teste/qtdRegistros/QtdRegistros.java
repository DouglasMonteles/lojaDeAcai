package teste.qtdRegistros;

import modelo.VendaDAO;

public class QtdRegistros {

    public static void main(String[] args) throws Exception {
        VendaDAO vDAO = new VendaDAO();
        
        double qtd = 1.3;
        
        System.out.println(Math.ceil(qtd));
        
       // System.out.println(vDAO.qtdVendas());
    }
    
}
