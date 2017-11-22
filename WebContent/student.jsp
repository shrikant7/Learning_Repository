<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%!HttpSession session = null;
  %>
<%
HttpServletResponse httpResponse = (HttpServletResponse)response;
httpResponse.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
response.addHeader("Cache-Control", "post-check=0, pre-check=0");
httpResponse.setHeader("Pragma","no-cache"); 
	session = request.getSession();
	System.out.println("in studen.jsp session UID:"+session.getAttribute("UID"));
	if(session.getAttribute("UID")==null){
       	String site = new String("index.jsp");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site); 
	}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <style>
      #b{
        
            border:1px solid;
            background: blue;
            color: aliceblue;
        }
        </style>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
<title>E-LNMIIT</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/jquery-ui.css" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/numscroller-1.0.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
 <script src="js/wow.min.js"></script>
	<script>
		 new WOW().init();
	</script>
<!--//end-animate-->
</head>
<body>
<!-- header -->
 <div class="header wow zoomIn">
        <div class="container">
        	<div class="header_left" data-wow-duration="2s" data-wow-delay="0.5s">
			<ul>
				
				<li><a href="mailto:e-lnmiit@gmail.com"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>e-lnmiit@gmail.com</a></li>
			</ul>
		</div>
            <div class="header_right">
                <div class="login">
                <ul> 
                    <li><a href="#"><span aria-hidden="true"><img src="icon/user.png" width="20px" height="30px"></span></a></li>
                    <li><a href="accountDetails.jsp"><span aria-hidden="true" >Account Details </span></a></li>
                	<li><button class = "btn btn-primary" type="button" onclick="location.href = './Logout';">Logout</button></li>
                </ul>
                </div>    
                     
            </div>
        </div>
    </div>
<!-- //header -->
 <div class="header-bottom ">
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
					<div class="logo grid">
						<div class="grid__item color-3">
							<h1><a class="link link--nukun" href="index.jsp"><i></i>E-<span>LNMIIT</span></a></h1>
						</div>
					</div>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
					<nav class="menu menu--horatio">
						<ul class="nav navbar-nav menu__list">
							<li class="menu__item menu__item--current"><a href="course.jsp" class="menu__link">Home</a></li>
							
							<li class="menu__item"><a href="#" class="menu__link">Ask Question to Faculty</a></li> 
							<li class="menu__item"><a href="#" class="menu__link">Contribute</a></li> 
						</ul>
					</nav>
				</div>
			</nav>
		</div>
	</div>
	
                     <p style="padding:20px;"></p>
         </div>
	<div class="educate">
	<div class="container">
		<div class="education-main">
			<ul class="ch-grid">
				 <div class="col-md-3 w3agile">
					<li>
						<div class="ch-item">				
							<div class="ch-info">
								<div class="ch-info-front ch-img-1">
									<span class="glyphicon glyphicon-grain" aria-hidden="true"> </span>
					                <h5>CSE</h5>
								</div>
								<div class="ch-info-back">
									<a href="course.jsp?dep=cse" ><h3>Computer Science and Engg</h3></a>
								
								</div>	
							</div>
						</div>
					</li>
					</div> 
					 <div class="col-md-3 w3agile">
					<li>
						<div class="ch-item">
							<div class="ch-info">
								<div class="ch-info-front ch-img-2">
									<span class="glyphicon glyphicon-hourglass" aria-hidden="true"> </span>									
					                <h5>ECE</h5> <br> 
					                <h4>Coming Soon...</h4>
								</div>
								<div class="ch-info-back">
								<a href="course.jsp?dep=ece" >	<h3> Electronics and Communication Engg</h3></a> 
								
								</div>
							</div>
						</div>
					</li>
					</div>
					 <div class="col-md-3 w3agile">
					<li>
						<div class="ch-item">
							<div class="ch-info">
								<div class="ch-info-front ch-img-3">
									<span class="glyphicon glyphicon-hourglass" aria-hidden="true"> </span>
					                <h5>CCE</h5> <br> 
					                <h4>Coming Soon...</h4>
								</div>
								<div class="ch-info-back">
									<a href="course.jsp?dep=cce"><h3>Computer and Communication Engg</h3></a>
									
								</div>
							</div>
						</div>
					</li>
					</div>
					 <div class="col-md-3 w3agile">
					<li>
						<div class="ch-item">
							<div class="ch-info">
								<div class="ch-info-front ch-img-4">
									<span class="glyphicon glyphicon-hourglass" aria-hidden="true"> </span>
					                <h5>ME</h5> <br> 
					                <h4>Coming Soon...</h4>
								</div>
								<div class="ch-info-back">
									<a href="course.jsp?dep=mme"><h3>Mechanical Engg</h3></a>
									
								</div>
							</div>
						</div>
					</li>
					</div>
					<div class="clearfix"> </div>
			 </ul>
		 </div>
	</div>
</div>
 
              <p style="padding:90px;"></p>
   <!--footer starts-->
     <div class="footer w3ls">
	<div class="container">
		<div class="footer-main">
			<div class="footer-top">
				<div class="col-md-4 ftr-grid">
					<h3>E-LNMIIT</h3>
					<p>Providing a platform to Lnmiit students to learn the courses from best online material </p>
				</div>
				<div class="col-md-4 ftr-grid">
					<h3>Our Address</h3>
					<div class="ftr-address">
						<div class="local">
							<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
						</div>
						<div class="ftr-text">
							<p>Rupa ki Nangal, Post-Sumel, Via-Jamdoli, Jaipur, Rajasthan 302031</p>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="ftr-address">
						<div class="local">
							<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
						</div>
						<div class="ftr-text">
							<p>e-lnmiit@gmail.com</p>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
				<div class="col-md-4 ftr-grid">
					<h3>Stay In Touch</h3>
					<form action="#" method="post">
						<input type="text" placeholder="Enter Email"  name="Enter Email" required="">
						<input type="submit" value="">
					</form>
					<ul class="ftr-social-icons">
						<li><a class="fa" href="#"> </a></li>
						<li><a class="tw" href="#"> </a></li>
						<li><a class="dri" href="#"> </a></li>
						<li><a class="p" href="#"> </a></li>

					</ul>
				</div>
			   <div class="clearfix"> </div>
			</div>
			<div id="contact">
			<div class="footer-bottom">
				<div class="col-md-6 ftr-navg">
					
				</div>
				<div class="col-md-6 copyrights">
					<p>© 2017 E-LNMIIT. All Rights Reserved | Design by <span style="font-family:cursive">Manish Jain </span>  </p>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
</div>
</div>
</body>

<!--footer ends here -->    

</html>