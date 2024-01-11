package web;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bouncycastle.asn1.ocsp.Request;

import bean.DataService;

/**
 * Servlet implementation class Batch_edit_delete
 */
@WebServlet("/Batch_edit_delete")
public class Batch_edit_delete extends HttpServlet {
	private static final long serialVersionUID = 
			1L;
	 DataService con;
	   PreparedStatement pst;
	   Connection c;
	  public ResultSet rs;
	  String status;
	  String batch_id;
  
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
           

            // Establish a database connection (replace with your own database URL, username, and password)
            String jdbcUrl = "jdbc:mysql://localhost:3306/candicodb";
            String dbUsername = "root";
            String dbPassword = "admin@123456789";
            Class.forName("com.mysql.jdbc.Driver");
            c = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);
            
            String batch_no = request.getParameter("batch_no");
            // Prepare a parameterized DELETE statement
            String deleteSql = "DELETE FROM batch_generation WHERE batch_no= '"+batch_no+"'";
            pst = c.prepareStatement(deleteSql);
           

            // Execute the DELETE statement
            int rowsAffected = pst.executeUpdate();

            if (rowsAffected > 0) {
            	// After successful deletion
            	// After successful deletion
            	
            	 

                
            	// Forward the request back to the JSP page
            	request.getRequestDispatcher("/view_all_batch.jsp").forward(request, response);

            	

                System.out.println("Record with batch_no " + batch_no + " deleted successfully");
            } else {
                
                System.out.println("Record with batch_no " + batch_no + "data not found ");
            }
         // Clean up resources
            pst.close();
            c.close();
        } catch (Exception e) {
            System.out.println(e);
            // Handle any exceptions here
            response.getWriter().write("Error: " + e.getMessage());
        } 
	}

}
