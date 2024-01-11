package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Calendar;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import bean.DataService;

/**
 * Servlet implementation class Purches_Order_insert
 */
@WebServlet("/Purches_Order_insert")
public class Purches_Order_insert extends HttpServlet {

	   Object state,CPid,Pid,CshortN,Cname,Cid,key,vender,tax,tot,gst_amt,TCS_tax,Total_Freight,final_total,Total_Quantity,Vid,GstN,GstP,remark,Date;
	   String obj,objA,inv_Fno;
	   DataService con;
	   PreparedStatement pst;
	   Connection c;
	  public ResultSet rs;
	  
	  NumberFormat nf = NumberFormat.getNumberInstance(Locale.ENGLISH);
	        DecimalFormat df = (DecimalFormat)nf;
	        
	   public void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        response.setContentType("text/html;charset=UTF-8");
	          // System.out.println("name-------->");
	          PrintWriter out = response.getWriter();
	        try {
	            
	            System.out.println(" i am in Purches_Order_insert");
	            
	        
	             response.setContentType("text/html;charset=UTF-8");
	            System.out.println("Purches_Order_insert-------->");
	            
	         String venders[]=request.getParameter("vender").toString().split("=>");
	         vender=venders[1];
	         System.out.println("vender-------->" +vender); 
	        
	         Vid=venders[0];
	         System.out.println("Vid-------->" +Vid); 
	         
	         String taxs[]=request.getParameter("tax").toString().split("=>");
	         GstN=taxs[0];
	         System.out.println("vender-------->" +vender); 
	        
	         GstP=taxs[1];
	         System.out.println("Vid-------->" +Vid); 
	        
	         String com[]=request.getParameter("com").toString().split("=>");
	         Cid=com[0];
	         System.out.println("Cid-------->" +Cid); 
	        
	         Cname=com[1];
	         System.out.println("Cname-------->" +Cname); 
	         
	         CshortN=com[2];
	         System.out.println("CshortN-------->" +CshortN); 
	         
	         tot=request.getParameter("tot");
	         System.out.println("tot-------->" +tot);
	         
	         gst_amt=request.getParameter("gst_amt");
	         System.out.println("gst_amt-------->" +gst_amt);
	         
	         TCS_tax=request.getParameter("TCS_tax");
	         System.out.println("TCS_tax-------->" +TCS_tax);
	         
	         Total_Freight=request.getParameter("Total_Freight");
	         System.out.println("Total_Freight-------->" +Total_Freight);
	         
	         final_total=request.getParameter("final_total");
	         System.out.println("final_total-------->" +final_total);
	         
	         Total_Quantity=request.getParameter("Total_Quantity");
	         System.out.println("Total_Quantity-------->" +Total_Quantity);
	         
	         remark=request.getParameter("remark");
	         System.out.println("remark-------->" +remark);
	         
	         Date=dateFormateChnge.dateFormateChnge(request.getParameter("Date"));
	         System.out.println("Date-------->" +Date);
	         
	         obj=request.getParameter("obj");
	         System.out.println("objj-------->" +obj);
	                   
	         objA=request.getParameter("objA");
	         System.out.println("objA-------->" +objA);
	          
	         Pid=request.getParameter("Pid");
	         Pid= Pid==null ? 0:Pid;
	         System.out.println("Pid-------->" +Pid);
	         
	         CPid=Integer.parseInt(request.getParameter("CPid"));
	         System.out.println("CPid-------->" +CPid);
	         
	         state=request.getParameter("state");
	         System.out.println("state-------->" +state);
	         
	           Class.forName("com.mysql.jdbc.Driver");
	  c = DriverManager.getConnection("jdbc:mysql://localhost:3306/candicodb", "root", "admin@123456789");
	  System.out.println("Connecting with database"); 
	         
	  
	  
	  pst=c.prepareStatement("delete from Purches_order where sr=?");
	                pst.setString(1,Pid.toString());
	               int count= pst.executeUpdate();
	               if(count==0){
	                   System.out.println("not delete");
	               }else{
	                System.out.println("Delete succesfully");
	               }
	               
	        pst=c.prepareStatement("delete from Purches_order_items where Pid=?");
	                pst.setString(1,Pid.toString());
	               int count1= pst.executeUpdate();
	               if(count1==0){
	                   System.out.println(" Purches_order_items not delete");
	               }else{
	                System.out.println("Purches_order_items Delete succesfully");
	               }
	               
	         pst=c.prepareStatement("delete from Purches_order_shedule_date where Pid=?");
	                pst.setString(1,Pid.toString());
	               int count2= pst.executeUpdate();
	               if(count2==0){
	                   System.out.println( " Purches_order_shedule_datenot delete");
	               }else{
	                System.out.println(" Purches_order_shedule_date Delete succesfully");
	               }
	               
	               
	               
	  
	      pst=c.prepareStatement("insert into Purches_order(vid,Vname,gst_name,gst_per,qty,total_amt,packing_charg,gst_amt,final_total,remark,datee,Com_id,Com_name,tcs_amt,Com_short_name,com_vise_PO_no,state) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
	            pst.setObject(1,Vid);
	            pst.setObject(2,vender);
	            pst.setObject(3,GstN);
	            pst.setObject(4,GstP);
	            pst.setObject(5,Total_Quantity);
	            pst.setObject(6,tot);
	            pst.setObject(7,Total_Freight);
	            pst.setObject(8,gst_amt);
	            pst.setObject(9,final_total);
	            pst.setObject(10,remark);
	            pst.setObject(11,Date);
	            
	            pst.setObject(12,Cid);
	            pst.setObject(13,Cname);
	            pst.setObject(14,TCS_tax);
	            pst.setObject(15,CshortN);
	            pst.setObject(16,CPid);
	            pst.setObject(17,state);
	            int y= pst.executeUpdate();
	            System.out.println("Connecting with database");
	            if(y>0){
	                rs=pst.getGeneratedKeys();
	                if(rs.next()){
	                    key=rs.getObject(1);
	                    System.out.println("key >>"+key);
	                }
	                System.out.println("Data inserted succcessfully");

	            }
	            else{
	                System.out.println("Data not inserted");
	            }
	  
//	            generate invoice no code
	            Calendar cal = Calendar.getInstance();
	          int year = cal.get(Calendar.YEAR);
	          System.out.println("year >>"+year);
	          df.applyPattern("##000");
	          String output = df.format(CPid);
	          inv_Fno= "PO"+CshortN+year+output;
	          System.out.println("incoice no final >>"+inv_Fno);
	          pst= c.prepareStatement("update Purches_order set Pid=? where sr=?");
	          pst.setString(1, inv_Fno);
	          pst.setObject(2, key);
	          pst.executeUpdate();
	  
	  
	  
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
	                       
	                       Object item_name=obj2.get("item_name");
	                       Object qty=obj2.get("qty");
	                       Object unit=obj2.get("unit");
	                       Object rate=obj2.get("rate");
	                       Object amt=obj2.get("amt");
	                       Object Iid=obj2.get("Iid");
	                       Object hsn=obj2.get("hsn");
	                       
	pst= c.prepareStatement("insert into Purches_order_items(Pid,Iid,Item_name,qty,unit,rate,amt,HSN,rem_qty) values(?,?,?,?,?,?,?,?,?)");              
	               pst.setObject(1,key);
	               pst.setObject(2,Iid);
	               pst.setObject(3,item_name);
	               pst.setObject(4,qty); 
	               pst.setObject(5,unit);
	               pst.setObject(6,rate);
	               pst.setObject(7,amt);
	               pst.setObject(8,hsn);
	               pst.setObject(9,qty);
	               int y1=pst.executeUpdate();
	               if(y1>0)
	               {
	                   System.out.println("Data inserted succcessfully Purches_order_items");
	               }
	               else
	               {
	                    System.out.println("Data not inserted Purches_order_items");
	               }
	  }
	                   
	                   
	                   JSONParser parser2 = new JSONParser();
	              Object obj12 = parser2.parse(objA);
	                JSONArray array2 = (JSONArray)obj12;
	                System.out.println("array2 >"+array2);
	               System.out.println("size2 >"+array2.size());
	                   
	                   for(int i=0; i < array2.size(); i++) {
	                   System.out.println("i >"+i);
			   System.out.println(array2.get(i));
	                   JSONObject obj2 = (JSONObject)array2.get(i);
	                       System.out.println("obj2 >"+obj2);
	                       
	                       Object item_name=obj2.get("item_name");
	                       Object qty=obj2.get("qty");
	                       Object Adate=obj2.get("Adate");
	                       String AdateF=Adate.toString().split("-")[2]+"-"+Adate.toString().split("-")[1]+"-"+Adate.toString().split("-")[0];
	                       Object remarks=obj2.get("remarks");
	                       Object item_qty_total=obj2.get("item_qty_total");
//	                       Object amt=obj2.get("amt");
//	                       Object Iid=obj2.get("Iid");
	                       
	pst= c.prepareStatement("insert into Purches_order_shedule_date(Pid,Iid,item_name,qty,Arrival_date,remark,item_qty_total) values(?,?,?,?,?,?,?)");              
	               pst.setObject(1,key);
	               pst.setObject(2,"");
	               pst.setObject(3,item_name);
	               pst.setObject(4,qty); 
	               pst.setObject(5,AdateF);
	               pst.setObject(6,remarks);
	               pst.setObject(7,item_qty_total);
	               int y1=pst.executeUpdate();
	               if(y1>0)
	               {
	                   System.out.println("Data inserted succcessfully Purches_order_shedule_date");
	               }
	               else
	               {
	                    System.out.println("Data not inserted Purches_order_shedule_date");
	               }
	  }
	                   
	                   
	                     response.setContentType("text/plain");
	                    response.getWriter().write("Create Successfully >> "+inv_Fno);
	                   
	                   
	        } 
	        catch(Exception ex) 
	          {
	                  System.out.println(" Error -->" + ex);
	                    response.setContentType("text/plain");
	                    response.getWriter().write("Not Success >"+ex);
	                  
	              
	          }
	    
	      }
	    }
