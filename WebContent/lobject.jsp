<%@page import="org.omg.CORBA.LocalObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" import ="java.io.PrintWriter" import ="DATABASE.DB" import ="java.util.*" import ="UTIL.*"
 %>
<%! Connection conn;String topic,str;ResultSet rs;PreparedStatement pst,temp;
	int CID,TID,LID=0,rating=0;
	ArrayList<Lobject> objectList;ArrayList<Navigation> cseNav,cceNav,eceNav,mmeNav; 
	ArrayList<DiscussionStore> commentList=null;
	HttpSession session;
	%> 
<%
HttpServletResponse httpResponse = (HttpServletResponse)response;
httpResponse.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
response.addHeader("Cache-Control", "post-check=0, pre-check=0");
httpResponse.setHeader("Pragma","no-cache"); 
	session=request.getSession();
	cseNav = (ArrayList<Navigation>)session.getAttribute("cseNav");
	cceNav = (ArrayList<Navigation>)session.getAttribute("cceNav");
	eceNav = (ArrayList<Navigation>)session.getAttribute("eceNav");
	mmeNav = (ArrayList<Navigation>)session.getAttribute("mmeNav");
%>

<%
//String fname,lname,pass,dateofbirth,email,address,city,state,pin,country,contact;
//int uid;
//Date dob;
	try{
			
			objectList = new ArrayList<Lobject>();
			if(request.getParameter("TID")!=null){
		        TID =Integer.valueOf(request.getParameter("TID"));
		    }else{
		    	TID =(int)session.getAttribute("TID");
		    } 
		    
		    if(request.getParameter("topic")!=null){
		        topic = request.getParameter("topic");
		    }else{
		    	topic = (String)session.getAttribute("topic");
		   	}
		   	if(session.getAttribute("LID")!=null)
			   	LID = (int)session.getAttribute("LID");
	        System.out.println("TID:"+" "+TID+" topic:"+topic);
	        /* if(request.getAttribute("commentList")!=null){
	        	commentList = (ArrayList<DiscussionStore>)request.getAttribute("commentList");
	        	rating = (int)request.getAttribute("rating");
	        	System.out.println("values from discussioPopup:"+rating+" "+LID);
	        	request.setAttribute("commentList", null);
	        	request.setAttribute("rating", null);
	        	session.setAttribute("LID", null);
	        } */
	        conn = DB.getConnect();
	        PreparedStatement pst = conn.prepareStatement("Select LID,lname,link,discription,rating from lobject where TID=?");
	        pst.setInt(1, TID);
	        rs = pst.executeQuery();
	        while(rs.next())           
	        {
	        	//out.println((++i)+" "+str+"<br>");
	        	objectList.add(new Lobject(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5)));
	        }
	        session.setAttribute("TID", TID);
	        session.setAttribute("topic", topic);       
		}
	   catch(Exception e){       
	       out.println("Something went wrongin lobject !! Please try again"); 
	   }
	
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
       <style>
     
        #navi{
          background: #ffffff;
        }
       
         td {
      padding: 15px;
      text-align: left;
     
      color:black;
  }
  #topics{
          
          font-size: 120%;
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
              <li class="menu__item menu__item--current"><a href="lobject.jsp" class="menu__link">Home</a></li>
              <li class="menu__item"><a href="#" class="menu__link">Messages</a></li> 
            
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
			<p style="padding:10px;"></p>
        </div>
        <div class="col-xs-12 col-sm-9 ">
        	<div><strong><h1><%=topic %></h1></strong></div>
        	 <p style="padding:20px;"></p>
        	 	<form method="post" action="discussion.jsp">
      				<div class="table-responsive">
           				<table class="table table-hover">
           				<% for(Lobject p:objectList) {%>
    						 <tr id="topics">
    						 <td ><span style="font-family:monospace; font-size:150%;"><a href="<%=p.getLink() %>"target="_blank"><%=p.getLname() %></a></span><br/>
                                  <p><%=p.getDescription() %></p> 
                                  </td>
                                  <td style="text-align: right">Rating:<%=p.getRating() %>/5 &nbsp;&nbsp;
                                  	<button type="submit" class="btn btn-primary" value="<%=p.getLID() %>" name="LID"
                                  		 id="discussion" >&nbsp;Discuss&nbsp;</button>
                                  </td></td>
                    				<%} %>
                    		</tr>
           				</table>
           			</div>
           		</form>
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
					<p>© 2017 E-LNMIIT. All Rights Reserved | Design by <span style="font-family:cursive">Manish Jain </span> </p>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
</div>
</div>


       
	<div class="modal fade" id="myModal6" tabindex="-1"role="dialog">
        <div class="modal-dialog" role="document">
          <div class="modal-content modal-info">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>            
            </div>
            <div class="modal-body modal-spa">
              <div class="login-grids">
                  
                  <div class="login-right">
                    <h3>Learning Object</h3>

                    <form action="signin.html" >
                      <div class="sign-in">
                        <div class="table-responsive">
                          <table class="table">
                            <tr><td id="topics">Learning Object Title:</td>
                              <td><fieldset class="rating">
                    <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="Rocks!">5 stars</label>
                    <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="Pretty good">4 stars</label>
                    <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="Meh">3 stars</label>
                    <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="Kinda bad">2 stars</label>
                    <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="Sucks big time">1 star</label>
                  </fieldset></td></tr>
                    <tr>
                    <td id="topics">Comment :</td>
                  <td><textarea rows="4" name="descrip" class="sign" required="">   </textarea> <button type="button" onclick="fun()">Submit</button></td>
                  </tr>
                   </table>
                    </div>
                       
                      </div>                    
                           <div class="media">
                            <div class="media-left">
                                <img src="icon/patient.png" class="media-object" style="width:60px">
                            </div>
                          <div class="media-body">
                          <h4 class="media-heading">John Doe <small><i>Posted on February 19, 2016</i></small> </h4> 

                            asfnnjanslfn
                          </div>
                        
                        </div>
                         <div class="media">
                            <div class="media-left">
                                <img src="icon/patient.png" class="media-object" style="width:60px">
                            </div>
                          <div class="media-body">
                          <h4 class="media-heading">John Doe <small><i>Posted on February 19, 2016</i></small> </h4> 
                          
                            asfnnjanslfn
                          </div>
                        
                        </div>
                         <div class="media">
                            <div class="media-left">
                                <img src="icon/patient.png" class="media-object" style="width:60px">
                            </div>
                          <div class="media-body">
                          <h4 class="media-heading">John Doe <small><i>Posted on February 19, 2016</i></small> </h4> 
                          
                            asfnnjanslfn
                          </div>
                        
                        </div>
                         <div class="media">
                            <div class="media-left">
                                <img src="icon/patient.png" class="media-object" style="width:60px">
                            </div>
                          <div class="media-body">
                          <h4 class="media-heading">John Doe <small><i>Posted on February 19, 2016</i></small> </h4> 
                          
                            asfnnjanslfn
                          </div>
                        
                        </div>
                    </form>
                  </div>
                                 
                  
                
              </div>
            </div>
          </div>
        </div>
      </div>     
   
<!--footer ends here -->       

</body>
</html>