package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.ItemVenda;
import modelo.ItemVendaComanda;
import modelo.Produto;
import modelo.ProdutoDAO;
import modelo.VendaComanda;
import modelo.VendaComandaDAO;

public class GerenciarCarrinhoComanda extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarCarrinhoComanda</title>");            
            out.println("</head>");
            out.println("<body>");
            
            HttpSession session = request.getSession();
            
            try {
                String opc = request.getParameter("opc");
                
                VendaComanda v = (VendaComanda) session.getAttribute("venda_comanda");
                ArrayList<ItemVendaComanda> carrinho = v.getCarrinho();
                
                Produto p = new Produto();
                ProdutoDAO pDAO = new ProdutoDAO();
                
                VendaComandaDAO vDAO = new VendaComandaDAO();
                
                switch(opc) {
                    case "add":
                        int id;
                        int id_produto = Integer.parseInt(request.getParameter("id_produto"));
                        int qtd = Integer.parseInt(request.getParameter("qtd"));
                        int comanda = Integer.parseInt(request.getParameter("comanda"));
                        p = pDAO.carregarPorId(id_produto);
                        
                        ItemVendaComanda iv = new ItemVendaComanda();
                        iv.setQtd(qtd);
                        iv.setValor(p.getPreco());
                        iv.setProduto(p);
                        iv.setComanda(comanda);
                        
                        id = vDAO.registarComanda(iv);
                        
                        session.setAttribute("venda_comanda", v);
                        session.setAttribute("id_comanda", id);
                        
                        request.setAttribute("message", iv.getQtd() + " " + p.getNome() + " no carrinho!");
                        
                        request.getRequestDispatcher("compra_comanda.jsp?op=c&id="+comanda).forward(request, response);
                        break;
                        
                    case "del":
                        int id_prod = Integer.parseInt(request.getParameter("id"));
                        int comand = Integer.parseInt(request.getParameter("comanda"));
                        vDAO.excluir(id_prod);
                        response.sendRedirect("finalizar_venda_comanda.jsp?id="+comand);
                        break;
                        
                    case "cancel":
                        int c = Integer.parseInt(request.getParameter("comanda"));
                        vDAO.cancelar(c);
                        response.sendRedirect("comanda.jsp");
                        break;
                }
            } catch (Exception e) {
                out.print("Erro: " + e);
            }
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
