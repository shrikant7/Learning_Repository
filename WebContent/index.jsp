<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%!HttpSession session = null;
  %>
<%
	HttpServletResponse httpResponse = (HttpServletResponse)response;
	httpResponse.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
	response.addHeader("Cache-Control", "post-check=0, pre-check=0");
	httpResponse.setHeader("Pragma","no-cache"); 
	
	if(request.getAttribute("errorMsg")!=null)
	{
		System.out.println("i have errorMsg:"+request.getAttribute("errorMsg"));
	}
	
	session = request.getSession();
	System.out.println("in index.jsp session UID:"+session.getAttribute("UID"));
	if(session.getAttribute("UID")!=null){
		if(((String)session.getAttribute("type")).equals("s")){
			String site = new String("student.jsp");
	        response.setStatus(response.SC_MOVED_TEMPORARILY);
	        response.setHeader("Location", site); 
	    }else{
        	String site = new String("professor.jsp");
	        response.setStatus(response.SC_MOVED_TEMPORARILY);
	        response.setHeader("Location", site); 
		}
	}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <style>

        h4 {
        		color : #FFFF00;
        }
        </style>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<title>E-LNMIIT</title>
<!-- for-mobile-apps -->

<!-- <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script> -->
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/jquery-ui.css" />
<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/numscroller-1.0.js"></script>
     <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>

<!-- //js -->


<!-- fonts -->
<link href='//fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Viga' rel='stylesheet' type='text/css'>

	<!-- start-smoth-scrolling -->
		<script type="text/javascript" src="js/move-top.js"></script>
		<script type="text/javascript" src="js/easing.js"></script>
		<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
		</script>
	<!-- start-smoth-scrolling -->


	<script src="js/responsiveslides.min.js"></script>
			<!--animate-->
<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="js/wow.min.js"></script>
	<script>
		 new WOW().init();
	</script>
<!--//end-animate-->
</head>
<body>
<!-- header -->

<!-- //header -->

	<div class="header wow zoomIn">
		<div class="container">
			<div class="header_left" data-wow-duration="2s" data-wow-delay="0.5s">
				<ul>
					<li><span class="glyphicon glyphicon-earphone"
						aria-hidden="true"></span>+123 456 7890</li>
					<li><a href="mailto:info@example.com"><span
							class="glyphicon glyphicon-envelope" aria-hidden="true"></span>info@example.com</a></li>
				</ul>
			</div>
			<div class="header_right">
				<div class="login">
					<ul>
						<li><a href="#" data-toggle="modal" data-target="#myModal5"><span
								class="glyphicon glyphicon-user" aria-hidden="true"></span>Faculty
								Sign Up</a></li>
						<li><a href="#" data-toggle="modal" data-target="#myModal6"><span
								class="glyphicon glyphicon-user" aria-hidden="true"></span>Student
								Sign Up</a></li>
						<li><a href="#" data-toggle="modal" data-target="#myModal4"><span><img
									src="images/doct1.png" hieght="15px" width="15px"></span>LogIn</a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
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
							<li class="menu__item menu__item--current"><a href="index.jsp" class="menu__link">Home</a></li>
							<li class="menu__item"><a href="#courses" class="menu__link">Courses</a></li>
							<li class="menu__item"><a href="#about" class="menu__link">About</a></li>
							<li class="menu__item"><a href="#contact" class="menu__link">Contact</a></li>
						</ul>
					</nav>
				</div>
			</nav>
		</div>
	</div>

<!-- banner -->
<div class="banner">

				<script>
						// You can also use "$(window).load(function() {"
						$(function () {
						 // Slideshow 4
						$("#slider3").responsiveSlides({
							auto: true,
							pager: true,
							nav: false,
							speed: 500,
							namespace: "callbacks",
							before: function () {
						$('.events').append("<li>before event fired.</li>");
						},
						after: function () {
							$('.events').append("<li>after event fired.</li>");
							}
							});
						});
				</script>
		<div  id="top" class="callbacks_container">
			<ul class="rslides" id="slider3">
				<li>
					<div class="banner1">
					<!-- 	<div class="container">
							<div class="banner-info2 text-center">
								<h3>Providing<span> a Platform to Lnmiit Students </span></h3>
								<p>Learn the courses from best online material and our faculty </p>
							</div>
						</div> -->
					</div>
				</li>
				<li>
					<div class="banner2">
						<!-- <div class="container">
							<div class="banner-info2 text-center">
								<h3>Contribute <span>Platform to contribute and help </span></h3>
								<p>Contribute to this platform so that other can utilize the best material and lern more and help to grow this platform in our campus</p>
							</div>
						</div> -->
					</div>
				</li>
				<li>
				<div class="banner1">
						<!-- <div class="container">
							<div class="banner-info2 text-center">
								<h3>Providing<span> a Platform to Lnmiit Students </span> </h3>
								<p>Learn the courses from best online material and our faculty </p>
							</div>
						</div> -->
					</div>
				</li>
				<li>
					<div class="banner2">
						<!-- <div class="container">
							<div class="banner-info2 text-center">
								<h3>Contribute <span>Platform to contribute and help </span></h3>
								<p>Contribute to this platform so that other can utilize the best material and lern more and help to grow this platform in our campus</p>
							</div>
						</div> -->
					</div>
				</li>
			</ul>
		</div>
		<div class="clearfix"></div>
</div>
<!-- //banner -->
<!-- content -->
<div id = "courses">
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
									<h3>Computer Sceince and Engg</h3>

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
									<h3>Electronics and communication engineering </h3>

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
									<h3>computer and comunication engg</h3>

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
									<h3>Mechanical Engg</h3>

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

</div>
<div id = "about">
<div class="ind-team">
	<div class="container">
		<h3>Meet Our Team</h3>
		<div class="col-md-4 ind-gds text-center wow zoomIn" data-wow-duration="1.5s" data-wow-delay="0.1s">
			<div class="team-img">
				<img class="img-responsive" src="images/pic4.jpg" alt=" " height="42" width="42"/>
				<div class="team-info">
					<ul>
						<li class="hvr-rectangle-out"><a class="eco1" href="#"></a></li>
						<li class="hvr-rectangle-out"><a class="eco2" href="#"></a></li>
						<li class="hvr-rectangle-out"><a class="eco3" href="#"></a></li>
						<li class="hvr-rectangle-out"><a class="eco4" href="#"></a></li>
						<li class="hvr-rectangle-out"><a class="eco5" href="#"></a></li>
					</ul>
				</div>
			</div>
			<h4>Manish Jain</h4>
			<p>Developer</p>
		</div>
		<div class="col-md-4 ind-gds text-center wow zoomIn" data-wow-duration="1.5s" data-wow-delay="0.1s">
			<div class="team-img">
				<img class="img-responsive" src="images/pic5.jpg" alt=" "/>
				<div class="team-info">
					<ul>
						<li class="hvr-rectangle-out"><a class="eco1" href="#"></a></li>
						<li class="hvr-rectangle-out"><a class="eco2" href="#"></a></li>
						<li class="hvr-rectangle-out"><a class="eco3" href="#"></a></li>
						<li class="hvr-rectangle-out"><a class="eco4" href="#"></a></li>
						<li class="hvr-rectangle-out"><a class="eco5" href="#"></a></li>
					</ul>
				</div>
			</div>
			<h4>Dr. Thompson</h4>
			<p>Cardiology</p>

		</div>
		<div class="col-md-4 ind-gds text-center wow zoomIn" data-wow-duration="1.5s" data-wow-delay="0.1s">
			<div class="team-img">
				<img class="img-responsive" src="images/pic6.jpg" alt=" "/>
				<div class="team-info">
					<ul>
						<li class="hvr-rectangle-out"><a class="eco1" href="#"></a></li>
						<li class="hvr-rectangle-out"><a class="eco2" href="#"></a></li>
						<li class="hvr-rectangle-out"><a class="eco3" href="#"></a></li>
						<li class="hvr-rectangle-out"><a class="eco4" href="#"></a></li>
						<li class="hvr-rectangle-out"><a class="eco5" href="#"></a></li>
					</ul>
				</div>
			</div>
			<h4>Shrikant Sharma</h4>
			<p>Developer</p>
		</div>

		<div class="clearfix"></div>
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
					<h3>Learning</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
				</div>
				<div class="col-md-4 ftr-grid">
					<h3>Our Address</h3>
					<div class="ftr-address">
						<div class="local">
							<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
						</div>
						<div class="ftr-text">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="ftr-address">
						<div class="local">
							<span class="glyphicon glyphicon-phone" aria-hidden="true"></span>
						</div>
						<div class="ftr-text">
							<p>+1 (512) 154 8176</p>
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
					<ul>
						<li><a href="index.jsp">Home</a></li>
						<li><a href="about.html">About</a></li>
						<li><a href="shortcodes.html">Short Codes</a></li>
						<li><a href="gallery.html">Gallery</a></li>
						<li><a href="contact.html">Contact</a></li>
					</ul>
				</div>
				<div class="col-md-6 copyrights">
					<p>© 2016 Learning. All Rights Reserved | Design by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
</div>
</div>
<!--footer ends here -->
			<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" >
				<div class="modal-dialog" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						</div>
						<div class="modal-body modal-spa">
							<div class="login-grids">

									<div class="login-right">
										<h3>Sign in with your account</h3>
										<form action="./Login" method="post" >
											<div class="sign-in">
												<h4>Email :</h4>
												<input type="text" name="email" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Type here';}" required="">
											</div>
											<div class="sign-in">
												<h4>Password :</h4>
												<input type="password" name="password" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="">
												<a href="#">Forgot password?</a>
											</div>

											<div class="sign-in">
												<input type="submit" value="SIGNIN" onclick="pa">
											</div>
										</form>
									</div>


								<p>By logging in you agree to our <a href="#">Terms and Conditions</a> and <a href="#">Privacy Policy</a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
<!-- //login -->
<!-- login -->
			<div class="modal fade" id="myModal5" tabindex="-1" role="dialog" >
				<div class="modal-dialog" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						</div>
						<div class="modal-body modal-spa">
							<div class="login-grids">
									<div class="login-bottom">
										<form action="./Signup" method="post">
                      <div class="sign-up">
												<h4>Name :</h4>
												<input type="text" name="name" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
											</div>
											 <div class="sign-up">
												<h4>Department:</h4>
                        <select name = "branch">
                        <option value="cse">Computer Science and Engg</option>
                          <option value="ece">Electronics and Communication Engg</option>
                          <option value="cce">Computer and Communication Engg</option>
                          <option value="mme">Mechanical Engg</option>
                        </select>
											</div>
											<div class="sign-up">
												<h4>Email :</h4>
												<input type="text" name="email" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Type here';}" required="">
											</div>
											<div class="sign-up">
												<h4>Password :</h4>
												<input type="password" name="password" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="">

											</div>
											<div class="sign-up">
												<h4>Re-type Password :</h4>
												<input type="password" name="rpassword" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="">

											</div>
											<div class="sign-up">
											    <input type="hidden" name="type" value="p">
												<input type="submit" value="REGISTER NOW" >
											</div>

										</form>
									</div>
								<p>By logging in you agree to our <a href="#">Terms and Conditions</a> and <a href="#">Privacy Policy</a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
      <div class="modal fade" id="myModal6" tabindex="-1" role="dialog" >
      				<div class="modal-dialog" role="document">
      					<div class="modal-content modal-info">
      						<div class="modal-header">
      							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      						</div>
      						<div class="modal-body modal-spa">
      							<div class="login-grids">
      									<div class="login-bottom">
      										<form action="./Signup" method="post">
                            <div class="sign-up">
      												<h4>Name :  </h4>
      												<input type="text" name="name" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
      											</div>
      											 <div class="sign-up">
      												<h4>Roll No. :  </h4>
      												<input type="text" name="roll" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'rollno.';}" required="">
      											</div>
      												<div class="sign-up">
      												<h4>Department :  </h4>
                              <select name= "branch">
                                  <option  value="cse">Computer Science and Engg</option>
                                    <option value="ece">Electronics and Communication Engg</option>
                                    <option value="cce">Computer and Communication Engg</option>
                                    <option value="mme">Mechanical Engg</option>
                                </select>
      											</div>
      											<div class="sign-up">
      												<h4>Email :</h4>
      												<input type="email" name="email" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Type here';}" required="">
      											</div>
      				              <div class="sign-up">
      												<h4>Password :</h4>
      												<input type="password" name="password" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="">

      											</div>
      											<div class="sign-up">
      												<h4>Re-type Password :</h4>
      												<input type="password" name="rpassword" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="">

      											</div>
      											<div class="sign-up">
      												<input type="hidden" name="type" value="s">
      												<input type="submit" value="REGISTER NOW" >
      											</div>

      										</form>
      									</div>
      								<p>By logging in you agree to our <a href="#">Terms and Conditions</a> and <a href="#">Privacy Policy</a></p>
      							</div>
      						</div>
      					</div>
      				</div>
      			</div>
<!-- //login -->
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
</body>
</html>
