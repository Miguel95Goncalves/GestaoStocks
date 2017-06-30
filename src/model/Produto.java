package model;

public class Produto {
	private int produto_id,categoria_id,produto_stock,produto_stock_minimo, quantidade_venda;
	private String produto_nome,produto_descricao;
	private float produto_preco_compra, produto_preco_venda;

	public Produto(){
		
	}
	
	public Produto(int produto_id, int categoria_id, int produto_stock, int produto_stock_minimo, String produto_nome,
			String produto_descricao, float produto_preco_compra, float produto_preco_venda, int quantidade_venda) {
		super();
		this.produto_id = produto_id;
		this.categoria_id = categoria_id;
		this.produto_stock = produto_stock;
		this.produto_stock_minimo = produto_stock_minimo;
		this.produto_nome = produto_nome;
		this.produto_descricao = produto_descricao;
		this.produto_preco_compra = produto_preco_compra;
		this.produto_preco_venda = produto_preco_venda;
		this.quantidade_venda = quantidade_venda;
	}
	
	public int getCategoria_id() {
		return categoria_id;
	}
	public void setCategoria_id(int categoria_id) {
		this.categoria_id = categoria_id;
	}
	public int getProduto_id() {
		return produto_id;
	}
	public void setProduto_id(int produto_id) {
		this.produto_id = produto_id;
	}
	public int getProduto_stock() {
		return produto_stock;
	}
	public void setProduto_stock(int produto_stock) {
		this.produto_stock = produto_stock;
	}
	public int getProduto_stock_minimo() {
		return produto_stock_minimo;
	}
	public void setProduto_stock_minimo(int produto_stock_minimo) {
		this.produto_stock_minimo = produto_stock_minimo;
	}
	public String getProduto_nome() {
		return produto_nome;
	}
	public void setProduto_nome(String produto_nome) {
		this.produto_nome = produto_nome;
	}
	public String getProduto_descricao() {
		return produto_descricao;
	}
	public void setProduto_descricao(String produto_descricao) {
		this.produto_descricao = produto_descricao;
	}
	public float getProduto_preco_compra() {
		return produto_preco_compra;
	}
	public void setProduto_preco_compra(float produto_preco_compra) {
		this.produto_preco_compra = produto_preco_compra;
	}
	public float getProduto_preco_venda() {
		return produto_preco_venda;
	}
	public void setProduto_preco_venda(float produto_preco_venda) {
		this.produto_preco_venda = produto_preco_venda;
	}
	public int getQuantidade_venda() {
		return quantidade_venda;
	}
	public void setQuantidade_venda(int quantidade_venda) {
		this.quantidade_venda = quantidade_venda;
	}
	
}
