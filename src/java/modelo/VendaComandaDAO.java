package modelo;

import com.mysql.jdbc.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class VendaComandaDAO extends DataBaseDAO {
    private PreparedStatement st;
    private ResultSet rs;
    
    public ArrayList<VendaComanda> listar() throws Exception {
        ArrayList<VendaComanda> list = new ArrayList<VendaComanda>();
        this.conectar();
        String sql = "SELECT * FROM venda_comanda ORDER BY id DESC";
        st = con.prepareStatement(sql);
        rs = st.executeQuery();
        while (rs.next()) {
            VendaComanda v = new VendaComanda();
            v.setId(rs.getInt("id"));
            v.setDataVenda(rs.getTimestamp("data_venda"));
            v.setDataPagamento(rs.getTimestamp("data_pagamento"));
            ComandaDAO cDAO = new ComandaDAO();
            v.setComanda(cDAO.carregarPorId(rs.getInt("id_comanda")));
            UsuarioDAO uDAO = new UsuarioDAO();
            v.setVendedor(uDAO.carregarPorId(rs.getInt("id_usuario")));
            list.add(v);
        }
        this.desconectar();
        return list;
    }
    
    public ArrayList<VendaComanda> listarPorPaginacao(int limit, int offset) throws Exception {
        ArrayList<VendaComanda> list = new ArrayList<VendaComanda>();
        this.conectar();
        String sql = "SELECT * FROM venda_comanda WHERE DATE_FORMAT(data_venda, '%Y-%m-%d') = CURDATE() ORDER BY id DESC LIMIT ? OFFSET ?";
        st = con.prepareStatement(sql);
        st.setInt(1, limit);
        st.setInt(2, offset);
        rs = st.executeQuery();
        while (rs.next()) {
            VendaComanda v = new VendaComanda();
            v.setId(rs.getInt("id"));
            v.setDataVenda(rs.getTimestamp("data_venda"));
            v.setDataPagamento(rs.getTimestamp("data_pagamento"));
            ComandaDAO cDAO = new ComandaDAO();
            v.setComanda(cDAO.carregarPorId(rs.getInt("id_comanda")));
            UsuarioDAO uDAO = new UsuarioDAO();
            v.setVendedor(uDAO.carregarPorId(rs.getInt("id_usuario")));
            list.add(v);
        }
        this.desconectar();
        return list;
    }
    
    public ArrayList<ItemVendaComanda> listarCarrinho(int id) throws Exception {
        ArrayList<ItemVendaComanda> itens = new ArrayList<ItemVendaComanda>();
        this.conectar();
        String sql = "SELECT * FROM item_venda_comanda WHERE comanda=?";
        st = con.prepareStatement(sql);
        st.setInt(1, id);
        rs = st.executeQuery();
        while (rs.next()) {
            ItemVendaComanda iv = new ItemVendaComanda();
            iv.setId(rs.getInt("id"));
            iv.setQtd(rs.getInt("qtd"));
            iv.setValor(rs.getDouble("valor"));
            ProdutoDAO pDAO = new ProdutoDAO();
            iv.setProduto(pDAO.carregarPorId(rs.getInt("produto_id")));
            iv.setComanda(rs.getInt("comanda"));
            itens.add(iv);
        }
        this.desconectar();
        return itens;
    }
    
    public VendaComanda carregarPorId(int id) throws Exception {
        VendaComanda v = new VendaComanda();
        this.conectar();
        String sql = "SELECT * FROM venda_comanda WHERE id=?";
        st = con.prepareStatement(sql);
        st.setInt(1, id);
        rs = st.executeQuery();
        if (rs.next()) {
            v.setId(rs.getInt("id"));
            v.setDataVenda(rs.getTimestamp("data_venda"));
            v.setDataPagamento(rs.getTimestamp("data_pagamento"));
            ComandaDAO cDAO = new ComandaDAO();
            v.setComanda(cDAO.carregarPorId(rs.getInt("id_comanda")));
            UsuarioDAO uDAO = new UsuarioDAO();
            v.setVendedor(uDAO.carregarPorId(rs.getInt("id_usuario")));
        }
        this.desconectar();
        return v;
    }
    
    public int registar(VendaComanda v) throws Exception {
        int ret;
        this.conectar();
        String sql = "INSERT INTO venda_comanda (usuario_id, comanda_id) VALUES (?, ?)";
        st = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        st.setLong(1, v.getVendedor().getId());
        st.setInt(2, v.getComanda().getId());
        ret = st.executeUpdate();
        rs = st.getGeneratedKeys();
        if (rs.next()) {
            v.setId(rs.getInt(1));
        }
        
        for (ItemVendaComanda itens : v.getCarrinho()) {
            String sql_item = "UPDATE item_venda_comanda SET venda_comanda_id = ?";
            st = con.prepareStatement(sql_item);
            st.setInt(1, v.getId());
            st.executeUpdate();
        }
        this.desconectar();
        return ret;
    }
    
    public int registarComanda(ItemVendaComanda v) throws Exception {
        int ret = 0;
        this.conectar();
        String sql_item = "INSERT INTO item_venda_comanda (qtd, produto_id, valor, comanda) VALUES (?, ?, ?, ?)";
        st = con.prepareStatement(sql_item, Statement.RETURN_GENERATED_KEYS);
        st.setInt(1, v.getQtd());
        st.setInt(2, v.getProduto().getId());
        st.setDouble(3, v.getValor());
        st.setInt(4, v.getComanda());
        st.executeUpdate();
        rs = st.getGeneratedKeys();
        if (rs.next())
            ret = rs.getInt(1);
        this.desconectar();
        return ret;
    }
    
    public int registrarPagamento(int id) throws Exception {
        int ret;
        this.conectar();
        String sql = "UPDATE venda_comanda AS vc JOIN comanda AS c ON vc.comanda_id = c.id "
                + "SET vc.data_pagamento = CURRENT_TIMESTAMP(), c.status = 'inativo' WHERE c.id=?";
        st = con.prepareStatement(sql);
        st.setInt(1, id);
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
    
    public float qtdVendas() throws Exception {
        float qtd = 0;
        this.conectar();
        String sql = "SELECT COUNT(id) AS qtd FROM venda_comanda WHERE DATE_FORMAT(data_venda, '%Y-%m-%d') = CURDATE()";
        st = con.prepareStatement(sql);
        rs = st.executeQuery();
        if (rs.next())
            qtd = rs.getInt("qtd");
        this.desconectar();
        return qtd;
    }
    
    public int excluir(int id) throws Exception {
        int ret = 0;
        this.conectar();
        String sql = "DELETE FROM item_venda_comanda WHERE id = ?";
        st = con.prepareStatement(sql);
        st.setInt(1, id);
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
    
    public int cancelar(int comanda) throws Exception {
        int ret = 0;
        this.conectar();
        String sql = "DELETE FROM item_venda_comanda WHERE comanda = ?";
        st = con.prepareStatement(sql);
        st.setInt(1, comanda);
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
}
