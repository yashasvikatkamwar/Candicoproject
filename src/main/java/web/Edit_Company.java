package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DataService;

/**
 * Servlet implementation class Edit_Company
 */
@WebServlet("/Edit_Company")
public class Edit_Company extends HttpServlet {

    
    Object id,name,unit,basic_rate,gst,total_rate,lift_amt,type;
    Object key,code,Cname,Ctype,shot_name,noOFowner,HO_addresss,location,country,state,city,pincode,phone1,phone2,mobile1,mobile2,email;
     Object ofc_addresss,ofc_location,ofc_country,ofc_state,ofc_city,ofc_pincode,ofc_phone1,ofc_phone2,ofc_mobile1,ofc_mobile2,ofc_email,ofc_website,sale_ofc_addresss,sale_ofc_location,sale_ofc_country,sale_ofc_state,sale_ofc_city,sale_ofc_pincode,sale_ofc_phone1,sale_ofc_phone2, sale_ofc_mobile1,sale_ofc_mobile2,sale_ofc_email,bank_name,branch,account_number,IFSC,in_favour,registration_office,holder_name;
  DataService con;
  PreparedStatement pst=null,ps=null;
  Connection c;
 
 public void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
         // System.out.println("name-------->");
       try {
             PrintWriter out = response.getWriter();
       
            response.setContentType("text/html;charset=UTF-8");
           System.out.println("Edit_Company-------->");
           
           id=request.getParameter("id");
        System.out.println("id-------->" +id); 
      
      String status=request.getParameter("status");
        System.out.println("status-------->" +status); 
        
        
        code=request.getParameter("code");
        System.out.println("code-------->" +code); 
       
        Cname=request.getParameter("Cname");
        System.out.println("Cname-------->" +Cname);
        
       Ctype=request.getParameter("Ctype");
        System.out.println("Ctype-------->" +Ctype);
        
        shot_name=request.getParameter("shot_name");
        System.out.println("shot_name-------->"+shot_name);
        
        noOFowner=request.getParameter("noOFowner");
        System.out.println("noOFowner-------->"+noOFowner);
        
        HO_addresss=request.getParameter("HO_addresss");
        System.out.println("HO_addresss-------->"+HO_addresss);
        
        location=request.getParameter("location");
        System.out.println("vlocation-------->"+location);
        
        
        country=request.getParameter("country");
        System.out.println("country-------->"+country);
        
        state=request.getParameter("state");
        System.out.println("state-------->"+state);
        
        city=request.getParameter("city");
        System.out.println("city-------->"+city);
        
        pincode=request.getParameter("pincode");
        System.out.println("pincode-------->"+pincode);
        
        phone1=request.getParameter("phone1");
        phone2=request.getParameter("phone2");
        mobile1=request.getParameter("mobile1");
        mobile2=request.getParameter("mobile2");
        email=request.getParameter("email");
        ofc_addresss=request.getParameter("ofc_addresss");
        ofc_location=request.getParameter("ofc_location");
        ofc_country=request.getParameter("ofc_country");
        ofc_state=request.getParameter("ofc_state");
        ofc_city=request.getParameter("ofc_city");
        
        ofc_pincode=request.getParameter("ofc_pincode");
        ofc_phone1=request.getParameter("ofc_phone1");
        ofc_phone2=request.getParameter("ofc_phone2");
        ofc_mobile1=request.getParameter("ofc_mobile1");
        ofc_mobile2=request.getParameter("ofc_mobile2");
        ofc_email=request.getParameter("ofc_email");
        ofc_website=request.getParameter("ofc_website");
        sale_ofc_addresss=request.getParameter("sale_ofc_addresss");
        sale_ofc_location=request.getParameter("sale_ofc_location");
        sale_ofc_country=request.getParameter("sale_ofc_country");
        
        sale_ofc_state=request.getParameter("sale_ofc_state");
        sale_ofc_city=request.getParameter("sale_ofc_city");
        sale_ofc_pincode=request.getParameter("sale_ofc_pincode");
        sale_ofc_phone1=request.getParameter("sale_ofc_phone1");
        sale_ofc_phone2=request.getParameter("sale_ofc_phone2");
        sale_ofc_mobile1=request.getParameter("sale_ofc_mobile1");
        sale_ofc_mobile2=request.getParameter("sale_ofc_mobile2");
        sale_ofc_email=request.getParameter("sale_ofc_email");
        bank_name=request.getParameter("bank_name");
        branch=request.getParameter("branch");
        
        account_number=request.getParameter("account_number");
        IFSC=request.getParameter("IFSC");
        in_favour=request.getParameter("in_favour");
        registration_office=request.getParameter("registration_office");
        holder_name=request.getParameter("holder_name");
      
        Class.forName("com.mysql.jdbc.Driver");
 c = DriverManager.getConnection("jdbc:mysql://localhost:3306/candicodb", "root", "admin@123456789");
 System.out.println("Connecting with database");
 
 if(status.equals("delete")){
     System.out.println("dlete if");
     pst=c.prepareStatement("delete from Company where sr=?");
               pst.setString(1,id.toString());
              int count= pst.executeUpdate();
              if(count==0){
                  System.out.println("not delete");
              }else{
               System.out.println("Delete succesfully");
              }
 }
 else{
       pst= c.prepareStatement("update Company set code=?,Cname=?,Ctype=?,shot_name=?,noOFowner=?,HO_addresss=?,location=?,country=?,state=?,city=?,"
               + "pincode=?,phone1=?,phone2=?,mobile1=?,mobile2=?,email=?,ofc_addresss=?,ofc_location=?,ofc_country=?,ofc_state=?,ofc_city=?,ofc_pincode=?,ofc_phone1=?,ofc_phone2=?,ofc_mobile1=?,ofc_mobile2=?,ofc_email=?,ofc_website=?,"
               + "sale_ofc_addresss=?,sale_ofc_location=?,sale_ofc_country=?,sale_ofc_state=?,sale_ofc_city=?,sale_ofc_pincode=?,sale_ofc_phone1=?,sale_ofc_phone2=?,sale_ofc_mobile1=?,sale_ofc_mobile2=?,sale_ofc_email=?,bank_name=?,branch=?,account_number=?,IFSC=?,in_favour=?,registration_office=?,holder_name=? where sr=?");              
       pst.setObject(1, code);
               pst.setObject(2, Cname);
               pst.setObject(3, Ctype);
               pst.setObject(4, shot_name);
               pst.setObject(5, noOFowner);
               pst.setObject(6, HO_addresss);
               pst.setObject(7, location);
               pst.setObject(8, country);
               pst.setObject(9, state);
               pst.setObject(10, city);
               pst.setObject(11, pincode);
               pst.setObject(12, phone1);
               pst.setObject(13, phone2);
               pst.setObject(14, mobile1);
               pst.setObject(15, mobile2);
               pst.setObject(16, email);
               pst.setObject(17, ofc_addresss);
               pst.setObject(18, ofc_location);
               pst.setObject(19, ofc_country);
               pst.setObject(20, ofc_state);
               pst.setObject(21, ofc_city);
               pst.setObject(22, ofc_pincode);
               pst.setObject(23, ofc_phone1);
               pst.setObject(24, ofc_phone2);
               pst.setObject(25, ofc_mobile1);
               pst.setObject(26, ofc_mobile2);
               pst.setObject(27, ofc_email);
               pst.setObject(28, ofc_website);
               pst.setObject(29, sale_ofc_addresss);
               pst.setObject(30, sale_ofc_location);
               pst.setObject(31, sale_ofc_country);
               pst.setObject(32, sale_ofc_state);
               pst.setObject(33, sale_ofc_city);
               pst.setObject(34, sale_ofc_pincode);
               pst.setObject(35, sale_ofc_phone1);
               pst.setObject(36, sale_ofc_phone2);
               pst.setObject(37, sale_ofc_mobile1);
               pst.setObject(38, sale_ofc_mobile2);
               pst.setObject(39, sale_ofc_email);
               pst.setObject(40, bank_name);
               pst.setObject(41, branch);
               pst.setObject(42, account_number);
               pst.setObject(43, IFSC);
               pst.setObject(44, in_favour);
               pst.setObject(45, registration_office);
               pst.setObject(46, holder_name);
               pst.setObject(47, id);
       
               int y=pst.executeUpdate();
              System.out.println("Connecting with database"); 
              if(y>0)
                   System.out.println("update");
              else
                   System.out.println("not update");
              
              response.sendRedirect("Main_Company_View.jsp");
 }
       } 
       catch(Exception ex) 
         {
 System.out.println(" Error -->" + ex);
             
         }
        finally {
           try {
               pst.close();
                 c.close();
           } catch (SQLException ex) {
              // Logger.getLogger(ServletEdit_Sal_Head.class.getName()).log(Level.SEVERE, null, ex);
           }
         
          // out.close();
       } 
       
       
       
     }
   }