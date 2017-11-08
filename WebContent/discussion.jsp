<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" import ="java.io.PrintWriter" import ="DATABASE.DB" import ="java.util.*" import ="UTIL.*"
 %>
<%! Connection conn;String course;ResultSet rs;PreparedStatement pst,temp;
	int LID,UID,rating=0;int TID=0;Lobject lobject = null;
	ArrayList<DiscussionStore> commentList;
	HttpSession session;ArrayList<Navigation> cseNav,cceNav,eceNav,mmeNav; 
	%> 
<%
	session = request.getSession();
	UID = (int)session.getAttribute("UID");
	System.out.print("UID:"+" "+UID);
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
			commentList = new ArrayList<DiscussionStore>();
			if(request.getParameter("LID")!=null){
				LID = Integer.valueOf(request.getParameter("LID"));
			}else if(request.getAttribute("LID")!=null){
				LID = (int)request.getAttribute("LID");
			}
	        session.setAttribute("LID", LID);
	        if(request.getParameter("TID")!=null){
	        	TID = Integer.valueOf(request.getParameter("TID"));
	       	}else if(session.getAttribute("TID")!=null){
	        	TID =(int)session.getAttribute("TID");
	        }
	        System.out.println("LID in discussion.jsp:"+LID+" TID:"+TID);
	        conn = DB.getConnect();
	        PreparedStatement pst = conn.prepareStatement("Select lname,link,discription,rating from lobject where LID=?");
	        pst.setInt(1, LID);
	        rs = pst.executeQuery();
	        if(rs.next())           
	        {
	        	//out.println((++i)+" "+str+"<br>");
	        	lobject = new Lobject(LID,rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4));
	        }
	        
	        PreparedStatement temp = conn.prepareStatement("select rating from review where LID=? and UID = ?;");
	        temp.setInt(1, LID);
	        temp.setInt(2, UID);
	        rs = temp.executeQuery();
	        int rowcount=0;
	        rating=0;
	        if (rs.last()) {
			  rowcount = rs.getRow();
			  rs.beforeFirst(); 
			}
	        if(rowcount!=0){
	        	rs.next();
	        	rating = rs.getInt(1);
		    }
	        pst = conn.prepareStatement("Select name,comment from discussion where LID=? order by pid desc");
	        pst.setInt(1, LID);
	        rs = pst.executeQuery();
	        
	        rowcount=0;
	        if (rs.last()) {
			  rowcount = rs.getRow();
			  rs.beforeFirst(); 
			}
	        if(rowcount==0){
	        	System.out.println("resultSet is NuLL!!");
		     }else{
			     while(rs.next())           
		        {
		        	//out.println((++i)+" "+str+"<br>");
		        	commentList.add(new DiscussionStore(rs.getString(1),rs.getString(2)));
		        }
		     }
		}
	   catch(Exception e){       
	       out.println("Something went wrong in discussion.jsp!! Please try again"); 
	   }
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <style>
     
        #navi{
        	background: #F0F8FF;
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
        <div class="col-xs-12 col-sm-9 ">
        	          
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body modal-spa">
              <div class="login-grids">

                  <div class="login-right">
                    <h3><%=lobject.getLname()%></h3>

                    <form action="./Discussion" method="post">
                      <div class="sign-in">
                        <div class="table-responsive">
                          <table class="table">
                          <thead>
			                    <tr>
			                        <th colspan="2">your rating:<%= rating %></th>
			                    </tr>
			                </thead>
					<tr>
                    <td id="topics">Comment :</td>

                  <td><textarea rows="4" name="comment" class="sign" ></textarea></td></tr>
                  <tr><td id="topics"><a href='<%=lobject.getLink() %>'><%=lobject.getLink() %></a></td>
                              <td><fieldset class="rating">
                    <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="Rocks!">5 stars</label>
                    <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="Pretty good">4 stars</label>
                    <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="Meh">3 stars</label>
                    <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="Kinda bad">2 stars</label>
                    <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="Sucks big time">1 star</label>
                  </fieldset></td></tr>
                   <tr><td><button>Submit</button></td>
                  </tr>
                   </table></div></div>
                             </form>
                    </div>

                      </div>
                        <div class="container">
                        <%for(DiscussionStore obj : commentList){%>
                           <div class="media">
                            <div class="media-left">
                                <img src="icon/patient.png" class="media-object" style="width:60px">
                            </div>
                          <div class="media-body">
                          <h4 class="media-heading"><%=obj.getName() %></h4>

                            <%=obj.getComment() %>
                        </div>
                        </div>
                    <%}%>
                  </div>



              </div>
            </div>
          </div>    

    </div>
       
	
</body>
</html>