package teste.registarComanda;

import modelo.ItemVendaComanda;
import modelo.Produto;
import modelo.VendaComandaDAO;

public class RegistrarComanda {

    public static void main(String[] args) throws Exception {
        ItemVendaComanda i = new ItemVendaComanda();
        
        i.setQtd(12);
        i.setValor(12.0);
        Produto p = new Produto();
        p.setId(2);
        i.setProduto(p);
        
        VendaComandaDAO vDAO = new VendaComandaDAO();
        
        System.out.println(vDAO.registarComanda(i));
    }
    
}
