package modelo;

import java.io.FileWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MenuDAO extends DataBaseDAO{
    private PreparedStatement st;
    private ResultSet rs;
    
    public ArrayList<Menu> listar() throws Exception {
        ArrayList<Menu> listMenu = new ArrayList<Menu>();
        this.conectar();
        String sql = "SELECT * FROM menu";
        st = con.prepareStatement(sql);
        rs = st.executeQuery();
        while(rs.next()) {
            Menu m = new Menu();
            m.setId(rs.getInt("id"));
            m.setNome(rs.getString("nome"));
            m.setLink(rs.getString("link"));
            m.setIcone(rs.getString("icone"));
            listMenu.add(m);
        }
        this.desconectar();
        return listMenu;
    }
    
    public Menu carregarPorId(int id) throws Exception {
        Menu m = new Menu();
        this.conectar();
        String sql = "SELECT * FROM menu WHERE id=?";
        st = con.prepareStatement(sql);
        st.setInt(1, id);
        rs = st.executeQuery();
        if (rs.next()) {
            m.setId(rs.getInt("id"));
            m.setNome(rs.getString("nome"));
            m.setLink(rs.getString("link"));
            m.setIcone(rs.getString("icone"));
        }
        this.desconectar();
        return m;
    }
    
    public int inserir(Menu m) throws Exception {
        int ret=0;
        this.conectar();
        String sql = "INSERT INTO menu (nome, link, icone) VALUES (?, ?, ?)";
        st = con.prepareStatement(sql);
        st.setString(1, m.getNome());
        st.setString(2, m.getLink());
        st.setString(3, m.getIcone());
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
    
     public int alterar(Menu m) throws Exception {
        int ret=0;
        this.conectar();
        String sql = "UPDATE menu set nome=?, link=?, icone=? WHERE id=?";
        st = con.prepareStatement(sql);
        st.setString(1, m.getNome());
        st.setString(2, m.getLink());
        st.setString(3, m.getIcone());
        st.setInt(4, m.getId());
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
     
     public int excluir(int id) throws Exception {
         int ret=0;
         this.conectar();
         String sql = "DELETE FROM menu WHERE id=?";
         st = con.prepareStatement(sql);
         st.setInt(1, id);
         ret = st.executeUpdate();
         this.desconectar();
         return ret;
     }
}
