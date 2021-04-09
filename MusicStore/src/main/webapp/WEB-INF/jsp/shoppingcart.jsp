<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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

<title>Shopping Cart</title>
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
						<li><a class="nav-link px-2 text-white" href="orderhistory">Order
								History</a></li>
						<li><a class="nav-link px-2 text-secondary"
							href="shoppingcart">Cart</a></li>

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
	<div class="container w-25">
		<ul class="list-group mb-3">
			<h1 class="display-1">Cart</h1>
			<h5 class="text-danger">${errorMessage}</h5>
			<c:set var="total" value="${0}" />
			<c:forEach items="${products}" var="product">
				<li
					class="list-group-item d-flex justify-content-between lh-condensed">
					<div>
						<h6 class="my-0">${product.title}</h6>
						<small class="text-muted">${product.format}</small>
						<form action="/deleteFromCart" method="post"">
							<input type="hidden" name="id" value="${product.id}"> <input
								class="btn btn-danger btn-sm" type="submit" value="Remove">
						</form>
					</div> <span class="text-muted">$${product.price} x
						${product.quantity} item(s) = $${product.price * product.quantity}</span>
				</li>

				<c:set var="total"
					value="${total + (product.price * product.quantity)}" />
			</c:forEach>

			<li class="list-group-item d-flex justify-content-between"><span>Total
					(USD)</span> <strong>$ ${total - discount}</strong></li>
		</ul>
		<form action="/payment" method="get">
			<input class="btn btn-secondary" type="submit" value="Checkout">
		</form>
	</div>
	<footer class="page-footer font-small indigo" id="footer"
		style="width: 100%">
		<!-- Copyright -->
		<div class="footer-copyright text-center py-3">
			Copyright � 2021 Designed by <span> <a href="localhost:8080/">The
					Coolest Team!</a> All rights reserved.
			</span> <a href="/shoppingcart">Back to top</a>
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