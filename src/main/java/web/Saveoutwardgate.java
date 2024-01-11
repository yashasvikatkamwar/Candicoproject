package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import bean.DataService;

@WebServlet("/Saveoutwardgate")
public class Saveoutwardgate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 DataService con;
	   PreparedStatement pst;
	   Connection c;
   
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		int status = 0 ;
		try {
			
			System.out.println("This is servlet");
			
			String cid = request.getParameter("company_id");
			String ogpdate = request.getParameter("ogpdate");
			String OgpNo = request.getParameter("OgpNo");
			String modeOfTransport = request.getParameter("modeOfTransport");
			String Purpose = request.getParameter("Purpose");
			String Remark = request.getParameter("Remark");
			String suplierno = request.getParameter("suplierno");
			String Vehicleno = request.getParameter("Vehicleno");
			String obj = request.getParameter("obj");
			
			DataService ds = new DataService();
			 status = ds.saveogpdata(cid, ogpdate, OgpNo, modeOfTransport, Purpose, Remark, suplierno, Vehicleno);
			 

			  JSONParser JSON = new JSONParser(); 
			  Object obj1;
			  obj1 = JSON.parse(obj);
			  
			  JSONArray array = (JSONArray) obj1; 
			  
			  
			  for (int i = 0; i < array.size(); i++) {
				    JSONObject obj2 = (JSONObject) array.get(i);

				    Object itemId = obj2.get("itemId");
				    Object iName = obj2.get("iName");
				    Object itemQty = obj2.get("itemQty");
				    Object unit = obj2.get("unit");
				    Object CIMS_batch_no = obj2.get("CIMS_batch_no");
				    //Object OgpNo = obj2.get("OgpNo"); // Retrieving OgpNo from the JSON object

				    System.out.println("itemId: " + itemId);
				    System.out.println("iName: " + iName);
				    System.out.println("itemQty: " + itemQty);
				    System.out.println("unit: " + unit);
				    System.out.println("CIMS_batch_no: " + CIMS_batch_no);
				    System.out.println("OgpNo: " + OgpNo);

				    // Assuming ds is an instance of your data source
				    int st = ds.saveogpitem(itemId, iName, unit, CIMS_batch_no, itemQty, OgpNo);
				    int sta = ds.updateogpitem(CIMS_batch_no, itemQty);
				    // Perform operations using retrieved JSON values in your data source
				}

		}catch(Exception e){
			
		}
	}

}
