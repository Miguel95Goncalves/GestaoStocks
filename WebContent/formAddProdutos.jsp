<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList, model.Categoria"%>
<h1 class="page-header">
    Inserir Produto
</h1>
<form method="POST" action="HIndex?pag=produtos">
	<fieldset title="Adicionar Produto">
	<div class="form-group">
			<label>Categoria:
				<select class="form-control" name="categoria">
					<%
					ArrayList listaCategoria = (ArrayList) request.getAttribute("listaCategoria");
					
					for(int i=0;i<listaCategoria.size();i++){
						Categoria cat = (Categoria) listaCategoria.get(i);
						out.append("<option value=" + cat.getCategoria_id() + ">" + cat.getCategoria_nome() + "</option>");
					}
					%>
				</select>
			</label>
		</div>
		<div class="form-group">
			<label>Produto:
				<input class="form-control" type="text" placeholder="Nome do Produto" name="produto_nome" id="produto_nome">
			</label>
		</div>
		<div class="form-group">
			<label>Preço:
				<input class="form-control" type="text" placeholder="Preço do Produto" name="produto_preco" id="produto_preco" pattern="[0-9]{1,}\.[0-9]{0,}|[0-9]{1,}" title="Substitua as vírgulas por pontos!">
			</label>
		</div>
		<div class="form-group">
			<label>Stock:
				<input class="form-control" type="text" placeholder="stock do Produto" name="produto_stock" id="produto_stock">
			</label>
		</div>
		<div class="form-group">
			<label>Stock Mínimo:
				<input class="form-control" type="text" placeholder="Stock Mínimo do Produto" name="produto_stock_minimo" id="produto_stock_minimo">
			</label>
		</div>
		<div class="form-group">
			<label>Descrição:
				<textarea class="form-control" placeholder="Descrição do Produto" name="produto_descricao" id="produto_descricao" cols="25" rows="5"></textarea>
			</label>
		</div>
		<div class="form-group">
			<input type="hidden" name="logica" value="SProduto">
			<input type="hidden" name="acao" value="AdicionarProduto">
			
			<input class="btn btn-success" type="submit" value="Inserir" name="inserir">
		</div>
	</fieldset>
</form>