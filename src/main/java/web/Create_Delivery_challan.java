package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import bean.DataService;

@WebServlet("/Create_Delivery_Challan")
public class Create_Delivery_challan extends HttpServlet 
{
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException 
	{
		System.out.println("InCreateDeliveryChallan");
		response.setContentType("application/json");
		PrintWriter out=response.getWriter();
		int status =0;
		try {
			String cid=request.getParameter("cid");
        	String com = request.getParameter("com");
    	    String comaddress = request.getParameter("comaddress");
    		String statecode = request.getParameter("statecode");
    	    String statename = request.getParameter("statename");
    	    String uniqueid = request.getParameter("uniqueid");
    	    String trmode = request.getParameter("trmode");
    	    String dlno = request.getParameter("dlno");
    	    String dlstate = request.getParameter("dlstate");
    	    String dcno = request.getParameter("dcno");
    	    String dcdate = request.getParameter("dcdate");
    	    String odno = request.getParameter("odno");
    	    String oddate = request.getParameter("oddate");
    	    String lrno = request.getParameter("lrno");
    	    String lrdate = request.getParameter("lrdate");
    	    String ewaybillno = request.getParameter("ewaybillno");
    	    String ewaybilldate = request.getParameter("ewaybilldate");
    	    String vno = request.getParameter("vno");
    	    String trname = request.getParameter("trname");
    	    
    	    String total = request.getParameter("total"); 
    	    String igst = request.getParameter("igst");
    	    String cgst = request.getParameter("cgst");
    	    String sgst = request.getParameter("sgst");
    	    String compcess = request.getParameter("compcess");
    	    String roundoff = request.getParameter("roundoff");
    	    String totalamount = request.getParameter("totalamount");
    	    
    	    String obj = request.getParameter("obj");
            
            status = DataService.createDeliveryChallan(com, cid, comaddress, statecode, statename, uniqueid, trmode, dlno,
            		dlstate,dcno,dcdate,odno,oddate,lrno,lrdate,ewaybillno,ewaybilldate,vno,trname,total,igst,cgst,sgst,compcess,roundoff,totalamount);

            JSONParser parser=new JSONParser();
            JSONArray array=(JSONArray) parser.parse(obj);
            
            for(int i=0; i<array.size();i++)
            {
            	JSONObject obj2=(JSONObject) array.get(i);
            	Object itemId =obj2.get("itemId"); 
            	Object iName=obj2.get("iName"); 
				  Object hsncode = obj2.get("hsncode"); 
				  Object batchno = obj2.get("batchno"); 
				  Object qty =obj2.get("qty");
				  Object unit=obj2.get("unit"); 
				  Object unitprice=obj2.get("unitprice");
				  Object taxvalue=obj2.get("taxvalue");
				  
				  int resultStatus = DataService.DeliveryChallanItem(dcno, odno, itemId, qty, iName, hsncode, batchno, unit, unitprice, taxvalue);
			}
            
		}catch(Exception ex){
			System.out.println("Exception Delivery Challan =="+ex);
		}
		
		JSONObject jsonResponse = new JSONObject();
		if(status>0)
		{
			jsonResponse.put("message", "Data inserted successfully");
        } else {					
            jsonResponse.put("message", "Failed to insert data");
        }
		out.print(jsonResponse.toJSONString());
		out.flush();
		
	}  

}
