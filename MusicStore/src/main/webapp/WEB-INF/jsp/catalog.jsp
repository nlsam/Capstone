<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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


<title>Catalog</title>
</head>
<body>
	<h1 class="display-1">The Music Store</h1>
	<nav class="p-3 bg-dark text-white">
  <div class="container">
    <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
      <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
        <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
      </a>

      <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
        <li><a href="home" class="nav-link px-2 text-white">Home</a></li>
        <li><a href="catalog" class="nav-link px-2 text-secondary">Catalog</a></li>
        <li><a href="about" class="nav-link px-2 text-white">About</a></li>
        <sec:authorize access="isAuthenticated()">
        	<li><a class="nav-link px-2 text-white" href="orderhistory">Order History</a></li>
        	<li><a class="nav-link px-2 text-white" href="shoppingcart">Cart</a></li>
    	   	
    	</sec:authorize>
      </ul>
		

			
	  <sec:authorize access="!isAuthenticated()">
      	<div class="text-end">
        	<a class="btn btn-outline-light me-2" href="login"  >Login</a>
    		<a class="btn btn-warning" href="register">Register</a>
      	</div>
      </sec:authorize>
      
      <sec:authorize access="isAuthenticated()">
      	<div class="dropdown text-end">
        <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
          <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
        </a>
        <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
        	<sec:authorize access="hasAnyRole('ADMIN')">
    			 <li><a class="dropdown-item" href="admin">Admin</a></li>
    	 		 <li><a class="dropdown-item" href="manageinventory">Manage Inventory</a></li>
    			 <li><a class="dropdown-item" href="manageorders">Manage Orders</a></li>
    			 <li><a class="dropdown-item" href="manageusers">Manage Users</a></li>	
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



	<div class="container">
		<div class="productlist">
			<h1 class="display-1">Catalog</h1>
				<nav class="p-3 bg-dark text-white">
  <div class="container">
    <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
      <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
        <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
      </a>

<!--  https://blog.hubspot.com/website/center-div-css#:~:text=To%20center%20a%20div%20horizontally%20on%20a%20page%2C%20simply%20set,equally%20between%20the%20two%20margins.-->
		
	  <div id="divId1" align=right style="position: absolute;
left: 50%;

transform: translate(-50%, 0);
//border: 5px solid #FFFF00;
padding: 10px;">
		<!-- Search for everything but Price-->
		<form action="search" id="search1">
			<div class="row">
				<div class="col-2">
					<label for="options"><h4 class="fs-6">Search By:</h4></label> 
				</div>
				<div class="col-4">
					<select class="form-select" id="options1" name="options">
					<option value="artist">Index</option>
					<option value="artist">Artist Name</option>
					<option value="format">Music Format</option>
					<option value="genre">Genre</option>
					<option value="style">Style</option>
					<option value="title">Title</option>
					<option value="category">Category</option>
					<option value="price">Price</option>
					</select> 
					
				</div>
				<div class="col-4">
					<input class="form-control" type="text" id="name" name="name" required>
				</div>
				<div class="col-2">
					<input class="form-control fs-8" type="submit" value="Search">
				</div>

			</div>
		</form>

		<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" action="searchprice" id="search2">
			<div class="row">
				<div class="col">
					<label for="options"> Search By: </label> 
				</div>
				<div class="col">
					<select class="form-select" id="options2" name="options">
					<option value="artist">Artist Name</option>
					<option value="format">Music Format</option>
					<option value="genre">Genre</option>
					<option value="style">Style</option>
					<option value="title">Title</option>
					<option value="category">Category</option>
					<option value="price">Price</option>
					</select> 
				</div>
				<div class="col">
					<input class="form-control" type="number" id="lowerprice" name="lowerprice" placeholder="min" required> 		
				</div>
				<div class="col">
					<input class="form-control" type="number" id="higherprice" name="higherprice" placeholder="max" required>
				</div>
				<div class="col">
					<input class="form-control" type="submit" value="Search">
				</div>
				
			</div>
		</form>
		
	
	</div>


    </div>
  </div>
</nav>
			<div style="color: #0000FF;">${successMessage}</div>
			<div style="color: #FF0000;">${errorMessage}</div>
			<table class="table table-hover">
				<thead>
					<tr>
					    <th scope="col"  >Name</th>
						<th scope="col"  >Image</th>
						<th scope="col"  >Price</th>
						<th scope="col"  >Category</th>
						<th scope="col"  > </th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${Product}" var="product">
						<tr>
								<td>${product.title}</td>
								<td>
									<img src="${product.imageurl}" alt="${product.title}"  alt="mdo" width="100" height="100" class="img-thumbnail rounded-square">
								</td>
								<td> $ ${product.price} </td>
								<td class="col-2"> ${product.category} </td>
								<td class="row">
								<form class="col" action="/addToCart" method="post">
									<input type="hidden" id="idnumber" name="id"
										value="${product.id}"><h6>Quantity</h6><input class="w-25" type="number"
										id="quantity" name="quantity" value="1" required> <input class="btn btn-outline-success"
										type="submit" value="Add to Cart">
								</form>
								<form class="row w-25" action="details">
									<input type="hidden" id="idnumber" name="idnumber"
										value="${product.id}"> <input class="btn btn-outline-secondary" type="submit"
										value="Details">
								</form>
								</td>
								 
						</tr>
					</c:forEach>
				  
				</tbody>
			</table>
			
			<nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
    <li class="page-item active"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
  </ul>
</nav>
			
		</div>
	</div>
	 <footer class="page-footer font-small indigo" id="footer" style="width:100%">
    
                    <!-- Copyright -->
                    <div class="footer-copyright text-center py-3">© 2021 Copyright:
                      <a href="localhost:8080/">The Music tore</a>
                    </div>
                    <!-- Copyright -->
          
                  </footer>
                  <!-- Footer -->
       
      
             	<script>
		var element = document.getElementById("footer");
		var rect = element.getBoundingClientRect();
		var w = window.innerWidth;
		var h = window.innerHeight;
	
		console.log(rect.top,  rect.bottom);
		console.log(w+" "+h);
		if(rect.bottom<=h){element.style="position: fixed; bottom: 0; width:100%";}
		//console.log(x);
		rect = element.getBoundingClientRect();
				console.log(rect.top, rect.bottom);
		console.log(w+" "+h);
		var count=0; 
		window.onresize = reportWindowSize;
		function reportWindowSize(){console.log("hi");
		count++; 		element.style="position:width:100%";
		if(count!=1){
			 rect = element.getBoundingClientRect();
			 h = window.innerHeight;
			 console.log(rect.bottom+" "+h);
			if(rect.bottom<=h){element.style="position: fixed; bottom: 0; width:100%";}
			else{element.style="position:width:100%";}
		}
		}
		</script>
               <style>
  footer {
  text-align: center;
  padding: 3px;
  background-color: black;
  color: white;
}
</style>       

	
	
	
	
	

</body>
<script src="/javascript/search.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>
</html>
