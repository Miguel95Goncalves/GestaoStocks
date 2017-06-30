<%@page import="service.Logica"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList, model.Produto"%>
<h1 class="page-header">
    Produtos <i class="fa fa-fw fa-dropbox"></i>
</h1>
<div class="table-responsive">
	<% if(Logica.categorias.size() > 0){ %>
		<h3><a href="HIndex?pag=produtosFormAdd"><i class="fa fa-plus-circle"></i>Inserir</a></h3>
	<%} %>
    <table class="table table-bordered table-hover table-striped">
        <thead>
            <tr>
                <th>Produto</th>
                <th>Categoria</th>
                <th>Descrição</th>
                <th>Preço</th>
                <th>Stock</th>
                <th>Stock Mínimo</th>
                <th>Editar</th>
                <th>Eliminar</th>
            </tr>
        </thead>
        <tbody>
            <%
            String categoria = "";
            ArrayList listaProduto = (ArrayList) request.getAttribute("listaProduto");
			
			for(int i=0;i<listaProduto.size();i++){
				Produto prod = (Produto) listaProduto.get(i);
				
				for(int o = 0;o<Logica.categorias.size();o++) if(Logica.categorias.get(o).getCategoria_id() == prod.getCategoria_id()) categoria = Logica.categorias.get(o).getCategoria_nome();
				
				out.append("<tr><td>" + prod.getProduto_nome() + "</td>"
						+ "<td>" + categoria + "</td>"
						+ "<td>" + prod.getProduto_descricao() + "</td>"
						+ "<td>" + prod.getProduto_preco_venda() + "&euro;</td>"
						+ "<td>" + prod.getProduto_stock() + "</td>"
						+ "<td>" + prod.getProduto_stock_minimo() + "</td>"
						+ "<td><form method='POST' action='HIndex?pag=fEditProd'>"
						+ "<input type='hidden' name='logica' value='SProduto'></input>"
						+ "<input type='hidden' name='acao' value='ProcurarProduto'>"
						+ "<input type='hidden' name='id_cat' value='"+ prod.getCategoria_id() +"'>"
						+ "<input type='hidden' name='id' value='"+ prod.getProduto_id() +"'>"
						+ "<input class='btn btn-warning' type='submit' value='Editar' name='editar'>"
						+ "</form></td>"
						
						+ "<td><form action='HIndex?pag=produtos' method='POST'>"
						+ "<input type='hidden' name='logica' value='SProduto'>"
						+ "<input type='hidden' name='acao' value='EliminarProduto'>"
						+ "<input type='hidden' name='id_cat' value='"+ prod.getCategoria_id() +"'>"
						+ "<input type='hidden' name='id' value='"+ prod.getProduto_id() +"'>"
						+ "<input class='btn btn-danger' type='submit' value='Apagar' name='eliminar'>"
						+ " </form></td></tr>");
			}
            %>
        </tbody>
    </table>
</div>