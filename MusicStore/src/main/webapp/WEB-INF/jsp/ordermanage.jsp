<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<h1 class="display-1">The Music Store:Admin Side</h1>
	<nav class="p-3 bg-dark text-white">
		<div class="container">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				<a href="/"
					class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
					<svg class="bi me-2" width="40" height="32">
						<use xlink:href="#bootstrap" /></svg>
				</a>

				<ul
					class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<li><a href="home" class="nav-link px-2 text-secondary">Home</a></li>
					<li><a href="catalog" class="nav-link px-2 text-white">Catalog</a></li>
					<li><a href="about" class="nav-link px-2 text-white">About</a></li>
					<sec:authorize access="isAuthenticated()">
						<li><a class="nav-link px-2 text-white" href="orderhistory">Order
								History</a></li>
						<li><a class="nav-link px-2 text-white" href="shoppingcart">Cart</a></li>

					</sec:authorize>
				</ul>



				<sec:authorize access="!isAuthenticated()">
					<div class="text-end">
						<a class="btn btn-outline-light me-2" href="login">Login</a> <a
							class="btn btn-warning" href="register">Register</a>
					</div>
				</sec:authorize>

				<sec:authorize access="isAuthenticated()">
					<div class="dropdown text-end">
						<a href="#"
							class="d-block link-dark text-decoration-none dropdown-toggle"
							id="dropdownUser1" data-bs-toggle="dropdown"
							aria-expanded="false"> <img src="images/coolpanda1_crop.jpg"
							alt="mdo" width="32" height="32" class="rounded-circle">
						</a>
						<ul class="dropdown-menu text-small"
							aria-labelledby="dropdownUser1">
							<sec:authorize access="hasAnyRole('ADMIN')">
								<li><a class="dropdown-item" href="admin">Admin</a></li>
								<li><a class="dropdown-item" href="manageinventory">Manage
										Inventory</a></li>
								<li><a class="dropdown-item" href="manageusers">Manage
										Orders</a></li>
								<li><a class="dropdown-item" href="manageusers">Manage
										Users</a></li>
							</sec:authorize>
							<li><a class="dropdown-item" href="profile">Profile</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="logout">Sign out</a></li>
						</ul>
					</div>
				</sec:authorize>
			</div>
		</div>
	</nav>

	<h2>
		<div style="color: #0000FF;">${successMessage}</div>
		<div style="color: #FF0000;">${errorMessage}</div>
	</h2>

	<div class="container">
		<div>
			<table class="table table-striped table-bordered" id="tblData">
				<thead>
					<tr>
						<h1>List of All Orders</h1>
					</tr>
					<tr>
						<th scope="col">Order Id</th>
						<th scope="col">Status</th>
						<th scope="col">Customer Username</th>
						<th scope="col"># Products Ordered</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${orders}" var="order">
						<tr>
							<td><c:out value="${order.id}" /></td>
							<td><c:out value="${order.status}" /></td>
							<td><c:out value="${order.customer.getUsername()}" /></td>
							<td><c:out value="${order.products.size()}" /></td>
							<td>
								<form action="/editOrder" method="post">
									<input type="hidden" name="id" value="${order.id}"> <input
										type="submit" value="Edit Products">
								</form>
								<form action="/deleteOrder" method="post">
									<input type="hidden" name="id" value="${order.id}"> <input
										type="submit" value="Delete Order">
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<form action="/addOrder" method="post">
				<table class="table table-striped table-bordered" id="tblData">
					<thead>
						<tr>
							<h1>Add an Order</h1>
						</tr>
						<tr>
							<th><input type="number" name="ordernumber"
								placeholder="Order Number"></th>
							<th><select name="status" id="status">
									<option value="" disabled selected>Status</option>
									<option value="ORDERED">Ordered</option>
									<option value="SHIPPED">Shipped</option>
									<option value="DELIVERED">Delivered</option>
							</select></th>
							<th><input type="text" name="user" placeholder="Customer"></th>
							<th><input type="submit" value="Add"></th>
						</tr>
					</thead>
				</table>
			</form>
		</div>
		<div>
			<form action="/updateOrderStatus" method="post">
				<table class="table table-striped table-bordered" id="tblData">
					<thead>
						<tr>
							<h1>Update Order Status</h1>
							</td>
						<tr>
							<th><input type="text" name="id" placeholder="Order Id"
								required></th>
						<tr>
							<th><select name="status" id="status">
									<option value="" disabled selected>Status</option>
									<option value="ORDERED">Ordered</option>
									<option value="SHIPPED">Shipped</option>
									<option value="DELIVERED">Delivered</option>
							</select></th>
							<th><input type="submit" value="Update"></th>
					</thead>
				</table>
			</form>
		</div>
	</div>
	<footer class="page-footer font-small indigo" id="footer"
		style="width: 100%">
		<!-- Copyright -->
		<div class="footer-copyright text-center py-3">
			Copyright � 2021 Designed by <span> <a href="/about">The
					Coolest Team!</a> All rights reserved.
			</span> <a href="/manageorders">Back to top</a>
			<button class="btn btn-toggle" style="color: red" onclick="myFunction()">Dark/Light</button>
		</div>
	</footer>

	<script src="/javascript/dark.js"></script>
	<script src="/javascript/footer.js"></script>
</body>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>
</html>