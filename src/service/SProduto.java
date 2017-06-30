package service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Categoria;
import model.Produto;

public class SProduto implements Logica {

	public void addProduto(int categoria_id,int produto_stock, int produto_stock_minimo, String produto_nome, //Adicionar Produto
			String produto_descricao, float produto_preco_venda){
		
		for(Categoria cat : Logica.categorias){ //Percorre a lista de categorias
			if(cat.getCategoria_id()==categoria_id){ //Se encontrar a categoria indicada no formulário
				cat.getProdutos().add(new Produto(cat.getProdutos().size()+1, categoria_id, produto_stock, produto_stock_minimo, produto_nome, //Adiciona o produto à lista de produtos da categoria
						produto_descricao, 0, produto_preco_venda, 0));
			}
		}
	}

	public Produto procProduto(int categoria_id, int produto_id){ //Procurar Produto
		for(Categoria cat : Logica.categorias){
			for(Produto prod : cat.getProdutos()){
				if(prod.getCategoria_id() == categoria_id && prod.getProduto_id() == produto_id) return prod;
			}
		}
		
		return null;
		
	}
	
	public ArrayList<Produto> todosProdutos(){ //Retornar Todos os Produtos de Todas as Categorias
		ArrayList listaProdutos = new ArrayList<>();
		
		for(Categoria cat : Logica.categorias){
			for(Produto prod : cat.getProdutos()){
				listaProdutos.add(prod);
			}
		}
		
		return listaProdutos;
	}
	
	public void editProduto(int produto_id, int categoria_id, int nova_categoria_id, String nome, String descricao, float preco, int stock, int stock_minimo){ //Editar Produto
		for(Produto prod : todosProdutos()){
			if(prod.getCategoria_id() == categoria_id && prod.getProduto_id() == produto_id){
				prod.setCategoria_id(nova_categoria_id);
				prod.setProduto_nome(nome);
				prod.setProduto_descricao(descricao);
				prod.setProduto_preco_compra(preco);
				prod.setProduto_stock(stock);
				prod.setProduto_stock_minimo(stock_minimo);
			}
		}
	}
	
	public void delProduto(int categoria_id, int produto_id){ //Remover Produto
		for(int i=0;i<Logica.categorias.size();i++){
			for(int o=0;o<Logica.categorias.get(i).getProdutos().size();o++){
				if(Logica.categorias.get(i).getCategoria_id() == categoria_id && Logica.categorias.get(i).getProdutos().get(o).getProduto_id() == produto_id) Logica.categorias.get(i).getProdutos().remove(o);
			}
		}
	}
	
	@Override
	public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getParameter("acao").equals("AdicionarProduto")){ //Ação Adicionar Produto
			addProduto(Integer.parseInt(req.getParameter("categoria")),Integer.parseInt(req.getParameter("produto_stock")), Integer.parseInt(req.getParameter("produto_stock_minimo")), req.getParameter("produto_nome"),
					req.getParameter("produto_descricao"), Float.parseFloat(req.getParameter("produto_preco")));
		}else if(req.getParameter("acao").equals("EditarProduto")){ //Ação Editar Produto
			editProduto(Integer.parseInt(req.getParameter("id")),
					Integer.parseInt(req.getParameter("cat_id")),
					Integer.parseInt(req.getParameter("nova_categoria")),
					req.getParameter("novo_produto_nome"),
					req.getParameter("novo_produto_descricao"),
					Float.parseFloat(req.getParameter("novo_produto_preco")),
					Integer.parseInt(req.getParameter("novo_produto_stock")),
					Integer.parseInt(req.getParameter("novo_produto_stock_minimo")));
		}else if(req.getParameter("acao").equals("ProcurarProduto")){ //Ação Procurar Produto
			req.setAttribute("Produto_ID",procProduto(Integer.parseInt(req.getParameter("id_cat")),Integer.parseInt(req.getParameter("id"))).getProduto_id());
			req.setAttribute("Categoria_ID",procProduto(Integer.parseInt(req.getParameter("id_cat")),Integer.parseInt(req.getParameter("id"))).getCategoria_id());
			req.setAttribute("Produto_Nome",procProduto(Integer.parseInt(req.getParameter("id_cat")),Integer.parseInt(req.getParameter("id"))).getProduto_nome());
			req.setAttribute("Produto_Descricao",procProduto(Integer.parseInt(req.getParameter("id_cat")),Integer.parseInt(req.getParameter("id"))).getProduto_descricao());
			req.setAttribute("Produto_Stock",procProduto(Integer.parseInt(req.getParameter("id_cat")),Integer.parseInt(req.getParameter("id"))).getProduto_stock());
			req.setAttribute("Produto_Stock_Minimo",procProduto(Integer.parseInt(req.getParameter("id_cat")),Integer.parseInt(req.getParameter("id"))).getProduto_stock_minimo());
			req.setAttribute("Produto_Preco",procProduto(Integer.parseInt(req.getParameter("id_cat")),Integer.parseInt(req.getParameter("id"))).getProduto_preco_compra());
			req.setAttribute("listaCategoria", Logica.categorias); //Envia Lista de Categorias como Atributo
			return "/index.jsp?pag=fEditProd";
		}else if(req.getParameter("acao").equals("EliminarProduto")){
			delProduto(Integer.parseInt(req.getParameter("id_cat")), Integer.parseInt(req.getParameter("id")));
		}
		
		req.setAttribute("listaProduto", todosProdutos()); //Envia Lista de todos os Produtos como Atributo
		
		return "/index.jsp";
	}

}