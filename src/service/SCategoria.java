package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Categoria;

public class SCategoria implements Logica {
	
	public void addCategoria(String categoria_nome){ //Adicionar Categoria
		categorias.add(new Categoria(Logica.categorias.size()+1,categoria_nome));
	}
	
	public void editCategoria(int categoria_id, String categoria_nome){ //Editar Categoria
		for(int i=0;i<Logica.categorias.size();i++){
			if(Logica.categorias.get(i).getCategoria_id()==categoria_id) Logica.categorias.get(i).setCategoria_nome(categoria_nome);
		}
	}
	
	public void delCategoria(int categoria_id){ //Apagar Categoria
		for(int i=0;i<Logica.categorias.size();i++){
			if(Logica.categorias.get(i).getCategoria_id()==categoria_id) Logica.categorias.remove(i);
		}
	}
	
	public Categoria procCat(int id){ //Procurar Categoria
		for(Categoria cat : Logica.categorias){
			if(cat.getCategoria_id() == id) return cat;
		}
		
		return null;
	}
	
	@Override
	public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception { //Método Executa
		
		if(req.getParameter("acao").equals("AdicionarCategoria")){ //Ação Adicionar Categoria
			addCategoria(req.getParameter("categoria_nome"));
		}else if(req.getParameter("acao").equals("EliminarCategoria")){ //Ação Eliminar Categoria
			delCategoria(Integer.parseInt(req.getParameter("id")));
		}else if(req.getParameter("acao").equals("EditarCategoria")){ //Ação Editar Categoria
			editCategoria(Integer.parseInt(req.getParameter("id")), req.getParameter("categoria_novo_nome"));
		}else if(req.getParameter("acao").equals("procurarCat")){ //Ação Procurar Categoria
			req.setAttribute("Categoria_Nome",procCat(Integer.parseInt(req.getParameter("id"))).getCategoria_nome()); //Devolve o Nome da Categoria através do método procurar
			req.setAttribute("Categoria_ID",procCat(Integer.parseInt(req.getParameter("id"))).getCategoria_id()); //Devolve o ID da Categoria através do método procurar
			return "/index.jsp?pag=fEditCat"; //Retorna Para a Página de Editar
		}
		
		req.setAttribute("listaCategoria", Logica.categorias); //Envia Lista de Categorias como Atributo
		
		return "/index.jsp";
	}
}