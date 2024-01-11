package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

import bean.DataService;

/**
 * Servlet implementation class BILL_Edit
 */
@WebServlet("/BILL_Edit")
public class BILL_Edit extends HttpServlet {

	   Object CshortN,Cname,Cid,key,Vname,Vid,GstN,GstP;
	   Object Gid,Bid,document_date,posting_date,delevery_note,bill_of_lading,header_text,qty,LR_date,transport_name,way_bill_date,
	           way_bill_no,vehicle_no,challan_date,chalan_no,total_shiper;
	   Object total_container,bill_no,delevery_challan_no,LR_no,Bill_date,GRN_BY,Pid_sr;
	   Object total,fright,gst_per,gst_amt,gst_code,tcs_tax,Bill_amt,local_freight,other_expences,state;
	   Object invoice_no,invoice_date,category,bill_amt;
	   String obj,objA,inv_Fno,status,sr;
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
	        try {
	            
	            System.out.println(" i am in BILL_Edit");
	            PrintWriter out = response.getWriter();
	        
	             response.setContentType("text/html;charset=UTF-8");
	            System.out.println("BILL_Edit-------->");
	            
	         status =request.getParameter("status");
	         System.out.println("status-------->" +status);
	         
	         sr=request.getParameter("sr");
	         System.out.println("sr-------->" +sr);
//	         Vname=request.getParameter("Vname");
//	         System.out.println("Vname-------->" +Vname); 
//	        
//	         Vid=request.getParameter("Vid");
//	         System.out.println("Vid-------->" +Vid); 
	         
//	         String taxs[]=request.getParameter("tax").toString().split("=>");
//	         GstN=taxs[0];
//	         System.out.println("vender-------->" +vender); 
//	        
//	         GstP=taxs[1];
//	         System.out.println("Vid-------->" +Vid); 
	        
//	         String com[]=request.getParameter("com").toString().split("=>");
//	         Cid=com[0];
//	         System.out.println("Cid-------->" +Cid); 
//	        
//	         Cname=com[1];
//	         System.out.println("Cname-------->" +Cname); 
//	         
//	         CshortN=com[2];
//	         System.out.println("CshortN-------->" +CshortN); 
	         
	         
//	         Gid=request.getParameter("Gid");
//	         System.out.println("Gid-------->" +Gid);
	         
	         Bid=request.getParameter("Bid");
	         System.out.println("Bid-------->" +Bid);
	         
	         System.out.println("Bill_date-------->" +request.getParameter("Bill_date"));
	         Bill_date=dateFormateChnge.dateFormateChnge(request.getParameter("Bill_date")==null?"":request.getParameter("Bill_date"));
	         System.out.println("Bill_date-------->" +Bill_date);
	         
	         
	         invoice_no=request.getParameter("invoice_no");
	         System.out.println("invoice_no-------->" +invoice_no);
	         
	         invoice_date=dateFormateChnge.dateFormateChnge(request.getParameter("invoice_date")==null?"":request.getParameter("invoice_date"));
	         System.out.println("invoice_date-------->" +invoice_date);
	         
	         category=request.getParameter("category");
	         System.out.println("category-------->" +category);
	         
	         total=request.getParameter("total");
	         System.out.println("total-------->" +total);
	         
	         fright=request.getParameter("fright");
	         System.out.println("fright-------->" +fright);
	         
	         other_expences=request.getParameter("other_expences");
	         System.out.println("other_expences-------->" +other_expences);
	         
	         bill_amt=request.getParameter("bill_amt");
	         System.out.println("bill_amt-------->" +bill_amt);
	         
	         gst_per=request.getParameter("gst_per");
	         System.out.println("gst_per-------->" +gst_per);
	         
	         gst_code=request.getParameter("gst_code");
	         System.out.println("gst_code-------->" +gst_code);
	         
	         gst_amt=request.getParameter("gst_amt");
	         System.out.println("gst_amt-------->" +gst_amt);
	        
//	         tcs_tax=request.getParameter("tcs_tax");
//	         System.out.println("tcs_tax-------->" +tcs_tax);
	         
//	         local_freight=request.getParameter("local_freight");
//	         System.out.println("local_freight-------->" +local_freight);
	         
//	         other_expences=request.getParameter("other_expences");
//	         System.out.println("other_expences-------->" +other_expences);
	         
	         state=request.getParameter("state");
	         System.out.println("state-------->" +state);
	         
	         obj=request.getParameter("obj");
	         System.out.println("objj-------->" +obj);
	                   
	          
	           Class.forName("com.mysql.jdbc.Driver");
	  c = DriverManager.getConnection("jdbc:mysql://localhost:3306/candicodb", "root", "admin@123456789");
	  System.out.println("Connecting with database"); 
	         
	  
	  
	  switch(status){
	        case "edit":
	                pst=c.prepareStatement("delete from BILL_DETAILS where Bid=?");
	                pst.setString(1,sr.toString());
	                int count= pst.executeUpdate();
	                if(count==0){
	                    System.out.println("not delete BILL_DETAILS");
	                }else{
	                 System.out.println("Delete succesfully BILL_DETAILS");
	                }
	                
	      pst=c.prepareStatement("update BILL set Bill_date=?,invoice_no=?,invoice_date=?,category=?,total=?,fright=?,other_expences=?,bill_amt=?,gst_per=?,gst_code=?,gst_amt=?,demand_QTY=?,issue_QTY=?,bal_QTY=? where sr=?");
	            pst.setObject(1,Bill_date);
	            pst.setObject(2,invoice_no);
	            pst.setObject(3,invoice_date);
	            pst.setObject(4,category);
	            pst.setObject(5,total);
	            pst.setObject(6,fright);
	            pst.setObject(7,other_expences);
	            pst.setObject(8,bill_amt);
	            
	            pst.setObject(9,gst_per);
	            pst.setObject(10,gst_code);
	            pst.setObject(11,gst_amt);
	            pst.setObject(12,"demand_QTY");
	            pst.setObject(13,"issue_QTY");
	            pst.setObject(14,"bal_QTY");
	            pst.setObject(15,sr);
	            
	            int y= pst.executeUpdate();
	            System.out.println("Connecting with database");
	            if(y>0){
	                
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
	                       
	                       Object Iid=obj2.get("Iid");
	                       Object Iname=obj2.get("Iname");
	                       Object unit=obj2.get("unit");
	                       Object HSN=obj2.get("HSN");
	                       Object recd_qty=obj2.get("recd_qty");
	                       Object shortage_qty=obj2.get("shortage_qty");
	                       Object amt=obj2.get("amt");
	                       Object Excess=obj2.get("Excess");
	                       
	               pst= c.prepareStatement("insert into BILL_DETAILS(Bid,Iid,Iname,unit,HSN,recd_qty,shortage_qty,amt,Excess) values(?,?,?,?,?,?,?,?,?)");              
	               pst.setObject(1,sr);
	               pst.setObject(2,Iid);
	               pst.setObject(3,Iname);
	               pst.setObject(4,unit); 
	               pst.setObject(5,HSN);
	               pst.setObject(6,recd_qty);
	               pst.setObject(7,shortage_qty);
	               pst.setObject(8,amt);
	               pst.setObject(9,Excess);
	               
	               int y1=pst.executeUpdate();
	               if(y1>0)
	               {
	                   System.out.println("Data inserted succcessfully BILL_DETAILS");
	               }
	               else
	               {
	                    System.out.println("Data not inserted BILL_DETAILS");
	               }
	             }  
	              break; 
	              
	            case "delete":    
	                System.out.println("dlete if");
	                pst=c.prepareStatement("delete from BILL where sr=?");
	                pst.setString(1,sr.toString());
	                int count1= pst.executeUpdate();
	                if(count1==0){
	                    System.out.println("not delete");
	                }else{
	                 System.out.println("Delete succesfully");
	                }
	                pst=c.prepareStatement("delete from BILL_DETAILS where Bid=?");
	                pst.setString(1,sr.toString());
	                int count2= pst.executeUpdate();
	                if(count2==0){
	                    System.out.println("not delete BILL_DETAILS");
	                }else{
	                 System.out.println("Delete succesfully BILL_DETAILS");
	                }
	            break;
	  }
	                   
	                   
	                  
	                   
	        } 
	        catch(Exception ex) 
	          {
	                  System.out.println(" Error -->" + ex);
	              
	          }
	    
	      }
	    }
