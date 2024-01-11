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
 * Servlet implementation class Getdeliveryitembyno
 */
@WebServlet("/Getdeliveryitembyno")
public class Getdeliveryitembyno extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		 PrintWriter out = response.getWriter();
		 
		 try {
			 
			 System.out.println("THIS IS DELIEVRYITENMfor print SERVLET");
			 
			 String delivery_challan_no = request.getParameter("delivery_challan_no");
               System.out.println(delivery_challan_no);
	            DataService ds = new DataService();
	            ResultSet rs = ds.delivery_itemlistbyno(delivery_challan_no);
	            System.out.println(rs);
	            JsonArray data_json = new JsonArray();

	            while (rs.next()) {
					
	                JsonObject json = new JsonObject();
	                
	                json.addProperty("itemId", rs.getString("itemId"));
	                json.addProperty("iName", rs.getString("iName"));
	                json.addProperty("HSN", rs.getString("HSN"));
	                json.addProperty("CIMS_batch_no", rs.getString("CIMS_batch_no"));
	                json.addProperty("itemQty", rs.getString("itemQty"));
	                json.addProperty("unit", rs.getString("unit"));
	                json.addProperty("price_per_unit", rs.getString("price_per_unit"));
	                json.addProperty("tax_value", rs.getString("tax_value"));
	                
	                
	                
					
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
			     System.out.println("DATA :"+data_json);
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
