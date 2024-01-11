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

@WebServlet("/GRN_Edit")
public class GRN_Edit extends HttpServlet {

	   Object CshortN,Cname,Cid,key,vender,Vid,GstN,GstP;
	   Object Gid,Pid,document_date,posting_date,delevery_note,bill_of_lading,header_text,qty,LR_date,transport_name,way_bill_date,
	           way_bill_no,vehicle_no,challan_date,chalan_no,total_shiper;
	   Object total_container,bill_no,delevery_challan_no,LR_no,Bill_date,GRN_BY,Pid_sr,com_vise_GRN_no,sr;
	   Object total,freight,gst_per_freight,gst_amt_freight,tcs_tax,bill_amt,local_freight,other_expensess,state;
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
	        try {
	            
	            System.out.println(" i am in GRN_Edit");
	            PrintWriter out = response.getWriter();
	        
	             response.setContentType("text/html;charset=UTF-8");
	            System.out.println("GRN_Edit-------->");
	            
	         String venders[]=request.getParameter("vender").toString().split("=>");
	         vender=venders[1];
	         System.out.println("vender-------->" +vender); 
	        
	         Vid=venders[0];
	         System.out.println("Vid-------->" +Vid); 
	         
//	         String taxs[]=request.getParameter("tax").toString().split("=>");
//	         GstN=taxs[0];
//	         System.out.println("vender-------->" +vender); 
//	        
//	         GstP=taxs[1];
//	         System.out.println("Vid-------->" +Vid); 
	        
	         String com[]=request.getParameter("com").toString().split("=>");
	         Cid=com[0];
	         System.out.println("Cid-------->" +Cid); 
	        
	         Cname=com[1];
	         System.out.println("Cname-------->" +Cname); 
	         
	         CshortN=com[2];
	         System.out.println("CshortN-------->" +CshortN); 
	         
	         
	         Gid=request.getParameter("Gid");
	         System.out.println("Gid-------->" +Gid);
	         
	         Pid=request.getParameter("Pid");
	         System.out.println("Pid-------->" +Pid);
	         
	         document_date=dateFormateChnge.dateFormateChnge(request.getParameter("document_date"));
	         System.out.println("document_date-------->" +document_date);
	         
	         posting_date=dateFormateChnge.dateFormateChnge(request.getParameter("posting_date"));
	         System.out.println("posting_date-------->" +posting_date);
	         
	         delevery_challan_no=request.getParameter("delevery_challan_no");
	         System.out.println("delevery_challan_no-------->" +delevery_challan_no);
	         
	         bill_no=request.getParameter("bill_no");
	         System.out.println("bill_no-------->" +bill_no);
	         
	         Bill_date=dateFormateChnge.dateFormateChnge(request.getParameter("Bill_date"));
	         System.out.println("Bill_date-------->" +Bill_date);
	         
	         header_text=request.getParameter("header_text");
	         System.out.println("header_text-------->" +header_text);
	         
	         qty=request.getParameter("qty");
	         System.out.println("qty-------->" +qty);
	         
	         LR_no=request.getParameter("LR_no");
	         System.out.println("LR_no-------->" +LR_no);
	         
	         LR_date=dateFormateChnge.dateFormateChnge(request.getParameter("LR_date"));
	         System.out.println("LR_date-------->" +LR_date);
	         
	         transport_name=request.getParameter("transport_name");
	         System.out.println("transport_name-------->" +transport_name);
	         
	         way_bill_date=dateFormateChnge.dateFormateChnge(request.getParameter("way_bill_date"));
	         System.out.println("way_bill_date-------->" +way_bill_date);
	         
	         way_bill_no=request.getParameter("way_bill_no");
	         System.out.println("way_bill_no-------->" +way_bill_no);
	         
	         vehicle_no=request.getParameter("vehicle_no");
	         System.out.println("vehicle_no-------->" +vehicle_no);
	         
	         challan_date=dateFormateChnge.dateFormateChnge(request.getParameter("challan_date"));
	         System.out.println("challan_date-------->" +challan_date);
	         
	         chalan_no=request.getParameter("chalan_no");
	         System.out.println("chalan_no-------->" +chalan_no);
	         
	         total_container=request.getParameter("total_container");
	         System.out.println("total_container-------->" +total_container);
	         
	         GRN_BY=request.getParameter("GRN_BY");
	         System.out.println("GRN_BY-------->" +GRN_BY);
	                 
	         Pid_sr=request.getParameter("Pid_sr");
	         System.out.println("Pid_sr-------->" +Pid_sr);
	         
	         total=request.getParameter("total");
	         System.out.println("total-------->" +total);
	         
	         freight=request.getParameter("freight");
	         System.out.println("freight-------->" +freight);
	         
	         gst_per_freight=request.getParameter("gst_per_freight");
	         System.out.println("gst_per_freight-------->" +gst_per_freight);
	         
	         gst_amt_freight=request.getParameter("gst_amt_freight");
	         System.out.println("gst_amt_freight-------->" +gst_amt_freight);
	         
	         tcs_tax=request.getParameter("tcs_tax");
	         System.out.println("tcs_tax-------->" +tcs_tax);
	         
	         bill_amt=request.getParameter("bill_amt");
	         System.out.println("bill_amt-------->" +bill_amt);
	         
	         local_freight=request.getParameter("local_freight");
	         System.out.println("local_freight-------->" +local_freight);
	         
	         other_expensess=request.getParameter("other_expensess");
	         System.out.println("other_expensess-------->" +other_expensess);
	         
	         state=request.getParameter("state");
	         System.out.println("state-------->" +state);
	         
	         sr=request.getParameter("sr");
	         System.out.println("sr-------->" +sr);
	         
	         com_vise_GRN_no=request.getParameter("com_vise_GRN_no");
	         System.out.println("com_vise_GRN_no-------->" +com_vise_GRN_no);
	         
	         obj=request.getParameter("obj");
	         System.out.println("objj-------->" +obj);
	                   
	          
	           Class.forName("com.mysql.jdbc.Driver");
	  c = DriverManager.getConnection("jdbc:mysql://localhost:3306/candicodb", "root", "admin@123456789");
	  System.out.println("Connecting with database"); 
	         
	                pst=c.prepareStatement("delete from GRN where sr=?");
	                pst.setString(1,sr.toString());
	                int count= pst.executeUpdate();
	                if(count==0){
	                    System.out.println("not delete GRN");
	                }else{
	                 System.out.println("Delete succesfully GRN");
	                }
	                pst=c.prepareStatement("delete from GRN_items where Gid=?");
	                pst.setString(1,sr.toString());
	                int count1= pst.executeUpdate();
	                if(count1==0){
	                    System.out.println("not delete GRN_items");
	                }else{
	                 System.out.println("Delete succesfully GRN_items");
	                }
	  
	  
	  
	      pst=c.prepareStatement("insert into GRN(com_name,Com_id,CshortN,Pid,Vname,Vid,document_date,posting_date,bill_no,Bill_date,delevery_challan_no,header_text,qty,LR_no,LR_date,transport_name,way_bill_date,way_bill_no,vehicle_no,challan_date,chalan_no,total_container,GRN_BY,total,freight,gst_per_freight,gst_amt_freight,tcs_tax,bill_amt,local_freight,other_expensess,state,com_vise_GRN_no,sr,Gid) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
	            pst.setObject(1,Cname);
	            pst.setObject(2,Cid);
	            pst.setObject(3,CshortN);
	            pst.setObject(4,Pid);
	            pst.setObject(5,vender);
	            pst.setObject(6,Vid);
	            pst.setObject(7,document_date);
	            pst.setObject(8,posting_date);
	            pst.setObject(9,bill_no);
	            pst.setObject(10,Bill_date);
	            pst.setObject(11,delevery_challan_no);
	            
	            pst.setObject(12,header_text);
	            pst.setObject(13,qty);
	            pst.setObject(14,LR_no);
	            pst.setObject(15,LR_date);
	            pst.setObject(16,transport_name);
	            pst.setObject(17,way_bill_date);
	            pst.setObject(18,way_bill_no);
	            pst.setObject(19,vehicle_no);
	            pst.setObject(20,challan_date);
	            pst.setObject(21,chalan_no);
	            pst.setObject(22,total_container);
	            pst.setObject(23,GRN_BY);
	            
	            pst.setObject(24,total);
	            pst.setObject(25,freight);
	            pst.setObject(26,gst_per_freight);
	            pst.setObject(27,gst_amt_freight);
	            pst.setObject(28,tcs_tax);
	            pst.setObject(29,bill_amt);
	            pst.setObject(30,local_freight);
	            pst.setObject(31,other_expensess);
	            pst.setObject(32,state);
	            pst.setObject(33,com_vise_GRN_no);
	            pst.setObject(34,sr);
	            pst.setObject(35,Gid);
	            
	            int y= pst.executeUpdate();
	            System.out.println("Connecting with database");
	            if(y>0){
//	                rs=pst.getGeneratedKeys();
//	                if(rs.next()){
//	                    key=rs.getObject(1);
//	                    System.out.println("key >>"+key);
//	                }
	                System.out.println("Data inserted succcessfully");

	            }
	            else{
	                System.out.println("Data not inserted");
	            }
	  
//	            generate invoice no code
//	            Calendar cal = Calendar.getInstance();
//	          int year = cal.get(Calendar.YEAR);
//	          System.out.println("year >>"+year);
//	          df.applyPattern("##000");
//	          String output = df.format(Integer.parseInt((String) Gid));
//	          inv_Fno= "PIL"+CshortN+output;
//	          System.out.println("incoice no final >>"+inv_Fno);
//	          pst= c.prepareStatement("update GRN set Gid=? where sr=?");
//	          pst.setString(1, inv_Fno);
//	          pst.setObject(2, key);
//	          pst.executeUpdate();
	          
	          key=sr;
	  
	  
	  
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
	                       Object HSN=obj2.get("HSN");
	                       Object vender_metrial_no=obj2.get("vender_metrial_no");
	                       Object MPN_material=obj2.get("MPN_material");
	                       Object material_grup=obj2.get("material_grup");
	                       Object valuation_type=obj2.get("valuation_type");
	                       
	                       Object EAN_in_order_unit=obj2.get("EAN_in_order_unit");
	                       Object EAN_check=obj2.get("EAN_check");
	                       Object QTY_in_unit_of_Entry=obj2.get("QTY_in_unit_of_Entry");
	                       Object QTY_in_unit_of_Entry1=obj2.get("QTY_in_unit_of_Entry1");
	                       Object QTY_in_SKU=obj2.get("QTY_in_SKU");
	                       Object QTY_in_SKU1=obj2.get("QTY_in_SKU1");
	                       Object QTY_in_delivery_note=obj2.get("QTY_in_delivery_note");
	                       Object QTY_in_delivery_note1=obj2.get("QTY_in_delivery_note1");
	                       Object QTY_in_short=obj2.get("QTY_in_short");
	                       Object QTY_in_short1=obj2.get("QTY_in_short1");
	                       Object QTY_ordered=obj2.get("QTY_ordered");
	                       Object QTY_ordered1=obj2.get("QTY_ordered1");
	                       Object GR_QTY=obj2.get("GR_QTY");
	                       
	                       Object No_containers=obj2.get("No_containers");
	                       Object No_containers1=obj2.get("No_containers1");
	                       Object Movement_type=obj2.get("Movement_type");
	                       Object stock_type=obj2.get("stock_type");
	                       Object plant=obj2.get("plant");
	                       Object plant_id=obj2.get("plant_id");
	                       Object storage_location=obj2.get("storage_location");
	                       Object storage_location_id=obj2.get("storage_location_id");
	                       
	                       Object goods_recipient=obj2.get("goods_recipient");
	                       Object unloading_point=obj2.get("unloading_point");
	                       Object text=obj2.get("text");
	                       Object item_category=obj2.get("item_category");
	                       Object Del_Completed_Ind=obj2.get("Del_Completed_Ind");
	                       Object Requistioner=obj2.get("Requistioner");
	                       Object Cent_enclosed=obj2.get("Cent_enclosed");
	                       
	                       Object Manufacturer_id=obj2.get("Manufacturer_id");
	                       Object Manufacturer_name=obj2.get("Manufacturer_name");
	                       Object Manufacturer_adrs=obj2.get("Manufacturer_adrs");
	                       Object Batch=obj2.get("Batch")==""? 0 : obj2.get("Batch");
	                       Object vender_Batch=obj2.get("vender_Batch");
	                       Object Date_of_manufacture=obj2.get("Date_of_manufacture");
	                       Object SLED_BBD=obj2.get("SLED_BBD");
	                       
	                       Object rate=obj2.get("rate");
	                       Object basic_amt=obj2.get("basic_amt");
	                       Object gst_code=obj2.get("gst_code");
	                       Object gst_per=obj2.get("gst_per");
	                       Object gst_amt=obj2.get("gst_amt");
	                       Object total_amt=obj2.get("total_amt");
	                       
	                       Object retest_date=obj2.get("retest_date");
	                       
	               pst= c.prepareStatement("insert into GRN_items(Gid,Iid,Iname,HSN,vender_metrial_no,MPN_material,material_grup,valuation_type,EAN_in_order_unit,EAN_check,QTY_in_delivery_note,QTY_in_delivery_note1,QTY_in_unit_of_Entry,QTY_in_unit_of_Entry1,QTY_in_SKU,QTY_in_SKU1,QTY_in_short,QTY_in_short1,QTY_ordered,QTY_ordered1,GR_QTY,No_containers,No_containers1,Movement_type,stock_type,plant,plant_id,storage_location,storage_location_id,goods_recipient,unloading_point,text,item_category,Del_Completed_Ind,Requistioner,Cent_enclosed,Manufacturer_id,Manufacturer_name,Manufacturer_adrs,Batch,vender_Batch,Date_of_manufacture,SLED_BBD,rate,basic_amt,gst_code,gst_per,gst_amt,total_amt,retest_date) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");              
	               pst.setObject(1,key);
	               pst.setObject(2,Iid);
	               pst.setObject(3,Iname);
	               pst.setObject(4,HSN); 
	               pst.setObject(5,vender_metrial_no);
	               pst.setObject(6,MPN_material);
	               pst.setObject(7,material_grup);
	               pst.setObject(8,valuation_type);
	               pst.setObject(9,EAN_in_order_unit);
	               pst.setObject(10,EAN_check);
	               
	               pst.setObject(11,QTY_in_delivery_note);
	               pst.setObject(12,QTY_in_delivery_note1);
	               pst.setObject(13,QTY_in_unit_of_Entry);
	               pst.setObject(14,QTY_in_unit_of_Entry1); 
	               pst.setObject(15,QTY_in_SKU);
	               pst.setObject(16,QTY_in_SKU1);
	               pst.setObject(17,QTY_in_short);
	               pst.setObject(18,QTY_in_short1);
	               pst.setObject(19,QTY_ordered);
	               pst.setObject(20,QTY_ordered1);
	               
	               pst.setObject(21,GR_QTY);
	               pst.setObject(22,No_containers);
	               pst.setObject(23,No_containers1);
	               pst.setObject(24,Movement_type); 
	               pst.setObject(25,stock_type);
	               pst.setObject(26,plant);
	               pst.setObject(27,plant_id);
	               pst.setObject(28,storage_location);
	               pst.setObject(29,storage_location_id);
	               pst.setObject(30,goods_recipient);
	               
	               pst.setObject(31,unloading_point);
	               pst.setObject(32,text);
	               pst.setObject(33,item_category);
	               pst.setObject(34,Del_Completed_Ind); 
	               pst.setObject(35,Requistioner);
	               pst.setObject(36,Cent_enclosed);
	               
	               pst.setObject(37,Manufacturer_id);
	               pst.setObject(38,Manufacturer_name);
	               pst.setObject(39,Manufacturer_adrs);
	               pst.setObject(40,Batch);
	               pst.setObject(41,vender_Batch);
	               pst.setObject(42,Date_of_manufacture);
	               pst.setObject(43,SLED_BBD);
	               
	               pst.setObject(44,rate);
	               pst.setObject(45,basic_amt);
	               pst.setObject(46,gst_code);
	               pst.setObject(47,gst_per);
	               pst.setObject(48,gst_amt);
	               pst.setObject(49,total_amt);
	               
	               pst.setObject(50,retest_date);
	               int y1=pst.executeUpdate();
	               if(y1>0)
	               {
	                   System.out.println("Data inserted succcessfully GRN_items");
	               }
	               else
	               {
	                    System.out.println("Data not inserted GRN_items");
	               }
	               
	          pst= c.prepareStatement("update Purches_order_items set rem_qty=rem_qty-?,received_qty=received_qty+? where Pid=? and Iid=?");
	          pst.setObject(1, QTY_in_unit_of_Entry);
	          pst.setObject(2, QTY_in_unit_of_Entry);
	          pst.setObject(3, Pid_sr);
	          pst.setObject(4, Iid);
	          int y2=pst.executeUpdate();
	          if(y2>0){
	                   System.out.println("Data update succcessfully Purches_order_items");
	          }else{
	                    System.out.println("Data not update Purches_order_items");
	               }
	  }
	                   
	                   
	                  
	                   
	        } 
	        catch(Exception ex) 
	          {
	                  System.out.println(" Error -->" + ex);
	              
	          }
	    
	      }
	    }

