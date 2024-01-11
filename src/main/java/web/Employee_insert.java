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
 * Servlet implementation class Employee_insert
 */
@WebServlet("/Employee_insert")
public class Employee_insert extends HttpServlet {

    Object Name,Phone_No,desi,GST_NO,Email_Id,Sid,sr_no;
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
           System.out.println("Employee_insert-------->");
                  
                          
       
           sr_no=request.getParameter("sr_no");
        System.out.println("sr_no-------->" +sr_no); 
        
        Name=request.getParameter("Name");
        System.out.println("Name-------->" +Name); 
       
         Phone_No=request.getParameter("Phone_No");
        System.out.println("Phone_No-------->" +Phone_No);
        
       desi=request.getParameter("desi");
        System.out.println("desi-------->" +desi);
        
        
        Email_Id=request.getParameter("Email_Id");
        System.out.println("Email_Id-------->" +Email_Id);
        
         status=request.getParameter("status");
        System.out.println("status-------->" +status); 
      
         Class.forName("com.mysql.jdbc.Driver");
        c = DriverManager.getConnection("jdbc:mysql://localhost:3306/candicodb", "root", "admin@123456789");
 System.out.println("Connecting with database"); 
 
 
 
       switch(status){
 
       case "insert":
           pst=c.prepareStatement("insert into  employee_master(name,mobile,email,designation) values(?,?,?,?)");
           pst.setObject(1,Name);
           pst.setObject(2,Phone_No);
           pst.setObject(3,Email_Id);
           pst.setObject(4,desi);
                
               int y= pst.executeUpdate();
            System.out.println("Connecting with database"); 
                  if(y>0)
                   System.out.println("Data inserted succcessfully");
              else
                   System.out.println("Data not inserted");
           break;

                  
       case "delete":      
               System.out.println("dlete if");
               pst=c.prepareStatement("delete from employee_master where sr=?");
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
            pst= c.prepareStatement("update employee_master set name=?,mobile=?,email=?,designation=? where sr=?");              
            pst.setObject(1,Name);
            pst.setObject(2,Phone_No);
            pst.setObject(3,Email_Id);
            pst.setObject(4,desi);
            pst.setObject(5,sr_no);
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
