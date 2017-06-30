<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList, model.Fatura"%>
<h1 class="page-header">
    Vendas <i class="fa fa-fw fa-barcode"></i>
</h1>
<div class="table-responsive">
	<div class="col-lg-10">
		<h3><a href="HIndex?pag=vendasFormAdd"><i class="fa fa-plus-circle"></i>Efetuar Venda</a></h3>
	</div>
	<div class="col-lg-2">
		<label>Procurar
			<input class="form-control" type="text" id="myInput" onkeyup="myFunction()" placeholder="Procurar por nif.." title="Insira um nif">
		</label>
	</div>
	<table class="table table-bordered table-hover table-striped" id="myTable">
		<thead>
		    <tr>
		        <th>Data</th>
		        <th>NIF</th>
		        <th>Pagamento</th>
		        <th>Total</th>
		        <th>Detalhes</th>
		    </tr>
		</thead>
		<%
		ArrayList listaVenda = (ArrayList) request.getAttribute("listaVenda");
		
		for(int i=0;i<listaVenda.size();i++){
			Fatura vend = (Fatura) listaVenda.get(i);
			
			out.append("<tr><td>" + vend.getFatura_data() + "</td>"
					+ "<td>" + vend.getCliente_nif() + "</td>"
					+ "<td>" + vend.getPagamento() + "</td>"
					+ "<td>" + vend.getFatura_total() + "&euro;</td>"
					+ "<td><a href='HIndex?pag=vendasDetalhes&id=" + vend.getFatura_id() + "'><i class='fa fa-eye'></i> Detalhes</a></h3></td></tr>");
		}
		%>
		<tbody>
		</tbody>
	</table>
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
</script>