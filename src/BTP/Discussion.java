package BTP;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DATABASE.DB;

/**
 * Servlet implementation class discussion
 */
@WebServlet("/Discussion")
public class Discussion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Discussion() {
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
		int rate=0;String comment=null;HttpSession session = request.getSession();PreparedStatement temp;

		try{
			PrintWriter out = response.getWriter();
			if(request.getParameter("comment")!=null && request.getParameter("comment").length()!=0)
				comment = request.getParameter("comment");
	        if(request.getParameter("rating")!=null)
	        		rate = Integer.valueOf(request.getParameter("rating"));
	        int LID = (int)session.getAttribute("LID");
	        int UID = (int)session.getAttribute("UID");
	        String name = (String)session.getAttribute("username");
	        System.out.println(name+" "+LID+" "+UID+" "+comment+" "+rate);
	        Connection conn = DB.getConnect();
	        if(comment!=null && comment.length()!=0){
	        	temp = conn.prepareStatement("insert into discussion(LID,UID,comment,name) values(?,?,?,?)");
		        temp.setInt(1,LID);
		        temp.setInt(2,UID);
		        temp.setString(3,comment);
		        temp.setString(4,name);
				int x = temp.executeUpdate();
	        	if(x>0)
	        	{
	        		System.out.println("Commment  Successfull!!");
	                request.setAttribute("LID", LID);
	        	}else{
	        		throw new Exception("error in comment");
	        	}
	        }
	        if(rate!=0){
	        	temp = conn.prepareStatement("select rating from review where LID=? and UID = ?;");
		        temp.setInt(1, LID);
		        temp.setInt(2, UID);
		        ResultSet rs = temp.executeQuery();
		        int beforeRating=0;
		        boolean isRated=false;
		        int rowcount=0;
		        if (rs.last()) {
				  rowcount = rs.getRow();
				  rs.beforeFirst(); 
				}
		        if(rowcount!=0){
		        	rs.next();
		        	beforeRating = rs.getInt(1);
		        	System.out.println(beforeRating);
		        	temp = conn.prepareStatement("update review set rating = ? where LID=? and UID = ?;");
			        temp.setInt(1, rate);
			        temp.setInt(2, LID);
			        temp.setInt(3, UID);
			        temp.executeUpdate();
			        isRated=true;
			    }else{
			    	System.out.println("inserting into review");
			    	temp = conn.prepareStatement("insert into review(UID,LID,rating) values(?,?,?)");
			    	temp.setInt(1, UID);
			        temp.setInt(2, LID);
			        temp.setInt(3, rate);
				    System.out.println("rating:");
			        temp.executeUpdate();
			    }
		        temp = conn.prepareStatement("select rating,ratingCount from lobject where LID=?;");
		        temp.setInt(1, LID);
		        rs = temp.executeQuery();
			    rs.next();
		        int rating = rs.getInt(1);
		        int ratingCount = rs.getInt(2);
		        System.out.println(rating+" "+ratingCount);
		        if(isRated){
		        	rating = ((rating*ratingCount)-beforeRating+rate)/ratingCount;
		        }else{
		        	rating = ((rating*ratingCount)+rate)/(++ratingCount);
		        }
		        temp = conn.prepareStatement("update lobject set rating=?,ratingCount=? where LID=?");
		        temp.setInt(1, rating);
		        temp.setInt(2, ratingCount);
		        temp.setInt(3, LID);
		        temp.executeUpdate();
		        System.out.println("rating  Successfull!!");
	            request.setAttribute("LID", LID);
	        }
	        RequestDispatcher rd= request.getRequestDispatcher("discussion.jsp");
 	        rd.forward(request, response);
		}
	   catch(Exception e){       
	       System.out.println("in discussion.java Something went wrong !! Please try again"); 
	   }
	}

}
