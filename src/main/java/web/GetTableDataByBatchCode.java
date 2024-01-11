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


@WebServlet("/GetTableDataByBatchCode")
public class GetTableDataByBatchCode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public GetTableDataByBatchCode() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    response.setContentType("application/json");
	    PrintWriter out = response.getWriter();

	    try {
	        String Bcode = request.getParameter("Bcode");
	        System.out.println(Bcode);

	        DataService ds = new DataService();

	        // Retrieve data from the first table
	        ResultSet rs1 = ds.getDataBybatchCode(Bcode);
	        JsonArray data_json1 = new JsonArray();

	        while (rs1.next()) {
	            JsonObject json = new JsonObject();
	           json.addProperty("one", rs1.getString("unit"));
	                json.addProperty("two", rs1.getString("iQuantity"));
	                json.addProperty("three", rs1.getString("CIMS_batch_no"));
	                json.addProperty("five", rs1.getString("Cid"));
		            json.addProperty("six", rs1.getString("expiry_date"));
		            json.addProperty("seven", rs1.getString("Cname"));
		            json.addProperty("eight", rs1.getString("REANALYSIS_DATE"));
		            json.addProperty("nine", rs1.getString("MFG_retest_date"));
	            data_json1.add(json);
	        }
	        System.out.println("data 1"+data_json1);									

	      
	        // Combine data from both tables into a single JSON response
	        JsonObject jsonResponse = new JsonObject();
	        jsonResponse.addProperty("Bcode", Bcode);
	        jsonResponse.add("Data", data_json1);
	     

	        out.println(jsonResponse.toString());
	    } catch (Exception ex) {
	        System.out.println("Ashwinshende" + ex);
	        JsonObject errorResponse = new JsonObject();
	        errorResponse.addProperty("error", "An error occurred.");
	        out.println(errorResponse.toString());
	    } finally {
	        out.close();
	    }
	}

}