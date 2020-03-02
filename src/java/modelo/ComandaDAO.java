package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ComandaDAO extends DataBaseDAO {
    private PreparedStatement st;
    private ResultSet rs;
    
    public ArrayList<Comanda> listar() throws Exception {
        ArrayList<Comanda> list = new ArrayList<Comanda>();
        this.conectar();
        String sql = "SELECT * FROM comanda";
        st = con.prepareStatement(sql);
        rs = st.executeQuery();
        while (rs.next()) {
            Comanda c = new Comanda();
            c.setId(rs.getInt("id"));
            c.setNome(rs.getInt("nome"));
            c.setStatus(rs.getString("status"));
            list.add(c);
        }
        this.desconectar();
        return list;
    }
    
    public Comanda carregarPorId(int id) throws Exception {
        Comanda c = new Comanda();
        this.conectar();
        String sql = "SELECT * FROM comanda WHERE id=?";
        st = con.prepareStatement(sql);
        st.setInt(1, id);
        rs = st.executeQuery();
        if (rs.next()) {
            c.setId(rs.getInt("id"));
            c.setNome(rs.getInt("nome"));
            c.setStatus(rs.getString("status"));
        }
        this.desconectar();
        return c;
    }
    
    public Comanda carregarPorNome(int nome) throws Exception {
        Comanda c = new Comanda();
        this.conectar();
        String sql = "SELECT * FROM comanda WHERE nome=?";
        st = con.prepareStatement(sql);
        st.setInt(1, nome);
        rs = st.executeQuery();
        if (rs.next()) {
            c.setId(rs.getInt("id"));
            c.setNome(rs.getInt("nome"));
            c.setStatus(rs.getString("status"));
        }
        this.desconectar();
        return c;
    }
    
    public int inserir(Comanda c) throws Exception {
        int ret;
        this.conectar();
        String sql = "INSERT INTO comanda (nome) VALUES (?)";
        st = con.prepareStatement(sql);
        st.setInt(1, c.getNome());
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
    
    public int alterar(Comanda c) throws Exception {
        int ret;
        this.conectar();
        String sql = "UPDATE comanda SET nome=? WHERE id=?";
        st = con.prepareStatement(sql);
        st.setInt(1, c.getNome());
        st.setInt(2, c.getId());
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
    
    public int status(Comanda c) throws Exception {
        int ret;
        this.conectar();
        String sql = "UPDATE comanda SET status=? WHERE id=?";
        st = con.prepareStatement(sql);
        st.setString(1, c.getStatus());
        st.setInt(2, c.getId());
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
    
    public int excluir(int id) throws Exception {
        int ret;
        this.conectar();
        String sql = "DELETE FROM comanda WHERE id=?";
        st = con.prepareStatement(sql);
        st.setInt(1, id);
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
}
