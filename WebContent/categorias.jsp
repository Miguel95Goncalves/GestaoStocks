<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList, model.Categoria"%>
<h1 class="page-header">
    Categorias <i class="fa fa-fw  fa-tags"></i>
</h1>
<div class="table-responsive">
	<h3><a href="HIndex?pag=categoriasFormAdd"><i class="fa fa-plus-circle"></i>Inserir</a></h3>
    <table class="table table-bordered table-hover table-striped">
        <thead>
            <tr>
                <th>Nome da Categoria</th>
                <th>Número de Produtos</th>
                <th>Editar</th>
                <th>Eliminar</th>
            </tr>
        </thead>
        <tbody>
            <%
            ArrayList listaCategoria = (ArrayList) request.getAttribute("listaCategoria");
			
			for(int i=0;i<listaCategoria.size();i++){
				Categoria cat = (Categoria) listaCategoria.get(i);
				out.append("<tr><td>" + cat.getCategoria_nome() + "</td>"
						+ "<td>" + cat.getProdutos().size() + "</td>"
						+ "<td><form method='POST' action='HIndex?pag=fEditCat'>"
						+ "<input type='hidden' name='logica' value='SCategoria'></input>"
						+ "<input type='hidden' name='acao' value='procurarCat'>"
						+ "<input type='hidden' name='id' value='"+ cat.getCategoria_id() +"'>"
						+ "<input class='btn btn-warning' type='submit' value='Editar' name='editar'>"
						+ "</form></td>"
						
						+ "<td><form action='HIndex?pag=categorias' method='POST'>"
						+ "<input type='hidden' name='logica' value='SCategoria'>"
						+ "<input type='hidden' name='acao' value='EliminarCategoria'>"
						+ "<input type='hidden' name='id' value='"+ cat.getCategoria_id() +"'>"
						+ "<input class='btn btn-danger' type='submit' value='Apagar' name='eliminar'>"
						+ " </form></td></tr>");
			}
            %>
        </tbody>
    </table>
</div>