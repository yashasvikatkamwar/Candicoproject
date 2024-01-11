package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import bean.DataService;

/**
 * Servlet implementation class Getworkorderbybatchcode
 */
@WebServlet("/Getworkorderbybatchcode")
public class Getworkorderbybatchcode extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Getworkorderbybatchcode() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
        	
        	System.out.println("This is workorder........... ");
        	
        	
        	
            String Bcode = request.getParameter("Bcode");
            
            
            DataService ds = new DataService();
            ResultSet rs = ds.getworkorderBybatchCode(Bcode);
            
            
            JsonArray data_json = new JsonArray();

            while (rs.next()) {
				
                JsonObject json = new JsonObject();
                json.addProperty("proposedworkdate", rs.getString("proposed_work_date"));
                json.addProperty("dpt", rs.getString("department"));
               
                         
				/*
				 * json.addProperty("two", rs.getString("unit")); json.addProperty("three",
				 * rs.getString("iQuantity"));
				 */
				 
                	data_json.add(json);
                }
              
            
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.add("Data", data_json);

            out.println(jsonResponse.toString());
        } catch (Exception ex) {
            //ex.printStackTrace();
        	System.out.println("Ashwinshende2"+ex);
            // Handle exceptions or return an error response
            JsonObject errorResponse = new JsonObject();
            errorResponse.addProperty("error", "An error occurred.");
            out.println(errorResponse.toString());
        } finally {
            out.close();
        }
       
		
	}

}
