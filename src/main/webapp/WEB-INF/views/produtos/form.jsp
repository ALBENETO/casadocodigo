<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Livro de Java, Android, iPhone, Ruby, PHP e muito mais - Casa do Código </title>
		<c:url value="/resources/css" var="cssPath" />
		<c:set var="urlBase" value="${pageContext.request.contextPath }"></c:set>
		<link rel="stylesheet" href="${cssPath}/bootstrap.min.css" />
		
	</head>
	<body>
	
		<nav class="navbar navbar-dark bg-dark navbar-expand-lg navbar-light bg-light navbar-fixed-top" >
			  <a class="navbar-brand" href="${urlBase}/index">Casa do Código</a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
		
			  <div class="collapse navbar-collapse" id="navbarSupportedContent">
			    <ul class="navbar-nav mr-auto">
			      <li class="nav-item active">
			        <a class="nav-link" href="${urlBase}/produtos">Lista de Produtos<span class="sr-only">(current)</span></a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="${urlBase}/produtos/form">Cadastro de Produtos</a>
			      </li>
			  </div>
		</nav>	
		<div class="container">
		
			<h1>Cadastro de Produto</h1>
		
			<form:form action="produtos" method="POST" modelAttribute="produto" enctype="multipart/form-data">
			
				<div class="form-grourp">
					<label>Titulo</label>
					<form:input path="titulo" cssClass="form-control"/>
					<form:errors path="titulo" cssClass="form-control"/>
				</div>
				
				<div class="form-grourp">
					<label>Descrição</label>
					<form:textarea path="descricao" cssClass="form-control"/>
					<form:errors path="descricao"/>
				</div>
			
				<div class="form-grourp">
					<label>Páginas</label>
					<form:input path="paginas" cssClass="form-control"/>
					<form:errors path="paginas"/>
				</div>
				<div class="form-grourp">
					<label>Data de Lançamento</label>
					<form:input path="dataLancamento" cssClass="form-control"/>
					<form:errors path="dataLancamento"/>
				</div>
				<c:forEach items="${tipos }" var="tipoPreco" varStatus="status">
					<div class="form-grourp">
						<label>${tipoPreco }</label>
						<form:input path="precos[${status.index}].valor" cssClass="form-control"/>
						<form:hidden path="precos[${status.index}].tipo" value="${tipoPreco}"/>
					</div>
				</c:forEach>
				<div class="form-grourp">
					<label>Sumário</label>
					<input name="sumario" type="file" class="form-control">
				</div>
				<button type="submit" class="btn btn-primary">Cadastrar Livro</button>
			</form:form>
		</div>
	</body>
</html>