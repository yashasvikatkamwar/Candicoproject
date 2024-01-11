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

@WebServlet("/GRN_delete")
public class GRN_delete extends HttpServlet {

    
    Object id,name,unit,basic_rate,gst,total_rate,lift_amt,type;
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
           System.out.println("GRN_delete-------->");
           
           id=request.getParameter("id");
        System.out.println("id-------->" +id); 
      
      
        Class.forName("com.mysql.jdbc.Driver");
 c = DriverManager.getConnection("jdbc:mysql://localhost:3306/candicodb", "root", "");
 System.out.println("Connecting with database");
 
     pst=c.prepareStatement("delete from GRN where sr=?");
               pst.setString(1,id.toString());
              int count= pst.executeUpdate();
              if(count==0){
                  System.out.println("not delete");
              }else{
               System.out.println("Delete succesfully");
              }
              
       pst=c.prepareStatement("delete from GRN_items where Gid=?");
               pst.setString(1,id.toString());
              int count1= pst.executeUpdate();
              if(count1==0){
                  System.out.println(" Purches_order_items not delete");
              }else{
               System.out.println("Purches_order_items Delete succesfully");
              }
              
//        pst=c.prepareStatement("delete from Purches_order_shedule_date where Pid=?");
//               pst.setString(1,id.toString());
//              int count2= pst.executeUpdate();
//              if(count2==0){
//                  System.out.println( " Purches_order_shedule_datenot delete");
//              }else{
//               System.out.println(" Purches_order_shedule_date Delete succesfully");
//              }

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
