<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
    href="/webjars/bootstrap/4.5.2/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
<meta charset="ISO-8859-1">
<title>View Book</title>
</head>
<body style="padding-left:20px"> 
	
	<h1 style="padding-top:50px">
	
		<c:out value="${book.title}"></c:out>
		<a href="/">back to the shelves</a>
	</h1>
	<div>
	<h3 style="padding-top:50px">${book.user.userName} read <c:out value="${book.title}"/> by <c:out value="${book.name}."/></h3>
	</div>
	<div>
		<h5>${book.user.userName}'s thoughts on the book:</h5>
	</div>
	
	<div style="padding-top:20px">
	<h4><c:out value="${book.thought}"/></h4>
	</div>
	<div style="padding-top:50px"></div>
	<div></div>
	<div>
		<form style="padding-left:300px" action="/delete/${book.id}" method="post">
			<a class="btn btn-outline-warning" href="/edit/${book.id}" >edit</a>
			<input type="hidden" name="_method" value="delete"/>
			<input type="submit" value="Delete" class="btn btn-outline-danger"/>
		</form>
	</div>
</body>
</html>