<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.website.entities.Category" %>
<%@ page import="com.website.entities.Product" %>
<%@ page import="com.website.dao.CategoryDao" %>
<%@ page import="com.website.dao.ProductDao" %>

    

<!DOCTYPE html>
<html>
	
	<head>
	
		<!-- Required Tag -->
		<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
		<title>eCommerce Application</title>
		<%@ include file="components/common.jsp"%>
		
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
	</style>

	<body>
		<%@ include file="components/navbar.jsp"%>	
		
		<%
			String catId = request.getParameter("category"); 
			List<Product> productsList = null;
			List<Category> categoriesList = null;
			
		/* 	if(null !=request.getAttribute("catIdPrdList")){
				productsList = (List<Product>) request.getAttribute("catIdPrdList");
			}else{
				if(null !=request.getAttribute("allProducts")){
					productsList = (List<Product>)request.getAttribute("allProducts");
				}
			}
			if(null != request.getAttribute("allCategories")){
				categoriesList = (List<Category>) request.getAttribute("allCategories");
			} */
			
			CategoryDao cd = new CategoryDao(); 
			
			ProductDao pd = new ProductDao();
			List<Product> pl = null;
			
			if(null == catId || "".equals(catId) || catId.trim().equals("All")){
				pl = pd.getAllProducts();
			} else {
				pl = cd.getProductListForCategory(Integer.parseInt(catId));
			}
			List<Category> cl = cd.getAllCategories();
			
		%> 
		
	
		<div class="container-fluid">
			<div class="row mt-3 mx-2">
				
				<!-- display Categories  -->
				<div class="col-md-2">
				
					<div class="list-group">
					
				
						<%
							String isAllProductsActive="";
							if("All".equals(catId) || "".equals(catId) || null == catId) {
								isAllProductsActive = "active";
							} 
						%>
					
					
					
						<a href="homepage.jsp?category=All" class="list-group-item list-group-item-action <%=isAllProductsActive%>" aria-current="true">
						    All Products
						</a>
				
						<h1> Number of Categories ::: <%=cl.size()%>></h1> 
						<%	String categoryActive;
							for(Category c: cl){								
								if( !isAllProductsActive.equals("active") && c.getId()==Integer.parseInt(catId))  {
									categoryActive = "active";
								} else {
									categoryActive = "";
								}
								
						%>
								<a href="homepage.jsp?category=<%=c.getId()%>" class="list-group-item list-group-item-action <%=categoryActive%>"><%=c.getTitle()%></a>
						
						<%
								categoryActive = "";
							}
						%>	 
					</div>	
				</div>
				
				<!-- display Products  -->			
				<div class="col-md-10 mt-3">		
				
					<div class="row">
							<div class="col-md-12">
							
								<div class="card-columns">
									
									<%
										if(null != pl && !pl.isEmpty()){
									
											for(Product p: pl){
									%>
												<div class="card product-card">
													
													<div class="container text-center">
														<img src="images/<%=p.getProductImage() %>" style="max-height: 200px; max-width: 100% ; width: auto" class="m-2" alt="Product_Image">
													</div>
													
													<div class="card-body">
														<h5 class="card-title" style="max-height: 125px;">
															 <%=p.getProductName()%>
														</h5>
														
													</div>
													
													<div class="card-footer text-center">
													<% Integer DiscountedPrice = 0;
														   DiscountedPrice = p.getProductPrice()-(p.getProductPrice()*p.getProductDiscount())/100;
															%>
														<button class="btn custom-bg text-white" onclick="add_to_cart(<%=p.getProductId()%>,'<%=p.getProductName()%>',<%=DiscountedPrice%>)">Add to Cart</button>
														<button class="btn btn-outline-success">
														
														&#8377; <%=DiscountedPrice%>/- 
															<span class="text-secondary original-price"><%=p.getProductPrice()%></span> 
															<span class="text-secondary discount-label"><%=p.getProductDiscount()%>% Off
															</span>
														</button>
													</div>
												</div>
						
									<%
											}
											
										} else {
									%>
												<div class="card-body">
														<h5 class="card-title" style="max-height: 125px;">
															 No Products for the Category
														</h5>
												</div>									
												
									<%
										}
									%>
									
								</div>
							
							</div>
					</div>
				
				</div>
			
			</div>
		</div>
	
		 <%@include file="components/common_modals.jsp" %> 
	</body> 
	
</html>