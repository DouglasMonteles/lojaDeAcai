package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PerfilDAO extends DataBaseDAO {
    private PreparedStatement st;
    private ResultSet rs;
    
    public ArrayList<Perfil> listar() throws Exception {
        ArrayList<Perfil> list = new ArrayList<Perfil>();
        this.conectar();
        String sql = "SELECT * FROM perfil";
        st = con.prepareStatement(sql);
        rs = st.executeQuery();
        while (rs.next()) {
            Perfil p = new Perfil();
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setDescricao(rs.getString("descricao"));
            list.add(p);
        }
        this.desconectar();
        return list;
    }
    
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
            p.setMenu(this.menusPerfil(id));
        }
        this.desconectar();
        return p;
    }
    
    public int inserir(Perfil p) throws Exception {
        int ret = 0;
        this.conectar();
        String sql = "INSERT INTO perfil (nome, descricao) VALUES (?, ?)";
        st = con.prepareStatement(sql);
        st.setString(1, p.getNome());
        st.setString(2, p.getDescricao());
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
    
    public int alterar(Perfil p) throws Exception {
        int ret = 0;
        this.conectar();
        String sql = "UPDATE perfil SET nome=?, descricao=? WHERE id=?";
        st = con.prepareStatement(sql);
        st.setString(1, p.getNome());
        st.setString(2, p.getDescricao());
        st.setLong(3, p.getId());
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
    
    public int vincular(int id_perfil, int id_menu) throws Exception {
        int ret;
        this.conectar();
        String sql = "INSERT INTO perfil_menu (id_perfil, id_menu) VALUES (?, ?)";
        st = con.prepareStatement(sql);
        st.setInt(1, id_perfil);
        st.setInt(2, id_menu);
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
    
    public int desvincular(int id_perfil, int id_menu) throws Exception {
        int ret;
        this.conectar();
        String sql = "DELETE FROM perfil_menu WHERE id_perfil=? AND id_menu=?";
        st = con.prepareStatement(sql);
        st.setInt(1, id_perfil);
        st.setInt(2, id_menu);
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
    
    public ArrayList<Menu> menusPerfil(long id_perfil) throws Exception {
        ArrayList<Menu> list = new ArrayList<Menu>();
        this.conectar();
        String sql = "SELECT m.* FROM menu AS m, perfil_menu AS pm WHERE m.id = pm.id_menu AND pm.id_perfil = ?";
        st = con.prepareStatement(sql);
        st.setLong(1, id_perfil);
        rs = st.executeQuery();
        while (rs.next()) {
            Menu m = new Menu();
            m.setId(rs.getInt("id"));
            m.setNome(rs.getString("nome"));
            m.setLink(rs.getString("link"));
            m.setIcone(rs.getString("icone"));
            list.add(m);
        }
        this.desconectar();
        return list;
    }
    
    public ArrayList<Menu> menusNaoPerfil(int id_perfil) throws Exception {
        ArrayList<Menu> list = new ArrayList<Menu>();
        this.conectar();
        String sql = "SELECT * FROM menu WHERE id NOT IN(SELECT id_menu FROM perfil_menu WHERE id_perfil=?)";
        st = con.prepareStatement(sql);
        st.setInt(1, id_perfil);
        rs = st.executeQuery();
        while (rs.next()) {
            Menu m = new Menu();
            m.setId(rs.getInt("id"));
            m.setNome(rs.getString("nome"));
            m.setLink(rs.getString("link"));
            m.setIcone(rs.getString("icone"));
            list.add(m);
        }
        this.desconectar();
        return list;
    }
    
    public int excluir(int id) throws Exception {
        int ret = 0;
        this.conectar();
        String sql = "DELETE FROM perfil WHERE id=?";
        st = con.prepareStatement(sql);
        st.setInt(1, id);
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
}
