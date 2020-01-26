package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UsuarioDAO extends DataBaseDAO{
    private PreparedStatement st;
    private ResultSet rs;
    private PerfilDAO pDAO = new PerfilDAO();
    
    public ArrayList<Usuario> listar() throws Exception {
        ArrayList<Usuario> listUser = new ArrayList<Usuario>();
        this.conectar();
        String sql = "SELECT * FROM usuario";
        st = con.prepareStatement(sql);
        rs = st.executeQuery();
        while (rs.next()) {
            Usuario u = new Usuario();
            u.setId(rs.getLong("id"));
            u.setNome(rs.getString("nome"));
            u.setLogin(rs.getString("login"));
            u.setPerfil(pDAO.carregarPorId(rs.getInt("id_perfil")));
            listUser.add(u);
        }
        this.desconectar();
        return listUser;
    }
    
    public Usuario carregarPorId(long id) throws Exception {
        Usuario u = new Usuario();
        this.conectar();
        String sql = "SELECT * FROM usuario WHERE id=?";
        st = con.prepareStatement(sql);
        st.setLong(1, id);
        rs = st.executeQuery();
        if (rs.next()) {
            u.setId(rs.getLong("id"));
            u.setNome(rs.getString("nome"));
            u.setLogin(rs.getString("login"));
            u.setPerfil(pDAO.carregarPorId(rs.getLong("id_perfil")));
        }
        this.desconectar();
        return u;
    }
    
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
    
    public int inserir(Usuario u) throws Exception {
        int ret;
        this.conectar();
        String sql = "INSERT INTO usuario (nome, login, senha, id_perfil) VALUES (?, ?, ?, ?)";
        st = con.prepareStatement(sql);
        st.setString(1, u.getNome());
        st.setString(2, u.getLogin());
        st.setString(3, u.getSenha());
        st.setLong(4, u.getPerfil().getId());
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
    
      public int alterar(Usuario u) throws Exception {
        int ret;
        this.conectar();
        String sql = "UPDATE usuario SET nome=?, login=?, senha=?, id_perfil=? WHERE id=?";
        st = con.prepareStatement(sql);
        st.setString(1, u.getNome());
        st.setString(2, u.getLogin());
        st.setString(3, u.getSenha());
        st.setLong(4, u.getPerfil().getId());
        st.setLong(5, u.getId());
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
    
    public int excluir(int id) throws Exception {
        int ret;
        this.conectar();
        String sql = "DELETE FROM usuario WHERE id=?";
        st = con.prepareStatement(sql);
        st.setInt(1, id);
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
}
