package test;

import java.util.ArrayList;
import modelo.Cliente;
import modelo.ClienteDAO;
import modelo.ItemVenda;
import modelo.Produto;
import modelo.ProdutoDAO;
import modelo.Usuario;
import modelo.UsuarioDAO;
import modelo.Venda;
import modelo.VendaDAO;

public class Test {

    public static void main(String[] args) throws Exception {
        Cliente c = new Cliente();
        c.setId(2);
        ClienteDAO cDAO = new ClienteDAO();
        
        Usuario u = new Usuario();
        u.setId(1);
        UsuarioDAO uDAO = new UsuarioDAO();
        
        Produto p = new Produto();
        p.setId(17);
        ProdutoDAO pDAO = new ProdutoDAO();
        
        ItemVenda iv = new ItemVenda();
        iv.setId(5);
        iv.setProduto(p);
        
        Venda v = new Venda();
        v.setCliente(c);
        v.setVendedor(u);
        ArrayList<ItemVenda> i = new ArrayList<ItemVenda>();
        i.add(iv);
        v.setCarrinho(i);
        VendaDAO vDAO = new VendaDAO();
        
        
        System.out.println(vDAO.registar(v));
    }
    
}
