package conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionDao {
	
	public static Connection getConnection(){
		Connection con=null;
		try{
			Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
			//con = DriverManager.getConnection("jdbc:mysql://103.14.99.198:3306/CandicoDB", "root", "9QT2{gZvm[Gx~b");
			con = DriverManager.getConnection("jdbc:mysql://localhost/candicodb", "root", "admin@123456789");
			}catch(Exception e){System.out.println(e);}
		return con;
	}
	
	
	
}
