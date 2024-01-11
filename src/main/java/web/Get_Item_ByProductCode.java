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
 * Servlet implementation class Get_Item_ByProductCode
 */
@WebServlet("/getItemByProductCode")
public class Get_Item_ByProductCode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 response.setContentType("application/json");
	        PrintWriter out = response.getWriter();

	        try {
	            String Pid = request.getParameter("Pid");
	          //  System.out.println("cid="+Cid);
	            // Perform any necessary validation on Cid here
	            
	            DataService ds = new DataService();
	            ResultSet rs = ds.Item_Details_ByProductCode(Pid);
	           
	            JsonArray data_json = new JsonArray();

                 while (rs.next()) {
					
	                JsonObject json = new JsonObject();
	               
	                  json.addProperty("itemId", rs.getString("itemId"));
					  json.addProperty("itemQty", rs.getString("itemQty"));
					  json.addProperty("unit",  rs.getString("unit"));
					  json.addProperty("iName",rs.getString("iName"));
					  json.addProperty("CIMS_batch_no",rs.getString("CIMS_batch_no"));
					  json.addProperty("expiry_date",rs.getString("expiry_date"));
					  json.addProperty("RELEASED_QTY",rs.getString("RELEASED_QTY"));
					  
					  
					  
					 
	                  data_json.add(json);}
	               // System.out.println(" "+data_json);
	            
	            JsonObject jsonResponse = new JsonObject();
	            jsonResponse.add("Data", data_json);
	            System.out.println("Data"+data_json);

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
