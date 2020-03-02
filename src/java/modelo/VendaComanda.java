package modelo;

import java.util.ArrayList;
import java.util.Date;

public class VendaComanda {
    private int id;
    private Date dataVenda;
    private Date dataPagamento;
    private Usuario vendedor;
    private Comanda comanda;
    private ArrayList<ItemVendaComanda> carrinho;

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

    public Comanda getComanda() {
        return comanda;
    }

    public void setComanda(Comanda comanda) {
        this.comanda = comanda;
    }

    public ArrayList<ItemVendaComanda> getCarrinho() {
        return carrinho;
    }

    public void setCarrinho(ArrayList<ItemVendaComanda> carrinho) {
        this.carrinho = carrinho;
    }

    @Override
    public String toString() {
        return "\n Venda{" + "id=" + id + ", dataVenda=" + dataVenda + ", dataPagamento=" + dataPagamento + ", vendedor=" + vendedor + ", comanda=" + comanda + ", carrinho=" + carrinho + '}';
    }
}
