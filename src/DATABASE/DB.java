package DATABASE;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB {
	static Connection con = null;
	public static Connection getConnect()
	{
		if(con==null){
			//Statement stmt=null;
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
	     		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/learning", "root", "root");
				System.out.println("Connected");			
			}catch(Exception e)
			{
				e.printStackTrace();
				System.out.println(e);
			}
		}
		return con;
	}
}
