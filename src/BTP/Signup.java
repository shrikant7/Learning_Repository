package BTP;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Collections;
import java.util.Comparator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DATABASE.DB;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("doGet method in signup and Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
	    String name = request.getParameter("name");
	    String email = request.getParameter("email");
		String pwd = request.getParameter("password");
		String rpwd = request.getParameter("rpassword");
	    String type = request.getParameter("type");
	    String roll = request.getParameter("roll");
	    String branch = request.getParameter("branch");
		try{
	     		Connection con = DB.getConnect();
	           // Statement stmt = con.createStatement();
	            System.out.println(name+" "+email+" "+pwd+" "+rpwd+" "+type+" "+roll+" "+branch+" "+pwd.equals(rpwd));
	            PreparedStatement ps = con.prepareStatement("Select UID from user where email=?;");
	            ps.setString(1, email);
	            ResultSet rs = ps.executeQuery();
	            int rowcount=0;
		        if (rs.last()) {
				  rowcount = rs.getRow();
				  rs.beforeFirst(); 
				}
	            System.out.println("rowCount"+rowcount);
	            if(rowcount!=0){
	            	out.println("<script type=\'text/javascript\'>");
		            out.println("alert('Same email exists!!!');");
	            	out.println("location='index.jsp';");
	            	out.println("</script>");
	            	return;
	            }if(!pwd.equals(rpwd)){
	            	System.out.println("i'm in matching password");
	            	out.println("<script type=\'text/javascript\'>");
		            out.println("alert('Passwords not matching!!!);");
	            	out.println("location='index.jsp';");
	            	out.println("</script>");
	            	return;
	            }else{
	            	String sql = "insert into user(name,email,password,type,roll,branch) " + "values(?,?,?,?,?,?)";
		            ps = con.prepareStatement(sql);
		            ps.setString(1, name);
		            ps.setString(2, email);
		            ps.setString(3, pwd);
		            ps.setString(4, type);
		            ps.setString(5, roll);
		            ps.setString(6, branch);
					int i= ps.executeUpdate();
					
		     		//int i = stmt.executeUpdate("insert into user(FName, LName, Pwd, DOB, EmailId, Address, City, State, Pin, Country, Contact) values ('" + fname + "','" + lname + "','" + pwd + "','" + dob + "','" + email + "','" + adr + "','" + city + "','" + state + "','" + pin + "','" + country + "','" + contact +"')";
		            //System.out.println(request.getAttribute("username"));
		            if (i > 0) {
		            	HttpSession session =request.getSession();
		                session.setAttribute("username", name);
		                session.setAttribute("type", type);
				        session.setAttribute("branch", branch);
		                PreparedStatement temp = con.prepareStatement("Select UID from user where name=?");
		    	        temp.setString(1,name);
		    	        rs=temp.executeQuery();
		    	        if(rs.next())
		    	        {
		    	        	session.setAttribute("UID", rs.getInt(1));
		    	        }
		    	        if(type.equals("s")){
				        	String site = new String("student.jsp");
					        response.setStatus(response.SC_MOVED_TEMPORARILY);
					        response.setHeader("Location", site); 
				        }else{
				        	String site = new String("professor.jsp");
					        response.setStatus(response.SC_MOVED_TEMPORARILY);
					        response.setHeader("Location", site); 
				        }
		                //out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
		                //response.sendRedirect("index.jsp");
		                
		            } else {
		            	out.println("registration unsucessfull!!!");
		                response.sendRedirect("index.jsp");
		            }
	            }
	        } catch(Exception exc1){
	            exc1.printStackTrace();
	            System.out.println("error");
	        }
		
		
	}

}
