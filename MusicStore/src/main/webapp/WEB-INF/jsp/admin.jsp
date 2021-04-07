<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html>
  <head>
  	<link rel="stylesheet" href="css/style.css">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link href="css/main.css" rel="stylesheet">


    <title>Admin</title>
  </head>
  <body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="home">Home</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
				aria-controls="navbarNavAltMarkup" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav"">
					<a class="nav-link" href="catalog">Catalog</a> <a class="nav-link"
						href="about">About</a>
					<sec:authorize access="isAuthenticated()">
						<a class="nav-link" href="shoppingcart">Cart</a>
						<a class="nav-link" href="orderhistory">Order History</a>
						<a class="nav-link" href="profile">Profile</a>

					</sec:authorize>

					<sec:authorize access="hasAnyRole('ADMIN')">

						<a class="nav-link" href="admin">Admin</a>
						<a class="nav-link" href="manageinventory">Manage Inventory</a>
						<a class="nav-link" href="manageusers">Manage Orders</a>
						<a class="nav-link" href="manageusers">Manage Users</a>
					</sec:authorize>

					<sec:authorize access="!isAuthenticated()">

						<a class="nav-link" href="login">Login</a>
						<a class="nav-link" href="register">Register</a>

					</sec:authorize>

					<sec:authorize access="isAuthenticated()">
						<a class="nav-link" href="logout">Logout</a>
					</sec:authorize>
				</div>
			</div>
		</div>
	</nav>

	<h1 class="display-1">Wow, you're an admin!!!</h1>
	</form>
	<form action="http://localhost:8080/swagger-ui.html#/" method="GET">
		<input type="submit" value="View Swagger Documentation">
	</form>



	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.2.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
    </body>
</html>