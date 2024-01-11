package web;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import bean.DataService;

/**
 * Servlet implementation class get_GRNs_Iid_COMBO
 */
@WebServlet("/get_GRNs_Iid_COMBO")
public class get_GRNs_Iid_COMBO extends HttpServlet {

    private static final long serialVersionUID = 1L;



@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{
  System.out.println("get_GRNs_Iid_COMBO=combobox===>"); 
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
//      String compname=request.getParameter("company_name");
//      System.out.println("compname=combobox===>"+compname);
      
       String Gid=request.getParameter("Gid");
      System.out.println("compname=Gid===>"+Gid);
      
      rs=sr.GRN_item_list(Gid.trim());
      System.out.println("company_name=combobox===>123" +Gid);
       
      while(rs.next())
       {
           //rs2= s.executeQuery("select Unit_id,emp_id,First_name,Last_name,designation,Ifsc_no,ESIC_no,pf_no_a,bank_name,accno from security_recruityment where Unit_name='"+pr+"'");
     
     System.out.println("jkjkj "+rs.getObject(1));
      System.out.println("compname=combobox3===>"+Gid);
       login_val++;
           JsonObject json=new JsonObject();
           json.addProperty("value","login"+login_val);
//           String h1=rs.getString(2).replace(" ","_");
           String o=rs.getObject(1)+"=>"+rs.getObject("Iid")+"=>"+rs.getObject("Iname")+"=>"+rs.getObject("HSN")+"=>"+rs.getObject("Manufacturer_name")+"=>"+rs.getObject("Batch")+"=>"+rs.getObject("vender_Batch")+"=>"+rs.getObject("No_containers")+"=>"+rs.getObject("Date_of_manufacture")+"=>"+rs.getObject("SLED_BBD")+"=>"+rs.getObject("retest_date")+"=>"+rs.getObject("QTY_in_unit_of_Entry");
           String f=rs.getString("Iname");
           
           json.addProperty("text",o);
           json.addProperty("sr",f);
           data_json.add(json);
    System.out.println("compname=combobox4===>"+Gid);
       }
         System.out.println("compname=combobox5===>"+Gid);
       System.out.println(data_json);
       json_response.add("aaData", data_json);
 System.out.println("compname=combobox6===>"+Gid);
       response.setContentType("application/Json");
 System.out.println("compname=combobox7===>"+Gid);
       response.getWriter().write(json_response.toString());
 System.out.println("compname=combobox8===>"+Gid);
       System.out.println(json_response);
   }

catch(Exception ex2)
   {   
       
       System.out.println("Exception occured during retrieval of Login_Id in ComboBox :"+ex2);
       ex2.printStackTrace();
   }
}

}
