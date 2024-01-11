package web;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import conn.ConnectionDao;

/**
 * Servlet implementation class ViewWorkOrder
 */
@WebServlet("/ViewWorkOrder")
public class ViewWorkOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewWorkOrder() {
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
String id = request.getParameter("id");
		
		try {
            // Load the MySQL JDBC driver
            //Class.forName("com.mysql.jdbc.Driver");

            Connection con = ConnectionDao.getConnection();

            String sql = "SELECT * FROM work_order_ms WHERE id=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, id);

            // Execute the statement
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
            	
               int c1 = rs.getInt("id");
            String c2 = rs.getString("c_name");
            String c3 = rs.getString("product_code");
            String c4 = rs.getString("batch_no");
            String c5 = rs.getString("proposed_work_date");
           // String c6 = rs.getString("header_mfg_desk");
            String c6 = rs.getString("department");
            String c7 = rs.getString("date_of_manufacture");
            
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("a1", c1);
            jsonObject.put("a2", c2);
            jsonObject.put("a3", c3);
            jsonObject.put("a4", c4);
            jsonObject.put("a5", c5);
            //jsonObject.put("a6", c6);
            jsonObject.put("a6", c6);
            jsonObject.put("a7", c7);
            	
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonObject.toString());
            	
                //response.getWriter().write(""+id);
			} 
			  else {
					  response.getWriter().write("0"); 
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
