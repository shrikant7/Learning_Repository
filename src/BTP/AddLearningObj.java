package BTP;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import DATABASE.*;
/**
 * Servlet implementation class AddLearningObj
 */
@WebServlet("/AddLearningObj")
public class AddLearningObj extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddLearningObj() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
	        HttpSession session = request.getSession();
			PrintWriter out = response.getWriter();
	        String name = request.getParameter("name");
	        String link = request.getParameter("link");
	        String description = request.getParameter("description");
	        int CID = Integer.valueOf(request.getParameter("CID"));/*(int)session.getAttribute("CID");*/
	        int TID = Integer.valueOf(request.getParameter("TID"));/*(int)session.getAttribute("TID");*/
	        System.out.println("in addlearning.java:"+CID+" "+TID+" "+name+" "+link+" "+description);
	        Connection conn = DB.getConnect();
	        PreparedStatement temp = conn.prepareStatement("select tname from topic where TID="+TID+";");
	        ResultSet rs = temp.executeQuery();
	        String topic="";
	        if(rs.next()){
	        	topic = rs.getString(1);
	        }
	        temp = conn.prepareStatement("insert into lobject(link,discription,CID,TID,lname) values(?,?,?,?,?)");
	        temp.setString(1,link);
	        temp.setString(2,description);
	        temp.setInt(3,CID);
	        temp.setInt(4,TID);
	        temp.setString(5,name);
			int x = temp.executeUpdate();
        	if(x>0)
        	{
        		System.out.println("addition Successfull!!");
        		session.setAttribute("TID", TID);
        		session.setAttribute("topic", topic);
     	        RequestDispatcher rd= request.getRequestDispatcher("lobject.jsp");
     	        rd.forward(request, response);
        	}else{
        		throw new Exception("error in addtion new learning object");
        	}
		}
	   catch(Exception e){       
	       System.out.println("Something went wrong in addLearningObj.java !! Please try again"); 
	   }
	}

}
