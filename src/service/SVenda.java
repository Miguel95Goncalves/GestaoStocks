package service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Fatura;
import model.Fatura.Pagamento;
import model.Produto;

public class SVenda implements Logica {

	public void addVenda(HttpServletRequest req) {

		float total_venda = 0;
		
		for (Produto prod : Logica.temp) {
			total_venda += (prod.getQuantidade_venda()*prod.getProduto_preco_venda());
		}

		Date data = Calendar.getInstance().getTime();

		DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		String today = formatter.format(data);

		Logica.vendas.add(new Fatura(Logica.vendas.size() + 1,
				Integer.parseInt(req.getParameter("nif")),
				Logica.vendas.size() + 1, total_venda, today, Pagamento.valueOf(req.getParameter("pagamento"))));

		req.setAttribute("listaVenda", Logica.vendas);

		Logica.temp.clear();
	}

	public Fatura procVenda() {
		Fatura venda = new Fatura();

		return venda;
	}

	public ArrayList<Produto> addProduto(HttpServletRequest req, int id_produto, int id_categoria) {
		
		System.out.println("1 -" + Logica.temp.size());
		
		boolean ver = false;
		SProduto sProduto = new SProduto();
		ArrayList<Produto> listaProdutoVenda = Logica.temp;
		
		System.out.println("2 -" + Logica.temp.size());

		int quantidade = sProduto.todosProdutos()
				.get(sProduto.todosProdutos().indexOf(sProduto.procProduto(id_categoria, id_produto)))
				.getProduto_stock();
		if (quantidade > 0) {
			sProduto.todosProdutos()
					.get(sProduto.todosProdutos().indexOf(sProduto.procProduto(id_categoria, id_produto)))
					.setProduto_stock(quantidade - 1);

			for (Produto p : listaProdutoVenda) {
				if (p.getCategoria_id() == id_categoria && p.getProduto_id() == id_produto) {
					p.setQuantidade_venda(p.getQuantidade_venda() + 1);
					ver = true;
				}
			}

			if (ver == false) {
				listaProdutoVenda.add(sProduto.procProduto(id_categoria, id_produto));
				listaProdutoVenda.get(listaProdutoVenda.size() - 1).setQuantidade_venda(1);
			}

		}
		
		req.setAttribute("nif", req.getParameter("nifTemp"));
		req.setAttribute("pagamento", req.getParameter("pagamentoTemp"));
		req.setAttribute("listaProduto", sProduto.todosProdutos());

		return listaProdutoVenda;
	}

	public ArrayList<Produto> remProduto(HttpServletRequest req, int id_produto, int id_categoria) {
		SProduto sProduto = new SProduto();

		int quantidade_stock = sProduto.todosProdutos()
				.get(sProduto.todosProdutos().indexOf(sProduto.procProduto(id_categoria, id_produto)))
				.getProduto_stock();
		int quantidade_venda = Logica.temp.get(Logica.temp.indexOf(sProduto.procProduto(id_categoria, id_produto)))
				.getQuantidade_venda();

		if (quantidade_venda > 1) { // Se a quantidade na venda for maior que 1
			Logica.temp.get(Logica.temp.indexOf(sProduto.procProduto(id_categoria, id_produto)))
					.setQuantidade_venda(quantidade_venda - 1); // Tira 1
																// unidade
		} else { // Se houver apenas 1 unidade, remove o produto
			Logica.temp.remove(sProduto.procProduto(id_categoria, id_produto));
		}

		sProduto.todosProdutos().get(sProduto.todosProdutos().indexOf(sProduto.procProduto(id_categoria, id_produto)))
				.setProduto_stock(quantidade_stock + 1); // Acrescenta no stock

		req.setAttribute("nif", req.getParameter("nif"));
		req.setAttribute("pagamento", req.getParameter("pagamento"));
		req.setAttribute("listaProduto", sProduto.todosProdutos());

		return Logica.temp;
	}

	@Override
	public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getParameter("acao").equals("adicionarVenda")) {
			addVenda(req);
			return "/index.jsp?pag=vendas";
		} else if (req.getParameter("acao").equals("procurarVenda")) {
			req.setAttribute("venda", procVenda());
		} else if (req.getParameter("acao").equals("adicionarProduto")) {
			req.setAttribute("listaProdutoVenda", addProduto(req, Integer.parseInt(req.getParameter("id_produto")),
					Integer.parseInt(req.getParameter("id_categoria"))));
			SProduto sProduto = new SProduto();
		} else if (req.getParameter("acao").equals("removerProduto")) {
			req.setAttribute("listaProdutoVenda", remProduto(req, Integer.parseInt(req.getParameter("id_produto")),
					Integer.parseInt(req.getParameter("id_categoria"))));
			SProduto sProduto = new SProduto();
		}

		req.setAttribute("listaVenda", Logica.vendas);

		return "/index.jsp";
	}

}