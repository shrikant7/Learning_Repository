<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import ="java.sql.*" import ="java.io.PrintWriter" 
	import ="DATABASE.DB" import ="java.util.*" import ="UTIL.*"
%>
<%! Connection conn;String dep,username;ResultSet rs;PreparedStatement pst,temp;
	int uid,DID;
	ArrayList<Navigation> cseNav,cceNav,eceNav,mmeNav; 
	ArrayList<Trending>trendingList;
	ArrayList<Pair> courseList;
	HttpSession session;
%>
<%
	session=request.getSession();
	username = (String)session.getAttribute("username");
	uid = (int)session.getAttribute("UID");
	System.out.print("hello " + username+" "+uid);
	dep = request.getParameter("dep");
	
	cseNav = new ArrayList<Navigation>();
	cceNav = new ArrayList<Navigation>();
	eceNav = new ArrayList<Navigation>();
	mmeNav = new ArrayList<Navigation>();
	try{
		// department cse
		conn = DB.getConnect();
		temp = conn.prepareStatement("select CID,cname from course where DID=?");
		temp.setInt(1, 1);
		rs = temp.executeQuery();
		while(rs.next()){
			cseNav.add(new Navigation(rs.getInt(1),rs.getString(2),null));
		}
		for(Navigation n : cseNav){
			temp = conn.prepareStatement("select TID,tname from topic where CID=?;");
			temp.setInt(1, n.getCourseID());
			rs = temp.executeQuery();
			ArrayList<Pair> topics = new ArrayList<Pair>();
			while(rs.next()){
				topics.add(new Pair(rs.getInt(1),rs.getString(2)));
			}
			n.setTopics(topics);
		}
		// department cce
		temp = conn.prepareStatement("select CID,cname from course where DID=?");
		temp.setInt(1, 2);
		rs = temp.executeQuery();
		while(rs.next()){
			cceNav.add(new Navigation(rs.getInt(1),rs.getString(2),null));
		}
		for(Navigation n : cceNav){
			temp = conn.prepareStatement("select TID,tname from topic where CID=?;");
			temp.setInt(1, n.getCourseID());
			rs = temp.executeQuery();
			ArrayList<Pair> topics = new ArrayList<Pair>();
			while(rs.next()){
				topics.add(new Pair(rs.getInt(1),rs.getString(2)));
			}
			n.setTopics(topics);
		}
		// department ece
		temp = conn.prepareStatement("select CID,cname from course where DID=?");
		temp.setInt(1, 3);
		rs = temp.executeQuery();
		while(rs.next()){
			eceNav.add(new Navigation(rs.getInt(1),rs.getString(2),null));
		}
		for(Navigation n : eceNav){
			temp = conn.prepareStatement("select TID,tname from topic where CID=?;");
			temp.setInt(1, n.getCourseID());
			rs = temp.executeQuery();
			ArrayList<Pair> topics = new ArrayList<Pair>();
			while(rs.next()){
				topics.add(new Pair(rs.getInt(1),rs.getString(2)));
			}
			n.setTopics(topics);
		}
		// department mme
		temp = conn.prepareStatement("select CID,cname from course where DID=?");
		temp.setInt(1, 4);
		rs = temp.executeQuery();
		while(rs.next()){
			mmeNav.add(new Navigation(rs.getInt(1),rs.getString(2),null));
		}
		for(Navigation n : mmeNav){
			temp = conn.prepareStatement("select TID,tname from topic where CID=?;");
			temp.setInt(1, n.getCourseID());
			rs = temp.executeQuery();
			ArrayList<Pair> topics = new ArrayList<Pair>();
			while(rs.next()){
				topics.add(new Pair(rs.getInt(1),rs.getString(2)));
			}
			n.setTopics(topics);
		}
	}catch(Exception e){
		System.out.println("fix Navigation!!");
	}
	
	session.setAttribute("cseNav", cseNav);
	session.setAttribute("cceNav", cceNav);
	session.setAttribute("eceNav", eceNav);
	session.setAttribute("mmeNav", mmeNav);
	
	try{
			courseList = new ArrayList<Pair>();
			trendingList = new ArrayList<Trending>();
	       //	dep = request.getParameter("dep");  
	        
	        System.out.println("dep = "+" "+dep);
	        conn = DB.getConnect();
	        /*trending  */
	        
	        temp=conn.prepareStatement("Select TID,LID,lname from lobject order by rating desc LIMIT 5;");
	        rs = temp.executeQuery();
	        while(rs.next())
	        {
	        	trendingList.add(new Trending(rs.getInt(1),rs.getInt(2),rs.getString(3)));
	        }
	        
	        /* courses retriving */
	        temp = conn.prepareStatement("Select DID from department where branch=?");
	        temp.setString(1,dep);
			rs = temp.executeQuery();
	        DID=0;
        	while(rs.next())
        	{
        		DID = rs.getInt(1);
        	}
	        PreparedStatement pst = conn.prepareStatement("Select CID,cname from course where DID=?");
	        pst.setInt(1, DID);
	        rs = pst.executeQuery();
	        while(rs.next())           
	        {
	        	//out.println((++i)+" "+str+"<br>");
	        	courseList.add(new Pair(rs.getInt(1),rs.getString(2)));
	        }
	        session.setAttribute("DID", DID);	        
		}
	   catch(Exception e){       
	       out.println("Something went wrong !! Please try again"); 
	   }
	   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script>
		Request.querystring["dep"];
	</script>
    <style>
      #b{
        
            border:1px solid;
            background: blue;
            color: aliceblue;
        }
        #navi{
        	background: #F0F8FF;
        }
        #topic{
        	background:#F0F8FF;
        }
        #txt{
        	background: #F0F8FF;
        	font-size: 150%;
        	color : skyblue;
        }
        
        #topics{
        	
        	font-size: 200%;
        	color:black;
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
							
							<li class="menu__item"><a href="medicalhistory.html" class="menu__link">Ask Question to Faculty</a></li> 
							<li class="menu__item"><a href="mydetails.html" class="menu__link">Contribute</a></li> 
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
        <div class="col-xs-12 col-sm-6 ">
        	<div><strong><h1>Courses</h1></strong></div>
        	 <p style="padding:20px;"></p>
        	 	<div class="table-responsive">
           		<table id="topics" class="table table-striped table-hover">
           		<% for(Pair p:courseList) {       
                            		%>
           			<tr><td><a href="topic.jsp?courseID=<%=p.getNum()%>&course=<%=p.getStr() %>"><%=p.getStr()%></a> </td></tr>
           			
				<%} %>
           		</table>
           		</div>
          

           		
        </div>
        <div class="col-xs-12 col-sm-3 ">
          
           <p style="padding:8px;"></p>
           <div class="table-responsive">
           <form method = "post" action="discussion.jsp">
           	<table class="table table-striped table-hover">
           		 <tr><td><span id="txt">Trending</span></td></tr>
           		<tr><td><a href="discussion.jsp?TID=<%=trendingList.get(0).getTID()%>&LID=<%=trendingList.get(0).getLID()%>">&nbsp;<%=trendingList.get(0).getLname()%></a></td></tr>
           		<tr><td><a href="discussion.jsp?TID=<%=trendingList.get(1).getTID()%>&LID=<%=trendingList.get(1).getLID()%>">&nbsp;<%=trendingList.get(1).getLname()%></a></td></tr>
           		<tr><td><a href="discussion.jsp?TID=<%=trendingList.get(2).getTID()%>&LID=<%=trendingList.get(2).getLID()%>">&nbsp;<%=trendingList.get(2).getLname()%></a></td></tr>
           		<tr><td><a href="discussion.jsp?TID=<%=trendingList.get(3).getTID()%>&LID=<%=trendingList.get(3).getLID()%>">&nbsp;<%=trendingList.get(3).getLname()%></a></td></tr>
           		<tr><td><a href="discussion.jsp?TID=<%=trendingList.get(4).getTID()%>&LID=<%=trendingList.get(4).getLID()%>">&nbsp;<%=trendingList.get(4).getLname()%></a></td></tr>
           </table>
          </form>
        </div>
    </div>
    </div></div>
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
	
</body>
</html>