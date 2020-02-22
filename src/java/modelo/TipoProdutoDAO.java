package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class TipoProdutoDAO extends DataBaseDAO {
    PreparedStatement st;
    ResultSet rs;
    
    public ArrayList<TipoProduto> listar() throws Exception {
        ArrayList<TipoProduto> list = new ArrayList<TipoProduto>();
        this.conectar();
        String sql = "SELECT * FROM tipo_produto ORDER BY nome";
        st = con.prepareStatement(sql);
        rs = st.executeQuery();
        while (rs.next()) {
            TipoProduto tp = new TipoProduto();
            tp.setId(rs.getInt("id"));
            tp.setNome(rs.getString("nome"));
            list.add(tp);
        }
        this.desconectar();
        return list;
    }
    
    public TipoProduto carregarPorId(int id) throws Exception {
        TipoProduto tp = new TipoProduto();
        this.conectar();
        String sql = "SELECT * FROM tipo_produto WHERE id = ?";
        st = con.prepareStatement(sql);
        st.setInt(1, id);
        rs = st.executeQuery();
        if (rs.next()) {
            tp.setId(rs.getInt("id"));
            tp.setNome(rs.getString("nome"));
        }
        this.desconectar();
        return tp;
    }
    
    public int inserir(TipoProduto tp) throws Exception {
        int ret;
        this.conectar();
        String sql = "INSERT INTO tipo_produto (nome) VALUES (?)";
        st = con.prepareStatement(sql);
        st.setString(1, tp.getNome());
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
}
