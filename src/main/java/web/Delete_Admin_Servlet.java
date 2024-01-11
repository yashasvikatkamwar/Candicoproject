package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Delete_Admin_Servlet")
public class Delete_Admin_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PreparedStatement pst = null, ps = null;
	Connection c;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("Im calling");
		String id = request.getParameter("id");
		System.out.println(id);
		try {
			pst = c.prepareStatement("delete from admin_user where id='"+id+"'");
			pst.setString(1, id);
			int count = pst.executeUpdate();
			if (count == 0) {
				System.out.println("not delete");
			} else {
				System.out.println("Delete succesfully");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
