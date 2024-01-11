package web;

import java.io.IOException;
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

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import bean.DataService;

/**
 * Servlet implementation class Get_new_BachNO
 */
@WebServlet("/Get_new_BachNO")
public class Get_new_BachNO extends HttpServlet {

    private static final long serialVersionUID = 1L;

       NumberFormat nf = NumberFormat.getNumberInstance(Locale.ENGLISH);
       DecimalFormat df = (DecimalFormat)nf;

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{
  System.out.println("Get_new_BachNO=combobox===>"); 
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
      
       String max=request.getParameter("max");
      System.out.println("compname=max===>"+max);
      
      rs=sr.Get_new_BachNO();
       
      while(rs.next())
       {
       login_val++;
           JsonObject json=new JsonObject();
           json.addProperty("value","login"+login_val);
//           String h1=rs.getString(2).replace(" ","_");
               
           String batch=rs.getString(1);
           System.out.println(">>> "+Integer.parseInt(batch));
           int batchh=Integer.parseInt(batch);
           if(max.equals("0")){}else{
            batchh = Integer.parseInt(max)+1;
           }
           
           df.applyPattern("##0000000");
           String output = df.format(batchh);
           
           System.out.println(">>> "+output);
           
           json.addProperty("text",output);
           json.addProperty("sr",output);
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
