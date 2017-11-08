<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" import ="java.io.PrintWriter" import ="DATABASE.DB" import ="java.util.*" import ="UTIL.*"
 %>
<%! Connection conn;String course;ResultSet rs;PreparedStatement pst,temp;
	int DID,CID;ArrayList<Navigation> cseNav,cceNav,eceNav,mmeNav;
	ArrayList<Pair> topicList;
	HttpSession session;
	%> 
<%
	DID = (int)session.getAttribute("DID");
	System.out.print("did"+" "+DID);
	session=request.getSession();
	cseNav = new ArrayList<Navigation>();
	cceNav = new ArrayList<Navigation>();
	eceNav = new ArrayList<Navigation>();
	mmeNav = new ArrayList<Navigation>();
%>

<%
//String fname,lname,pass,dateofbirth,email,address,city,state,pin,country,contact;
//int uid;
//Date dob;
	try{
			topicList = new ArrayList<Pair>();
	        CID =Integer.valueOf(request.getParameter("courseID"));   
	        System.out.println("CID:"+CID);
	        conn = DB.getConnect();
	        PreparedStatement pst = conn.prepareStatement("Select TID,tname from topic where CID=?");
	        pst.setInt(1, CID);
	        rs = pst.executeQuery();
	        int rowcount=0;
	        if (rs.last()) {
			  rowcount = rs.getRow();
			  rs.beforeFirst(); 
			}
	        if(rowcount==0){
	        	System.out.println("resultSet is NuLL!!");
	        	String site = new String("courseRetrive.jsp");
		        response.setStatus(response.SC_MOVED_TEMPORARILY);
		        response.setHeader("Location", site); 
	        }else{
		        while(rs.next())           
		        {
		        	//out.println((++i)+" "+str+"<br>");
		        	topicList.add(new Pair(rs.getInt(1),rs.getString(2)));
		        }
		        session.setAttribute("CID", CID);	
	        }        
		}
	   catch(Exception e){       
	       out.println("Something went wrong !! Please try again"); 
	   }
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <style>
     
        #navi{
        	background: #F0F8FF;
        }
       	 td {
    	padding: 15px;
    	text-align: left;
    	border-bottom: 1px solid #ddd;
    	color:black;
	}
	#topics{
        	
        	font-size: 200%;
        	        }

        </style>
    
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<!-- header -->
 <div class="header wow zoomIn">
        <div class="container">
        	<div class="header_left" data-wow-duration="2s" data-wow-delay="0.5s">
			<ul>
				<li><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>+123 456 7890</li>
				<li><a href="mailto:info@example.com"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>info@example.com</a></li>
			</ul>
		</div>
            <div class="header_right">
                <div class="login">
                <ul> 
                    <li><a href="#"><span aria-hidden="true"><img src="icon/user.png" width="30px" height="40px"></span></a></li>
                    <li><a href="#"><span aria-hidden="true" >Account Details </span></a></li>
                
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
							<li class="menu__item menu__item--current"><a href="index.jsp" class="menu__link">Home</a></li>
							<li class="menu__item"><a href="myappointment.html" class="menu__link">Discussion</a></li> 
							
							<li class="menu__item"><a href="medicalhistory.html" class="menu__link">Messages</a></li> 
						
						</ul>
					</nav>
				</div>
			</nav>
		</div>
	</div>
	</div>
	<div class="container">
    <div class="row row-content">
         <div class="col-xs-12 col-sm-3">
        	<ul id="navi" class="navi">
				<li><input type="checkbox" id="cb1"/><label for="cb1">Navigation</label>
					<ul>
						<li><input type="checkbox" id="cb3"/><label for="cb3">CSE</label>
							<ul>
								<%for(Navigation n : cseNav){ %>
								<li><input type="checkbox" id="<%=n.getCourseID()%>"/><label for="<%=n.getCourseID()%>"><%=n.getCourse() %></label>
									<ul>
										<%for(Pair p : n.getTopics()){ %>
										<li><label><a href="lobject.jsp?TID=<%=p.getNum()%>&topic=<%=p.getStr()%>"><%=p.getStr() %></a></label> </li>
										<%} %>
									</ul>
								</li>
								<%} %>
							</ul>
						</li>
						<li><input type="checkbox" id="cb2"/><label for="cb2">CCE</label>
							<ul>
								<%for(Navigation n : cceNav){ %>
								<li><input type="checkbox" id="<%=n.getCourseID()%>"/><label for="<%=n.getCourseID()%>"><%=n.getCourse() %></label>
									<ul>
										<%for(Pair p : n.getTopics()){ %>
										<li><label><a href="lobject.jsp?TID=<%=p.getNum()%>&topic=<%=p.getStr()%>"><%=p.getStr() %></a></label> </li>
										<%} %>
									</ul>
								</li>
								<%} %>
								
							</ul>
						</li>
						<li><input type="checkbox" id="cb4"/><label for="cb4">ECE</label>
							<ul>
								<%for(Navigation n : eceNav){ %>
								<li><input type="checkbox" id="cb5"/><label for="cb5"><%=n.getCourse() %></label>
									<ul>
										<%for(Pair p : n.getTopics()){ %>
										<li><label><a href="lobject.jsp?TID=<%=p.getNum()%>&topic=<%=p.getStr()%>"><%=p.getStr() %></a></label> </li>
										<%} %>
									</ul>
								</li>
								<%} %>
							</ul>
						</li>
						<li><input type="checkbox" id="cb7"/><label for="cb7">MME</label>
							<ul>
								<%for(Navigation n : mmeNav){ %>
								<li><input type="checkbox" id="<%=n.getCourseID()%>"/><label for="<%=n.getCourseID()%>"><%=n.getCourse() %></label>
									<ul>
										<%for(Pair p : n.getTopics()){ %>
										<li><label><a href="lobject.jsp?TID=<%=p.getNum()%>&topic=<%=p.getStr()%>"><%=p.getStr() %></a></label> </li>
										<%} %>
									</ul>
								</li>
								<%} %>
							</ul>
						</li>
					</ul>
				</li>
			</ul>
        </div>
        <div class="col-xs-12 col-sm-9 ">
        	<div><strong><h1><%=course %></h1></strong></div>
        	 <p style="padding:20px;"></p>
           	<div class="table-responsive">
           		<table id="topics" class="table table-hover">
           			<% for(Pair p:topicList) {%>           			
           			<tr ><td><a href="lobject.jsp?TID=<%=p.getNum() %>&topic=<%=p.getStr() %>"><%=p.getStr()%></a> 
           				</td><td style="text-align: right">
           				<button  style="background-color:transparent; border:none" Value = "<%=p.getNum() %>" 
           						onClick="GetSelectedItem(this)" data-toggle="modal" data-target="#myModal6">
           								<span class="glyphicon glyphicon-cog"></span></button></td></tr>
           				<tr >
           			<%} %>
           			
           			
           		</table>
           		
           		</div>

           		
        </div>
        
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
<!--footer ends here -->    
  	<div class="modal fade" id="myModal6" tabindex="-1" role="dialog" >
				<div class="modal-dialog" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
						</div>
						<div class="modal-body modal-spa">
							<div class="login-grids">
									
									<div class="login-right">
										<h3>Add Learning Object Here</h3>
										<form action="./AddLearningObj" method="post" >
											<div class="sign-in">
												<h4>Learning Object Title :</h4>
												<input type="text" name="name" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Type here';}" required="">	
											</div>
												<div class="sign-in">
												<h4>Link :</h4>
												<input type="text" name="link" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Type here';}" required="">	
											</div>
											<div class="sign-in">
												<input type="hidden" id= "shri" name="TID" value="">
												<input type="hidden" name="CID" value="<%=CID%>"> 
												<h4>Description :</h4>
												<textarea rows="3"  name="description" class="sign" required=""></textarea>
												<!-- <textarea name="Message" onfocus="this.value = '';" onfocus="if (this.value == '') {this.value = 'Message...';}" required="" style="width:100% " ></textarea> -->
					
											</div>
										
											<div class="sign-in">
												<input type="submit" value="SUBMIT" onclick="pa">
											</div>
										</form>
									</div>
                                 
									
								
							</div>
						</div>
					</div>
				</div>
			</div>  
			<script  type="text/javascript">
         // Grab the output eleent
    //var output = document.getElementById('output');
	
       // "el" is the parameter that references the "this" argument that was passed
    function GetSelectedItem(el) {
    	
        //output.innerHTML = el.value; // set its content to the value of the "el"
    	document.getElementById('shri').setAttribute("value", el.value);
    }
</script>   
	
</body>

</html>