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

import bean.DataService;

@WebServlet("/QCD_Edit")
public class QCD_Edit extends HttpServlet {

	   Object Gid,CshortN,Cname,Cid,key,Vname,Vid;
	   Object MFG_name,Iid,Iname,HSN,CIMS_batch_no,vender_batch_no,no_of_container,MFG_date,expiry_date,MFG_retest_date,received_QTY,document_date,AR_no,sample_QTY,sample_date,stock_type;
	   Object result,RELEASED_REJECTED_DATED,REANALYSIS_DATE,LOT_QTY,RELEASED_QTY,REJECTED_QTY;
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
	          PrintWriter out = response.getWriter();
	        try {
	            
	            System.out.println(" i am in QCD_Edit");
	            
	        
	             response.setContentType("text/html;charset=UTF-8");
	            System.out.println("QCD_Edit-------->");
	            
	            status=request.getParameter("status");
	         System.out.println("status-------->" +status);
	         
	         sr=request.getParameter("sr");
	         System.out.println("sr-------->" +sr);
//	         
	         
	         
	         
	           Class.forName("com.mysql.jdbc.Driver");
	  c = DriverManager.getConnection("jdbc:mysql://localhost:3306/candicodb", "root", "admin@123456789");
	  System.out.println("Connecting with database"); 
	    switch(status){
	        case "edit":
	        	
	        	sr=request.getParameter("sr");
		         System.out.println("sr-------->" +sr);
		         
	        	String Gids[]=request.getParameter("Gid").toString().split("=>");
//		         Gid=Gids[1];
//		         System.out.println("Gid-------->" +Gid); 
//		        
//		        
//		         String com[]=request.getParameter("select_company").toString().split("=>");
//		         Cid=com[0];
//		         System.out.println("Cid-------->" +Cid); 
//		        
//		         Cname=com[1];
//		         System.out.println("Cname-------->" +Cname); 
//		         
//		         CshortN=com[2];
//		         System.out.println("CshortN-------->" +CshortN); 
		         
		         stock_type=request.getParameter("stock_type");
		         System.out.println("stock_type-------->" +stock_type);
		         
//		         Vname=request.getParameter("Vname");
//		         System.out.println("Vname-------->" +Vname);
//		         
//		         Vid=request.getParameter("Vid");
//		         System.out.println("Vid-------->" +Vid);
		         
		         MFG_name=request.getParameter("MFG_name");
		         System.out.println("MFG_name-------->" +MFG_name);
		         
//		         Iid=request.getParameter("Iid");
//		         System.out.println("Iid-------->" +Iid);
//		         
//		         Iname=request.getParameter("Iname");
//		         System.out.println("Iname-------->" +Iname);
//		         
//		         HSN=request.getParameter("HSN");
//		         System.out.println("HSN-------->" +HSN);
		         
		         
		         CIMS_batch_no=request.getParameter("CIMS_batch_no");
		         System.out.println("CIMS_batch_no-------->" +CIMS_batch_no);
		                   
		         vender_batch_no=request.getParameter("vender_batch_no");
		         System.out.println("vender_batch_no-------->" +vender_batch_no);
		          
		        
		         no_of_container=request.getParameter("no_of_container");
		         System.out.println("no_of_container-------->" +no_of_container);
		         
		         MFG_date=dateFormateChnge.dateFormateChnge(request.getParameter("MFG_date"));
		         System.out.println("MFG_date-------->" +MFG_date);
		         
		         expiry_date=dateFormateChnge.dateFormateChnge(request.getParameter("expiry_date"));
		         System.out.println("expiry_date-------->" +expiry_date);
		         MFG_retest_date=dateFormateChnge.dateFormateChnge(request.getParameter("MFG_retest_date"));
		         System.out.println("MFG_retest_date-------->" +MFG_retest_date);
		         received_QTY=request.getParameter("received_QTY");
		         System.out.println("received_QTY-------->" +received_QTY);
		         document_date=dateFormateChnge.dateFormateChnge(request.getParameter("document_date"));
		         System.out.println("document_date-------->" +document_date);
		         AR_no=request.getParameter("AR_no");
		         System.out.println("AR_no-------->" +AR_no);
		         sample_QTY=request.getParameter("sample_QTY");
		         System.out.println("sample_QTY-------->" +sample_QTY);
		         sample_date=dateFormateChnge.dateFormateChnge(request.getParameter("sample_date"));
		         System.out.println("sample_date-------->" +sample_date);
		         
		         RELEASED_REJECTED_DATED=dateFormateChnge.dateFormateChnge(request.getParameter("RELEASED_REJECTED_DATED"));
		         System.out.println("RELEASED_REJECTED_DATED-------->" +RELEASED_REJECTED_DATED);
		         REANALYSIS_DATE=dateFormateChnge.dateFormateChnge(request.getParameter("REANALYSIS_DATE"));
		         System.out.println("REANALYSIS_DATE-------->" +REANALYSIS_DATE);
		         LOT_QTY=request.getParameter("LOT_QTY");
		         System.out.println("LOT_QTY-------->" +LOT_QTY);
		         RELEASED_QTY=request.getParameter("RELEASED_QTY");
		         System.out.println("RELEASED_QTY-------->" +RELEASED_QTY);
		         REJECTED_QTY=request.getParameter("REJECTED_QTY");
		         System.out.println("REJECTED_QTY-------->" +REJECTED_QTY);
		         
		         result=request.getParameter("result");
		         System.out.println("result-------->" +result);
	        	
	        	
	            pst=c.prepareStatement("update QUALITY_CONTROL_DEPARTMENT set MFG_name=?,CIMS_batch_no=?,vender_batch_no=?,no_of_container=?,MFG_date=?,expiry_date=?,MFG_retest_date=?,received_QTY=?,document_date=?,AR_no=?,sample_QTY=?,sample_date=?,stock_type=?,RELEASED_REJECTED_DATED=?,REANALYSIS_DATE=?,LOT_QTY=?,RELEASED_QTY=?,REJECTED_QTY=?,result=? where sr=?");
	            pst.setObject(1,MFG_name);
	            pst.setObject(2,CIMS_batch_no);
	            pst.setObject(3,vender_batch_no);
	            pst.setObject(4,no_of_container);
	            pst.setObject(5,MFG_date);
	            pst.setObject(6,expiry_date);
	            pst.setObject(7,MFG_retest_date);
	            pst.setObject(8,received_QTY);
	            pst.setObject(9,document_date);
	            pst.setObject(10,AR_no);
	            pst.setObject(11,sample_QTY);
	            pst.setObject(12,sample_date);
	            pst.setObject(13,stock_type);
	            pst.setObject(14,RELEASED_REJECTED_DATED);
	            pst.setObject(15,REANALYSIS_DATE);
	            pst.setObject(16,LOT_QTY);
	            pst.setObject(17,RELEASED_QTY);
	            pst.setObject(18,REJECTED_QTY);
	            pst.setObject(19,result);
	            pst.setObject(20,sr);
	            int y= pst.executeUpdate();
	            System.out.println("Connecting with database");
	            if(y>0){
	                System.out.println("Data Edit succcessfully");
	            }
	            else{
	                System.out.println("Data not Edit");
	            }
	            break;
	            
	            case "delete":    
	                System.out.println("dlete if");
	                pst=c.prepareStatement("delete from QUALITY_CONTROL_DEPARTMENT where sr=?");
	                pst.setString(1,sr.toString());
	                int count= pst.executeUpdate();
	                if(count==0){
	                    System.out.println("not delete");
	                }else{
	                 System.out.println("Delete succesfully");
	                }
	            break;
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
