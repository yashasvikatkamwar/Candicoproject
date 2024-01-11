
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
 * Servlet implementation class Getdatabyogpno
 */
@WebServlet("/getdatabyogpno")
public class Getdatabyogpno extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    response.setContentType("application/json");
	    PrintWriter out = response.getWriter();
	    System.out.println("THIS IS OGP SERVLET");

	    try {
	        String ogp = request.getParameter("ogpno");
	        System.out.println("OGP :" + ogp);

	        DataService ds = new DataService();
	        ResultSet rs = ds.getogpdata(ogp);
	        
            
	        JsonArray data_json = new JsonArray();

	        while (rs.next()) {
	            JsonObject json = new JsonObject();
	            json.addProperty("comn", rs.getString("cid"));
	            json.addProperty("OdeliveryDatee", rs.getString("ogpdate"));
	            json.addProperty("TrModee", rs.getString("modeOfTransport"));
	            json.addProperty("vehicleNoo", rs.getString("Vehicleno"));

	            data_json.add(json);
	            System.out.println("data_json" +data_json );
	        }

	        JsonObject jsonResponse = new JsonObject();
	        jsonResponse.add("Data", data_json);

	        out.println(jsonResponse.toString());

	    } catch (Exception e) {
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

