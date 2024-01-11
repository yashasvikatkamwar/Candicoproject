package web;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.DataService;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
@WebServlet("/delivery_challan_no")
public class delivery_challan_no extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		System.out.println("Company_next_delivery noo_ID_get_COMBO=combobox===>");
		JsonArray data_json = new JsonArray(); 

		Statement st_loginId = null;
		ResultSet rs,rs1 = null;
		int login_val = 0;

		
		JsonObject json_response = new JsonObject();

		try {
			DataService ds1 = new DataService();
			String Cid = request.getParameter("Cid");
			rs = ds1.Company_deliveryChallanNo(Cid.trim());
			
			

			while (rs.next()) {
				
				String no = rs.getString(2);
				String cshort = rs.getString(1);
				String odn;
				String dli;
				
				
				if(cshort=="Null")
				{
					odn="OGP-"+no;
				}
				else {
					odn="OGP"+cshort+" "+no;
				}
				
				dli="DC"+cshort+""+no;
				
				
				
				System.out.println("Company "+Cid);
				System.out.println("Delivery No: " + dli);
				System.out.println("OGP NO " + odn);
				
				login_val++;
				JsonObject json = new JsonObject();
				json.addProperty("value", "login" + login_val);
//           	String h1=rs.getString(2).replace(" ","_");
				json.addProperty("text", rs.getString(2));
				json.addProperty("ogp", odn);
				json.addProperty("dli", dli);
				data_json.add(json);
				
				
			}
			//System.out.println("compname=combobox5===>" + Cid);
			//System.out.println(data_json);
			  json_response.add("aaData", data_json);
			//System.out.println("compname=combobox6===>" + Cid);
			  response.setContentType("application/Json");
			//System.out.println("compname=combobox7===>" + Cid);
			  response.getWriter().write(json_response.toString());
			//System.out.println("compname=combobox8===>" + Cid);
			//System.out.println(json_response);

			
		}

		catch (Exception ex2) {

			System.out.println("Exception occured during retrieval of Login_Id in ComboBox :" + ex2);
			ex2.printStackTrace();
		}

		      

}
}








    




  
   
 
 
