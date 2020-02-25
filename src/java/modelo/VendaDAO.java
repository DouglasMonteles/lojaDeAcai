package modelo;

import com.mysql.jdbc.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

public class VendaDAO extends DataBaseDAO {
    private PreparedStatement st;
    private ResultSet rs;
    
    public ArrayList<Venda> listar() throws Exception {
        ArrayList<Venda> list = new ArrayList<Venda>();
        this.conectar();
        String sql = "SELECT * FROM venda ORDER BY id DESC";
        st = con.prepareStatement(sql);
        rs = st.executeQuery();
        while (rs.next()) {
            Venda v = new Venda();
            v.setId(rs.getInt("id"));
            v.setDataVenda(rs.getTimestamp("data_venda"));
            v.setDataPagamento(rs.getTimestamp("data_pagamento"));
            ClienteDAO cDAO = new ClienteDAO();
            v.setCliente(cDAO.carregarPorId(rs.getInt("id_cliente")));
            UsuarioDAO uDAO = new UsuarioDAO();
            v.setVendedor(uDAO.carregarPorId(rs.getInt("id_usuario")));
            list.add(v);
        }
        this.desconectar();
        return list;
    }
    
    public ArrayList<Venda> listarPorPaginação(int limit, int offset) throws Exception {
        ArrayList<Venda> list = new ArrayList<Venda>();
        this.conectar();
        String sql = "SELECT * FROM venda WHERE DATE_FORMAT(data_venda, '%Y-%m-%d') = CURDATE() ORDER BY id DESC LIMIT ? OFFSET ?";
        st = con.prepareStatement(sql);
        st.setInt(1, limit);
        st.setInt(2, offset);
        rs = st.executeQuery();
        while (rs.next()) {
            Venda v = new Venda();
            v.setId(rs.getInt("id"));
            v.setDataVenda(rs.getTimestamp("data_venda"));
            v.setDataPagamento(rs.getTimestamp("data_pagamento"));
            ClienteDAO cDAO = new ClienteDAO();
            v.setCliente(cDAO.carregarPorId(rs.getInt("id_cliente")));
            UsuarioDAO uDAO = new UsuarioDAO();
            v.setVendedor(uDAO.carregarPorId(rs.getInt("id_usuario")));
            list.add(v);
        }
        this.desconectar();
        return list;
    }
    
    public ArrayList<ItemVenda> listarCarrinho(int id) throws Exception {
        ArrayList<ItemVenda> itens = new ArrayList<ItemVenda>();
        this.conectar();
        String sql = "SELECT * FROM item_venda WHERE id_venda=?";
        st = con.prepareStatement(sql);
        st.setInt(1, id);
        rs = st.executeQuery();
        while (rs.next()) {
            ItemVenda iv = new ItemVenda();
            iv.setId(rs.getInt("id"));
            iv.setQtd(rs.getInt("quantidade"));
            iv.setValor(rs.getDouble("valor"));
            ProdutoDAO pDAO = new ProdutoDAO();
            iv.setProduto(pDAO.carregarPorId(rs.getInt("id_produto")));
            itens.add(iv);
        }
        this.desconectar();
        return itens;
    }
    
    public Venda carregarPorId(int id) throws Exception {
        Venda v = new Venda();
        this.conectar();
        String sql = "SELECT * FROM venda WHERE id=?";
        st = con.prepareStatement(sql);
        st.setInt(1, id);
        rs = st.executeQuery();
        if (rs.next()) {
            v.setId(rs.getInt("id"));
            v.setDataVenda(rs.getTimestamp("data_venda"));
            v.setDataPagamento(rs.getTimestamp("data_pagamento"));
            ClienteDAO cDAO = new ClienteDAO();
            v.setCliente(cDAO.carregarPorId(rs.getInt("id_cliente")));
            UsuarioDAO uDAO = new UsuarioDAO();
            v.setVendedor(uDAO.carregarPorId(rs.getInt("id_usuario")));
        }
        this.desconectar();
        return v;
    }
    
    public int registar(Venda v) throws Exception {
        int ret;
        this.conectar();
        String sql = "INSERT INTO venda (id_usuario, id_cliente) VALUES (?, ?)";
        st = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        st.setLong(1, v.getVendedor().getId());
        st.setInt(2, v.getCliente().getId());
        ret = st.executeUpdate();
        rs = st.getGeneratedKeys();
        if (rs.next()) {
            v.setId(rs.getInt(1));
        }
        
        for (ItemVenda itens : v.getCarrinho()) {
            String sql_item = "INSERT INTO item_venda (quantidade, id_venda, id_produto, valor) VALUES (?, ?, ?, ?)";
            st = con.prepareStatement(sql_item);
            st.setInt(1, itens.getQtd());
            st.setInt(2, v.getId());
            st.setInt(3, itens.getProduto().getId());
            st.setDouble(4, itens.getValor());
            st.executeUpdate();
        }
        this.desconectar();
        return ret;
    }
    
    public int registrarPagamento(int id) throws Exception {
        int ret;
        this.conectar();
        String sql = "UPDATE venda SET data_pagamento = CURRENT_TIMESTAMP() WHERE id=?";
        st = con.prepareStatement(sql);
        st.setInt(1, id);
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
    
    public float qtdVendas() throws Exception {
        float qtd = 0;
        this.conectar();
        String sql = "SELECT COUNT(id) AS qtd FROM venda WHERE DATE_FORMAT(data_venda, '%Y-%m-%d') = CURDATE()";
        st = con.prepareStatement(sql);
        rs = st.executeQuery();
        if (rs.next())
            qtd = rs.getInt("qtd");
        this.desconectar();
        return qtd;
    }
}
