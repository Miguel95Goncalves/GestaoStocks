<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList, model.Produto"%>
<h1 class="page-header">
    Efetuar Venda
</h1>
<div class="col-lg-6">
	<form method='POST' action='HIndex?pag=vendasFormAdd'>
		<div class="form-group">
			<label>NIF
				<input class="form-control" type="text" max-length="9" pattern="[0-9]{9}" title="Este campo deverá conter 9 digítos." required id="nif" name="nif" <%if(request.getAttribute("nif") != null) out.append("value='" + request.getAttribute("nif") + "'"); %>>
			</label>
			<label>Pagamento
				<select class="form-control" id="pagamento" name="pagamento">
				<%if(request.getAttribute("pagamento") != null && request.getAttribute("pagamento").equals("Dinheiro")){
					out.append("<option value='Dinheiro' selected>Dinheiro</option>"
							+ "<option value='Multibanco'>Multibanco</option>");
				}else if(request.getAttribute("pagamento") != null && request.getAttribute("pagamento").equals("Multibanco")){ 
					out.append("<option value='Multibanco' selected>Multibanco</option>"
							+ "<option value='Dinheiro'>Dinheiro</option>");
				}else{
					out.append("<option value='Multibanco'>Multibanco</option>"
							+ "<option value='Dinheiro'>Dinheiro</option>");
				}%>
				</select>
			</label>
		</div>
		<table class="table table-bordered table-hover table-striped">
			<tr class="header">
			    <th style="width:50%;">Produto</th>
			    <th style="width:25%;">Quantidade</th>
			    <th style="width:25%;">Remover</th>
			 </tr>
		<%
		if(request.getAttribute("listaProdutoVenda") != null){
			ArrayList listaProdutoVenda = (ArrayList) request.getAttribute("listaProdutoVenda");
			
			for(int i=0;i<listaProdutoVenda.size();i++){
				Produto prod = (Produto) listaProdutoVenda.get(i);
				out.append("<tr><td>" + prod.getProduto_nome() + "</td>"
				+ "<td>" + prod.getQuantidade_venda() + "</td>"
				+ "<td>"
				+ "<input type='hidden' name='id_categoria' value='" + prod.getCategoria_id() + "'>"
				+ "<input type='hidden' name='id_produto' value='" + prod.getProduto_id() + "'>"
				+ "<input type='submit' class='btn btn-default' name='remP' id='remP' value='Remover >>' onClick='change(this)'></td></tr>"
				+ "</td></tr>");
			}
			out.append("</table>");
		}
		%>
		<input type='hidden' name='acao' id='acao' value='removerProduto'>
		<input type='hidden' name='logica' value='SVenda'>
		<input type='submit' class='btn btn-default' name='addP' value='Adicionar Venda' onClick='change(this)'>
	</form>
</div>

<div class="col-lg-6">
	<div class="form-group">
		<label>Produtos
			<input class="form-control" type="text" id="myInput" onkeyup="myFunction()" placeholder="Procurar por nome.." title="Insira um nome">
		</label>
		<table class="table table-bordered table-hover table-striped" id="myTable">
			<tr class="header">
				<th style="width:25%;">Adicionar</th>
			    <th style="width:50%;">Produto</th>
			    <th style="width:25%;">Quantidade</th>
			 </tr>
			 <%
			 ArrayList listaProduto = (ArrayList) request.getAttribute("listaProduto");
				
				for(int i=0;i<listaProduto.size();i++){
					Produto prod = (Produto) listaProduto.get(i);
					
					out.append("<tr><td>"
					+ "<form method='POST' action='HIndex?pag=vendasFormAdd'>"
					+ "<input type='hidden' name='id_categoria' value='" + prod.getCategoria_id() + "'>"
					+ "<input type='hidden' name='id_produto' value='" + prod.getProduto_id() + "'>"
					+ "<input type='hidden' name='acao' value='adicionarProduto'>"
					+ "<input type='hidden' name='logica' value='SVenda'>"
					+ "<input type='hidden' class='nifTemp' name='nifTemp'>"
					+ "<input type='hidden' class='pagamentoTemp' name='pagamentoTemp'>"
					+ "<input type='submit' class='btn btn-default' name='addP' value='<< Adicionar' onClick='igualarNif()'></td>"
					+ "<td>" + prod.getProduto_nome() + "</td>"
					+ "<td>" + prod.getProduto_stock() + "</td></tr>"
					+ "</form>");
				}
			 %>
		</table>
	</div>
</div>

<script>
function myFunction() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}

function change(field){
	var id = field.id;
	if(id == "remP"){
		$("#acao").val("removerProduto");
	}else $("#acao").val("adicionarVenda");
}

function igualarNif(){
	$(".nifTemp").val($("#nif").val());
	$(".pagamentoTemp").val($("#pagamento").val());
}
</script>