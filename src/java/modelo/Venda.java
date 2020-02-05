package modelo;

import java.util.ArrayList;
import java.util.Date;

public class Venda {
    private int id;
    private Date dataVenda;
    private Date dataPagamento;
    private Usuario vendedor;
    private Cliente cliente;
    private ArrayList<ItemVenda> carrinho;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDataVenda() {
        return dataVenda;
    }

    public void setDataVenda(Date dataVenda) {
        this.dataVenda = dataVenda;
    }

    public Date getDataPagamento() {
        return dataPagamento;
    }

    public void setDataPagamento(Date dataPagamento) {
        this.dataPagamento = dataPagamento;
    }

    public Usuario getVendedor() {
        return vendedor;
    }

    public void setVendedor(Usuario vendedor) {
        this.vendedor = vendedor;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public ArrayList<ItemVenda> getCarrinho() {
        return carrinho;
    }

    public void setCarrinho(ArrayList<ItemVenda> carrinho) {
        this.carrinho = carrinho;
    }
}
