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
import modelo.Produto;
import modelo.ProdutoDAO;
import modelo.Venda;

public class GerenciarCarrinho extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarCarrinho</title>");            
            out.println("</head>");
            out.println("<body>");
            
            request.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            
            try {
                String opc = request.getParameter("opc");
                
                Venda v = (Venda) session.getAttribute("venda");
                ArrayList<ItemVenda> carrinho = v.getCarrinho();
                
                Produto p = new Produto();
                ProdutoDAO pDAO = new ProdutoDAO();
                
                switch(opc) {
                    case "add":
                        int id_produto = Integer.parseInt(request.getParameter("id_produto"));
                        int qtd = Integer.parseInt(request.getParameter("qtd"));
                        p = pDAO.carregarPorId(id_produto);
                        
                        ItemVenda iv = new ItemVenda();
                        iv.setQtd(qtd);
                        iv.setValor(p.getPreco());
                        iv.setProduto(p);
                        carrinho.add(iv);
                        v.setCarrinho(carrinho);
                        
                        session.setAttribute("venda", v);
                        
                        if (iv.getQtd() == 1) {
                            request.setAttribute("message", iv.getQtd() + " " + p.getNome() + " foi adicionado!");
                        } else {
                            request.setAttribute("message", iv.getQtd() + " " + p.getNome() + "(s) foram adicionados!");
                        }
                       request.getRequestDispatcher("compra.jsp?op=c").forward(request, response);
                        break;
                        
                    case "del":
                        int index = Integer.parseInt(request.getParameter("index"));
                        carrinho.remove(index);
                        v.setCarrinho(carrinho);
                        session.setAttribute("venda", v);
                        response.sendRedirect("finalizar_venda.jsp");
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
