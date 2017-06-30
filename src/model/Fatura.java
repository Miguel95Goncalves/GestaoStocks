package model;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class Fatura {
	private int fatura_id, cliente_nif;
	private float fatura_total;
	private String fatura_data;
	private ArrayList<Produto> produto = new ArrayList<>();
	private Pagamento pagamento;
	
	public Fatura(){
		
	}
	
	public Fatura(int fatura_id, int cliente_nif, int fatura_total_prod, float fatura_total, String fatura_data, Pagamento pagamento) {
		super();
		this.fatura_id = fatura_id;
		this.cliente_nif = cliente_nif;
		this.fatura_total = fatura_total;
		this.fatura_data = fatura_data;
		this.produto = new ArrayList<>();
		this.pagamento = pagamento;
	}
	
	public Pagamento getPagamento() {
		return pagamento;
	}

	public void setPagamento(Pagamento pagamento) {
		this.pagamento = pagamento;
	}

	public int getFatura_id() {
		return fatura_id;
	}
	public void setFatura_id(int fatura_id) {
		this.fatura_id = fatura_id;
	}
	public int getCliente_nif() {
		return cliente_nif;
	}
	public void setCliente_nif(int cliente_nif) {
		this.cliente_nif = cliente_nif;
	}
	public float getFatura_total() {
		return fatura_total;
	}
	public void setFatura_total(float fatura_total) {
		this.fatura_total = fatura_total;
	}
	public String getFatura_data() {
		return fatura_data;
	}
	public void setFatura_data(String fatura_data) {
		this.fatura_data = fatura_data;
	}
	public ArrayList<Produto> getProduto() {
		return produto;
	}
	public void setProduto(ArrayList<Produto> produto) {
		this.produto = produto;
	}
	
	public enum Pagamento{
		Multibanco, Dinheiro;
	}
	
}
