package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import bean.DataService;

/**
 * Servlet implementation class Getitembycode
 */
@WebServlet("/Getitembycode")
public class Getitembycode extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		 PrintWriter out = response.getWriter();
		 
		 try {
			 String Iid = request.getParameter("Iid");
               System.out.println(Iid);
	            DataService ds = new DataService();
	            ResultSet rs = ds.getitemBycode(Iid);
	            System.out.println(rs);
	            JsonArray data_json = new JsonArray();

	            while (rs.next()) {
					
	                JsonObject json = new JsonObject();
	                json.addProperty("item_name", rs.getString("item_name"));
	                json.addProperty("unit", rs.getString("unit"));
	                json.addProperty("CIMS_batch_no", rs.getString("CIMS_batch_no"));
	                json.addProperty("expiry_date", rs.getString("expiry_date"));
	                json.addProperty("RELEASED_QTY", rs.getString("RELEASED_QTY"));
	                
	                
					
					/*
					 * json.addProperty("itemId", rs.getString("itemId"));
					 * json.addProperty("itemQty", rs.getString("itemQty"));
					 * json.addProperty("unit", rs.getString("unit"));
					 * json.addProperty("iName",rs.getString("iName"));
					 */
					 
	                data_json.add(json);}
	            JsonObject jsonResponse = new JsonObject();
	            jsonResponse.add("Data", data_json);

	            out.println(jsonResponse.toString());
			 
		 }catch(Exception e) {
			 e.printStackTrace();
	            // Handle exceptions or return an error response
	            JsonObject errorResponse = new JsonObject();
	            errorResponse.addProperty("error", "An error occurred.");
	            out.println(errorResponse.toString());
	        } finally {
	            out.close();
	        }
		
	}

}
