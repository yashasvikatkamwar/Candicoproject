	package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection conn = null;
	Statement st = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	ResultSetMetaData rsmd = null;

	String username, password, compname;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("call");
		String Name = request.getParameter("Name");
		System.out.println("Name" + Name);
		username = request.getParameter("username");
		password = request.getParameter("password");
		System.out.println("username >>" + username);
		System.out.println("password >>" + password);
		// compname=request.getParameter("company_name");
		// System.out.println("get company name="+compname);
		System.out.println("call");
		response.setContentType("text/html;charset=UTF-8");
		
		try {
			PrintWriter out = response.getWriter();

			Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/candicodb?characterEncoding=UTF-8", "root", "admin@123456789");
			ps = conn.prepareStatement("Select username,password,roles from admin_user where username=? and password=?");
			ps.setString(1, username);
			ps.setString(2, password);
			
			System.out.println("jai ho22");

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				System.out.println("avilable in admin panal====>");
				HttpSession session_login = request.getSession();
				boolean st = session_login.isNew();
				System.out.println("session=========>" + st);
				session_login.setAttribute("session_name", st);
				session_login.setAttribute("uname", username);
				session_login.setAttribute("S_tyep", rs.getString(1));
				session_login.setAttribute("seller_id", rs.getString(3));
				session_login.setAttribute("seller_name", "Admin Panel");
				// session_login.setAttribute("cname",compname);
				// System.out.println(" set company name="+compname);

				if (!st) {
					System.out.println("session inside if=========>" + st);
					response.sendRedirect("index.jsp");
				} else {
					System.out.println("session inside else=========>" + st);
					response.sendRedirect("login.jsp");
				}
			} else {

				response.sendRedirect("login.jsp");

			}

			conn.close();

		} catch (SQLException ex) {
			Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
		} catch (ClassNotFoundException ex) {
			Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
		}

	}

}
