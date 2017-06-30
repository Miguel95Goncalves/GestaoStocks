<h1 class="page-header">
    Editar Categoria
</h1>
<form method="POST" action="HIndex?pag=categorias">
	<div class="form-group">
		<label>Categoria:
			<input class="form-control" type="text" placeholder="Novo Nome da Categoria" name="categoria_novo_nome" id="categoria_novo_nome" value='<%=request.getAttribute("Categoria_Nome")%>'>
		</label>
	</div>
	<div class="form-group">
		<input type="hidden" name="logica" value="SCategoria">
		<input type="hidden" name="acao" value="EditarCategoria">
		<input type="hidden" name="id" value="<%=request.getAttribute("Categoria_ID")%>">
	</div>
	<div class="form-group">
		<input class="btn btn-warning" type="submit" name="editar" value="Editar">
	</div>
</form>