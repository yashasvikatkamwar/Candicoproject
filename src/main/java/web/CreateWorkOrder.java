package web;

import java.io.IOException;


import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import bean.newOprations;

/**
 * Servlet implementation class CreateWorkOrder
 */
@WebServlet("/CreateWorkOrder")
public class CreateWorkOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateWorkOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* doGet(request, response); */
		
		 response.setContentType("application/json");
	        PrintWriter out = response.getWriter();
	   	 System.out.println("this is servlet" );
		
	        
	        String com = request.getParameter("com");
	        String pwdate = request.getParameter("pwdate");
	        String batchcode = request.getParameter("batchcode");
	        String productCode = request.getParameter("productCode");
	        //String hmd = request.getParameter("hmd");
	        String department = request.getParameter("department");
	        String dom = request.getParameter("dom");
	        
	        //int i = newOprations.createWorkOrder(com, pwdate, batchcode, productCode, hmd, department, dom);
			
			  System.out.println("Ashwin==>"+com); 
			  System.out.println("Ashwin==>"+pwdate);
			  System.out.println("Ashwin==>"+batchcode);
			  System.out.println("Ashwin==>"+productCode);
			 
			/*
			 * if (i > 0) { out.println("Record inserted successfully"); } else {
			 * out.println("Error while inserting data"); }
			 */

	        
	        //JsonArray data_json = new JsonArray();
	        
	        int status = 0;
			
			  try {
			  
			  status = newOprations.createWorkOrder(com, pwdate, batchcode, productCode,  department, dom);
			  
			  if(status >0) {
					
					  JsonObject json = new JsonObject(); 
					  json.addProperty("ok","Record Inserted Successfuly..!"); 
					  //data_json.add(json); 
					// json.add("data",data_json);
					  out.println(json.toString());
					 
				  out.println("Record Inserted Successfuly..!");
				  		
				 } else {
					  out.println("Error while inserting data");
			  }
			  
				/*
				 * JsonObject jsonResponse = new JsonObject(); jsonResponse.add("deta",
				 * data_json);
				 */
			  
			  } catch (Exception e) {
				  e.printStackTrace(); 
			  }
			 
	        

	        // Send JSON respo
			/*
			 * JSONObject jsonResponse = new JSONObject(); if (status > 0) {
			 * jsonResponse.put("message", "Data inserted successfully"); } else {
			 * jsonResponse.put("message", "Failed to insert data"); }
			 * out.print(jsonResponse.toJSONString()); out.flush();
			 */
			 
		
		
	}

}
