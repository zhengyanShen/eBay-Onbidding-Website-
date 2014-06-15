<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="onbidding.*,java.io.*"%>
<!doctype html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="nl"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8" lang="nl"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9" lang="nl"><![endif]-->
<!--[if IE]><html class="no-js ie" lang="nl"><![endif]-->
<!--[if !IE]><!--><html class="no-js" lang="nl"><!--<![endif]-->

	<head>

		<meta charset="utf-8">
		<title>Register</title>
		<meta name="description" content="Page description here">
		<meta name="author" content="OnBidding - S. Zhengyan">
		<meta name="viewport" content="width=device-width">
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Ubuntu">
		<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=McLaren">
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/nivo-slider.css">
		<link rel="stylesheet" href="nivo-themes/bar/bar.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="nivo-themes/light/light.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.min.css">
		<script src="js/config.js"></script>
		<script src="js/modernizr-2.6.2.min.js"></script>
		<script src="js/jquery-1.8.1.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<script src="js/jquery.nivo.slider.pack.js"></script>
		<script src="js/respond.min.js"></script>
		<script src="js/script.js"></script>
		
		<script>
		$(document).ready(function(){			
  			$("[id='wishlist']").click(function(){					
				alert("Please Login");							 			
			});
		});	
		</script>
		<script>
		function disp_confirm()
		{
			return confirm("Confirm submission");
		}
		
		</script>
		
		<style type="text/css">
			table{ border-collapse:collapse; }
			table, tr{border:1px solid Gainsboro;}
			td{padding:15px;}
  		</style>

	</head>

	<body>

		<!-- Facebook div for like button -->
		<div id="fb-root"></div>

		<!-- Div for shade line -->
		<div class="header-shadow"></div>

		<!-- Use class "container-fluid" on the following div for making complete website fluid -->
		<div class="container">

			<div class="row-fluid print-show">
				<div class="span12">
					Alternate header for print version
				</div>
			</div>

			<div class="row-fluid print-hide">
				<div class="span4">
					<div class="header-action">
						<span class="label label-info">Welcome to OnBidding, go get your deal !</span>
					</div>
				</div>
				<div class="span8">
					<div class="navbar pull-right header-nav">
						<ul class="nav">
							<li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#">Your Accont</a>
								<ul class="dropdown-menu">
									<li>
										<div class="dropdown-content">
										<%
										if((String)session.getAttribute("message")==null){
											out.println();
										}else{
											out.println(session.getAttribute("message"));
										}%>
											<br>
											<form action="LoginServlet" method="get">
												<input type="text" class="input-medium" placeholder="Username" name="username"><br>
												<input type="password" class="input-medium" placeholder="Password" name="password"><br>
												<button class="btn" type="reset" >reset</button>
												<button class="btn btn-primary" type="submit">login</button>
											</form> 
											<br>
										</div>
									</li>
								</ul>
							</li>
							<li><a id="wishlist" href="#">Your WishList</a></li>
							<li><a href="#">Customer Service</a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="row-fluid print-hide">
				<div class="span3">
					<img src="img/logo1.png" alt="Logo">
				</div>
				<div class="span5">
					<div class="row-fluid print-hide">
						<div class="span11 offset1">
							<div class="navbar header-search-nav">
								<ul class="nav">
								
								</ul>
							</div>
						</div>
					</div>
					<div class="row-fluid print-hide">
						<div class="span11 offset1">
							<form class="form-search header-search">
								<div class="input-append">
									<input class="input-large search-query" type="text" placeholder="Search all products...">
									<button class="btn" type="submit">search</button>
								</div>
							</form>
						</div>
					</div>
					<br>
				</div>
				<div class="span4">
					 <input  type="image"  name="submit_Btn"  id="submit_Btn"  src="img/banner_top.png"  onClick="javascript:location.href='/Zhen2b/ToRegisterServlet'" >
				</div>
			</div>

			<div class="row-fluid print-hide">
				<div class="span12">
					<div class="navbar main-nav">
						<div class="navbar-inner">
							<div class="container">
								<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">menu</a>
								<div class="nav-collapse">
									<ul class="nav">
										<li class="active"><a href="index.jsp"><i class="icon-home"></i></a></li>
										<li class="divider-vertical"></li>
										<li><a id="clothing">Clothing&Accessories</a></li>
										<li><a id="jewelry">Jewelry&Watches</a></li>
										<li><a id="health">Health&Beauty</a></li>
										<li><a id="athome">AtHome</a></li>									
										<li><a id="electronics">Electronics</a></li>
										<li><a id="book">Books</a></li>
										<li><a id="sports">Sports&Outdoors</a></li>										
									</ul>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row-fluid">
				<div class="span12">
					<form class="form" action="RegisterServlet">
						<fieldset>
							<div class="row-fluid">
								<div class="span9">
									<h2>Basic Infromation</h2>
								</div>
								<div class="span3">
									<div class="social-icons pull-right">
										<a href="#"><img src="img/icon-facebook.png" alt="facebook"></a>
										<a href="#"><img src="img/icon-twitter.png" alt="twitter"></a>
										<a href="#"><img src="img/icon-linkedin.png" alt="linkedin"></a>
										<a href="#"><img src="img/icon-rss.png" alt="rss"></a>
									</div>
								</div>
							</div>

							<div class="row-fluid">
								<div class="span4">
							
									<div class="control-group">
										<label class="control-label" for="field_01">Username</label>	
										<div class="controls">
											<input type="text" class="input-large" name="newusername" id="field_01">
										</div>											
									</div>
								</div>
								<div class="span4">
									<div class="control-group">
										<label class="control-label" for="field_02">Password</label>	
										<div class="controls">
											<input type="text" class="input-large" name="newpassword" id="field_02">
											<p class="help-block"></p>
										</div>											
									</div>
								</div>
							</div>
							<div class="row-fluid">
								<div class="span4">
									<div class="control-group">
										<label class="control-label" for="field_03">First Name</label>	
										<div class="controls">
											<input type="text" class="input-large" name="newfirstname" id="field_03">
										</div>											
									</div>
								</div>
								<div class="span4">
									<div class="control-group">
										<label class="control-label" for="field_04">Middle Name</label>	
										<div class="controls">
											<input type="text" class="input-large" name="field_04" id="field_04">
											<p class="help-block"></p>
										</div>											
									</div>
								</div>
								<div class="span4">
									<div class="control-group">
										<label class="control-label" for="field_05">Last Name</label>	
										<div class="controls">
											<input type="text" class="input-large" name="newlastname" id="field_05">
											<p class="help-block"></p>
										</div>											
									</div>
								</div>
							</div>
							<div class="row-fluid">
								<div class="span4">						
									<div class="control-group">
										<label class="control-label" for="field_06">Gender</label>
										<div class="controls">
											<input type="text" class="input-xlarge" name="newgender" id="field_06">
											<p class="help-block">Please use Female/Male</p>
										</div>
									</div>
								</div>
								<div class="span4">						
									<div class="control-group">
										<label class="control-label" for="field_07">Date of Birth</label>
										<div class="controls">
											<input type="text" class="input-xlarge" name="newDateOfBirth" id="field_07">
											<p class="help-block">Please use YYYY-MM-DD</p>
										</div>
									</div>
								</div>
								<div class="span4">							
									<div class="control-group">
										<label class="control-label" for="field_08">E-mail Address</label>
										<div class="controls">
											<input type="text" class="input-xlarge" name="newemail" id="field_08">
											<p class="help-block">Like: aaa@bbb.com</p>
										</div>
									</div>
								</div>
							</div>
					
					<div class="row-fluid">
						<div class="span8">						
									<div class="control-group">
										<label class="control-label" for="field_09">Billing Address</label>
										<div class="controls">
											<input type="text" class="input-xxlarge" name="newAddress" id="field_09">
											<p class="help-block"></p>
										</div>
									</div>
						</div>
						<div class="span4">						
									<div class="control-group">
										<label class="control-label" for="field_10">Zip Code</label>
										<div class="controls">
											<input type="text" class="input-large" name="newzipcode" id="field_10">
											<p class="help-block"></p>
										</div>
									</div>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span12">									
							<button type="reset" class="btn"><i class="icon-refresh"></i> reset</button> &nbsp;&nbsp;&nbsp;<button type=submit onclick="return disp_confirm();" class="btn btn-primary"> submit <i class="icon-chevron-right icon-white"></i> </button>
						</div>
					</div>
					</fieldset>
					</form>
				</div>
			</div>



			<hr>

			<div class="row-fluid">
				<div class="span12 well well-small">
						&copy; <script>document.write(new Date().getFullYear());</script> - All taxes are excluded - shipping costs depends on location - <a href="#">more info <i class="icon-chevron-right"></i></a>
				</div>
			</div>

			<div class="footer">

				<div class="row-fluid print-hide">

					<div class="span2">
						<ul class="unstyled">
							<li class="footer-title"><a href="#">Category 1</a></li>
							<li><a href="#">Product item A</a></li>
							<li><a href="#">Product B</a></li>
							<li><a href="#">Large product C</a></li>
						</ul>
						<ul class="unstyled">
							<li class="footer-title"><a href="#">Category 2</a></li>
							<li><a href="#">Product item A</a></li>
							<li><a href="#">Product B</a></li>
							<li><a href="#">Large product C</a></li>
							<li><a href="#">Product D</a></li>
							<li><a href="#">Short E</a></li>
						</ul>
					</div>

					<div class="span2">
						<ul class="unstyled">
							<li class="footer-title"><a href="#">Category 3</a></li>
							<li><a href="#">Product item A</a></li>
							<li><a href="#">Product B</a></li>
							<li><a href="#">Large product C</a></li>
							<li><a href="#">Product D</a></li>
						</ul>
						<ul class="unstyled">
							<li class="footer-title"><a href="#">Category 4</a></li>
							<li><a href="#">Product item A</a></li>
							<li><a href="#">Product B</a></li>
						</ul>
					</div>

					<div class="span2">
						<ul class="unstyled">
							<li class="footer-title"><a href="#">Category 5</a></li>
							<li><a href="#">Product item A</a></li>
							<li><a href="#">Product B</a></li>
							<li><a href="#">Large product C</a></li>
						</ul>
						<ul class="unstyled">
							<li class="footer-title"><a href="#">Category 6</a></li>
							<li><a href="#">Product item A</a></li>
							<li><a href="#">Product B</a></li>
							<li><a href="#">Large product C</a></li>
							<li><a href="#">Product D</a></li>
						</ul>
					</div>

					<div class="span2">
						<ul class="unstyled">
							<li class="footer-title"><a href="#">Category 7</a></li>
							<li><a href="#">Product item A</a></li>
							<li><a href="#">Product B</a></li>
							<li><a href="#">Large product C</a></li>
							<li><a href="#">Product D</a></li>
							<li><a href="#">Short E</a></li>
						</ul>
						<ul class="unstyled">
							<li class="footer-title"><a href="#">Category 8</a></li>
							<li><a href="#">Product item A</a></li>
							<li><a href="#">Product B</a></li>
							<li><a href="#">Large product C</a></li>
							<li><a href="#">Product D</a></li>
							<li><a href="#">Short E</a></li>
						</ul>
					</div>

					<div class="span2">
						<ul class="unstyled">
							<li class="footer-title"><a href="#">Category 9</a></li>
							<li><a href="#">Product item A</a></li>
							<li><a href="#">Product B</a></li>
							<li><a href="#">Large product C</a></li>
							<li><a href="#">Product D</a></li>
							<li><a href="#">Short E</a></li>
						</ul>
						<ul class="unstyled">
							<li class="footer-title"><a href="#">Category 10</a></li>
							<li><a href="#">Product item A</a></li>
							<li><a href="#">Product B</a></li>
							<li><a href="#">Large product C</a></li>
							<li><a href="#">Product D</a></li>
						</ul>
					</div>

					<div class="span2">
						<ul class="unstyled">
							<li class="footer-title"><a href="#">Category 11</a></li>
							<li><a href="#">Product item A</a></li>
							<li><a href="#">Product B</a></li>
						</ul>
						<ul class="unstyled">
							<li class="footer-title"><a href="#">Category 12</a></li>
							<li><a href="#">Product item A</a></li>
							<li><a href="#">Product B</a></li>
							<li><a href="#">Large product C</a></li>
						</ul>
					</div>

				</div>

				<div class="row-fluid print-show">
					<div class="span12">
						Alternate footer for print version
					</div>
				</div>

			</div>

		</div>

	</body>

</html>
