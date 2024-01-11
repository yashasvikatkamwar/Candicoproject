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

@WebServlet("/Tax_master_servlet")
public class Tax_master_servlet extends HttpServlet {

    Object Name,per,sr_no;
    String status;
  DataService con;
   PreparedStatement pst;
   Connection c;
   @Override
   public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException 
     {
          try (PrintWriter out = response.getWriter()) 
        {  
            
          response.setContentType("text/html;charset=UTF-8");
           System.out.println("Tax_master_servlet-------->");
                  
                          
       
           sr_no=request.getParameter("sr_no");
        System.out.println("sr_no-------->" +sr_no); 
        
        Name=request.getParameter("Name");
        System.out.println("Name-------->" +Name); 
       
         per=request.getParameter("per");
        System.out.println("per-------->" +per);
        
        
         status=request.getParameter("status");
        System.out.println("status-------->" +status); 
      
         Class.forName("com.mysql.jdbc.Driver");
        c = DriverManager.getConnection("jdbc:mysql://localhost:3306/candicodb", "root", "admin@123456789");
 System.out.println("Connecting with database"); 
 
 
 
       switch(status){
 
       case "insert":
           pst=c.prepareStatement("insert into  tax_master(tax_name,percent) values(?,?)");
           pst.setObject(1,Name);
           pst.setObject(2,per);
                
               int y= pst.executeUpdate();
            System.out.println("Connecting with database"); 
                  if(y>0)
                   System.out.println("Data inserted succcessfully");
              else
                   System.out.println("Data not inserted");
           break;

                  
       case "delete":      
               System.out.println("dlete if");
               pst=c.prepareStatement("delete from tax_master where sr=?");
               pst.setString(1,sr_no.toString());
               int count= pst.executeUpdate();
               if(count==0){
                   System.out.println("not delete");
               }else{
                System.out.println("Delete succesfully");
               }
           break;
              
      case "edit":
           System.out.println(" edit part");
            pst= c.prepareStatement("update tax_master set tax_name=?,percent=? where sr=?");              
            pst.setObject(1,Name);
            pst.setObject(2,per);
            pst.setObject(3,sr_no);
            int y2=pst.executeUpdate();
            System.out.println("Connecting with database"); 
              if(y2>0)
                   System.out.println("update");
              else
                   System.out.println("not update");
         break;
             
     }       
                  
                  
                  
                  
                  
                  c.close();
             } catch (SQLException ex) { 
//           Logger.getLogger(InsertEmpMast.class.getName()).log(Level.SEVERE, null, ex);
       } 
                 
     catch(Exception ex) 
         {
             System.out.println("Error -->" + ex);
             
         }
      
     }
}
