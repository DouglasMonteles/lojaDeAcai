package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Menu;
import modelo.MenuDAO;

public class GerenciarMenu extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarMenu</title>");            
            out.println("</head>");
            out.println("<body>");
            response.setCharacterEncoding("UTF-8");
            try {
                String tipo = request.getParameter("tipo");
                int id = Integer.parseInt(request.getParameter("id"));
                String nome = request.getParameter("nome");
                String link = request.getParameter("link");
                String icone = request.getParameter("icone");
                Menu m = new Menu();
                MenuDAO mDAO = new MenuDAO();
                
                if("excluir".equals(tipo)) {
                    if(mDAO.excluir(id) == 1) {
                        out.print("<script>alert('Menu excluido!'); location.href='menu.jsp'</script>");
                    }
                } else {
                    out.print("<script>alert('Erro ao excluir o menu'); location.href='excluir_menu.jsp?id='"+id+"</script>");
                }
                
                m.setId(id);
                m.setNome(nome);
                m.setLink(link);
                m.setIcone(icone);
                
                switch(tipo) {
                    case "inserir":
                        if(mDAO.inserir(m) == 1){
                            out.print("<script>alert('Menu inserido!'); location.href='menu.jsp'</script>");
                        } else {
                            out.print("<script>alert('Erro ao cadastrar menu')</script>");
                        }
                    ;break;
                    case "alterar":
                         if(mDAO.alterar(m) == 1){
                            out.print("<script>alert('Menu alterado!'); location.href='menu.jsp'</script>");
                        } else {
                            out.print("<script>alert('Erro ao alterar menu! Tente novamente'); "
                                    + "location.href='alterar_menu.jsp?id="+id+"'</script>");                        
                         }
                    ;break;
                    case "excluir":
                         if(mDAO.excluir(id) == 1){
                            m.setId(id);
                            out.print("<script>alert('Menu excluir!'); location.href='menu.jsp'</script>");
                        } else {
                            out.print("<script>alert('Erro ao excluir menu'); location.href = 'menu.jsp'</script>");
                        }
                    ;break;
                }
            } catch (Exception e) {
                System.out.println("Erro: "+e);
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
