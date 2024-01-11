package web;


import java.io.BufferedReader;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/TestingCreateWorkOrder")
public class TestingcreateWorkOrder  extends HttpServlet {
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the JSON data as a string
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
        BufferedReader reader = request.getReader();
        StringBuilder json = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            json.append(line);
        }

        // Now, the json variable contains the JSON data as a string
        String jsonString = json.toString();
        
        // Print the JSON string to verify
        //System.out.println(jsonString);

        // You can then parse the JSON string using a JSON library, like org.json.
        
        
        try {
        	
        	 //String batchcode = request.getParameter("batchcode");
            
        	
        	
            JSONObject jsonObject = new JSONObject(jsonString);
            JSONArray data = jsonObject.getJSONArray("data");
            JSONArray data2 = jsonObject.getJSONArray("data2");
            JSONArray data3 = jsonObject.getJSONArray("data3");
            JSONArray data4 = jsonObject.getJSONArray("data4");
            JSONArray data5 = jsonObject.getJSONArray("data5");
            JSONArray data6 = jsonObject.getJSONArray("data6");
            JSONArray data7 = jsonObject.getJSONArray("data7");
            JSONArray data8 = jsonObject.getJSONArray("data8");
            Object batchcodeValue = jsonObject.get("batchcode");
            
            
            
            
            
			/*
			 * if (batchcodeValue instanceof String) { // Handle it as a string String
			 * batchcode = (String) batchcodeValue; System.out.println("Batchcode: " +
			 * batchcode); } else { // Handle it as a JSON array JSONArray datas =
			 * jsonObject.getJSONArray("batchcode");
			 * System.out.println("Batchcode (as array): " + datas.toString()); }
			 */
            
            
            // Use the parsed data as needed
            System.out.println("data: " + data.toString());
            System.out.println("data2: " + data2.toString());
            System.out.println("data3: " + data3.toString());
            System.out.println("data4: " + data4.toString());
            System.out.println("data5: " + data5.toString());
            System.out.println("data6: " + data6.toString());
            System.out.println("data7: " + data7.toString());
            System.out.println("data8: " + data8.toString());
            
            System.out.println("batchcode: " + batchcodeValue);
            

            // Perform any other processing as required
            
            // Establish a database connection (adjust the connection details as needed)
            String jdbcUrl = "jdbc:mysql://localhost:3306/candicodb";
            String dbUser = "root";
            String dbPassword = "admin@123456789";

            try {
                // Load the MySQL JDBC driver
            	Class.forName("com.mysql.jdbc.Driver");

                try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
                    // Iterate over the data and insert it into the database
                    String insertSql = "INSERT INTO workorderitemsss (cimsbatchno, company_id, original, retermine, uomr, batchexp, nextinsp, ratestdt ,batch_no) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    try (PreparedStatement preparedStatement = connection.prepareStatement(insertSql)) {
                        for (int i = 0; i < data.length(); i++) {
                            String value1 = data3.getString(i);
                            String value2 = data2.getString(i);
                            String value3 = data.getString(i);
                            String value4 = data4.getString(i);
                            String value5 = data5.getString(i);
                            String value6 = data6.getString(i);
                            String value7 = data7.getString(i);
                            String value8 = data8.getString(i);
                           

                           
                            
                            
                            preparedStatement.setString(1, value1);
                            preparedStatement.setString(2, value2);
                            preparedStatement.setString(3, value3);
                            preparedStatement.setString(4, value4);
                            
                            preparedStatement.setString(5, value5);
                            preparedStatement.setString(6, value6);
                            preparedStatement.setString(7, value7);
                            preparedStatement.setString(8, value8);
                            if (batchcodeValue instanceof String) {
                                String batchcode = (String) batchcodeValue;
                                preparedStatement.setString(9, batchcode);
                            } else {
                                // Handle it as needed if it's an array
                                preparedStatement.setString(9, "ArrayValue");
                            }
                            preparedStatement.executeUpdate();
                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }


            // Send a response if needed
            response.setContentType("application/json");
            response.getWriter().write("{\"message\": \"Data received successfully\"}");
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}


