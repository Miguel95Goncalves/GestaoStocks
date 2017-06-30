package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Logica;
import service.SProduto;

@WebServlet("/HIndex")
public class HIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SProduto sProduto;
	
    public HIndex() {
        super();
        sProduto = new SProduto();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("listaProdutoVenda", Logica.temp);
		request.setAttribute("listaProduto", sProduto.todosProdutos());
		request.setAttribute("listaCategoria", Logica.categorias);
		request.setAttribute("listaVenda", Logica.vendas);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String parametro = request.getParameter("logica"); //Recebe como parametro do jsp, qual a class do service que irá atuar
	    String nomeDaClasse = "service." + parametro; //Nome da Classe

	    try {
	      Class<?> classe = Class.forName(nomeDaClasse); //Transforma a classe num objeto do tipo Class
	      Logica logica = (Logica) classe.newInstance(); //Cria uma nova instância através de um UpCast
	      
	      String pagina = logica.executa(request, response); //Retorna a página depois de executar a ação
	      
	      request.getRequestDispatcher(pagina).forward(request, response); //Redireciona para a página retornada pelo método executa

	    } catch (Exception e) {
	      throw new ServletException(
	          "A lógica de negócios causou uma exceção", e);
	    }
	}
}