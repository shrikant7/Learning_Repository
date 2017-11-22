<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" import ="java.io.PrintWriter" 
	import ="DATABASE.DB" import ="java.util.*" import ="UTIL.*"
%>
<%! Connection conn;String course;ResultSet rs;PreparedStatement pst,temp;
	int UID;String name,email,branch,roll;
	HttpSession session;
%>
<%
try{
	        conn = DB.getConnect();
	        session=request.getSession();
			UID = (int)session.getAttribute("UID");
	        temp=conn.prepareStatement("Select name,email,roll,branch from user where UID=?");
	        temp.setInt(1, UID);
	        rs = temp.executeQuery();
	        while(rs.next())
	        {
	        	name = rs.getString(1);
	        	email=rs.getString(2);
	        	branch=rs.getString(4);
	        }	        
		}
	   catch(Exception e){       
	       out.println("Something went wrong !! Please try again"); 
	   }
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap-social.css" rel="stylesheet">
   
    
  
<title>E-LNMIIT</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Infirmary Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/jquery-ui.css" />
<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/table.css" rel="stylesheet" type="text/css">
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/numscroller-1.0.js"></script>
     <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="js/jquery.autocomplete.min.js"></script>
  <script type="text/javascript" src="js/currency-autocomplete.js"></script>    

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

 <style>
  #topics{
        	
        	font-size: 150%;
        	        }
  td {
    	padding: 15px;
    	text-align: left;
    	border-bottom: 1px solid #ddd;
		}
	</style>
</head>
<body>
 
    <div class="header wow zoomIn">
        <div class="container">
            <div class="header_right">
                <div class="login">
                <ul> 
                    <li><a href="#"><span aria-hidden="true"><img src="icon/user.png" width="20px" height="30px"></span></a></li>
                    <li><a href="accountDetails.jsp"><span aria-hidden="true" >Account Details </span></a></li>
                
                </ul>
                </div>    
                     
            </div>
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
							<h1><a class="link link--nukun" href="index.html"><i></i>E-<span>LNMIIT</span></a></h1>
						</div>
					</div>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				
			</nav>
		</div>
	</div>
  
<p style="padding:50px;"></p>

    <div class="container">
	<div class="row row-content">
	<div class="col-md-3">
	</div>
	<div class="col-md-6">
	<table id="topics" class="table"  style="background:#D3D3D3;">

	<th>ACCOUNT DETAILS </th>
	<tr><td><img src="icon/user.png" width="100px" height="150px"></td>
	<td>Name:<br/>
	Email:<br/>
	Department:</td>
	
<td><%=name %><br/>


<%=email %> <br/>


<%=branch %> </td>
<td>
</td>
</table>
</div>
<div class="col-md-3">
	</div>
	</div>

 <p style="padding:90px;"></p>
</div>
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
<!--footer ends here -->          

    </body>
</html>