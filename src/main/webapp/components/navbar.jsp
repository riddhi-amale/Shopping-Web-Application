<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.website.entities.User" %>
<%
	User u1 = (User) session.getAttribute("userDetails");
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
		<div class="container">
			  <a class="navbar-brand" href="index.jsp">De-Kart</a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			
			  <div class="collapse navbar-collapse" id="navbarSupportedContent">
			    <ul class="navbar-nav mr-auto">
			      <li class="nav-item active">
			        <a class="nav-link" href="homepage.jsp">Home</a>
			      </li>
				<%-- <% if(null != u1){ %> --%>
			      <li class="nav-item dropdown">
			        <a class="nav-link dropdown-toggle" href="index.jsp" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			          Categories
			        </a>
			        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
			          <a class="dropdown-item" href="#">Action</a>
			          <a class="dropdown-item" href="#">Another action</a>
			          <div class="dropdown-divider"></div>
			          <a class="dropdown-item" href="#">Something else here</a>
			        </div>
			      </li>
			   <%--  <% } %>   --%>
			    </ul>
			    
			    <ul class="navbar-nav ml-auto">
			    
			    <%if(session.getAttribute("userDetails")!=null){ %>
			    	<li class="nav-item active">
				       		 <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart">
				       		 	<i class="fas fa-shopping-cart" style="font-size: 18px"></i>
				       		 	<span class="ml-0 cart-items" style="font-size: 18px">(0)</span>
				       		 </a>
				     </li>
			    <%}%>
			    	<% if(null == u1){ %> 
			    		
			    		<li class="nav-item active">
				       		 <a class="nav-link" href="login.jsp">Login</a>
				      	</li>
				    	<li class="nav-item active">
				       		 <a class="nav-link" href="register.jsp">Register</a>
				      	</li>
			    		
			     	<% }  else { %> 
			    		
			    		
			    		<li class="nav-item active">
				       		 <a class="nav-link font-weight-bold" href="<%-- <%=u1.getRole().equals("admin") ? "admin.jsp" : "homepage.jsp"%> --%>"> Welcome :  <%=u1.getName()%> </a>
				      	</li>
				    	<li class="nav-item active">
				       		 <a class="nav-link" href="LogoutServlet">Logout</a>
				      	</li> 
				      	
			    	 <% } %> 
			    
				      	
			    </ul>
			  </div>
		 </div>
	</nav>
</body>
</html>
