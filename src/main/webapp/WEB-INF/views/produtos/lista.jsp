<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Livro de Java, Android, iPhone, Ruby, PHP e muito mais - Casa do Código </title>
		<c:set var="urlBase" value="${pageContext.request.contextPath }"></c:set>
		<c:url value="/resources/css" var="cssPath" />
		<link rel="stylesheet" href="${cssPath}/bootstrap.min.css" />
	</head>
	<body>
	
		<nav class="navbar navbar-dark bg-dark navbar-expand-lg navbar-light bg-light  navbar-fixed-top">
			  <a class="navbar-brand" href="${urlBase }/index">Casa do Código</a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
	
			  <div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto">
					  <li class="nav-item active">
					    <a class="nav-link" href="${urlBase }/produtos">Lista de Produtos<span class="sr-only">(current)</span></a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="${urlBase }/produtos/form">Cadastro de Produtos</a>
					   </li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li>
				      		<a href="">
				      			<security:authentication property="principal" var="usuario"/>
				      			Usuário: ${usuario.username }
				      		</a>
					   	</li>
					</ul>   
					<ul class="nav navbar-nav navbar-right">
						<li>
				      		<a href="${urlBase }/logout">Sair</a>
					   	</li>
					</ul>					
			  </div>
		</nav>
			
		<div class="container">
		
			<h1>Lista de Produtos</h1>
			
			<h2><div>${sucesso}</div></h2>
			<h2><div>${falha}</div></h2>
			
		    <table class = "table table-bordered table-striped table-hover ">
		        <tr>
		            <th>Título</th>
		            <th>Descrição</th>
		            <th>Páginas</th>
				    <c:forEach items="${produtos}" var="produto">
				        <tr>
				            <td><a href="${urlBase }/produtos/detalhe/${produto.id }">${produto.titulo}</a></td>
				            <td>${produto.descricao}</td>
				            <td>${produto.precos }</td>
				            <td>${produto.paginas}</td>
				        </tr>
				    </c:forEach>	            
		        </tr>
		    </table>
	    </div>
	</body>
</html>