<h1 class="page-header">
    Inserir Categoria
</h1>
<form method="POST" action="HIndex?pag=categorias">
	<fieldset title="Adicionar Categoria">
		<div class="form-group">
			<label>Categoria:
				<input class="form-control" type="text" placeholder="Nome da Categoria" name="categoria_nome" id="categoria_nome">
			</label>
		</div>
		<div class="form-group">
			<input type="hidden" name="logica" value="SCategoria">
			<input type="hidden" name="acao" value="AdicionarCategoria">
			
			<input class="btn btn-success" type="submit" value="Inserir" name="inserir">
		</div>
	</fieldset>
</form>