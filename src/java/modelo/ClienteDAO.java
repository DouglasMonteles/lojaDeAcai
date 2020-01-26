package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ClienteDAO extends DataBaseDAO {
    private PreparedStatement st;
    private ResultSet rs;
    
    public ArrayList<Cliente> listar() throws Exception {
        ArrayList<Cliente> list = new ArrayList<Cliente>();
        this.conectar();
        String sql = "SELECT * FROM cliente";
        st = con.prepareStatement(sql);
        rs = st.executeQuery();
        while (rs.next()) {
            Cliente c = new Cliente();
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setTelContato(rs.getString("tel_contato"));
            list.add(c);
        }
        this.desconectar();
        return list;
    }
    
    public Cliente carregarPorId(int id) throws Exception {
        Cliente c = new Cliente();
        this.conectar();
        String sql = "SELECT * FROM cliente WHERE id=?";
        st = con.prepareStatement(sql);
        st.setInt(1, id);
        rs = st.executeQuery();
        if (rs.next()) {
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setTelContato(rs.getString("tel_contato"));
        }
        this.desconectar();
        return c;
    }
    
    public int inserir(Cliente c) throws Exception {
        int ret;
        this.conectar();
        String sql = "INSERT INTO cliente (nome, tel_contato) VALUES (?, ?)";
        st = con.prepareStatement(sql);
        st.setString(1, c.getNome());
        st.setString(2, c.getTelContato());
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
    
    public int alterar(Cliente c) throws Exception {
        int ret;
        this.conectar();
        String sql = "UPDATE cliente SET nome=?, tel_contato=? WHERE id=?";
        st = con.prepareStatement(sql);
        st.setString(1, c.getNome());
        st.setString(2, c.getTelContato());
        st.setInt(3, c.getId());
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
    
    public int excluir(int id) throws Exception {
        int ret;
        this.conectar();
        String sql = "DELETE FROM cliente WHERE id=?";
        st = con.prepareStatement(sql);
        st.setInt(1, id);
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
}
