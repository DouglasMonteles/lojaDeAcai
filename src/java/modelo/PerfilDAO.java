package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PerfilDAO extends DataBaseDAO {
    private PreparedStatement st;
    private ResultSet rs;
    
    public Perfil carregarPorId(long id) throws Exception {
        Perfil p = new Perfil();
        this.conectar();
        String sql = "SELECT * FROM perfil WHERE id=?";
        st = con.prepareStatement(sql);
        st.setLong(1, id);
        rs = st.executeQuery();
        if (rs.next()) {
            p.setId(rs.getLong("id"));
            p.setNome(rs.getString("nome"));
            p.setDescricao(rs.getString("descricao"));
        }
        this.desconectar();
        return p;
    }
}
