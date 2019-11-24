package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsuarioDAO extends DataBaseDAO{
    private PreparedStatement st;
    private ResultSet rs;
    private PerfilDAO pDAO = new PerfilDAO();
    
    public Usuario login(String login, String psw) throws Exception {
        Usuario u = new Usuario();
        this.conectar();
        String sql = "SELECT * FROM usuario WHERE login=?";
        st = con.prepareStatement(sql);
        st.setString(1, login);
        rs = st.executeQuery();
        if (rs.next()) {
            if (rs.getString("senha").equals(psw)) {
                u.setId(rs.getLong("id"));
                u.setNome(rs.getString("nome"));
                u.setLogin(rs.getString("login"));
                u.setPerfil(pDAO.carregarPorId(rs.getLong("id_perfil")));
            }
        }
        this.desconectar();
        return u;
    }
}
