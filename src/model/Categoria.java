package model;

import java.util.ArrayList;

public class Categoria {
	private int categoria_id;
	private String categoria_nome;
	private ArrayList<Produto> produtos = new ArrayList<>();
	
	public Categoria() {
		super();
		this.produtos = new ArrayList<>();
	}
	
	public Categoria(int categoria_id, String categoria_nome) {
		super();
		this.categoria_id = categoria_id;
		this.categoria_nome = categoria_nome;
		this.produtos = new ArrayList<>();
	}
	
	public int getCategoria_id() {
		return categoria_id;
	}
	public void setCategoria_id(int categoria_id) {
		this.categoria_id = categoria_id;
	}
	public String getCategoria_nome() {
		return categoria_nome;
	}
	public void setCategoria_nome(String categoria_nome) {
		this.categoria_nome = categoria_nome;
	}
	public ArrayList<Produto> getProdutos() {
		return produtos;
	}
	public void setProdutos(ArrayList<Produto> produtos) {
		this.produtos = produtos;
	}

}
