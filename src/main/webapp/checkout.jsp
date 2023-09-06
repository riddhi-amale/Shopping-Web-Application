<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%
	User u = (User) session.getAttribute("userDetails");

	if(u == null){
		session.setAttribute("warning", "You are not logged in!! Login first  to access the checkoutpage");
		response.sendRedirect("login.jsp");
		return;
	}
%> 

<html>

	<head>
		<meta charset="ISO-8859-1">
		<title>Checkout Page</title>
		<%@include file="components/common.jsp"%>
		<%@include file="components/common_modals.jsp" %>
	</head>
	
	<body>
		<%@include file="components/navbar.jsp"%>
		
		
		<div class="container">
			<div class="row mt-5">
				<!-- Cart - Details -->
				<div class="col-md-6">
				
					<div class="card bg-light">
						<div class="card-body">
							<h3 class="text-center mb-5">Cart - Selected Products</h3>
						
							<div class="cart-body">
							
							</div>
						</div>
					</div>
					
				</div>
				
				<!-- Checkout - Details -->
				<div class="col-md 6">
				
					<div class="card">
						<div class="card-body">
							<h3 class="text-center mb-5">Checkout Details - for Order</h3>
							
							
							<form action="CheckoutServlet" method="post">
								<div class="form-group">
									<label for="emailId">Email Address</label>
									<input type="email" value=<%=u.getEmail()%> class="form-control" id = "emailId" aria-describedby="emailHelp" placeholder="Enter EmailId">
									<small id="emailHelp" class="form-text text-muted"> We'll never share emailId with others</small>
								</div>
								
								<div class="form-group">
									<label for="name">Name</label>
									<input type="text" value=<%=u.getName()%> class="form-control" id = "name" placeholder="Enter Name">									
								</div>
								
								<div class="form-group">
									<label for="address">Your Shipping Address</label>
									<input type="text" value=<%=u.getAddress()%> style="height: 175px" class="form-control" id = "address" placeholder="Enter Shipping Address">									
								</div>
								
								<div class="form-group">
									<label for="contact">Phone</label>
									<input type="text" value=<%=u.getPhone()%> class="form-control" id = "contact" placeholder="Enter Mobile Number">									
								</div>
								
								<div class="container text-center">
									<button class="btn btn-outline-success" onclick="emptyCart()">Order Now</button>
									<!-- <button class="btn btn-outline-primary" onclick="continueShopping()">Continue Shopping</button> -->									
									<a href='homepage.jsp'> <input type=button class="btn btn-outline-primary" value='Continue Shopping'> </a>
									
								</div>
							</form>
							
							<!-- <div class="container text-center">
									<button id="paytmWithPaytm" class="btn btn-outline-success">Order Now</button>
							</div> -->
							
							
						</div>
						
					</div>
				
				</div>
			</div>
		</div>
			 
	 	
	</body>

		
</html>