package web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import bean.DataService;

@WebServlet("/Add_Company_master")
@MultipartConfig(location="/tmp", fileSizeThreshold=1024*1024*8,maxFileSize=1024*1024*8, maxRequestSize=1024*1024*5*5)
public class Add_Company_master extends HttpServlet {

    Object key,code,Cname,Ctype,shot_name,noOFowner,HO_addresss,location,country,state,city,pincode,phone1,phone2,mobile1,mobile2,email;
    Object ofc_addresss,ofc_location,ofc_country,ofc_state,ofc_city,ofc_pincode,ofc_phone1,ofc_phone2,ofc_mobile1,ofc_mobile2,ofc_email,ofc_website,sale_ofc_addresss,sale_ofc_location,sale_ofc_country,sale_ofc_state,sale_ofc_city,sale_ofc_pincode,sale_ofc_phone1,sale_ofc_phone2, sale_ofc_mobile1,sale_ofc_mobile2,sale_ofc_email,bank_name,branch,account_number,IFSC,in_favour,registration_office,holder_name;
 DataService con;
  PreparedStatement pst,pst2,pst3;
  Connection c;
  ResultSet rs;    
    NumberFormat nf = NumberFormat.getNumberInstance(Locale.ENGLISH);
      DecimalFormat df = (DecimalFormat)nf;
      
  private String getFileName(final Part part) {
  final String partHeader = part.getHeader("content-disposition");
  
  for (String content : part.getHeader("content-disposition").split(";")) {
      if (content.trim().startsWith("filename")) {
          return content.substring(
                  content.indexOf('=') + 1).trim().replace("\"", "");
      }
  }
  return null;
}
  
  
  @Override
  public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
         try (PrintWriter out1 = response.getWriter()) 
       {  
           
         response.setContentType("text/html;charset=UTF-8");
          System.out.println("<---------- Add_Company_master -------->");
       
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
       
       
       
       String photo1="";
       String photo2="";
       
        Part filePart = request.getPart("logo_img");
          System.out.println("in servlet 2"+filePart);
          
        Part filePart2 = request.getPart("profile_img");
          System.out.println("in servlet 3"+filePart2);
        
       
        Class.forName("com.mysql.jdbc.Driver");
        c = DriverManager.getConnection("jdbc:mysql://localhost:3306/candicodb", "root", "admin@123456789");
          System.out.println("Connecting with database"); 
          pst=c.prepareStatement("insert into  Company(code,Cname,Ctype,shot_name,noOFowner,HO_addresss,location,country,state,city,pincode,phone1,phone2,mobile1,mobile2,email,\n" +
"ofc_addresss,ofc_location,ofc_country,ofc_state,ofc_city,ofc_pincode,ofc_phone1,ofc_phone2,ofc_mobile1,ofc_mobile2,ofc_email,ofc_website,\n" +
"sale_ofc_addresss,sale_ofc_location,sale_ofc_country,sale_ofc_state,sale_ofc_city,sale_ofc_pincode,sale_ofc_phone1,sale_ofc_phone2,sale_ofc_mobile1,sale_ofc_mobile2,sale_ofc_email,\n" +
"bank_name,branch,account_number,IFSC,in_favour,registration_office,holder_name)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
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
              int y= pst.executeUpdate();
           System.out.println("Connecting with database"); 
                 if(y>0){
                  System.out.println("Data inserted succcessfully");
                  rs = pst.getGeneratedKeys();
                  if(rs.next()){
                      System.out.println("id===>>>"+rs.getObject(1));
                       key=rs.getObject(1);
                  }
                 }
                 else{
                  System.out.println("Data not inserted");
                 }
              
                           
String path =getServletContext().getRealPath("/")+"images";
        System.out.println("path >> "+path);
        
        File file=new File(path);
        file.mkdir();
        String fileName = getFileName(filePart);
        
        OutputStream out = null;
        
          InputStream filecontent = null;
          
       
       for(int i=1;i<=2;i++) {  
          
//           photo="gate_pass"+fileName;
           String photo=key+"_"+i+"_Customer.jpg";
           System.out.println("photo>>"+photo);
          PrintWriter writer = response.getWriter();

      out = new FileOutputStream(new File(path + File.separator
              + photo));
      if(i==1){photo1=photo;
      filecontent = (filePart).getInputStream();}
      
      if(i==2){photo2=photo;
      filecontent = (filePart2).getInputStream();}
      
        int read = 0;
      final byte[] bytes = new byte[1024];

      while ((read = filecontent.read(bytes)) != -1) {
          out.write(bytes, 0, read);
         
      }
  }
      
        df.applyPattern("##0000");
        String output = df.format(key);
       String inv_Fno= "CID"+output;
        
          pst3=c.prepareStatement("update Company set logo_img =?,profile_img=?,code=? where sr =?");
              pst3.setObject(1,photo1);
              pst3.setObject(2,photo2);
              pst3.setObject(3,inv_Fno);
              pst3.setObject(4,key);
                                                    
              int y3= pst3.executeUpdate();
           System.out.println("Connecting with database"); 
                 if(y3>0){
                  System.out.println("Data update succcessfully Company");}
                 else{
                  System.out.println("Data not update Company");
                 }
                pst.close();
                pst3.close();
               c.close();
             
          response.sendRedirect("Main_Company_View.jsp");
            } catch (SQLException ex) { 
//          Logger.getLogger(InsertEmpMast.class.getName()).log(Level.SEVERE, null, ex);
System.out.println("ex >>"+ex);
      } 
                
    catch(Exception ex) 
        {
            System.out.println("Database.getConnection() Error -->" + ex);
            
        }
    }
    }
