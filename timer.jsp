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
		<title>Timer List</title>
		<meta name="description" content="Page description here">
		<meta name="author" content="OnBidding - S. Zhengyan">
		<meta name="viewport" content="width=device-width">
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/FontsUbuntu">
		<link rel="stylesheet" type="text/css" href="css/FontsMcLaren">
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
						location.href='/Zhen2b/ToWishListServlet';				 
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
		  							//documnet.getElmentById("counter").value = data[i].timer-count;
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
  		<script>
  		  function deleteItem(itemId){	
  				confirm("Are you going to delete "+itemId);
  				$.ajax({				
	                type: "post",
	                url: "/Zhen2b/DeleteTimerServlet",     
	                data:{deleteditemid:itemId}	                										
	          	});
  				window.setInterval(function(){location.href='/Zhen2b/timer.jsp'}, 1500);
  				
  			}
  			
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

							<div class="tab-content">
								<div class="tab-pane active" id="step1">
									<div class="row-fluid">
										<div class="span12" id="result1">
										<script>
										 $.ajax({				
							                type: "post",
							                url: "/Zhen2b/TimerListServlet",
							                dataType: "json",
							                success: postTimerList, error: function(){alert("Wrong,Login!");}										
							          	}); 
										function postTimerList(data){												
											var html = [];
											html.push('<table class="table table-bordered"><thead><tr><th class="">Item</th>'+
													'<th>Item Info</th><th>Timer Setting</th><th>UnLike Item</th></tr></thead><tbody>');
											if(data.length==0){
												alert("Please Select Something you liked");
											}else{
												for(var i=0;i<data.length;i++){
													var itemId = data[i].itemId; 
													var itemTitle = data[i].itemTitle;
													var itemPic = data[i].itemPic;
													var itemUrl= data[i].itemUrl;
													var timeSet = data[i].timeSet;
													
													html.push('<tr><td>'+'<img src="'+itemPic+'" width="75"></td>'+
															'<td><a href="'+itemUrl+'">'+itemTitle+'</a></td>');
													html.push('<td style="color:red">'+timeSet+'&nbsp;mins</td>');
													html.push('<td align="center"><button type="button" class="btn" name="delete" onClick="deleteItem('+itemId+')">Delete</button></td></tr>');
												}
											}  									
											html.push('</tbody></table>');
											document.getElementById("result1").innerHTML = html.join("");
										}
										</script>
																										
										</div>
									</div>
									<div class="row-fluid">
										<div class="span4">
											<button class="btn" onClick="location.href='wishlist.jsp'"><i class="icon-chevron-left"></i> Goto WishList</button>
										</div>
										<div class="span4">
										</div>
										<div class="span4">
											<button class="btn btn-primary pull-right" onClick="javascript:location.href='timer.jsp'">Rrefresh Timers </button>
										</div>
									</div>
								</div>
							
					</div>
		     		<br>




			<hr>

			<div class="row-fluid">
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
