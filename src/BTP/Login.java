package BTP;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DATABASE.DB;
/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("came to doGet and Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		try{
	    	out.println("in login");
	        String email = request.getParameter("email");   
	        String password = request.getParameter("password");
	        System.out.println(email+" "+password);
	        Connection conn = DATABASE.DB.getConnect();
	        PreparedStatement pst = conn.prepareStatement("Select UID,name,type,branch from user where email=? and password=?");
	        pst.setString(1, email);
	        pst.setString(2, password);
	        ResultSet rs = pst.executeQuery();
	        String type;
	        if(rs.next())           
	        {
	        	System.out.println("Valid login credentials");
		        HttpSession session =request.getSession();
		        session.setAttribute("UID", rs.getInt(1));
		        session.setAttribute("username", rs.getString(2));
		        session.setAttribute("type", rs.getString(3));
		        session.setAttribute("branch", rs.getString(4));
		        System.out.println("UID:"+rs.getInt(1)+" username:"+rs.getString(2));
		        type = rs.getString(3);
		        if(type.equals("s")){
		        	String site = new String("student.jsp");
			        response.setStatus(response.SC_MOVED_TEMPORARILY);
			        response.setHeader("Location", site); 
		        }else{
		        	String site = new String("professor.jsp");
			        response.setStatus(response.SC_MOVED_TEMPORARILY);
			        response.setHeader("Location", site); 
		        }
	        }
	        else{
	           out.println("Invalid login credentials");
	           out.print("<h3><a href='index.jsp'>HOME</a></h3>");
	        }
	        
		}
	   catch(Exception e){       
	       out.println("Something went wrong !! Please try again"); 
	   }
	}

}
