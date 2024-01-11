package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import bean.DataService;
import conn.ConnectionDao;

/**
 * Servlet implementation class getProduct_Code
 */
@WebServlet("/GetData")
public class Get_ProductCode_Dropdwon extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            String Cid = request.getParameter("Cid");
          //  System.out.println("cid="+Cid);
            // Perform any necessary validation on Cid here
            
            DataService ds = new DataService();
            ResultSet rs = ds.Batch_Dropdown_Company_List(Cid);
           
            JsonArray data_json = new JsonArray();

            while (rs.next()) {
				/*
				 * System.out.println("id: " + rs.getString("id")); // Debugging statement
				 * System.out.println("productCode: " + rs.getString("productCode")); //
				 * Debugging statement
				 */
                JsonObject json = new JsonObject();
               json.addProperty("productName", rs.getString("productName"));
                json.addProperty("proId", rs.getString("productCode"));
                data_json.add(json);}
               // System.out.println(" "+data_json);
            
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.add("Data", data_json);

            out.println(jsonResponse.toString());
        } catch (Exception ex) {
            ex.printStackTrace();
            // Handle exceptions or return an error response
            JsonObject errorResponse = new JsonObject();
            errorResponse.addProperty("error", "An error occurred.");
            out.println(errorResponse.toString());
        } finally {
            out.close();
        }
       
        

    }
    
    
}

	
	
