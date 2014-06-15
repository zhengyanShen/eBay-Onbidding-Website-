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
		<title>OnBidding</title>
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
	
		<style type="text/css">
			table{ border-collapse:collapse; }
			table, tr{border:1px solid Gainsboro;}
			td{padding:15px;}
  		</style>
  		<script>
  		function searchItem(){
  			var searchElement = document.getElementById("search");
  			var searchValue = searchElement.value;
  			return searchValue;
  		}  
  		</script>
  		<script>
  		$(document).ready(function(){
  			var button=$("[name='Like']");			
  	     	button.click(function(){			
 				var likeditemid=$(this).attr("id");
  				var likeditemtitle=$(this).parents("tr").find("a").text();
  				var likeditempic=$(this).parents("tr").find("img").attr("src");
  				var likeditemurl=$(this).parents("tr").find("a").attr("href");
 				var likeditemendtime = $(this).parents("tr").find("#endtime").attr("name"); 
				var StringEndTime=likeditemendtime.toString();
		   		var convertEndTime = StringEndTime.replace('T', ' ').replace('Z', '');
  				
  				//alert(convertEndTime);
				
  				$.get("LikeServlet",{likeditemid:likeditemid,likeditemtitle:likeditemtitle,likeditempic:likeditempic,likeditemurl:likeditemurl,likeditemendtime:convertEndTime},function(){});
  				alert("Item has been added to your wishlist");
  			}); 
  	     	var button=$("[name='ViewItem']");			
  	     	button.click(function(){			
 				var likeditemid=$(this).attr("id");
  				var likeditemtitle=$(this).parents("tr").find("a").text();
  				var likeditempic=$(this).parents("tr").find("img").attr("src");
  				var likeditemurl=$(this).parents("tr").find("a").attr("href");
 				//var likeditemendtime = $(this).parents("tr").find("#endtime").attr("name"); 
				//var StringEndTime=likeditemendtime.toString();
		   		//var convertEndTime = StringEndTime.replace('T', ' ').replace('Z', '');
  				
  				//alert(convertEndTime);
				
  				$.get("ViewHistoryServlet",{likeditemid:likeditemid,likeditemtitle:likeditemtitle,likeditempic:likeditempic,likeditemurl:likeditemurl},function(){});
  				alert("Item has been added to your ViewHistory");
  			}); 
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
  		/* function likeItem(itemId,pic,viewitem,title){
  			//alert("going to be added");
  			$.get("LikeServlet",{likeditemid:itemId,likeditemtitle:title,likeditempic:pic,likeditemurl:viewitem},function(){});
  			alert("Item has been added to your wishlist");
  		} */
  		</script>

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
							</div>
						</div>
					</div>
					
					<div class="row-fluid print-hide">
						<div class="span11 offset1">
							<form class="form-search header-search">
								<div class="input-append">
									<input class="input-large search-query" id="search" type="text" placeholder="Search all products...">
									<button type="button" class="btn" id="searchButton" onClick="searchItem()">search</button>
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
					<div id="result1"></div>				
						<script>
						function _cb_findItemsByKeywords(root)
						{
						  var items = root.findItemsByKeywordsResponse[0].searchResult[0].item || [];
						  var html = [];
						  html.push('<ul class="thumbnails product-list-inline-small">');
						  for (var i = 0; i < items.length; ++i)  
						  {
						    var item = items[i];
						    var title = item.title;
						    var pic  = item.galleryURL;
						    var viewitem = item.viewItemURL;
						    
						    if (null != title && null != viewitem)
						    {
						    	html.push('<li class="span3"><div class="thumbnail">');
						    	html.push('<img src="' + pic + '" border="0">' + '<div class="caption">'+
						    		        '<a href="' + viewitem + '" target="_blank">' + title + '</a>'+'</div>');
						    	html.push('</li></div>');
						    }
						    
						  }
						  html.push('</ul>');
						  document.getElementById("result1").innerHTML = html.join("");
						}
						</script>
						<script src=http://svcs.ebay.com/services/search/FindingService/v1?SECURITY-APPNAME=Elfsoftw-0f6e-43a3-86e7-d1093b5ccbd8&OPERATION-NAME=findItemsByKeywords&SERVICE-VERSION=1.0.0&RESPONSE-DATA-FORMAT=JSON&callback=_cb_findItemsByKeywords&REST-PAYLOAD&keywords=beauty&itemFilter(0).name=ListingType&itemFilter(0).value=Auction&paginationInput.entriesPerPage=4>
						</script>
				</div>			
			</div>
			<hr>		
			<div class="row-fluid">
				<div class="span8">
					<div class="row-fluid">
						<div class="span9">
							<h2>For Your Selection</h2>
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
						<div class="span12">
							<div id="result2"></div>
							<script>
							function _cb_findItemsByKeywords(root)
							{
							  var items = root.findItemsByKeywordsResponse[0].searchResult[0].item || [];
							  var html = [];
							  html.push('<table><tbody>');
							
							  for (var i = 0; i < items.length; ++i)  
							  {
							    var item = items[i];
							    var title = item.title;
							    var pic  = item.galleryURL;
							    var viewitem = item.viewItemURL;
							    var itemid = item.itemId;							    
							    var endTime = item.listingInfo[0].endTime;
							    var currentPrice = Number(item.sellingStatus[0].currentPrice[0]['__value__']).toFixed(2);
							    var timeLeft = item.sellingStatus[0].timeLeft;
							    var StringtimeLeft=timeLeft.toString();
							    var convertTimeLeft = StringtimeLeft.replace(/P(\d+)DT(\d+)H(\d+)M(\d+)S/, "$2:$3:$4");
							    
							    if (null != title && null != viewitem)
							    {
							      html.push('<tr><td align=center>' + '<img src="' + pic + '" border="0">' + '</td>' + 
									        '<td align=left><a name="ViewItem" id="'+itemid+'" href="' + viewitem + '" target="_blank">' + title + 
									        '</a><td>$'+currentPrice+'</td><td style="color:red" id="endtime" name="'+endTime+'">'+convertTimeLeft+'</td>');
							      html.push('<td align=right><button type="button" class="btn" id="'+itemid+'" name="Like">Like</button></td></td></tr>');
							    }
							  }
							  html.push('</tbody></table>');
							  document.getElementById("result2").innerHTML = html.join("");
							}
							</script>
							
							<!--
							Use the value of your appid for the appid parameter below.
							-->
							<script src=http://svcs.ebay.com/services/search/FindingService/v1?SECURITY-APPNAME=Elfsoftw-0f6e-43a3-86e7-d1093b5ccbd8&OPERATION-NAME=findItemsByKeywords&SERVICE-VERSION=1.0.0&RESPONSE-DATA-FORMAT=JSON&callback=_cb_findItemsByKeywords&REST-PAYLOAD&keywords=bags&itemFilter(0).name=ListingType&itemFilter(0).value=Auction&paginationInput.entriesPerPage=20>
							</script>
							
							<script>
							jQuery(init);
					    	
					    	function init() {						    		
					    		jQuery("#clothing").click(clothingClicked);
					    		jQuery("#jewelry").click(jewelryClicked);
					    		jQuery("#health").click(healthClicked);
					    		jQuery("#athome").click(athomeClicked);
								jQuery("#electronics").click(electronicsClicked);
								jQuery("#book").click(bookClicked);
								jQuery("#sports").click(sportsClicked);
								jQuery("#searchButton").click(searchClicked);
					    	}
					    	
					    	function clothingClicked() {					    		
					    		jQuery.ajax({
					    			url: "http://svcs.ebay.com/services/search/FindingService/v1?SECURITY-APPNAME=Elfsoftw-0f6e-43a3-86e7-d1093b5ccbd8&OPERATION-NAME=findItemsByCategory&SERVICE-VERSION=1.0.0&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&categoryId=4250&paginationInput.entriesPerPage=20",
					    			dataType: "jsonp",
					    			success: handleResponse
					    		});
					    		// http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=[your_api_key]&q=Jack&page_limit=1
					    	}
					    	function jewelryClicked() {					    		
					    		jQuery.ajax({
					    			url: "http://svcs.ebay.com/services/search/FindingService/v1?SECURITY-APPNAME=Elfsoftw-0f6e-43a3-86e7-d1093b5ccbd8&OPERATION-NAME=findItemsByCategory&SERVICE-VERSION=1.0.0&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&categoryId=281&paginationInput.entriesPerPage=20",
					    			dataType: "jsonp",
					    			success: handleResponse
					    		});
					    		// http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=[your_api_key]&q=Jack&page_limit=1
					    	}
					    	function healthClicked() {				    		
					    		jQuery.ajax({
					    			url: "http://svcs.ebay.com/services/search/FindingService/v1?SECURITY-APPNAME=Elfsoftw-0f6e-43a3-86e7-d1093b5ccbd8&OPERATION-NAME=findItemsByCategory&SERVICE-VERSION=1.0.0&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&categoryId=172025&paginationInput.entriesPerPage=20",
					    			dataType: "jsonp",
					    			success: handleResponse
					    		});
					    		// http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=[your_api_key]&q=Jack&page_limit=1
					    	}
					    	function athomeClicked() {					    		
					    		jQuery.ajax({
					    			url: "http://svcs.ebay.com/services/search/FindingService/v1?SECURITY-APPNAME=Elfsoftw-0f6e-43a3-86e7-d1093b5ccbd8&OPERATION-NAME=findItemsByCategory&SERVICE-VERSION=1.0.0&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&categoryId=11700&paginationInput.entriesPerPage=20",
					    			dataType: "jsonp",
					    			success: handleResponse
					    		});
					    		// http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=[your_api_key]&q=Jack&page_limit=1
					    	}
					    	function electronicsClicked() {					    		
					    		jQuery.ajax({
					    			url: "http://svcs.ebay.com/services/search/FindingService/v1?SECURITY-APPNAME=Elfsoftw-0f6e-43a3-86e7-d1093b5ccbd8&OPERATION-NAME=findItemsByCategory&SERVICE-VERSION=1.0.0&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&categoryId=32852&paginationInput.entriesPerPage=20",
					    			dataType: "jsonp",
					    			success: handleResponse
					    		});
					    		// http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=[your_api_key]&q=Jack&page_limit=1
					    	}
					    	function bookClicked() {					    		
					    		jQuery.ajax({
					    			url: "http://svcs.ebay.com/services/search/FindingService/v1?SECURITY-APPNAME=Elfsoftw-0f6e-43a3-86e7-d1093b5ccbd8&OPERATION-NAME=findItemsByCategory&SERVICE-VERSION=1.0.0&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&categoryId=267&paginationInput.entriesPerPage=20",
					    			dataType: "jsonp",
					    			success: handleResponse
					    		});
					    		// http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=[your_api_key]&q=Jack&page_limit=1
					    	}
					    	function sportsClicked() {					    		
					    		jQuery.ajax({
					    			url: "http://svcs.ebay.com/services/search/FindingService/v1?SECURITY-APPNAME=Elfsoftw-0f6e-43a3-86e7-d1093b5ccbd8&OPERATION-NAME=findItemsByCategory&SERVICE-VERSION=1.0.0&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&categoryId=888&paginationInput.entriesPerPage=20",
					    			dataType: "jsonp",
					    			success: handleResponse
					    		});				
					    	}
					    	function searchClicked(){
					    		var searchValue = searchItem();
					    		jQuery.ajax({
					    			url: "http://svcs.ebay.com/services/search/FindingService/v1?SECURITY-APPNAME=Elfsoftw-0f6e-43a3-86e7-d1093b5ccbd8&OPERATION-NAME=findItemsByKeywords&SERVICE-VERSION=1.0.0&RESPONSE-DATA-FORMAT=JSON&callback=_cb_findItemsByKeywords&REST-PAYLOAD&keywords="+searchValue+"&itemFilter(0).name=ListingType&itemFilter(0).value=Auction&paginationInput.entriesPerPage=20",
					    			dataType: "jsonp",
					    			success: handleResponseSearch
					    		});
					    	}
												    	
					    	function handleResponse(response) {					    		
					    		var items = response.findItemsByCategoryResponse[0].searchResult[0].item || [];
								  var html = [];
								  html.push('<table><tbody>');
								
								  for (var i = 0; i < items.length; ++i)  
								  {
									  var item = items[i];
									    var title = item.title;
									    var pic  = item.galleryURL;
									    var viewitem = item.viewItemURL;
									    var itemid = item.itemId;							    
									    var endTime = item.listingInfo[0].endTime;
									    var currentPrice = Number(item.sellingStatus[0].currentPrice[0]['__value__']).toFixed(2);
									    var timeLeft = item.sellingStatus[0].timeLeft;
									    var StringtimeLeft=timeLeft.toString();
									    var convertTimeLeft = StringtimeLeft.replace(/P(\d+)DT(\d+)H(\d+)M(\d+)S/, "$2:$3:$4");
									    
									    if (null != title && null != viewitem)
									    {
										      html.push('<tr><td align=center>' + '<img src="' + pic + '" border="0">' + '</td>' + 
												        '<td align=left><a name="ViewItem" id="'+itemid+'" href="' + viewitem + '" target="_blank">' + title + 
												        '</a><td>$'+currentPrice+'</td><td style="color:red" id="endtime" name="'+endTime+'">'+convertTimeLeft+'</td>');
										      html.push('<td align=right><button type="button" class="btn" id="'+itemid+'" name="Like">Like</button></td></td></tr>');
										}
								  }
								  html.push('</tbody></table>');
								  document.getElementById("result2").innerHTML = html.join("");
					    	}
					    	
					    	function handleResponseSearch(response){
					    		var items = response.findItemsByKeywordsResponse[0].searchResult[0].item || [];
								var html = [];
								html.push('<table><tbody>');
								
								 for (var i = 0; i < items.length; ++i)  
								  {
									 var item = items[i];
									    var title = item.title;
									    var pic  = item.galleryURL;
									    var viewitem = item.viewItemURL;
									    var itemid = item.itemId;							    
									    var endTime = item.listingInfo[0].endTime;
									    var currentPrice = Number(item.sellingStatus[0].currentPrice[0]['__value__']).toFixed(2);
									    var timeLeft = item.sellingStatus[0].timeLeft;
									    var StringtimeLeft=timeLeft.toString();
									    var convertTimeLeft = StringtimeLeft.replace(/P(\d+)DT(\d+)H(\d+)M(\d+)S/, "$2:$3:$4");
									    
									    if (null != title && null != viewitem)
									    {
										      html.push('<tr><td align=center>' + '<img src="' + pic + '" border="0">' + '</td>' + 
												        '<td align=left><a name="ViewItem" id="'+itemid+'" href="' + viewitem + '" target="_blank">' + title + 
												        '</a><td>$'+currentPrice+'</td><td style="color:red" id="endtime" name="'+endTime+'">'+convertTimeLeft+'</td>');
										      html.push('<td align=right><button type="button" class="btn" id="'+itemid+'" name="Like">Like</button></td></td></tr>');
										}
								  }
								  html.push('</tbody></table>');
								  document.getElementById("result2").innerHTML = html.join("");
					    	}					    	
						    </script>
						</div>
					</div>
				</div>
				<div class="span4">

					<br>

					<div class="row-fluid">
						<div class="span12">
							<div class="slider-wrapper theme-light">
								<div class="ribbon"></div>
								<div id="slider2" class="nivoslider">
									<img src="img/banner_01.jpg" alt="" title="This is an example of an optional long caption text" />
									<img src="img/banner_02.jpg" alt="" title="" />
									<img src="img/banner_03.jpg" alt="" title="" />
									<img src="img/banner_04.jpg" alt="" title="Another caption" />
								</div>
							</div>
							<br>
						</div>

					</div>
					<div class="row-fluid">
						<h3>View History</h3>
						<div class="span12" id="result3">
						
						<script>
							$.ajax({				
							   type: "post",
							   url: "/Zhen2b/ViewHistoryListServlet",
							   dataType: "json",
							   success: postViewHistoryList, error: function(){alert("Wrong,Login!");}										
							});
							function postViewHistoryList(data){												
								var html = [];
							    html.push('<table><tbody>');
								if(data.length==0){
									alert("Please Select Something you liked");
								}else{
									for(var i=0;i<data.length;i++){
										var itemId = data[i].itemId; 
										var itemTitle = data[i].itemTitle;
										var itemPic = data[i].itemPic;
										var itemUrl= data[i].itemUrl;
										
										
										html.push('<tr><td>'+'<img src="'+itemPic+'">'+'</td>'+
												'<td><a href="'+itemUrl+'">'+itemTitle+'</td></tr>');
										
									}
								}  									
								html.push('</tbody></table>');
								document.getElementById("result3").innerHTML = html.join("");
							}
						</script>
							
						</div>
					</div>

				</div>
			</div>

			<hr>



			<div class="row-fluid">
				<div class="span12 well well-small">
						&copy; <script>document.write(new Date().getFullYear());</script> - All taxes are excluded - shipping costs depends on location - <a href="#">more info <i class="icon-chevron-right"></i></a>
				</div>
			</div>

			<div class="footer">


			</div>

		</div>

	</body>

</html>
