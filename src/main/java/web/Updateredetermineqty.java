package web;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Updateredetermineqty
 */

   
	@WebServlet("/Updateredetermineqty")
	public class Updateredetermineqty extends HttpServlet {
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String[] redetermineqty = request.getParameterValues("redetermineqty[]");
	        String[] cimsbatchno = request.getParameterValues("cimsbatchno[]");

	        // JDBC connection parameters
	        String jdbcUrl = "jdbc:mysql://localhost:3306/candicodb";
            String dbUser = "root";
            String dbPassword = "admin@123456789";

	        Connection connection = null;
	        PreparedStatement preparedStatement = null;

	        
	        System.out.println("ThIS IS SERVLET OF REDERTERMINE" );
	        
	        
	        try {
	            // Establish the database connection
	            connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

	            // SQL statement to update the database
	            String updateQuery = "UPDATE quality_control_department SET RELEASED_QTY =  RELEASED_QTY - ? WHERE CIMS_batch_no = ?";

	            // Prepare the statement
	            preparedStatement = connection.prepareStatement(updateQuery);

	            // Loop through cimsbatchno and redetermineqty arrays to perform updates
	            for (int i = 0; i < cimsbatchno.length; i++) {
	                String cimsbatchNo = cimsbatchno[i];
	                String qty = redetermineqty[i];

	                // Set parameters for the prepared statement
	                preparedStatement.setString(1, qty);
	                preparedStatement.setString(2, cimsbatchNo);

	                // Execute the update query
	                int rowsAffected = preparedStatement.executeUpdate();
	                // You can check rowsAffected for successful updates
	            }

	            // Send response to client
	            response.getWriter().write("Data updated successfully");
	        } catch (SQLException e) {
	            // Handle SQL exceptions
	            response.getWriter().write("SQL Error: " + e.getMessage());
	        } finally {
	            // Close PreparedStatement and Connection in the finally block to release resources
	            try {
	                if (preparedStatement != null) {
	                    preparedStatement.close();
	                }
	                if (connection != null) {
	                    connection.close();
	                }
	            } catch (SQLException e) {
	                // Handle SQL exceptions while closing connections
	                response.getWriter().write("Error closing resources: " + e.getMessage());
	            }
	        }
	    }

	}

