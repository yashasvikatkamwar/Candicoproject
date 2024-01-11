package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DataService;

/**
 * Servlet implementation class Vender_Master_servlet
 */
@WebServlet("/Vender_Master_servlet")
public class Vender_Master_servlet extends HttpServlet {

    Object sr_no,name,GST_no,adrs,desc,com,email,mob,code,key;
    String status;
  DataService con;
   PreparedStatement pst,pst3;
   Connection c;
    ResultSet rs;    
     NumberFormat nf = NumberFormat.getNumberInstance(Locale.ENGLISH);
       DecimalFormat df = (DecimalFormat)nf;
   @Override
   public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException 
     {
          try (PrintWriter out = response.getWriter()) 
        {  
            
          response.setContentType("text/html;charset=UTF-8");
           System.out.println("Vender_Master_servlet-------->");
                  
                          
       
           sr_no=request.getParameter("sr_no");
        System.out.println("sr_no-------->" +sr_no); 
        
        name=request.getParameter("name");
        System.out.println("name-------->" +name); 
       
         code=request.getParameter("code");
        System.out.println("code-------->" +code);
        
         mob=request.getParameter("mob");
        System.out.println("mob-------->" +mob);
        
        email=request.getParameter("email");
        System.out.println("vemail -------->" +email);
        
        com=request.getParameter("com");
        System.out.println("com-------->" +com);
        
        desc=request.getParameter("desc");
        System.out.println("desc-------->" +desc);
        
        adrs=request.getParameter("adrs");
        System.out.println("adrs-------->" +adrs);
        
        GST_no=request.getParameter("gst");
        System.out.println("GST_no-------->" +GST_no);
        
        
         status=request.getParameter("status");
        System.out.println("status-------->" +status); 
      
         Class.forName("com.mysql.jdbc.Driver");
        c = DriverManager.getConnection("jdbc:mysql://localhost:3306/candicodb", "root", "admin@123456789");
 System.out.println("Connecting with database"); 
 
 
 
       switch(status){
 
       case "insert":
           pst=c.prepareStatement("insert into  vender(name,code,mob,email,Com_name,descri,adrs,GST_no) values(?,?,?,?,?,?,?,?)");
           pst.setObject(1,name);
           pst.setObject(2,code);
           pst.setObject(3,mob);
           pst.setObject(4,email);
           pst.setObject(5,com);
           pst.setObject(6,desc);
           pst.setObject(7,adrs);
           pst.setObject(8,GST_no);
           int y= pst.executeUpdate(); 
                  if(y>0){
                   System.out.println("Data inserted succcessfully");
                  rs = pst.getGeneratedKeys();
                   if(rs.next()){
                       System.out.println("id===>>>"+rs.getObject(1));
                        key=rs.getObject(1);
                   }
                    df.applyPattern("##0000");
                     String output = df.format(key);
                    String inv_Fno= "VID"+output;
         
               pst3=c.prepareStatement("update vender set code =? where sr =?");
               pst3.setObject(1,inv_Fno);
               pst3.setObject(2,key);           
               int y3= pst3.executeUpdate(); 
                  if(y3>0){
                   System.out.println("Data update succcessfully vender code");}
                  else{
                   System.out.println("Data not update vender code");
                  }
                  }
              else
                   System.out.println("Data not inserted");
           break;

                  
       case "delete":      
               System.out.println("dlete if");
               pst=c.prepareStatement("delete from vender where sr=?");
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
            pst= c.prepareStatement("update vender set name=?,code=?,mob=?,email=?,Com_name=?,descri=?,adrs=?,GST_no=? where sr=?");              
           pst.setObject(1,name);
           pst.setObject(2,code);
           pst.setObject(3,mob);
           pst.setObject(4,email);
           pst.setObject(5,com);
           pst.setObject(6,desc);
           pst.setObject(7,adrs);
           pst.setObject(8,GST_no);
           pst.setObject(9,sr_no);
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
System.out.println("ex >>>>>>"+ex);
       } 
                 
     catch(Exception ex) 
         {
             System.out.println("Error -->" + ex);
             
         }
      
     }
}
