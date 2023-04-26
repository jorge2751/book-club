<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="/webjars/bootstrap/4.5.2/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
<meta charset="ISO-8859-1">
<title>Create a book</title>
</head>
<body>
	<h1>
		Add a Book to Your Shelf!
		<a href="/">back to the shelves</a>
	</h1>
	<form:form action="/process/create" method="post" modelAttribute="book">
	    <form:input type="hidden" path="user" value="${user_id}"/>
	    <div class="form-group">
	        <form:label path="title">Title </form:label>
	        <form:input type="text" path="title" class="form-control"/>
	        <form:errors path="title"/>
	    </div>
	    <div class="form-group">
	        <form:label path="name">Author </form:label>
	        <form:input type="text" path="name" class="form-control" />
	        <form:errors path="name"/>
	    </div>
	    <div class="form-group">
	        <form:label path="thought">My thoughts </form:label>
	        <form:input type="text" path="thought" class="form-control" />
	        <form:errors path="thought"/>
	    </div>
	    <input type="submit" value="Submit" class="btn btn-primary" />
	</form:form>
</body>
</html>