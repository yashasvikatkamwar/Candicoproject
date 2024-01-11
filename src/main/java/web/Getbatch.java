package web;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import bean.DataService;



/**
 * Servlet implementation class Getbatch
 */
@WebServlet("/Getbatch")
public class Getbatch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("get all batchs"); 
		  JsonArray data_json=new JsonArray();     //   Jsonarray  object===data_json

		  Statement st_loginId=null;
		  ResultSet rs=null;
		  int login_val=0;
		   
		 // Object compname;
		   JsonObject json_response=new JsonObject();//jsoobject==json_response
		//Ifsc_noESIC_nopf_no_abank_nameaccno
		   try
		   {
		      DataService sr=new DataService();
                
		      
		       String Cid=request.getParameter("Cid");
		       System.out.println("COMPANY NAME"+Cid);
		       String Fdate=request.getParameter("Fdate");
		       System.out.println("f date "+Fdate);
		       String Tdate=request.getParameter("Tdate");
		       System.out.println("T date "+Tdate);
		      
		      
		      rs=sr.view_All_Batchs(Cid, Fdate, Tdate);
		      //rs=sr.viewBatchs();
		      
		      System.out.println("RS"+rs);
		       
		      while(rs.next())
		       {
		           //rs2= s.executeQuery("select Unit_id,emp_id,First_name,Last_name,designation,Ifsc_no,ESIC_no,pf_no_a,bank_name,accno from security_recruityment where Unit_name='"+pr+"'");
		     
		     System.out.println("jkjkj "+rs.getObject(1));
		     System.out.println("jkjkj "+rs.getObject(2));
		   
		       login_val++;
		           JsonObject json=new JsonObject();
		           json.addProperty("value","login"+login_val);
//		           String h1=rs.getString(2).replace(" ","_");
		           String o=rs.getObject(3)+"/"+rs.getObject(4)+"/"+rs.getObject(5)+"/"+rs.getObject(2);
		           String f=rs.getString(6);
		           
		           json.addProperty("text",o);
		           json.addProperty("sr",f);
		           data_json.add(json);
		    
		       }
		       System.out.println(data_json);
		       json_response.add("aaData", data_json);
		       response.setContentType("application/Json");
		 
		       response.getWriter().write(json_response.toString());
		
		       System.out.println(json_response);
		   }

		catch(Exception ex2)
		   {   
		       
		       System.out.println("Exception occured during retrieval of Login_Id in ComboBox :"+ex2);
		       ex2.printStackTrace();
		   }
		}


}
