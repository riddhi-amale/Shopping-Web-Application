<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.website.entities.Category"%> 
<%@page import="com.website.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.website.dao.UserDao"%>
<%@page import="com.website.dao.CategoryDao"%> 
<%@page import="com.website.dao.ProductDao"%>
<%@page import="com.website.util.HibernateHelper"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.website.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
	User u = (User) session.getAttribute("userDetails");

if (u == null) {
	session.setAttribute("warning", "You are not logged in!! Login first");
	response.sendRedirect("login.jsp");
	return;
} else if ("customer".equals(u.getRole())) {
	session.setAttribute("warning", "You are not an Admin!! No access to this page");
	response.sendRedirect("index.jsp");
	return;
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<%@include file="components/common.jsp"%>

</head>

<style>
.custom-bg{
	  background: #f4511e!important;
	}
</style>

<body>


	<%@include file="components/navbar.jsp"%>

	<div class="container admin">
		
		<div class=" mt-3">
			<%-- <%@include file="components/response.jsp"%> --%>
		</div>
		<%
		CategoryDao cdo = new CategoryDao(); 
		List<Category> cl = cdo.getAllCategories();
		
		ProductDao pd = new ProductDao();
		List<Product> pl = pd.getAllProducts();
		
		UserDao ud = new UserDao();
		List<User> ul =ud.getAllUsers();
		%>
		<!-- First row -->
		<div class="row mt-3">
			<div class="col-md-4">
				<div class="card border-dark">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 150px" class="img-fluid rounded-circle"
								src="images/users.png" alt="user_icon" />
						</div>
						<h3><%=ul.size()%></h3>
						<h1 class="text-uppercase text-muted">Users</h1>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card border-dark">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 150px" class="img-fluid rounded-circle"
								src="images/list.png" alt="list_icon" />
						</div>
						<h3><%=cl.size()%></h3>
						<h1 class="text-uppercase text-muted">Categories</h1>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card border-dark">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 150px" class="img-fluid rounded-circle"
								src="images/product.png" alt="product_icon" />
						</div>
						<h3><%=pl.size()%></h3>
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>
				</div>
			</div>


		</div>

		<!-- Second row -->
		<div class="row mt-3">
			<div class="col-md-6">
				<div class="card border-dark" data-toggle="modal" data-target="#add-category-modal">
					<% if("CategoryAdded".equalsIgnoreCase((String)request.getAttribute("catAdded"))){%>
					<h4 style="color:green">Category added successfully</h4>
					<%} %>
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 150px" class="img-fluid rounded-circle"
								src="images/plus.png" alt="plus_icon" />
						</div>
						<h3 class="mt-4">Click here to Add new Category</h3>
						<h1 class="text-uppercase text-muted">Add Category</h1>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card border-dark"  data-toggle="modal" data-target="#add-product-modal">
					<div class="card-body text-center">
					<% if (null != request.getAttribute("productSuccess")){%>
									<h4 style="color:green">Product added successfully</h4>
		        	<%} %>
						<div class="container">
							<img style="max-width: 150px" class="img-fluid"
								src="images/addProduct.png" alt="addProduct_icon" />
						</div>
						<h3 class="mt-4" >Click here to Add new Product</h3>
						<h1 class="text-uppercase text-muted">Add Product</h1>
					</div>
				</div>
			</div>

		</div>


	</div>


	<!-- Category Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

		<div class="modal-dialog modal-lg" role="document">

			<div class="modal-content">

				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<form action="AdminServlet" method="post">
					
						<input type="hidden" name="operation" value="addCategory"/>
					
						<div class="form-group">
								<input type="text" class="form-control" name="catTitle" placeholder="Enter Category title" required/> 
						</div>
						
						<div class="form-group">
								<textarea style="height: 150px" class="form-control" name="catDescription" placeholder="Enter Category Description" required></textarea> 
						</div>
						
						<div class="container text-center">
							<button class="btn btn-outline-success" >Add Category</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
								
			</div>
		</div>
	</div>
	
	
	
	<!-- Product Modal -->
	
	<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">

			<div class="modal-content">

				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					
					<form action="AdminServlet" method="post" ><!-- enctype="multipart/form-data" -->
						
						<input type="hidden" name="operation" value="addProduct"/>
					
						<div class="form-group">
								<input type="text" class="form-control" name="productName" placeholder="Enter Product Name" required/> 
						</div>
						
						<div class="form-group">
								<textarea style="height: 150px" class="form-control" name="productDescription" placeholder="Enter Product Description" required></textarea> 
						</div>
						
						<!-- <div class="form-group">
							<div class="container">
								<div class="row">
									<div class="col-md-6"><textarea style="height: 150px" class="form-control" name="catDescription" placeholder="Enter Category Description" required></textarea></div>
									<div class="col-md-3"><input type="text" class="form-control" name="productQty" placeholder="Quantity"/></div>
									<div class="col-md-3"><input type="text" class="form-control" name="productQty" placeholder="Discount"/></div>
								</div>
							</div>
								<input type="text" class="form-control" name="productQty" placeholder="Enter Product Quantity"/>
								<input type="text" class="form-control" name="productDiscount" placeholder="Enter Product Discount"/> 
						</div> -->
						
						<div class="form-group">
								<input type="text" class="form-control" name="productPrice" placeholder="Enter Product Price" required> 
						</div>
						
						<div class="form-group">
								<input type="text" class="form-control" name="productDiscount" placeholder="Enter Product Discount" required> 
						</div>
						
						<div class="form-group">
								<input type="text" class="form-control" name="productQty" placeholder="Enter Product Qty" required> 
						</div>
						
						<%
							CategoryDao cd = new CategoryDao();
							List<Category> l = cd.getAllCategories();
						%> 
						
						<div class="form-group">
								<select name="catId" class="form-control">
									
									<%
										for(Category c: l){
									%>
											<option value="<%=c.getId()%>"><%=c.getTitle()%></option>
									<%
										}
									%>
									
								</select>
						</div>
						
						<div class="form-group">
								<label for="productImage" > Select The Product Image</label>
								<input type="file" class="form-control" id="productImage" name="productImage" placeholder="Enter Product Discount" required> 
						</div>
						
						<div class="container text-center">
							<button class="btn btn-outline-success">Add Category</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
								
			</div>
		</div>
	</div>
	
	
</body>
</html>