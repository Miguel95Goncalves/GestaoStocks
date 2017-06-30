<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList, model.Categoria"%>
<h1 class="page-header">
    Editar Produto
</h1>
<form method="POST" action="HIndex?pag=produtos">
	<div class="form-group">
		<div class="form-group">
			<label>Categoria:
				<select class="form-control" name="nova_categoria">
					<%
					ArrayList listaCategoria = (ArrayList) request.getAttribute("listaCategoria");
					
					for(int i=0;i<listaCategoria.size();i++){
						Categoria cat = (Categoria) listaCategoria.get(i);
						
						if(cat.getCategoria_id() == Integer.parseInt(request.getAttribute("Categoria_ID").toString())){
							out.append("<option selected value=" + cat.getCategoria_id() + ">" + cat.getCategoria_nome() + "</option>");
						}else{
							out.append("<option value=" + cat.getCategoria_id() + ">" + cat.getCategoria_nome() + "</option>");
						}
						
					}
					%>
				</select>
			</label>
		</div>
		<div class="form-group">
			<label>Produto:
				<input class="form-control" type="text" placeholder="Nome do Produto" name="novo_produto_nome" id="novo_produto_nome" value="<%=request.getAttribute("Produto_Nome")%>">
			</label>
		</div>
		<div class="form-group">
			<label>Preço:
				<input class="form-control" type="text" placeholder="Preço do Produto" name="novo_produto_preco" id="novo_produto_preco" value="<%=request.getAttribute("Produto_Preco")%>">
			</label>
		</div>
		<div class="form-group">
			<label>Stock:
				<input class="form-control" type="text" placeholder="stock do Produto" name="novo_produto_stock" id="novo_produto_stock" value="<%=request.getAttribute("Produto_Stock")%>">
			</label>
		</div>
		<div class="form-group">
			<label>Stock Mínimo:
				<input class="form-control" type="text" placeholder="Stock Mínimo do Produto" name="novo_produto_stock_minimo" id="novo_produto_stock_minimo" value="<%=request.getAttribute("Produto_Stock_Minimo")%>">
			</label>
		</div>
		<div class="form-group">
			<label>Descrição:
				<textarea class="form-control" placeholder="Descrição do Produto" name="novo_produto_descricao" id="novo_produto_descricao" cols="25" rows="5"><%=request.getAttribute("Produto_Descricao")%></textarea>
			</label>
		</div>
	</div>
	<div class="form-group">
		<input type="hidden" name="logica" value="SProduto">
		<input type="hidden" name="acao" value="EditarProduto">
		<input type="hidden" name="cat_id" value="<%=request.getAttribute("Categoria_ID")%>">
		<input type="hidden" name="id" value="<%=request.getAttribute("Produto_ID")%>">
	</div>
	<div class="form-group">
		<input class="btn btn-warning" type="submit" name="editar" value="Editar">
	</div>
</form>