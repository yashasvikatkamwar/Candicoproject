package web;


import java.io.IOException;



import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.JsonObject;

import bean.DataService;

/**
 * Servlet implementation class Save_batches
 */
@WebServlet("/saveBatches")
public class Save_batches extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 DataService con;
	   PreparedStatement pst;
	   Connection c;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		int status = 0;
		 try {
			 
		  String cid = request.getParameter("cid");
		 
		  String batchno =  request.getParameter("batchno");
		  System.out.println("batchno:" +batchno);
		  String productname =  request.getParameter("productname");
		  String version =  request.getParameter("version");
		  String date =  request.getParameter("Date");
		  String batchsizeinkg =  request.getParameter("batchsizeinkg");
		  String productcode =  request.getParameter("productcode");
		  String batchsizeinno =  request.getParameter("batchsizeinno");
		  String expdate = request.getParameter("expdate");
		 
		  String obj = request.getParameter("obj");
		 
		  
		 
		  

		  
		  DataService ds = new DataService();
		   status = ds.save_batches(cid,batchno,productname,version,date,expdate,batchsizeinkg,productcode,batchsizeinno);
		  
			
			  JSONParser JSON = new JSONParser(); 
			  Object obj1;
			  obj1 = JSON.parse(obj);
			  
			  JSONArray array = (JSONArray) obj1; //System.out.println("array >" + array);
			  //System.out.println("size >" + array.size());
			  
			  for (int i = 0; i < array.size(); i++) { //System.out.println("i >" + i);
			  //System.out.println(array.get(i)); 
		     JSONObject obj2 = (JSONObject)
			  array.get(i); //System.out.println("obj2 >" + obj2);
			  
			  Object itemId = obj2.get("itemId");
			 // System.out.println("itemid: "+itemId);
			  Object iName = obj2.get("iName"); 
			  Object itemQty = obj2.get("itemQty");
			  Object unit = obj2.get("unit");
			  
			  Object CIMS_batch_no = obj2.get("CIMS_batch_no");
			  
			  System.out.println("cims nooooooo"+CIMS_batch_no);
			  
			  int st = ds.Save_Batch_Items_ByBatchNo(productcode,batchno,itemId, iName,
					  itemQty, unit ,CIMS_batch_no);
			  
			  
			  
			  
			  }
			 
		 }catch (ClassNotFoundException | ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
		// Send JSON response
		     JsonObject jsonResponse = new JsonObject();
	        if (status > 0) {
	          //  jsonResponse.put("message", "Data Saved successfully");
	        	jsonResponse.addProperty("message", "Data Saved successfully");
	        } else {					
	            jsonResponse.addProperty("message", "Failed to save data");
	        }
	        
	        out.print(jsonResponse.toString());
	        out.flush();
		
	}

}