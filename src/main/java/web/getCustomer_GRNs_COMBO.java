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

@WebServlet("/getCustomer_GRNs_COMBO")
public class getCustomer_GRNs_COMBO extends HttpServlet {

    private static final long serialVersionUID = 1L;



@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{
  System.out.println("getCustomer_GRNs_COMBO=combobox===>"); 
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
      
       String Cid=request.getParameter("Cid");
      System.out.println("compname=Cid===>"+Cid);
      
      rs=sr.COM_GRN_list(Cid.trim());
      System.out.println("company_name=combobox===>123" +Cid);
       
      while(rs.next())
       {
           //rs2= s.executeQuery("select Unit_id,emp_id,First_name,Last_name,designation,Ifsc_no,ESIC_no,pf_no_a,bank_name,accno from security_recruityment where Unit_name='"+pr+"'");
     
     System.out.println("jkjkj "+rs.getObject(1));
      System.out.println("compname=combobox3===>"+Cid);
       login_val++;
           JsonObject json=new JsonObject();
           json.addProperty("value","login"+login_val);
//           String h1=rs.getString(2).replace(" ","_");
           String o=rs.getObject(1)+"=>"+rs.getObject(2)+"=>"+rs.getObject("Vid")+"=>"+rs.getObject("Vname");
           String f=rs.getString(2);
           
           json.addProperty("text",o);
           json.addProperty("sr",f);
           data_json.add(json);
    System.out.println("compname=combobox4===>"+Cid);
       }
         System.out.println("compname=combobox5===>"+Cid);
       System.out.println(data_json);
       json_response.add("aaData", data_json);
 System.out.println("compname=combobox6===>"+Cid);
       response.setContentType("application/Json");
 System.out.println("compname=combobox7===>"+Cid);
       response.getWriter().write(json_response.toString());
 System.out.println("compname=combobox8===>"+Cid);
       System.out.println(json_response);
   }

catch(Exception ex2)
   {   
       
       System.out.println("Exception occured during retrieval of Login_Id in ComboBox :"+ex2);
       ex2.printStackTrace();
   }
}

}
