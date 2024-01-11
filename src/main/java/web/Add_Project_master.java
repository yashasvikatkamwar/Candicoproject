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

@WebServlet("/Add_Project_master")
public class Add_Project_master extends HttpServlet {

    Object Cname,Cid,Pname,P_code,P_initials,Ptype,noOFphases,contact_person,contact_person_no,site_engr,site_adrs,location,country,state,city,
pincode,phone1,phone2,mobile1,mobile2,email,total_construction_area,amenity1_name,amenity2_name,amenity3_name,amenity4_name,amenity5_name,
plot_area,FSI,land_agreement_details,property_card_no,property_tax_no,commencement_date,exp_completion_date,project_profile,details_7_12,website;
 DataService con;
  PreparedStatement pst;
  Connection c;

  public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException 
    {
         try (PrintWriter out = response.getWriter()) 
       {  
           
         response.setContentType("text/html;charset=UTF-8");
          System.out.println("Add_Project_master-------->");
       
       String[] Cna=request.getParameter("Cname").split("/");
      
       
       Cname=Cna[0];
       Cid=Cna[1];
                System.out.println("Cname-------->" +Cname);
                System.out.println("Cid-------->" +Cid);
                
        Pname=request.getParameter("Pname");
       System.out.println("Pname-------->" +Pname);
       
       Pname=request.getParameter("Pname");
       System.out.println("Pname-------->" +Pname);
       
        P_code=request.getParameter("P_code");
       System.out.println("P_code-------->" +P_code);
       
        P_initials=request.getParameter("P_initials");
       System.out.println("P_initials-------->" +P_initials);
       
       Ptype=request.getParameter("Ptype");
       System.out.println("Ptype-------->" +Ptype);
       
        noOFphases=request.getParameter("noOFphases");
       System.out.println("noOFphases-------->" +noOFphases);
       
       
       contact_person=request.getParameter("contact_person");
       contact_person_no=request.getParameter("contact_person_no");
       site_engr=request.getParameter("site_engr");
       site_adrs=request.getParameter("site_adrs");
       location=request.getParameter("location");
       country=request.getParameter("country");
       state=request.getParameter("state");
       city=request.getParameter("city");
       pincode=request.getParameter("pincode");
       phone1=request.getParameter("phone1");
       phone2=request.getParameter("phone2");
       mobile1=request.getParameter("mobile1");
       mobile2=request.getParameter("mobile2");
       email=request.getParameter("email");
       total_construction_area=request.getParameter("total_construction_area");
       amenity1_name=request.getParameter("amenity1_name");
       amenity2_name=request.getParameter("amenity2_name");
       amenity3_name=request.getParameter("amenity3_name");
       amenity4_name=request.getParameter("amenity4_name");
       amenity5_name=request.getParameter("amenity5_name");
       plot_area=request.getParameter("plot_area");
       FSI=request.getParameter("FSI");
       land_agreement_details=request.getParameter("land_agreement_details");
       property_card_no=request.getParameter("property_card_no");
       property_tax_no=request.getParameter("property_tax_no");
       commencement_date=request.getParameter("commencement_date");
       exp_completion_date=request.getParameter("exp_completion_date");
       project_profile=request.getParameter("project_profile");
       details_7_12=request.getParameter("details_7_12");
       website=request.getParameter("website");
      
        Class.forName("com.mysql.jdbc.Driver");
        c = DriverManager.getConnection("jdbc:mysql://localhost:3306/candicodb", "root", "admin@123456789");
          System.out.println("Connecting with database"); 
          pst=c.prepareStatement("insert into  project_master(Cname,Cid,Pname,P_code,P_initials,Ptype,noOFphases,contact_person,contact_person_no,site_engr,site_adrs,location,country,state,city,\n" +
"pincode,phone1,phone2,mobile1,mobile2,email,total_construction_area,amenity1_name,amenity2_name,amenity3_name,amenity4_name,amenity5_name,\n" +
"plot_area,FSI,land_agreement_details,property_card_no,property_tax_no,commencement_date,exp_completion_date,project_profile,details_7_12,website) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
              pst.setObject(1,Cname); 
              pst.setObject(2,Cid); 
              pst.setObject(3,Pname); 
              pst.setObject(4,P_code); 
              pst.setObject(5,P_initials); 
              pst.setObject(6,Ptype); 
              pst.setObject(7,noOFphases); 
              pst.setObject(8,contact_person); 
              pst.setObject(9,contact_person_no); 
              pst.setObject(10,site_engr); 
              pst.setObject(11,site_adrs); 
              pst.setObject(12,location); 
              pst.setObject(13,country); 
              pst.setObject(14,state); 
              pst.setObject(15,city); 
              pst.setObject(16,pincode); 
              pst.setObject(17,phone1); 
              pst.setObject(18,phone2); 
              pst.setObject(19,mobile1); 
              pst.setObject(20,mobile2); 
              pst.setObject(21,email); 
              pst.setObject(22,total_construction_area); 
              pst.setObject(23,amenity1_name); 
              pst.setObject(24,amenity2_name); 
              pst.setObject(25,amenity3_name); 
              pst.setObject(26,amenity4_name); 
              pst.setObject(27,amenity5_name); 
              pst.setObject(28,plot_area); 
              pst.setObject(29,FSI); 
              pst.setObject(30,land_agreement_details); 
              pst.setObject(31,property_card_no); 
              pst.setObject(32,property_tax_no); 
              pst.setObject(33,commencement_date); 
              pst.setObject(34,exp_completion_date); 
              pst.setObject(35,project_profile); 
              pst.setObject(36,details_7_12); 
              pst.setObject(37,website);  
              int y= pst.executeUpdate();
           System.out.println("Connecting with database"); 
                 if(y>0)
                  System.out.println("Data inserted succcessfully");
             else
                  System.out.println("Data not inserted");
          
                 c.close();  
                 
                 response.sendRedirect("Main_Project_View.jsp");
       } catch (SQLException ex) { 
//          Logger.getLogger(InsertEmpMast.class.getName()).log(Level.SEVERE, null, ex);
System.out.println("ex >"+ex);
      } 
                
    catch(Exception ex) 
        {
            System.out.println(" Error -->" + ex);
            
        }
     
    }
}

