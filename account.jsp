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
		<title>Account</title>
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
		function disp_confirm()
		{
			return confirm("Confirm submission");
		}
		
		</script>
		<script>
		$(document).ready(function(){
  			$("[id='wishlist']").click(function(){
  				var user = $("input[name='getsession1']").attr("value");
  				if(user=="null"){
  					alert("Please Login");
  				}else{
  					//alert(user);
  					location.href ="wishlist.jsp";				 
  				}				 			
  			});
  			timer = function(){
  				$.ajax({				
	                type: "post",
	                url: "/Zhen2b/CountDownServlet",   
	                dataType: "json", 
	                success: sws, error: function(){alert("Wrong, no json to jsp!");}
	          	});
  				function sws(data){
  					var count;
	  				var timeID;
  					
  					count = 0;
  				  	timeID = setInterval("timeCount1()",1000);
  					
  					timeCount1 = function() 
  					{ 	
	  					for (var i = 0; i < data.length; i++)
	  					{	
	  						if(count == data[i].timer){
	  						
	  						alert(data[i].itemTitle);
	  						}	
	  					}
  				  		count++; 				  	
  					}
  					function stopCount1()
  					{ 
  				  		clearInterval(timeID);
  					}
  				}
  			}
		});	
  		</script>
		<style type="text/css">
			table{ border-collapse:collapse; }
			table, tr{border:1px solid Gainsboro;}
			td{padding:15px;}
  		</style>

	</head>
	<body onload="timer()">

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
							<li><input type="hidden" name="getsession1" value="<%=(String)session.getAttribute("validate")%>" /></li>
							<li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#">Welcome</a>
								<ul class="dropdown-menu">
									<li>
										<div class="dropdown-content">
											<br>
										        <form action="LogoutServlet" method="post">										
												&nbsp;<button class="btn btn-primary" formaction="account.jsp">Account</button>
												&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn" type="submit">logout</button>
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
					 <input  type="image"  name="submit_Btn"  id="submit_Btn"  src="img/banner_top.png"  onClick="javascript:alert('Please Logout First')" >
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
										<li class="active"><a href="indexAfterLogin.jsp"><i class="icon-home"></i></a></li>
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
					<form class="form" action="AccountServlet">
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
											<div id="no1"></div>
											<script>
											var carname='<input type="text" class="input-large" name="username" id="field_01" value =' + '<%=session.getAttribute("username")%>' + '>';
											document.getElementById("no1").innerHTML=carname;
											</script>										
									</div>
								</div>
								<div class="span4">
									<div class="control-group">
										<label class="control-label" for="field_02">Password</label>	
											<div id="no2"></div>
											<script>
											var carname='<input type="text" class="input-large" name="password" id="field_01" value =' + '<%=session.getAttribute("password")%>' + '>';
											document.getElementById("no2").innerHTML=carname;
											</script>										
									</div>
								</div>
							</div>
							<div class="row-fluid">
								<div class="span4">
									<div class="control-group">
										<label class="control-label" for="field_03">First Name</label>	
											<div id="no3"></div>
											<script>
											var carname='<input type="text" class="input-large" name="firstname" id="field_01" value =' + '<%=session.getAttribute("firstname")%>' + '>';
											document.getElementById("no3").innerHTML=carname;
											</script>											
									</div>
								</div>
								<div class="span4">
									<div class="control-group">
										<label class="control-label" for="field_04">Middle Name</label>	
											<input type="text" class="input-large" name="middlename" id="field_04">
											<p class="help-block"></p>											
									</div>
								</div>
								<div class="span4">
									<div class="control-group">
										<label class="control-label" for="field_05">Last Name</label>	
											<div id="no5"></div>
											<script>
											var carname='<input type="text" class="input-large" name="lastname" id="field_01" value =' + '<%=session.getAttribute("lastname")%>' + '>';
											document.getElementById("no5").innerHTML=carname;
											</script>											
									</div>
								</div>
							</div>
							<div class="row-fluid">
								<div class="span4">						
									<div class="control-group">
										<label class="control-label" for="field_06">Gender</label>
											<div id="no6"></div>
											<script>
											var carname='<input type="text" class="input-xlarge" name="gender" id="field_01" value =' + '<%=session.getAttribute("gender")%>' + '>';
											document.getElementById("no6").innerHTML=carname;
											</script>
											<p class="help-block">Please use Female/Male</p>
									</div>
								</div>
								<div class="span4">						
									<div class="control-group">
										<label class="control-label" for="field_07">Date of Birth</label>
											<div id="no7"></div>
											<script>
											var carname='<input type="text" class="input-xlarge" name="dateofbirth" id="field_01" value =' + '<%=session.getAttribute("dateofbirth")%>' + '>';
											document.getElementById("no7").innerHTML=carname;
											</script>
											<p class="help-block">Please use YYYY-MM-DD</p>
									</div>
								</div>
								<div class="span4">							
									<div class="control-group">
										<label class="control-label" for="field_08">E-mail Address</label>
											<div id="no8"></div>
											<script>
											var carname='<input type="text" class="input-xlarge" name="email" id="field_01" value =' + '<%=session.getAttribute("email")%>' + '>';
											document.getElementById("no8").innerHTML=carname;
											</script>
											<p class="help-block">Like: aaa@bbb.com</p>
									</div>
								</div>
							</div>
					
					<div class="row-fluid">
						<div class="span8">						
									<div class="control-group">
										<label class="control-label" for="field_09">Billing Address</label>
											<div id="no9"></div>
											<script>
											var carname='<input type="text" class="input-xxlarge" name="address" id="field_01" value =' + '<%=session.getAttribute("address")%>' + '>';
											document.getElementById("no9").innerHTML=carname;
											</script>
									</div>
						</div>
						<div class="span4">						
									<div class="control-group">
										<label class="control-label" for="field_10">Zip Code</label>
											<div id="no10"></div>
											<script>
											var carname='<input type="text" class="input-large" name="zipcode" id="field_01" value =' + '<%=session.getAttribute("zipcode")%>' + '>';
											document.getElementById("no10").innerHTML=carname;
											</script>
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
