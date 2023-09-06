<!DOCTYPE html>
<html>
	<head>
	  <title>De-Kart</title>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
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
		
		<%@include file="components/navbar.jsp"%> 
	
		<div class="jumbotron text-center">
		  <h1>De-Kart</h1> 
		  <p>Online Merchandise For Everyone</p>
		  
		  <div class="container" style="width: 40%; align: middle">
					  <!-- <form class="form-row"> -->
					  	<div>
							<div class="input-group">
							  <input type="email" class="form-control" placeholder="Email Address" required>				  
								<button type="button" class="btn btn-danger">Subscribe</button>				  
							</div>
						</div>
		  </div>  
		</div>
		
		
	
		<div class="container-fluid text-center">
		  <h2>SERVICES</h2>
		  <h4>What we offer</h4>
		  <br>
		  <div class="row">
			<div class="col-sm-4">			  
			  <span><i class="fas fa-laptop logo-small"></i></span>
			  <h4>LAPTOPS</h4>
			  <p>Lorem ipsum dolor sit amet..</p>
			</div>
			<div class="col-sm-4">
			  <span><i class="fas fa-mobile-alt logo-small"></i></span>
			  <h4>MOBILES</h4>
			  <p>Lorem ipsum dolor sit amet..</p>
			</div>
			<div class="col-sm-4">
			  <span><i class="fas fa-keyboard logo-small"></i></span>
			  <h4>KEY BOARDS</h4>
			  <p>Lorem ipsum dolor sit amet..</p>
			</div>
			</div>
			<br><br>
		  <div class="row">
			<div class="col-sm-4">
			   <span><i class="fas fa-gifts logo-small"></i></span>
			  <h4>GIFTS</h4>
			  <p>Lorem ipsum dolor sit amet..</p>
			</div>
			<div class="col-sm-4">
			  <span><i class="far fa-clock logo-small"></i></span>
			  <h4>WATCHES</h4>
			  <p>Lorem ipsum dolor sit amet..</p>
			</div>
			<div class="col-sm-4">
			  <span><i class="fas fa-headphones-alt logo-small"></i></span>
			  <h4>HEADPHONES</h4>
			  <p>Lorem ipsum dolor sit amet..</p>
			</div>
		  </div>
		</div>
	
		
		
	<div class="container-fluid mt-5 mb-5">
			<div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
			  
			  <!-- Indicators -->
			  <ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			  </ol>
			
			  <h2>What our customers say</h2>
				
			  <!-- Wrapper for slides -->
			  <div class="carousel-inner">
				<div class="carousel-item active">
				<h4>"This company has the best products. I am so happy with the purchase!!!!!!!!"<br><span style="font-style:normal;">Michael Roe, Vice President, Comment Box</span></h4>
				</div>
				<div class="carousel-item">
				  <h4>"One word... WOW!!"<br><span style="font-style:normal;">John Doe, Salesman, Rep Inc</span></h4>
				</div>
				<div class="carousel-item">
				  <h4>"Could I... BE any more happy with the purchases?"<br><span style="font-style:normal;">Chandler Bing, Actor, FriendsAlot</span></h4>
				</div>
			  </div>
	
			  <!-- Left and right controls -->
			  <a class="carousel-control-prev bg-gradient-dark" href="#myCarousel" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next bg-gradient-dark" href="#myCarousel" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			  </a>
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


