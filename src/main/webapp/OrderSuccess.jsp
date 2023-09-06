<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
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
		<meta charset="UTF-8">
		<title>Order Successful</title>		
		<%@include file="components/common.jsp"%>		
	</head>
	
	<style>
	
	.custom-bg{
	  background: #f4511e!important;
	}
	
	.jumbotron {
	  background-color: #f4511e; /* Orange */
	  color: #ffffff;
	  border-top: solid;
	}
	
	
	/* Add an orange color to all icons and set the font-size */
	.logo-small {
	  color: #f4511e;
	  font-size: 50px;
	}
	
	.carousel-control-next {
	  background-image: linear-gradient(to right, rgba(244, 81, 30,0.2), rgba(244, 81, 30,100));
	  color: #f4511e;
	}
	
	.carousel-control-prev{
	  background-image: linear-gradient(to left, rgba(244, 81, 30,0.2), rgba(244, 81, 30,100));
	  color: #f4511e;
	}
	
	.carousel-indicators li {
	  border-color: #f4511e!important;	  
	}
	
	.carousel-indicators li.active {
	  background-color: #f4511e;
	}
	
	.carousel-item h4 {
	  font-size: 19px;
	  line-height: 1.375em;
	  font-weight: 400;
	  font-style: italic;
	  margin: 70px 0;
	}
	
	.carousel-item span {
	  font-style: normal;
	}
	
	footer {
	  padding-top: 10px;
	  background-color: #f4511e;/*#292c2f;*/
	  color: white;
	}
	
	footer a {
	  color: white;
	  /*text-decoration:none;*/
	}
	
	footer a:hover, footer a:focus {
	  color: #aaa;
	  text-decoration:none;
	  border-bottom:1px dotted #999;
	}
	
	footer .form-control {
	    background-color: white;
	    box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.9);
	    border: none;
	    resize: none;
	    color: #d1d2d2;
	    padding: 0.7em 1em;
	}
	h1{
	color: green;
	text-align: center;
	}
	</style>
	<script type="text/javascript">
	function printdate() {
	    return new Date();
	}
	document.getElementById("dat").innerHTML =printdate();
	</script>
	<body>
		<%@include file="components/navbar.jsp"%>
		<br>
		<h1>Order has been successfully placed</h1>
		<div class="row mt-5">
				<div class="col-md-4 offset-md-4">
						<div class="card">												
							<div class="card-body px-5">
							<h3 style="text-align: center">Order Details</h3>
							<p>Name: <%=u.getName() %></p>
							<p>Shipping Address: <%=u.getAddress() %></p>
							<p>Phone Number: <%=u.getPhone() %></p>
							<p id="date"></p>
								<script>
								n =  new Date();
								y = n.getFullYear();
								m = n.getMonth() + 1;
								d = n.getDate()+2;
								document.getElementById("date").innerHTML ="Delivery Date: "+ d + "/" + m + "/" + y;
								</script>
							</div>
						</div>
				</div>
		</div>	
			<!-- Container (Contact Section) -->
		<footer>
			 <div class="container mt-5">
		        <div class="row">
		            <div class="col-md-5">
		                <h5><i class="fa fa-road"></i> De-Kart</h5>
		                <div class="row">
		                    <div class="col-6">
		                        <ul class="list-unstyled">
		                            <li><a href="">Product</a></li>
		                            <li><a href="">Benefits</a></li>
		                            <li><a href="">Partners</a></li>
		                            <li><a href="">Team</a></li>
		                        </ul>
		                    </div>
		                    <div class="col-6">
		                        <ul class="list-unstyled">
		                            <li><a href="">Documentation</a></li>
		                            <li><a href="">Support</a></li>
		                            <li><a href="">Legal Terms</a></li>
		                            <li><a href="">About</a></li>
		                        </ul>
		                    </div>
		                </div>
		                <ul class="nav">
		                    <li class="nav-item"><a href="" class="nav-link pl-0"><i class="fa fa-facebook fa-lg"></i></a></li>
		                    <li class="nav-item"><a href="" class="nav-link"><i class="fa fa-twitter fa-lg"></i></a></li>
		                    <li class="nav-item"><a href="" class="nav-link"><i class="fa fa-github fa-lg"></i></a></li>
		                    <li class="nav-item"><a href="" class="nav-link"><i class="fa fa-instagram fa-lg"></i></a></li>
		                </ul>
		                <br>
		            </div>
		            <div class="col-md-2">
		                <h5 class="text-md-right">Contact Us</h5>
		            </div>
		            <div class="col-md-5">
		                <form>
		                    <fieldset class="form-group">
		                        <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
		                    </fieldset>
		                    <fieldset class="form-group">
		                        <textarea class="form-control" id="exampleMessage" placeholder="Message"></textarea>
		                    </fieldset>
		                    <fieldset class="form-group text-xs-right">
		                        <button type="button" class="btn btn-secondary-outline btn-lg">Send</button>
		                    </fieldset>
		                </form>
		            </div>
		        </div>
		    </div>
		 </footer>	
	</body>
</html>