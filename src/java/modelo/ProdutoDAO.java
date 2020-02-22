package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProdutoDAO extends DataBaseDAO {
    TipoProdutoDAO tpDAO = new TipoProdutoDAO();
    private PreparedStatement st;
    private ResultSet rs;
    
    public ArrayList<Produto> listar() throws Exception {
        ArrayList<Produto> list = new ArrayList<Produto>();
        this.conectar();
        String sql = "SELECT * FROM produto ORDER BY nome";
        st = con.prepareStatement(sql);
        rs = st.executeQuery();
        while (rs.next()) {
            Produto p = new Produto();
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setDescricao(rs.getString("descricao"));
            p.setImgPath(rs.getString("img_path"));
            p.setPreco(rs.getDouble("preco"));
            p.setTipoProduto(tpDAO.carregarPorId(rs.getInt("tipo_produto_id")));
            list.add(p);
        }
        this.desconectar();
        return list;
    }
    
    public Produto carregarPorId(int id) throws Exception {
        Produto p = new Produto();
        this.conectar();
        String sql = "SELECT * FROM produto WHERE id=?";
        st = con.prepareStatement(sql);
        st.setInt(1, id);
        rs = st.executeQuery();
        if (rs.next()) {
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setDescricao(rs.getString("descricao"));
            p.setImgPath(rs.getString("img_path"));
            p.setPreco(rs.getDouble("preco"));
            p.setTipoProduto(tpDAO.carregarPorId(rs.getInt("tipo_produto_id")));
        }
        this.desconectar();
        return p;
    }
    
    public int inserir(Produto p) throws Exception {
        int ret;
        this.conectar();
        String sql = "INSERT INTO produto (nome, descricao, preco, img_path, tipo_produto_id) VALUES (?, ?, ?, ?, ?)";
        st = con.prepareStatement(sql);
        st.setString(1, p.getNome());
        st.setString(2, p.getDescricao());
        st.setDouble(3, p.getPreco());
        st.setString(4, p.getImgPath());
        st.setInt(5, p.getTipoProduto().getId());
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
    
     public int alterar(Produto p) throws Exception {
        int ret;
        this.conectar();
        String sql = "UPDATE produto SET nome=?, descricao=?, preco=?, img_path=?, tipo_produto_id=? WHERE id=?";
        st = con.prepareStatement(sql);
        st.setString(1, p.getNome());
        st.setString(2, p.getDescricao());
        st.setDouble(3, p.getPreco());
        st.setString(4, p.getImgPath());
        st.setInt(5, p.getTipoProduto().getId());
        st.setInt(6, p.getId());
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
     
     public int excluir(int id) throws Exception {
         int ret;
         this.conectar();
         String sql = "DELETE FROM produto WHERE id=?";
         st = con.prepareStatement(sql);
         st.setInt(1, id);
         ret = st.executeUpdate();
         this.desconectar();
         return ret;
     }
}
