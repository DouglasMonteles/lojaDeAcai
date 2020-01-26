package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;
import modelo.ClienteDAO;

public class GerenciarCliente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarCliente</title>");            
            out.println("</head>");
            out.println("<body>");
            
            try {
   
                int id = Integer.parseInt(request.getParameter("id"));
                String tipo = request.getParameter("tipo");
                String nome = request.getParameter("nome");
                String tel_contato = request.getParameter("tel_contato");
                
                Cliente c = new Cliente();
                ClienteDAO cDAO = new ClienteDAO();
                c.setNome(nome);
                c.setTelContato(tel_contato);
                
                switch(tipo) {
                    case "inserir":
                        
                        if (cDAO.inserir(c) == 1) {
                            out.print("<script> alert('Cliente inserido!'); location.href='cliente.jsp' </script>");
                        } else {
                            out.print("<script> alert('Erro ao inserir cliente'); location.href='inserir_cliente.jsp' </script>");
                        }
                        
                        break;
                        
                    case "alterar":
                        c.setId(id);
                        
                        if (cDAO.alterar(c) == 1) {
                            out.print("<script> alert('Cliente alterado!'); location.href='cliente.jsp' </script>");
                        } else {
                            out.print("<script> alert('Erro ao alterar cliente'); location.href='alterar_cliente.jsp?id=" + id + "' </script>");
                        }
                        
                        break;
                        
                    case "excluir":
                        
                        if (cDAO.excluir(id) == 1) {
                            out.print("<script> alert('Cliente excluido!'); location.href='cliente.jsp' </script>");
                        } else {
                            out.print("<script> alert('Erro ao excluir cliente'); location.href='cliente.jsp</script>");
                        }
                        
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
