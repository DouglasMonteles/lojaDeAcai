package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Comanda;
import modelo.ComandaDAO;

public class GerenciarComanda extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarComanda</title>");            
            out.println("</head>");
            out.println("<body>");
            
            try {
                String tipo = request.getParameter("tipo");
                int nome = (request.getParameter("comanda") != null) ? Integer.parseInt(request.getParameter("comanda")) : 0;
                int id = (request.getParameter("id") != null) ? Integer.parseInt(request.getParameter("id")) : 0;
                
                ComandaDAO cDAO = new ComandaDAO();
                
                Comanda verif = cDAO.carregarPorNome(nome);
                
                Comanda c = new Comanda();
                
                if (verif.getId() > 0 && verif.getStatus().equals("ativo")) {
                    out.print("<script>alert('Comanda N° " + nome + " já cadastrada!'); location.href='comanda.jsp'</script>");
                } else {
                    c.setNome(nome);
                    
                    switch(tipo) {
                        case "inserir":
                            cDAO.inserir(c);
                        break;

                        case "alterar":
                            c.setId(id);
                            cDAO.alterar(c);
                        break;

                        case "excluir":
                            cDAO.excluir(id);
                        break;
                    }
                    response.sendRedirect("comanda.jsp");
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
