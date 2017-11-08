package BTP;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DATABASE.DB;
import UTIL.DiscussionStore;

/**
 * Servlet implementation class DiscussionPopup
 */
@WebServlet("/DiscussionPopup")
public class DiscussionPopup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiscussionPopup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = null;
		try{
			out = response.getWriter();
			ArrayList<DiscussionStore>commentList = new ArrayList<DiscussionStore>();
			int LID = 0,UID = 0,rating;HttpSession session = request.getSession();Connection conn=null;ResultSet rs;
			
			if(request.getParameter("LID")!=null){
				LID = Integer.valueOf(request.getParameter("LID"));
			}else if(request.getAttribute("LID")!=null){
				LID = (int)request.getAttribute("LID");
			}
	        UID = (int)session.getAttribute("UID");
	        System.out.println("LID in discussionPopup.java:"+LID+" "+UID);
	        session.setAttribute("LID", LID);
	        conn = DB.getConnect();
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
	        PreparedStatement pst = conn.prepareStatement("Select name,comment from discussion where LID=? order by pid desc");
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
	        request.setAttribute("rating", rating);
	        request.setAttribute("commentList", commentList);
	        RequestDispatcher rd= request.getRequestDispatcher("lobject.jsp");
 	        rd.forward(request, response);
		}
	   catch(Exception e){       
	       out.println("Something went wrong in discussionPopup.java!! Please try again"); 
	   }
	}

}
