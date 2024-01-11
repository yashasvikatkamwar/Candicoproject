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
 * Servlet implementation class add_unit
 */
@WebServlet("/add_unit")
public class add_unit extends HttpServlet {

    Object mater,unit,Sid,sell_price,emp_per;
 DataService con;
  PreparedStatement pst;
  Connection c;

  public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException 
    {
         try (PrintWriter out = response.getWriter()) 
       {  
           
         response.setContentType("text/html;charset=UTF-8");
          System.out.println("add_unit-------->");
       
       unit=request.getParameter("unit");
       System.out.println("unit-------->" +unit);
       
       String table_name=request.getParameter("table_name");
       System.out.println("table_name-------->" +table_name);
      
        Class.forName("com.mysql.jdbc.Driver");
        c = DriverManager.getConnection("jdbc:mysql://localhost:3306/candicodb", "root", "admin@123456789");
          System.out.println("Connecting with database"); 
          String sql="insert into  unit_Master(unit_name) values(?)";
           System.out.println("sql >"+sql);
          pst=c.prepareStatement(sql);
              pst.setObject(1,unit);            
              int y= pst.executeUpdate();
           System.out.println("Connecting with database"); 
                 if(y>0)
                  System.out.println("Data inserted succcessfully");
             else
                  System.out.println("Data not inserted");
          
                 c.close();  
       } catch (SQLException ex) { 
//          Logger.getLogger(InsertEmpMast.class.getName()).log(Level.SEVERE, null, ex);
System.out.println("ex >"+ex);
      } 
                
    catch(Exception ex) 
        {
            System.out.println("Database.getConnection() Error -->" + ex);
            
        }
     
    }
}
