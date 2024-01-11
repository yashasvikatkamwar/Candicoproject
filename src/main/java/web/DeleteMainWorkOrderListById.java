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

import conn.ConnectionDao;

/**
 * Servlet implementation class DeleteMainWorkOrderListById
 */
@WebServlet("/DeleteMainWorkOrderListById")
public class DeleteMainWorkOrderListById extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMainWorkOrderListById() {
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
String id = request.getParameter("id");
		
		try {
            // Load the MySQL JDBC driver
            //Class.forName("com.mysql.jdbc.Driver");

            Connection con = ConnectionDao.getConnection();

            String sql = "DELETE FROM work_order_ms WHERE id=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, id);

            // Execute the statement
            int i = pst.executeUpdate();

            if (i > 0) {
                response.getWriter().write(""+id);
            } else {
                response.getWriter().write("Record Not Found :"+id);
            }

            // Clean up resources
            pst.close();
            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Error");
        }
	}

}
