/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import modelo.Produto;
import modelo.ProdutoDAO;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class Test {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        // TODO code application logic here
        ProdutoDAO pDAO = new ProdutoDAO();
        Produto p = new Produto();
        p.setId(17);
        p.setNome("teste no id 17 de novo");
        p.setDescricao("desc");
        p.setPreco(12.0);
        p.setImgPath("img/teste");
        System.out.println(pDAO.alterar(p));
        
        
    }
    
}
