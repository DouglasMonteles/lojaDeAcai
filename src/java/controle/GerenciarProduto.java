package controle;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Produto;
import modelo.ProdutoDAO;
import modelo.TipoProduto;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class GerenciarProduto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarProduto</title>");            
            out.println("</head>");
            out.println("<body>");
            request.setCharacterEncoding("UTF-8");
            try {
                Produto p = new Produto();
                ProdutoDAO pDAO = new ProdutoDAO();
                
                if (ServletFileUpload.isMultipartContent(request)) {
                    try {
                        List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                        
                        int id = 0;
                        String tipo = "";
                        String nome = "";
                        String desc = "";
                        double preco = 0.0;
                        String imgName = "";
                        int id_tipo = 0;
                        
                        for (FileItem item : multiparts) {
                            if (!item.isFormField()) {
                                    item.write( new File(request.getServletContext().getRealPath("img") + File.separator + nome.trim()));
                            } else {  
                                switch (item.getFieldName()) {
                                    case "tipo":
                                        tipo = item.getString();
                                        break;
                                    case "id":
                                        id = Integer.parseInt(item.getString());
                                        break;
                                    case "nome":
                                        nome = item.getString();
                                        break;
                                    case "descricao":
                                        desc = item.getString();
                                        break;
                                    case "preco":
                                        preco = Double.parseDouble(item.getString());
                                        break;
                                    case "img_name":
                                        imgName = item.getString();
                                        break;
                                    case "id_tipo":
                                        id_tipo = Integer.parseInt(item.getString());
                                        break;
                                }
                            }
                        }
                        
                        p.setNome(nome);
                        p.setDescricao(desc);
                        p.setPreco(preco);
                        p.setImgPath("img/" + nome);
                        
                        TipoProduto tp = new TipoProduto();
                        tp.setId(id_tipo);
                        
                        p.setTipoProduto(tp);
                        
                         switch(tipo) {
                            case "inserir":
                                if (pDAO.inserir(p) == 1) { 
                                    out.print("<script>alert('Produto inserido!'); location.href='produto.jsp'</script>");
                                } else {
                                    out.print("<script>alert('Erro ao inserir produto! Tente novamente'); location.href='inserir_produto.jsp'</script>");
                                }
                                ;break;

                            case "alterar":
                                p.setId(id);

                                if (pDAO.alterar(p) == 1) {
                                    out.print("<script>alert('Produto alterado'); location.href='produto.jsp?pag=1'</script>");
                                } else {
                                    out.print("<script>alert('Erro ao alterar produto! Tente novamente'); location.href='alterar_produto.jsp?id="+ id +"'</script>");
                                }

                                ;break;
                            }
                        } catch (Exception ex) {
                            out.println("Erro ao gravar arquivo:" + ex.getMessage());
                        }        
                    } else {
                        String tipo = request.getParameter("tipo");
                        int id = Integer.parseInt(request.getParameter("id"));

                        if ("excluir".equals(tipo)) {
                            if (pDAO.excluir(id) == 1) {
                                out.print("<script>alert('Produto excluido'); location.href='produto.jsp?pag=1'</script>");
                            } else {
                                out.print("<script>alert('Erro ao excluir produto! Tente novamente'); location.href='produto.jsp?pag=1'</script>");
                            } 
                        }
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
