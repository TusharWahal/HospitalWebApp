<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ADD BILL</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Medicinal Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="applisalonion/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />	
<link rel="stylesheet" href="css/slider.css">
<script src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<!--/web-font-->
<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
<!--/script-->
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},900);
				});
			});
</script>


</head>
<body>
	<!--header-top-->
			<div class="header-top">
			  <div class="container">
					 <nav class="navbar navbar-default">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
					  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					  </button>
						<div class="logo">
							<h1><a class="navbar-brand" href="index.jsp"><span>M</span>edicinal  <img src="images/logo.png" alt=" " /></a></h1>
						</div>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
						  <div class="top-menu">
							<nav class="menu menu--francisco">
									<ul class="nav navbar-nav menu__list">
										<li class="menu__item menu__item--current"><a href="index.jsp" class="menu__link"><span class="menu__helper">Home</span></a></li>
										<li class="menu__item"><a href="about.html" class="menu__link"><span class="menu__helper">About Us</span></a></li>
										<li class="menu__item"><a href="typography.html" class="menu__link"><span class="menu__helper">Short Codes</span></a></li>
										<li class="menu__item"><a href="gallery.html" class="menu__link"><span class="menu__helper">Departments</span></a></li>
										<li class="menu__item"><a href="contact.html" class="menu__link"><span class="menu__helper">Contact Us</span></a></li>
									</ul>
								</nav>
							</div>
					</div>
					<!-- /.navbar-collapse -->
				</nav>

			   <div class="clearfix"></div>
			</div>
	</div>
<!--//header-top-->
 <!-- //Line Slider -->
		<div class="top_banner two">
			<div class="container">
			       <div class="sub-hd-inner">
						<h3 class="tittle">ADD <span>BILL</span></h3>
					</div>
			</div>
		</div>
	<!--/single-->
 <div class="single">
			<div class="container">
				<div class="article-post w3l">
				<div class="post-details s-page">
				
		<div class="leave w3l">
			<h3>Enter <span> required details </span></h3>
			<br>
			<br>
				<form action="./NewBillController">
					<div class="single-grid">
						<div class="single-us">
						
						   <form>
						   
								<input type="text" id="personid" name="personId" placeholder="Person ID" required="" >
								
								<jsp:forward page="./AddBill">
									<c:param name="personId" value="personId"></c:param>
								</jsp:forward>
								<!-- Need To Use JSTL to get department and doctor list dynamically-->
								
								<div class="section_room">
							
								<select id="discharge" name="discharge" class="frm-field required" required >
								<option  id='0' value="">Select Discharge Summary Serial Number</option>
								<c:forEach var="dischargeSummary" items="${dischargeSummaryList}">
									<option id=${dischargeSummary.serialNo} value=${dischargeSummary.serialNo}>${dischargeSummary.serialNo}</option>
			    				</c:forEach>						
								</select>
								</div>
								 
    
								<input type="number" id="docfee" name="docfee" placeholder="Doctor Visting Charges" required="">
								
								<input type="number" id="bedfee" name="bedfee" placeholder="Bed Charges" required="">
								
								<input type="number" name="tests" id="tests" placeholder="Test/s Charges" required="">

								<input type="number" name="medicines" id="medicines" placeholder="Test/s Charges" required="">
							
								<input id="confirm" type="submit" value="CREATE BILL" >

						   </form>
							<form action="./admin.jsp">
								<input  type="submit" value="CANCEL" >
						   </form>
						</div>
				</form>
				
				</div>
			</div>			
		</div>
			</div>
	</div>
	
	
	<%-- <script type="text/javascript">
	$(document).ready(function(){
		var valueSelected
		$("#department").on('change', function (e) {
		    var optionSelected = $("option:selected", this);
		    valueSelected = this.value;
		    $('option').show();
		    //$('#'+valueSelected).show();
		    $("#department > option").each(function() {
		        var docval=this.value;
		        if(docval!=valueSelected){
		        	$('#'+docval).hide();
		        }
		    });
		    
		    if(valueSelected=="Default"){
		    	$('option').show();
		    	
		    }
		    $("#doctor").fadeOut(function(){$("#doctor").val('');});	
		    $("#doctor").fadeIn();
		    $("#0").show();
		    $("#D0").show();
		    
		    	    
		    
		});
		
		
		
		
		});--%>
	</script>
	<!-- <script type="text/javascript">

	$(document).ready(function(){
			{
		$("#confirm").click(function()
		{
		alert($("#doctor").val());
			});


			}
		});

	</script>-->
	
	<!--//single-->	

	  <!--/start-footer-section-->
	  <br>
	  <br>
			<div class="footer-section">
				<div class="container">
					<div class="footer-grids wow bounceIn animated" data-wow-delay="0.4s">
						<div class="col-md-3 footer-grid">
						<h4>About <span>Medicinal</span></h4>
						<div class="border2"></div>
						  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque id arcu neque, at convallis est felis.</p>
						  <p class="sub">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque id arcu neque, at convallis est felis.</p>
						</div>
						<div class="col-md-3 footer-grid tags">
								<h4>The <span>Tags</span></h4>
								<div class="border2"></div>
							<ul class="tag">
								<li><a href="#">Awesome</a></li>
								<li><a href="#">Strategy</a></li>
								<li><a href="#">Photography</a></li>
								<li><a href="#">Development</a></li>
								<li><a href="#">Css</a></li>
								<li><a href="#">photoshop</a></li>
								<li><a href="#">Html</a></li>
								<li><a href="#">Awesome</a></li>
								<li><a href="#">Strategy</a></li>
								<li><a href="#">Photoshop</a></li>
								<li><a href="#">Html</a></li>
							</ul>
						</div>
						<div class="col-md-3 footer-grid tweet">
								<h4>Latest <span>Tweets</span></h4>
								<div class="border2"></div>
								<div class="icon-3-square">
										<a href="#"><i class="square-3"></i></a>
									</div>
							<div class="icon-text">
								<p>I like this awesome freebie. Check it out By <a href="#"> Admin </a></p>
								<h5>15 mins ago</h5>
							</div>
								<div class="clearfix"></div>
								<div class="icon-3-square">
										<a href="#"><i class="square-3"></i></a>
								</div>
								<div class="icon-text">
								    <p>I like this awesome freebie. Check it out  By <a href="#"> Admin </a> </p>
									<h5>15 mins ago</h5>
								</div>
								<div class="clearfix"></div>
						</div>
						<div class="col-md-3 footer-grid flickr">
								<h4>Flickr <span>Feed </span></h4>
								<div class="border2"></div>
								<div class="flickr-grids">
										<div class="flickr-grid">
											<a href="#"><img src="images/t1.jpg" alt=" " title="CEO" /></a>
										</div>
										<div class="flickr-grid">
											<a href="#"><img src="images/t2.jpg" alt=" " title="GM" /></a>
										</div>
										<div class="flickr-grid">
											<a href="#"><img src="images/t3.jpg" alt=" " title="CEO" /></a>
										</div>
										<div class="clearfix"> </div>
										
										<div class="flickr-grid">
											<a href="#"><img src="images/t2.jpg" alt=" " title="GM" /></a>
										</div>
										<div class="flickr-grid">
											<a href="#"><img src="images/t3.jpg" alt=" " title="CEO" /></a>
										</div>
										<div class="flickr-grid">
											<a href="#"><img src="images/t1.jpg" alt=" " title="GM" /></a>
										</div>
								<div class="clearfix"> </div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
			</div>
		</div>
	<!--//end-footer-section-->
	<!--//footer-->
	<div class="footer-bottom">
		<div class="container">
			<p>� 2016 Medicinal. All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
		</div>
	</div>
		<!--start-smooth-scrolling-->
						<script type="text/javascript">
									$(document).ready(function() {
										/*
										var defaults = {
								  			containerID: 'toTop', // fading element id
											containerHoverID: 'toTopHover', // fading element hover id
											scrollSpeed: 1200,
											easingType: 'linear' 
								 		};
										*/
										
										$().UItoTop({ easingType: 'easeOutQuart' });
										
									});
								</script>
								<!--end-smooth-scrolling-->
		<a href="#house" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
	<script src="js/bootstrap.js"></script>

</body>
</html>