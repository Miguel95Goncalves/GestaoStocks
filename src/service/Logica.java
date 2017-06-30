package service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Categoria;
import model.Fatura;
import model.Produto;

public interface Logica {
	
	static ArrayList<Categoria> categorias = new ArrayList<>();
	static ArrayList<Fatura> vendas = new ArrayList<>();
	static ArrayList<Produto> temp = new ArrayList<>();
	
	String executa(HttpServletRequest req, HttpServletResponse res)
            throws Exception;
}