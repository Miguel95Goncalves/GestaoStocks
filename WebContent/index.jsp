<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gestão de Stocks</title>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="css/plugins/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div id="wrapper">
		<jsp:include page="nav.html"/>
		
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
                    <div class="col-lg-12">
						<main>
							<%
								if(request.getParameter("pag") != null)
								{
									if(request.getParameter("pag").equals("categorias")){
										%> <jsp:include page="categorias.jsp"/> <%
									}else if(request.getParameter("pag").equals("categoriasFormAdd")){
										%> <jsp:include page="formAddCategorias.jsp"/> <%
									}else if(request.getParameter("pag").equals("fEditCat")){
										%> <jsp:include page="formEditCategorias.jsp"/> <%
									}else if(request.getParameter("pag").equals("produtos")){
										%> <jsp:include page="produtos.jsp"/> <%
									}else if(request.getParameter("pag").equals("produtosFormAdd")){
										%> <jsp:include page="formAddProdutos.jsp"/> <%
									}else if(request.getParameter("pag").equals("fEditProd")){
										%> <jsp:include page="formEditProdutos.jsp"/> <%
									}else if(request.getParameter("pag").equals("vendas")){
										%> <jsp:include page="vendas.jsp"/> <%
									}else if(request.getParameter("pag").equals("vendasFormAdd")){
										%> <jsp:include page="formAddVenda.jsp"/> <%
									}else if(request.getParameter("pag").equals("vendasDetalhes")){
										%> <jsp:include page="vendasDetalhes.jsp"/> <%
									}else if(request.getParameter("pag").equals("inicio")){
										%> <jsp:include page="inicio.html"/> <%
									}
								}
							%>
						</main>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<!-- jQuery -->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="js/plugins/morris/raphael.min.js"></script>
<script src="js/plugins/morris/morris.min.js"></script>
<script src="js/plugins/morris/morris-data.js"></script>
</body>
</html>