package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario;
import modelo.UsuarioDAO;

public class GerenciarUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarUsuario</title>");            
            out.println("</head>");
            out.println("<body>");
            
            try {
                String tipo = request.getParameter("type");
                Usuario u = new Usuario();
                UsuarioDAO uDAO = new UsuarioDAO();
                HttpSession session = request.getSession();
                
                switch(tipo) {
                    case "login": 
                        String login = request.getParameter("login");
                        String psw = request.getParameter("password");
                        
                        u = uDAO.login(login, psw);
                        
                        if ( u.getId() > 0 ) {
                            session.setAttribute("user_session", u);
                            response.sendRedirect("administracao.jsp");
                        } else {
                            out.print("<script>"
                                    + "alert('Usuário ou senha incorretos! Tente novamente');"
                                    + "location.href='index.jsp'"
                                    + "</script>");
                        }
                    ;break;
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
