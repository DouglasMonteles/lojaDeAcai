package modelo;

public class ItemVendaComanda {
    private int id;
    private int qtd;
    private double valor;
    private int comanda;
    private Produto produto;
    private VendaComanda vendaComanda;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQtd() {
        return qtd;
    }

    public void setQtd(int qtd) {
        this.qtd = qtd;
    }
    
    public void setValor(double valor) {
        this.valor = valor;
    }
    
    public double getValor() {
        return valor;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public VendaComanda getVenda() {
        return vendaComanda;
    }

    public void setVenda(VendaComanda vendaComanda) {
        this.vendaComanda = vendaComanda;
    }

    public int getComanda() {
        return comanda;
    }

    public void setComanda(int comanda) {
        this.comanda = comanda;
    }

    public VendaComanda getVendaComanda() {
        return vendaComanda;
    }

    public void setVendaComanda(VendaComanda vendaComanda) {
        this.vendaComanda = vendaComanda;
    }
    
    @Override
    public String toString() {
        return "ItemVenda{" + "id=" + id + ", qtd=" + qtd + ", valor=" + valor + ", produto=" + produto + ", vendaComanda=" + vendaComanda + '}';
    }
}
