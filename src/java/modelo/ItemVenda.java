package modelo;

public class ItemVenda {
    private int id;
    private int qtd;
    private double valor;
    private Produto produto;
    private Venda venda;

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

    public Venda getVenda() {
        return venda;
    }

    public void setVenda(Venda venda) {
        this.venda = venda;
    }

    @Override
    public String toString() {
        return "ItemVenda{" + "id=" + id + ", qtd=" + qtd + ", valor=" + valor + ", produto=" + produto + ", venda=" + venda + '}';
    }
}
