package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import bean.DataService;

@WebServlet("/Rate_analysis_master")
public class Rate_analysis_master extends HttpServlet {

	   Object item_category,ICID,item_name,IID,unit,std_qty,description,material_total_amt,labour_total_amt,machinery_total_amt,OH_mat,OH_mat_per,OH_lab,OH_lab_per,
	OH_mach,OH_mach_per,overAll_OH,overAll_OH_per,profit_name,profit_per,profit_amt,TOTAL_OH,TOTAL_AMT,TOTAL_RATE;
	   Object key;
	   DataService con;
	    PreparedStatement pst,pst2,pst3;
	    Connection c;
	     String obj;
	      NumberFormat nf = NumberFormat.getNumberInstance(Locale.ENGLISH);
	        DecimalFormat df = (DecimalFormat)nf;
	   
	    String msg_ord ;
	    String bill_tot,txt_tot;
	       public ResultSet rs;
	    @Override
	    public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException 
	      {
	           try {
	               JsonArray data_json=new JsonArray();
	               JsonObject json_response=new JsonObject();
	               
	                   
	                   
	                   response.setContentType("text/html;charset=UTF-8");
	                   System.out.println("name-------->");
	                   
	                   obj=request.getParameter("obj");
	                   System.out.println("objj-------->" +obj);
	                   
	                   item_category=request.getParameter("item_category");
	                   System.out.println("item_category-------->" +item_category);
	                   
	                   ICID=request.getParameter("ICID");
	                   System.out.println("ICID-------->" +ICID);
	                   
	                   item_name= request.getParameter("item_name");
	                   System.out.println("item_name-------->" +item_name);
	                   
	                   IID= request.getParameter("IID");
	                   System.out.println("IID-------->" +IID);
	                   
	                   unit= request.getParameter("unit");
	                   System.out.println("unit-------->" +unit);
	                   
	                   std_qty= request.getParameter("std_qty");
	                   System.out.println("std_qty-------->" +std_qty);
	                   
	                   description= request.getParameter("description");
	                   System.out.println("description-------->" +description);
	                   
	                   material_total_amt= request.getParameter("material_total_amt");
	                   System.out.println("material_total_amt-------->" +material_total_amt);
	                   
	                   labour_total_amt= request.getParameter("labour_total_amt");
	                   System.out.println("labour_total_amt-------->" +labour_total_amt);
	                   
	                   machinery_total_amt= request.getParameter("machinery_total_amt");
	                   System.out.println("machinery_total_amt-------->" +machinery_total_amt);
	                   
	                   OH_mat= request.getParameter("OH_mat");
	                   System.out.println("OH_mat-------->" +OH_mat);
	                   
	                   OH_mat_per= request.getParameter("OH_mat_per");
	                   System.out.println("OH_mat_per-------->" +OH_mat_per);
	                   
	                   OH_lab= request.getParameter("OH_lab");
	                   System.out.println("OH_lab-------->" +OH_lab);
	                   
	                   OH_lab_per= request.getParameter("OH_lab_per");
	                   System.out.println("OH_lab_per -------->" +OH_lab_per);
	                   
	                   OH_mach= request.getParameter("OH_mach");
	                   System.out.println("OH_mach-------->" +OH_mach);
	                   
	                   OH_mach_per= request.getParameter("OH_mach_per");
	                   System.out.println("OH_mach_per-------->" +OH_mach_per);
	                   
	                   overAll_OH= request.getParameter("overAll_OH");
	                   System.out.println("overAll_OH-------->" +overAll_OH);
	                   
	                   overAll_OH_per= request.getParameter("overAll_OH_per");
	                   System.out.println("overAll_OH_per-------->" +overAll_OH_per);
	                   
	                   profit_name= request.getParameter("profit_name");
	                   System.out.println("profit_name-------->" +profit_name);
	                   
	                   profit_per= request.getParameter("profit_per");
	                   System.out.println("profit_per-------->" +profit_per);
	                   
	                   profit_amt= request.getParameter("profit_amt");
	                   System.out.println("profit_amt-------->" +profit_amt);
	                   
	                   TOTAL_OH= request.getParameter("TOTAL_OH");
	                   System.out.println("TOTAL_OH-------->" +TOTAL_OH);
	                   
	                   TOTAL_AMT= request.getParameter("TOTAL_AMT");
	                   System.out.println("TOTAL_AMT-------->" +TOTAL_AMT);
	                   
	                   TOTAL_RATE= request.getParameter("TOTAL_RATE");
	                   System.out.println("TOTAL_RATE-------->" +TOTAL_RATE);
	                   
	             

	        Class.forName("com.mysql.jdbc.Driver");
	        c = DriverManager.getConnection("jdbc:mysql://localhost:3306/candicodb", "root", "admin@123456789");
	        System.out.println("Connecting with database");

	       
	        pst=c.prepareStatement("insert into  rate_analysis_master(item_category,ICID,item_name,IID,unit,std_qty,description,material_total_amt,labour_total_amt,machinery_total_amt,OH_mat,OH_mat_per,OH_lab,OH_lab_per,\n" +
	"OH_mach,OH_mach_per,overAll_OH,overAll_OH_per,profit_name,profit_per,profit_amt,TOTAL_OH,TOTAL_AMT,TOTAL_RATE) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
	        pst.setObject(1,item_category);
	        pst.setObject(2,ICID);
	        pst.setObject(3,item_name);
	        pst.setObject(4,IID);
	        pst.setObject(5,unit);
	        pst.setObject(6,std_qty);
	        pst.setObject(7,description);
	        pst.setObject(8,material_total_amt);
	        pst.setObject(9,labour_total_amt);
	        pst.setObject(10,machinery_total_amt);
	        pst.setObject(11,OH_mat);
	        pst.setObject(12,OH_mat_per);
	        pst.setObject(13,OH_lab);
	        pst.setObject(14,OH_lab_per);
	        pst.setObject(15,OH_mach);
	        pst.setObject(16,OH_mach_per);
	        pst.setObject(17,overAll_OH);
	        pst.setObject(18,overAll_OH_per);
	        pst.setObject(19,profit_name);
	        pst.setObject(20,profit_per);
	        pst.setObject(21,profit_amt);
	        pst.setObject(22,TOTAL_OH);
	        pst.setObject(23,TOTAL_AMT);
	        pst.setObject(24,TOTAL_RATE);
	        int y= pst.executeUpdate();
	        System.out.println("Connecting with database");
	        if(y>0){
	            rs=pst.getGeneratedKeys();
	            if(rs.next()){
	                key=rs.getObject(1);
	                System.out.println("key >>"+key);
	            }
	        //    key= no;
	            System.out.println("Data inserted succcessfully");

	        }
	        else{
	            System.out.println("Data not inserted");
	        }

	              JSONParser parser = new JSONParser();
	              Object obj1 = parser.parse(obj);
	                JSONArray array = (JSONArray)obj1;
	                System.out.println("array >"+array);
	               System.out.println("size >"+array.size());
	               
	                   for(int i=0; i < array.size(); i++) {
	                   System.out.println("i >"+i);
			   System.out.println(array.get(i));
	                   JSONObject obj2 = (JSONObject)array.get(i);
	                       System.out.println("obj2 >"+obj2);
	                       
	                       Object Did=obj2.get("id");
	                       Object Dname=obj2.get("name");
	                       Object Dunit=obj2.get("unit");
	                       Object Dqty=obj2.get("qty");
	                       Object Drate=obj2.get("rate");
	                       Object Damount=obj2.get("amount");
	                       Object typee=obj2.get("typee");
	                       
	                    pst2= c.prepareStatement("insert into rate_analysis_master_DETAILS(RA_ID,typee,id,name,unit,qty,rate,amount) values(?,?,?,?,?,?,?,?)");
	                    pst2.setObject(1,key);
	                    pst2.setObject(2,typee);
	                    pst2.setObject(3,Did);
	                    pst2.setObject(4,Dname);
	                    pst2.setObject(5,Dunit);
	                    pst2.setObject(6,Dqty);
	                    pst2.setObject(7,Drate);
	                    pst2.setObject(8,Damount);
	                    int y2=pst2.executeUpdate();
	                    System.out.println("Connecting with database");
	                    if(y2>0){
	                        System.out.println("fully rate_analysis_master_DETAILS inserted");
	                    }
	                    else{
	                        System.out.println("fully not rate_analysis_master_DETAILS inserted");
	                    }
	                    
	              }
	                   
	                 
	                
	               
	                   
	                   
	                   
	           
	      System.out.println("-------------------------------the end--------------------");
	       
	        response.setContentType("text/plain");
		response.getWriter().write((String) key);
	        


	           } catch (SQLException ex) {
	               System.out.println("ex >"+ex);
	           } 
	           catch (Exception ex) {
	           System.out.println("ex >"+ex);
	       }
	      finally {
	               try {
	                   c.close(); 
	                    pst.close();
	                    pst2.close();
	                   //out.close();
	               } catch (SQLException ex) {
	                 System.out.println(ex.toString());
	               }
	           }
	      }
	}
