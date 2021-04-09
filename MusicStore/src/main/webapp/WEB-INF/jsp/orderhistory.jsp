<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>Order History</title>
</head>
<body>
	<h1 class="display-1">The Music Store</h1>
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
					<li><a href="home" class="nav-link px-2 text-white">Home</a></li>
					<li><a href="catalog" class="nav-link px-2 text-white">Catalog</a></li>
					<li><a href="about" class="nav-link px-2 text-white">About</a></li>
					<sec:authorize access="isAuthenticated()">
						<li><a class="nav-link px-2 text-secondary"
							href="orderhistory">Order History</a></li>
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
							aria-expanded="false"> <img src="https://github.com/mdo.png"
							alt="mdo" width="32" height="32" class="rounded-circle">
						</a>
						<ul class="dropdown-menu text-small"
							aria-labelledby="dropdownUser1">
							<sec:authorize access="hasAnyRole('ADMIN')">
								<li><a class="dropdown-item" href="admin">Admin</a></li>
								<li><a class="dropdown-item" href="manageinventory">Manage
										Inventory</a></li>
								<li><a class="dropdown-item" href="manageorders">Manage
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
	<div class="container w-75">
		<h1 class="display-1">Order History</h1>
		<table class="table table-striped table-bordered" id="tblData">
			<thead>
				<tr>
					<th scope="col">Order Id</th>
					<!-- <th scope="col">Order Number</th> Hidden for now-->
					<th scope="col">Status</th>
					<th scope="col">Items</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orders}" var="order">
					<tr>
						<td><c:out value="${order.id}" /></td>
						<!-- <td><c:out value="${order.orderNumber}" /></td> Hidden for now-->
						<td><c:out value="${order.status}" /></td>
						<td><c:out value="${order.products.size()}" /></td>
						<td>
							<form class="row w-75 " action="getOrderDetails" method="post">
								<input type="hidden" id="orderid" name="orderid"
									value="${order.id}"> <input class="btn btn-secondary"
									type="submit" value="Order Details">
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<footer class="page-footer font-small indigo" id="footer"
		style="width: 100%">
		<!-- Copyright -->
		<div class="footer-copyright text-center py-3">
			Copyright � 2021 Designed by <span> <a href="localhost:8080/">The
					Coolest Team!</a> All rights reserved.
			</span> <a href="/orderhistory">Back to top</a>
		</div>
	</footer>
	<script>
		var element = document.getElementById("footer");
		var rect = element.getBoundingClientRect();
		var w = window.innerWidth;
		var h = window.innerHeight;

		console.log(rect.top, rect.bottom);
		console.log(w + " " + h);
		if (rect.bottom <= h) {
			element.style = "position: fixed; bottom: 0; width:100%";
		}
		//console.log(x);
		rect = element.getBoundingClientRect();
		console.log(rect.top, rect.bottom);
		console.log(w + " " + h);
		var count = 0;
		window.onresize = reportWindowSize;
		function reportWindowSize() {
			console.log("hi");
			count++;
			element.style = "position:width:100%";
			if (count != 1) {
				rect = element.getBoundingClientRect();
				h = window.innerHeight;
				console.log(rect.bottom + " " + h);
				if (rect.bottom <= h) {
					element.style = "position: fixed; bottom: 0; width:100%";
				} else {
					element.style = "position:width:100%";
				}
			}
		}
	</script>
</body>
<script>
	var x = document.getElementById("search1");
	var xx = document.getElementById("options1");
	var x2 = document.getElementById("search2");
	var xx2 = document.getElementById("options2");
	var y = document.getElementById("divId1");

	var count = 0;
	var count2 = 0;
	var currentState = false;
	var currentState2 = false;
	var option1A = document.getElementById("options1");
	option1A.addEventListener("change", function() {

		if (this.value == "price") {
			y.removeChild(x);
			xx2.selectedIndex = "6";
			y.appendChild(x2);
		}

	});

	var option1B = document.getElementById("options2");
	option1B.addEventListener("change", function() {
		console.log(this.value);
		if (this.value != "price") {
			y.removeChild(x2);
			if (this.value == "artist") {
				xx.selectedIndex = "0";
			} else if (this.value == "format") {
				xx.selectedIndex = "1";
			} else if (this.value == "genre") {
				xx.selectedIndex = "2";
			} else if (this.value == "style") {
				xx.selectedIndex = "3";
			} else if (this.value == "title") {
				xx.selectedIndex = "4";
			} else if (this.value == "category") {
				xx.selectedIndex = "5";
			}

			y.appendChild(x);
		}

	});
	console.log("zzzz");
	y.removeChild(x2);
</script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>
</html>