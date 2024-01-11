<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"
	errorPage="eror.jsp"%>
<%@page import="org.joda.time.LocalDate"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.DataService"%>
<jsp:include page="templates/header.jsp" />
<%
	Boolean sesname = (Boolean) session.getAttribute("session_name");
	String uname = (String) session.getAttribute("uname");
	if (!sesname) {
		System.out.println("" + uname);

	} else {
		response.sendRedirect("/login.jsp");
	}
%>
<%! ResultSet rs2,rs;DataService ds1;ArrayList ar;Iterator ity;Object o1=null; Statement statement=null; %>
<!DOCTYPE html>
<html>
   <div class="right_col" role="main">
        <div class="">
<div class="page-title">
            <div class="title_left">
              <h3 style="color:black;">Order Details</h3>
            </div>
          </div>
          <div class="clearfix"></div>
          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2></h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <br />
                  <form id="demo-form3" action="Main_GRN_form.jsp" method="post"  data-parsley-validate class="form-horizontal form-label-left">
                   
                      
    
                      <div class="form-group  col-md-12">
<!--                          <div class="col-md-1"></div>
                          <div class="col-md-2 col-sm-6 col-xs-12 inline" >
                            <select name="stat" id="stat" class=" form-control select2 col-md-7 col-xs-12 " required="">
                                 <option value="MS" style="color:black;">MS</option>
                                <option value="OMS" style="color:black;">OMS</option>
                             </select>
                          </div>-->
                    
                      <div class="col-md-5 col-sm-6 col-xs-12 inline" >
                         
                           <%
                               ds1= new DataService();
                               rs=ds1.Company_list();
                              
                             %>
                            <select name="Cid" id="Cid" class=" form-control select2 col-md-7 col-xs-12 " required="">
                             <!--<optgroup label="order_no" style="color:black;">-->
                                <option value="" style="color:black;">Select Company </option>
                                <%while(rs.next()){
                                 %>
                                <option value='<%=rs.getObject("code")%>' style="color:black;"><%=rs.getObject("Cname")%></option>
                                         <%}%> 
                                <!--</optgroup>-->
                          </select>
                          </div>
                   <div class="col-md-5 col-sm-6 col-xs-12 inline" >
                       <select name="Pid" id="Pid" class=" form-control  col-md-7 col-xs-12 " required="" style="    top: 13px;">
                          <!--<optgroup label="select Purches Order ID">-->
                              <option  disabled="" style="color:black;">select Purches Order ID</option>
                          <!--</optgroup>-->
                        </select>
                     </div>
                     
            </div>
            
           <div class="form-group">
               <br>
                      <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                       <button type="submit" class="btn btn-success" >Submit</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal" style="margin-bottom: 0;"><a href="index.jsp"> Close</a></button>
                      </div>
                    </div>

                             
                    </form>
                
   </html>
   
    <script>
           $(document).ready(function () {
                  //alert('payroll');
                 $(".select2").select2();
             });
   
   
$(document).ready(function() 
{ 
        $('#Cid').change(function(){
        var Cid = document.getElementById("Cid").value;
//        var com = document.getElementById("com").value;
//        alert(unit);
        
        $('#Pid').find('option').remove().end().append('<option disabled=""  style="color:black;">Data</option>').val(' ');

    $.ajax({
        type: "POST",
        url:"Company_wise_PO_for_COMBO",
        data:{
               Cid:Cid
            },
        dataType:"json",
        success:function(data){
            $.each(data.aaData,function(i,data)
            {
//                var Pid=data.sr+"=>"+data.text;
            var div_data='<option value="'+data.sr+'" style="color:black;">'+data.text+'</option>';
            $(div_data).appendTo('#Pid');
             }); 
            }
             
      });
     
    });
});
   </script>

<jsp:include page="templates/footer.html" />