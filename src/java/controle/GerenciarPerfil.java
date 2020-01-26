package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Perfil;
import modelo.PerfilDAO;

public class GerenciarPerfil extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarPerfil</title>");            
            out.println("</head>");
            out.println("<body>");
            request.setCharacterEncoding("UTF-8");
            try {
                String tipo = request.getParameter("tipo");
                String nome = request.getParameter("nome");
                String desc = request.getParameter("descricao");
                int id = Integer.parseInt(request.getParameter("id"));
                
                Perfil p = new Perfil();
                PerfilDAO pDAO = new PerfilDAO();
                
                p.setNome(nome);
                p.setDescricao(desc);
                
                switch(tipo) {
                    case "inserir":
                        if (pDAO.inserir(p) == 1) {
                            out.print("<script>alert('Perfil Cadastrado!'); location.href='perfil.jsp'</script>");
                        } else {
                            out.print("<script>alert('Erro ao cadastrar perfil, Tente novamente!'); location.href='inserir_perfil.jsp'</script>");
                        }
                        ;break;
                    case "alterar": 
                        p.setId(id);
                        if (pDAO.alterar(p) == 1) {
                            out.print("<script>alert('Perfil Alterado!'); location.href='perfil.jsp'</script>");
                        } else {
                            out.print("<script>alert('Erro ao alterar perfil, Tente novamente!'); location.href='alterar_perfil.jsp?id=" + id + "'</script>");
                        }
                        ;break;
                    case "excluir":
                        if (pDAO.excluir(id) == 1) {
                            out.print("<script>alert('Perfil Excluido!'); location.href='perfil.jsp'</script>");
                        } else {
                            out.print("<script>alert('Erro ao excluir perfil, Tente novamente!'); location.href='perfil.jsp'</script>");
                        }
                        ;break;
                    default:
                         out.print("<script>alert('Ocorreu um erro insperado! Tente novamente'); location.href='perfil.jsp'</script>");
                }
            } catch (Exception e) {
                out.print("Erro: " + e.getMessage());
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
