package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.mysql.jdbc.PreparedStatement;

import bean.DataService;
import bean.newOprations;
@WebServlet("/CreateProductFormulaServlet")
public class CeateProductFormulaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        String task = request.getParameter("task");
		System.out.println("task>>>>" + task);
		switch (task) {
		case "createProduct": {

        int status = 0;
        try {
            String com = request.getParameter("com");
            String version2 = request.getParameter("version2");
            String productId = request.getParameter("productId");
            String date = request.getParameter("date");
            String batchNo = request.getParameter("batchNo");
            String batchKg = request.getParameter("batchKg");
            String productName = request.getParameter("productName");
            String obj = request.getParameter("obj");
            status = newOprations.createProduct(com, version2, productId, date, batchNo, batchKg, productName);

            JSONParser parser = new JSONParser();
            JSONArray array = (JSONArray) parser.parse(obj);

            for (int i = 0; i < array.size(); i++) {
                JSONObject obj2 = (JSONObject) array.get(i);
                Object iId = obj2.get("iId");
                Object qty = obj2.get("qty");
                Object unit = obj2.get("unit");
                Object iName=obj2.get("iName");
                

                int resultStatus = newOprations.createProductitems(iId,qty,unit,productId,iName);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Send JSON response
        JSONObject jsonResponse = new JSONObject();
        if (status > 0) {
            jsonResponse.put("message", "Data inserted successfully");
        } else {					
            jsonResponse.put("message", "Failed to insert data");
        }
        out.print(jsonResponse.toJSONString());
        out.flush();
        break;
		}
//details Created Product
		case "Details":
		{

			System.out.println("Edit In");
			
			try {
				
				String productId=request.getParameter("productId");
				System.out.println("Product Id In DataService==>"+productId);
				DataService dataService= new DataService();
				ResultSet rs=  dataService.getproductByID(productId);
				System.out.println("Product Data==@"+rs);
				JsonArray data_json = new JsonArray();

	            while (rs.next()) {
					
	                JsonObject json = new JsonObject();
	                json.addProperty("com", rs.getString("companyId"));
	                json.addProperty("version2", rs.getString("version"));
	                json.addProperty("productId",productId);
	                json.addProperty("date",rs.getString("date"));
	                json.addProperty("batchKg", rs.getString("batchSizeKg"));
	                json.addProperty("batchNo", rs.getString("batchSizeNo"));
					json.addProperty("item", rs.getString("itemId"));
					json.addProperty("productName", rs.getString("productName"));
					json.addProperty("unit", rs.getString("unit"));
					json.addProperty("iName",rs.getString("iName"));
					json.addProperty("qty",rs.getString("itemQty"));
					
					
					
					
					
	                data_json.add(json);
	                }
					 System.out.println(" jsons"+data_json); 
	                
	            
	            JsonObject jsonResponse = new JsonObject();
	            jsonResponse.add("dataprod", data_json);

	            out.println(jsonResponse.toString());
				System.out.println("EveryThing Ok");

			} catch (Exception e) {
				System.out.println("Edit>>>" + e);
				
				JsonObject errorResponse =new JsonObject();
				errorResponse.addProperty("error", "An Error Create in Edit Product");
				out.println(errorResponse.toString());
			}finally {
				out.close();
			}
		
			break;
		}
//Update Product
		case "updateCreateProduct":
		{
			System.out.println("Update In");
			int status=0;
			try {
				
				String com = request.getParameter("com");
	            String version2 = request.getParameter("version2");
	            String productId = request.getParameter("productId");
	            String date = request.getParameter("date");
	            String batchNo = request.getParameter("batchNo");
	            String batchKg = request.getParameter("batchKg");
	            String productName = request.getParameter("productName");
	            String obj = request.getParameter("obj");
	            
	            System.out.println("Data==>"+obj);
	            
	            status = newOprations.UpdatecreateProduct(com,version2,productId,date,batchNo,batchKg,productName,obj);

	            JSONParser parser = new JSONParser();
	            JSONArray array = (JSONArray) parser.parse(obj);

	            for (int i = 0; i < array.size(); i++) {
	                JSONObject obj2 = (JSONObject) array.get(i);
	                Object iId = obj2.get("iId");
	                Object qty = obj2.get("qty");
	                Object unit = obj2.get("unit");
	                Object iName=obj2.get("iName");
	                

	                int resultStatus = newOprations.UpdatecreateProductitems(iId,qty,unit,productId,iName);
				
	            }
			}catch(Exception ex)
			{
				System.out.println("UpdateCreateProduct>>"+ex);
			}
			// Send JSON response
	        JSONObject jsonResponse = new JSONObject();
	        if (status > 0) {
	            jsonResponse.put("message", "Data Update successfully");
	        } else {					
	            jsonResponse.put("message", "Failed to Update data");
	        }
	        out.print(jsonResponse.toJSONString());
	        out.flush();
			break;
		}

//Delete Created ProductId	
		case "delete":
		{

			System.out.println("Delete In");
			
			int status=0;

			try {
				String productId = request.getParameter("productId");
				 status = newOprations.deleteProduct(productId);
				if (status == 1) {
					System.out.println("Deletestatus>>>Success");
				} else {
					System.out.println("Deletestatus>>>Fail");
				}

			} catch (Exception e) {
				System.out.println("Delete>>>" + e);
			}
			// Send JSON response
	        JSONObject jsonResponse = new JSONObject();
	        if (status > 0) {
	            jsonResponse.put("message", "Data Deleted successfully");
	        } else {					
	            jsonResponse.put("message", "Failed to Deleted data");
	        }
	        out.print(jsonResponse.toJSONString());
	        out.flush();
			break;
		}
		
    }
		
    }
}
    
    

 