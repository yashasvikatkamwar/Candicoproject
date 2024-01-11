package web;

import static java.lang.System.out;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DataService;

@WebServlet("/Insert_Admin_Servlet")

public class Insert_Admin_Servlet extends HttpServlet {
	Object username, password, admin_name, roles;
	DataService con;
	PreparedStatement pst;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {

			response.setContentType("text/html;charset=UTF-8");
			System.out.println("name-------->");
			username = request.getParameter("username");
			System.out.println("username-------->" + username);

			password = request.getParameter("password");
			System.out.println("password-------->" + password);

			admin_name = request.getParameter("admin_name");
			System.out.println("admin_name-------->" + admin_name);

			roles = request.getParameter("roles");
			System.out.println("roles-------->" + roles);

			Class.forName("com.mysql.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/candicodb", "root", "admin@123456789");
			System.out.println("Connecting with database");
			pst = c.prepareStatement("insert into admin_user(username,password,name,roles) values(?,?,?,?)");
			pst.setObject(1, username);
			pst.setObject(2, password);
			pst.setObject(3, admin_name);
			pst.setObject(4, roles);
			int y = pst.executeUpdate();
			System.out.println("Y===========>" + y);

			if (y > 0) {
				System.out.println("Data inserted succcessfully");
			} else {
				System.out.println("Data not inserted");
			}
//		                    response.sendRedirect("/Shivdhan/login.jsp");
			c.close();
		} catch (SQLException ex) {
			// Logger.getLogger(InsertEmpMast.class.getName()).log(Level.SEVERE, null, ex);
		}

		catch (Exception ex) {
			System.out.println("Database.getConnection() Error -->" + ex);

		} finally {

			out.close();
		}
	}
}
