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
<title>Dashboard</title>
</head>
<body> 
	<h1>
		Welcome, <c:out value="${loggedInUser.userName}"/>
		<a href="users/logout">logout</a>
	</h1>
	<h3>Books from everyone's shelves: 
	<a href="/create">+ Add a book to my shelf!</a>
	</h3>
	<table class="table table-striped" style= "border:3px solid black">
		<thead>
			<th>ID</th>
			<th>Title</th>
			<th>Author Name</th>
			<th>Posted By</th>
			<th>Actions</th>
		</thead>
		<tbody>
			<c:forEach var="book" items="${allBook}">
				<tr>
					<td>${book.id}</td>
					<td><a href="/display/${book.id}">${book.title}</a></td>
					<td>${book.name}</td>
					<td>${book.user.userName}</td>
					<td>
						<form action="/delete/${book.id}" method="post">
						<a class="btn btn-outline-warning" href="/edit/${book.id}">Edit</a>
							<input type="hidden" name="_method" value="delete"/>
							<input type="submit" value="Delete" class="btn btn-outline-danger"/>
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>