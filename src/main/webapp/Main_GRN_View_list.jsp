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
<style>
   th{
        text-align: center
    }
    td{
        text-align: center
    }
</style>
<%!ResultSet rs,rq,data,data2,data3,data4,data5,re,selectData,rs2;
ResultSetMetaData rsmd;
Object ob;
DataService sr1,ds1;int x;Object aval,bval,unitid; 
int i=0;ArrayList ar;
JSONArray list; Iterator ity;Object o1;String gender;
String S_tyep,seller_id;%>
<%
//                    S_tyep=(String)session.getAttribute("S_tyep");
//                    S_tyep="DryFruits Store";
                   seller_id=(String)session.getAttribute("seller_id");
                   
//                   LocalDate today = LocalDate.now();
//                    System.out.println(today.toString());  
//                    String to_date=today.plusDays(1).toString();
//                    System.out.println("to_date >"+to_date);
//                    String from_date=today.minusMonths(1).toString();

                String Fdate="",Tdate="",Cid="";
                Fdate=request.getParameter("Fdate");
                Tdate=request.getParameter("Tdate");
                Cid=request.getParameter("Cid");
    %>
    
    <%!
      public String dateFormateChnge(String date){
//        convert dd/MM/yyyy to yyyy/MM/dd
        System.out.println("date >>>>" +date.length());
        if(date.length()==0){return "";}
        if(date!=null && date!=""){
        String datee[]=date.split("-");
        return datee[2]+"/"+datee[1]+"/"+datee[0];
        }
        return "";
    } 
%>
<!-- page content -->
      <div class="right_col" role="main">
          
        <div class="">
          <div class="page-title">
              <div class="title_left" style="width: 100%">
              <h3 style="color:black;">
                Good Receipt Note
                <h4>
               <%--  <div style="float: right"><%=Fdate.split("-")[2]+"-"+Fdate.split("-")[1]+"-"+Fdate.split("-")[0]%> To <%=Tdate.split("-")[2]+"-"+Tdate.split("-")[1]+"-"+Tdate.split("-")[0]%></div>
                 --%></h4></h3>
                
            </div>
              <div id="sidebar-menu" class="main_menu_side hidden-print main_menu"></div>
          </div>
          <div class="clearfix"></div>
          
         
          <div class="row">

            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                  <div class="x_title"  style="background: #e8f1f3; width: 100%">
                  
                  <form id="demo-form3" action="Main_GRN_View_list.jsp"  data-parsley-validate class="form-horizontal form-label-left" style="margin-top: 1%;">
             <table>
                 <tr>
                     <td>
                        <%
                            ds1= new DataService();
                            rs=ds1.Company_list();
                           %>
                        <select name="Cid" id="Cid" class="form-control select2">
                          <optgroup label="">
                          <option value="">-- Select Company --</option>
                                        <%
                                         while(rs.next()){
                                          Object ven= rs.getString(2);
                                          Object ven2= rs.getString(3);
                                        %>
                            <option value="<%=ven%>"><%=ven2%></option>
                                          <% }%> 
                            </optgroup>
                        </select>  
                         
                     </td>
                     <td>
                     <div class="form-group" style="float: right;">
<!--                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name" style="width:150px;height:30px;margin-right:40px;color:black;">Attendance Date:
                      </label>-->
                      <div class="col-xs-12" style="height:30px;">
<!--                          <body onload="addDate();">-->
                        <div class="col-xs-6">
                            <input type="date" id="Fdate" name="Fdate"  class="form-control " >
                        </div>
                        <div class="col-xs-6">
                            <input type="date" id="Tdate" name="Tdate"  class="form-control " >
                        </div>
                      </div>
                    </div>                
                  </td> 
                  <td>
                    <div class="col-md-6 col-sm-6 col-xs-12 ">
                        <button type="submit" class="btn fix_back_color" style="width:150px; height:40;">Find</button>
                  </td>
                      </tr>
                      </table>
              </form>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="text-right">
                       
                     <span class="small"><a href="Main_GRN_PDF.jsp?Cid=<%=Cid%>&Fdate=<%=Fdate%>&Tdate=<%=Tdate%>"><button class="btn fix_back_color">PDF</button></a></span>
                             
                           <%
                try{
                sr1=new DataService();
                rs2=sr1.GRN_list_with_items(Fdate,Tdate,Cid);
                ArrayList rsa=new ArrayList();
                //data=sr1.viewUnitDetails(); 

                rsmd=rs2.getMetaData();
                x=rsmd.getColumnCount();
            %>    
                             
                        <input type="button" class="DTTT_button" onclick="tableToExcel('example', 'W3C Example Table')" value="Export to Excel">
                    </div>
            <div class="table-responsive" style="height: 460px;">
                    <table id="example" class="table table-striped table-bordered responsive-utilities jambo_table  data-sort-order "  >
                    <thead>
                      <tr class="headings fix_back_color">
                        <th >Sr no</th>
                        <th >GRN No</th>
                        <th >Company Name</th>
                        <th >Short Name</th>
                        <th >PO NO</th>
                        <th >Supplier Name</th>
                        <th >document_date</th>
                        <th >posting_date</th>
                        
                        <th >bill_no</th> 
                         <th >Bill_date</th> 
                        <th >delevery_challan_no</th> 
                        <th >header_text</th> 
                        <th >LR_no</th> 
                        <th >LR_date</th> 
                        
                        <th >transport_name</th>
                        <th >way_bill_date</th>
                        <th >way_bill_no</th>
                        <th >vehicle_no</th> 
                        <th >challan_date</th> 
                        <th >total_container</th> 
                        <th >GRN_BY</th>
                        <!--<th >Remark</th>-->
                        <th >Item code</th>
                        <th >Item Name</th>
                        <th >HSN</th>
                        <th >QTY_in_delivery_note</th>
                        <th >QTY_in_unit_of_Entry</th>
                        <th >QTY_in_short</th>
                        <th >No_containers</th>
                        <th >storage_location</th>
                        <th >unloading_point</th>
                        <th >Manufacturer_name</th>
                        <th >Manufacturer_adrs</th>
                        <th >Batch</th>
                        <th >vender_Batch</th>
                        <th >Date_of_manufacture</th>
                        <th >retest_date</th>
                        <th >total_amt</th>
                        
                        <th class=" no-link last"  ><span class="nobr">Action</span></th>
                      </tr>
                    </thead>
                    <%int i=0,hu=1;
                      //boolean t=data.next();
                      // out.println(" t====================>"+t);
                       while(rs2.next()){%>
                       <tr id="<%=i%>">
                            <td ><%=i+1%></td>
                            <td><%=rs2.getObject("Gid")%></td>
                            <td><%=rs2.getObject("com_name")%></td>
                            <td><%=rs2.getObject("CshortN")%></td>
                            <td><%=rs2.getObject("Pid")%></td>
                            <td><%=rs2.getObject("Vname")%></td>
                            <td style="width: 25%"><%=dateFormateChnge(rs2.getString("document_date"))%></td>
                            
                            <td style="width: 25%"><%=dateFormateChnge(rs2.getString("posting_date"))%></td>
                            
                            
                            <td><%=rs2.getObject("bill_no")%></td>
                             <td><%=rs2.getObject("Bill_date")%></td>
                            <td><%=rs2.getObject("delevery_challan_no")%></td>
                            <td><%=rs2.getObject("header_text")%></td>
                            <td><%=rs2.getObject("LR_no")%></td>
                            
                            <td style="width: 25%"><%=dateFormateChnge(rs2.getString("LR_date"))%></td>
                            
                            <td><%=rs2.getObject("transport_name")%></td>
                            
                            <td style="width: 25%"><%=dateFormateChnge(rs2.getString("way_bill_date"))%></td>
                            
                            <td><%=rs2.getObject("way_bill_no")%></td>
                            <td><%=rs2.getObject("vehicle_no")%></td>
                            
                            <td style="width: 25%"><%=dateFormateChnge(rs2.getString("challan_date"))%></td>
                            
                            <td><%=rs2.getObject("total_container")%></td>
                            <td><%=rs2.getObject("GRN_BY")%></td>
                            
                            <td><%=rs2.getObject("Iid")%></td>
                            <td><%=rs2.getObject("Iname")%></td>
                            <td><%=rs2.getObject("HSN")%></td>
                            <td><%=rs2.getObject("QTY_in_delivery_note")%></td>
                            <td><%=rs2.getObject("QTY_in_unit_of_Entry")%></td>
                            <td><%=rs2.getObject("QTY_in_short")%></td>
                            <td><%=rs2.getObject("No_containers")%></td>
                            <td><%=rs2.getObject("storage_location")%></td>
                            <td><%=rs2.getObject("unloading_point")%></td>
                            <td><%=rs2.getObject("Manufacturer_name")%></td>
                            <td><%=rs2.getObject("Manufacturer_adrs")%></td>
                            <td><%=rs2.getObject("Batch")%></td>
                            <td><%=rs2.getObject("vender_Batch")%></td>
                            <td><%=rs2.getObject("Date_of_manufacture")%></td>
                            <td><%=rs2.getObject("retest_date")%></td>
                            <td><%=rs2.getObject("total_amt")%></td>
                            
                            
                            
                              <td class=" last">
                                  <!--<button class="btn btn-primary btn-xs btn_edit" data-toggle="modal" data-target="#unit_guard_details" value="<%=rs2.getObject(1)%>" id="<%=i%>" href="#">Edit </button>-->
                                   <!--<button class="btn btn-primary btn-xs btn_edit" data-toggle="modal" data-target="#unit_guard_details" value="<%=rs2.getObject(1)%>"  href="#">Add </button>-->
                                  
                                  <%--

                                <!--<button class="btn btn-warning btn-xs" name="id_name" onclick="getId(this.id);" value="row_a<%=i-1%>" id="row_a<%=i-1%>">View Sub Units</button>-->
                               <%-- <a class="btn btn-warning btn-xs" href="view_subunit_details.jsp?unitid=<%=aval%>&unitname=<%=bval%>">View Sub Units</a>
                               --%>    
                                    <button value="<%=rs2.getObject(1)%>" class="delete btn btn-danger btn-xs btn_delete" >Delete</button>
                                    <a href="Main_GRN_Details_View.jsp?Gid=<%=rs2.getObject(1)%>"><button class=" btn btn-warning btn-xs " >Details</button></a>
                                    <a href="Main_GRN_Edit.jsp?Gid=<%=rs2.getObject(1)%>"><button class=" btn btn-success btn-xs " >Edit</button></a>
                                    <a href="Main_GRN_PDF_QAD.jsp?Gid=<%=rs2.getObject(1)%>"><button class=" btn btn-info btn-xs " >QCD PDF</button></a>
                                    <a href="Main_GRN_PDF_Inward.jsp?Gid=<%=rs2.getObject(1)%>"><button class=" btn btn-info btn-xs " >Inward PDF</button></a>
                                    
                                    <!--<a href="Main_Parches_order_View.jsp?Pid=<%=rs2.getObject(1)%>"><button class=" btn btn-warning btn-xs " >PDF</button></a>-->
                            </td>
                        </tr>
                    <%i++;}%>

                     
                    
                    

                  </table>
            </div>
                </div>
              </div>
            </div>
                    
                    <script>
                        function getId(element) {
                           var id_value = document.getElementById(element).value;
                           
                           return(id_value);
                        }
                    </script>        
            
            <br />
            <br />
            <br />
 </form>
                    <div class="ln_solid"></div>
<%--!    <div class="form-group">
                      <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <button type="submit" class="btn btn-primary">Cancel</button>
                        <button type="submit" class="btn btn-success">Submit</button>
                      </div>
                    </div>  --%>

          <div id="successMessage" class="col-md-6 col-md-offset-3 alert alert-success" style="display:none">      
                    
          </div>
          <%} catch(Exception y){} finally{try{sr1.c.close();}catch(Exception y3){}}%>
        </div>

        
     <div class="modal fade edit_recruit_modal" id="unit_guard_details" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close sub_unit_details_add_close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title">Edit  Details</h4>
            </div>

                  <form id="unit_details_add"  action="" class="form-horizontal form-label-left">
            <div class="modal-body">
                <div id="successMessage2" class="col-md-12 alert alert-success successMessage2" style="display:none">
                    <span>Vender Details Updated successfully</span>
                </div>              
                        
                <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12"> ID:<span class="required">*</span></label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="Iid" name="Iid" required="required" class="form-control col-md-7 col-xs-12" readonly="">
                        <div id="err_C_Name" class="err-msg">Please enter Iid</div>
                      </div>
                   </div>
                
                
                 <div class="col-md-12 form-group">
                                          <label class="control-label">Vender  Name</label>
                                          <!--<textarea name="name" id="name" class="form-control" placeholder="Item  Name" cols="30" rows="1"></textarea>-->
                                          <input type="text" autocomplete="off"  placeholder="Enter  name" id="name1" name="name1" required class="form-control">
                                          <span class="help-block small err" id="err_cust_ph_no" style="display:none"></span>
                                       </div>
                                        
                                        <div class="col-md-12 form-group">
                                          <label class="control-label">Vender  Code</label>
                                          <!--<textarea name="code" id="code" class="form-control" placeholder="Item  Name" cols="30" rows="1"></textarea>-->
                                          <input type="text" autocomplete="off"  placeholder="Enter  code" id="code1" name="code1" required class="form-control">
                                          <span class="help-block small err" id="err_cust_ph_no" style="display:none"></span>
                                       </div>
                                        
                                        
                                        <div class="col-md-12 form-group">
                                          <label class="control-label">Mobile</label>
                                          <!--<textarea name="mob" id="mob" class="form-control" placeholder="Item  Description" cols="30" rows="1"></textarea>-->
                                          <input type="text" autocomplete="off"  placeholder="Enter Tax mob" id="mob1" name="mob1" required class="form-control">
                                          <span class="help-block small err" id="err_cust_ph_no" style="display:none"></span>
                                       </div>
                                        
                                         <div class="col-md-12 form-group">
                                          <label class="control-label">Email</label>
                                          <!--<textarea name="email" id="email" class="form-control" placeholder="Item  Description" cols="30" rows="1"></textarea>-->
                                          <input type="text" autocomplete="off"  placeholder="Enter email" id="email1" name="email1" required class="form-control">
                                          <span class="help-block small err" id="err_cust_ph_no" style="display:none"></span>
                                       </div>

                                        
                                        
					<div class="col-md-12 form-group">
                                          <label class="control-label">Company Name</label>
                                          <input type="text" autocomplete="off"  placeholder="Enter Company" id="com1" name="com1" required class="form-control">
                                          <span class="help-block small err" id="err_cust_ph_no" style="display:none"></span>
                                        </div>
                                          
                                        
                                        <div class="col-md-12 form-group">
                                          <label class="control-label">Description</label>
                                          <textarea name="desc1" id="desc1" class="form-control" placeholder="Item  Description" cols="30" rows="1"></textarea>
                                          <!--<input type="text" autocomplete="off"  placeholder="Enter Description" id="desc" name="desc" required class="form-control">-->
                                          <span class="help-block small err" id="err_cust_ph_no" style="display:none"></span>
                                       </div>
                                        
                                        <div class="col-md-12 form-group">
                                          <label class="control-label">Address</label>
                                          <!--<textarea name="email" id="email" class="form-control" placeholder="Item  Description" cols="30" rows="1"></textarea>-->
                                          <input type="text" autocomplete="off"  placeholder="Enter Address" id="adrs1" name="adrs1" required class="form-control">
                                          <span class="help-block small err" id="err_cust_ph_no" style="display:none"></span>
                                       </div>
                                        
                                        <div class="col-md-12 form-group">
                                          <label class="control-label">GST NO</label>
                                          <input type="text" autocomplete="off"  placeholder="Enter GST NO" id="gst1" name="gst1" required class="form-control">
                                          <span class="help-block small err" id="err_cust_ph_no" style="display:none"></span>
                                        </div>
                                       

                    
                     
                    
            <div class="modal-footer">
              <button type="button" class="btn btn-default sub_unit_details_add_close" data-dismiss="modal" style="margin-bottom: 0;">Close</button>
              <button type="submit" class="btn btn-success ad_dtl_sbmt" onclick="edit()">Update </button>

            </div>
            </div>
            </form>
          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    
    <div class="modal fade" id="addModel" tabindex="-1" role="dialog" aria-hidden="true">
                  <div class="modal-dialog">
                     <div class="modal-content">
                        <div class="modal-header modal-header-primary">
                           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                           <h3 style="display:inline"><i class="fa fa-plus m-r-5"></i> Add new Vender</h3>
                        </div>
                        <div class="modal-body">
                           <div class="row">
                              <div class="col-md-12">
                                  <form class="form-horizontal" method="post" id="customer_form" >
                                    <input type="hidden" name="hid_cust" id="hid_cust" value="N" >

                                    <fieldset>
                                        

				  <div class="col-md-12 form-group">
                                          <label class="control-label">Vender  Name</label>
                                          <!--<textarea name="name" id="name" class="form-control" placeholder="Item  Name" cols="30" rows="1"></textarea>-->
                                          <input type="text" autocomplete="off"  placeholder="Enter  name" id="name" name="name" required class="form-control">
                                          <span class="help-block small err" id="err_cust_ph_no" style="display:none"></span>
                                       </div>
                                        
                                        <div class="col-md-12 form-group">
                                          <label class="control-label">Vender  Code</label>
                                          <!--<textarea name="code" id="code" class="form-control" placeholder="Item  Name" cols="30" rows="1"></textarea>-->
                                          <input type="text" autocomplete="off"  placeholder="Enter  code" id="code" name="code" required class="form-control">
                                          <span class="help-block small err" id="err_cust_ph_no" style="display:none"></span>
                                       </div>
                                        
                                        
                                        <div class="col-md-12 form-group">
                                          <label class="control-label">Mobile</label>
                                          <!--<textarea name="mob" id="mob" class="form-control" placeholder="Item  Description" cols="30" rows="1"></textarea>-->
                                          <input type="text" autocomplete="off"  placeholder="Enter Tax mob" id="mob" name="mob" required class="form-control">
                                          <span class="help-block small err" id="err_cust_ph_no" style="display:none"></span>
                                       </div>
                                        
                                         <div class="col-md-12 form-group">
                                          <label class="control-label">Email</label>
                                          <!--<textarea name="email" id="email" class="form-control" placeholder="Item  Description" cols="30" rows="1"></textarea>-->
                                          <input type="text" autocomplete="off"  placeholder="Enter email" id="email" name="email" required class="form-control">
                                          <span class="help-block small err" id="err_cust_ph_no" style="display:none"></span>
                                       </div>

                                        
                                        
					<div class="col-md-12 form-group">
                                          <label class="control-label">Company Name</label>
                                          <input type="text" autocomplete="off"  placeholder="Enter Company" id="com" name="com" required class="form-control">
                                          <span class="help-block small err" id="err_cust_ph_no" style="display:none"></span>
                                        </div>
                                          
                                        
                                        <div class="col-md-12 form-group">
                                          <label class="control-label">Description</label>
                                          <textarea name="desc" id="desc" class="form-control" placeholder="Item  Description" cols="30" rows="1"></textarea>
                                          <!--<input type="text" autocomplete="off"  placeholder="Enter Description" id="desc" name="desc" required class="form-control">-->
                                          <span class="help-block small err" id="err_cust_ph_no" style="display:none"></span>
                                       </div>
                                        
                                        <div class="col-md-12 form-group">
                                          <label class="control-label">Address</label>
                                          <!--<textarea name="email" id="email" class="form-control" placeholder="Item  Description" cols="30" rows="1"></textarea>-->
                                          <input type="text" autocomplete="off"  placeholder="Enter Address" id="adrs" name="adrs" required class="form-control">
                                          <span class="help-block small err" id="err_cust_ph_no" style="display:none"></span>
                                       </div>
                                        
                                        <div class="col-md-12 form-group">
                                          <label class="control-label">GST NO</label>
                                          <input type="text" autocomplete="off"  placeholder="Enter GST NO" id="gst" name="gst" required class="form-control">
                                          <span class="help-block small err" id="err_cust_ph_no" style="display:none"></span>
                                        </div>
                                        
                                       <div class="col-md-12 form-group user-form-group">
                                          <div class="pull-left">
                                             <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">Cancel</button>
                                             <button type="submit" name="add_cust" id="add_cust" value="add" class="btn btn-add btn-sm" onclick="add();">Add</button>
                                          </div>
                                       </div>
                                       <div class="col-md-12 form-group" id="Supplier_succ"></div>
                                    </fieldset>
                                 </form>
                              </div>
                           </div>
                        </div>
                     </div>
                     <!-- /.modal-content -->
                  </div>
                  <!-- /.modal-dialog -->
               </div>
    <script>
        
        function printDiv()
{

  var divToPrint=document.getElementById('unit_details_add');

  var newWin=window.open('','Print-Window');

  newWin.document.open();

  newWin.document.write('<html><body onload="window.print()">'+divToPrint.innerHTML+'</body></html>');

  newWin.document.close();

  setTimeout(function(){newWin.close();},10);

}
        
//        $("document").ready(function(){
//            alert('hello----------------------')
//            $('form#unit_details_add').submit(function (){
//                   alert('hello----------------------')
                function edit(){
                
                 var Iid = $("#Iid").val();
//                   alert("Iid==============>"+Iid);
              
                
                 var name= $("#name1").val();
                var code= $("#code1").val();
                var mob= $("#mob1").val();
                var email= $("#email1").val();
                var com= $("#com1").val();
                var desc= $("#desc1").val();
                var adrs= $("#adrs1").val();
                var gst= $("#gst1").val();
             
                 var status="edit";
               
                    $("#spinner").show(); 
                    $.ajax({
                    type: "POST",
                    url: "Vender_Master_servlet",
                    data: {
                            sr_no:Iid,
                            name:name,
                            code:code,
                            mob:mob,
                            email:email,
                            com:com,
                            desc:desc,
                            adrs:adrs,
                            gst:gst,
                            status:status
                        
                         },
                        success: function(data){
                        $('#successMessage2').html('Updated Succesfully').delay(5000).fadeOut();
                        $('#successMessage2').show();
                        $("#spinner").hide(); 
                        location.reload();
                        }
                    });
                    return false;
                }
//            });
            
           $("document").ready(function(){  
            $(".btn_edit").click(function(){
                var tr_id = this.id;
                var valuee=this.value;
//                alert(valuee);
                var tr = document.getElementById(tr_id);
                var td = tr.getElementsByTagName("td");
                     $("#unitid option").each(function () {
                        if ($(this).html() == td[0].innerHTML) {
                            $(this).attr("selected", "selected");
                            return;
                        }
                    });
                  //  $("#Designation").val(td[0].innerHTML);
                  //  alert(td[0]);
                    
                  $("#Iid").val(valuee);
                $("#name1").val(td[1].innerHTML);
                $("#code1").val(td[2].innerHTML);
                $("#mob1").val(td[3].innerHTML);
                $("#email1").val(td[4].innerHTML);
                $("#com1").val(td[5].innerHTML);
                $("#desc1").val(td[6].innerHTML);
                $("#adrs1").val(td[7].innerHTML);
                $("#gst1").val(td[8].innerHTML);
                  
            });
            
        
            
        $(".UnEmployed").click(function(){
               var result = confirm("change to UnEmployed?");
                var id = $(this).val();//alert(deleteid);
                var status ="UnEmployed"
                if (result) {
                    $.ajax({
                    type: "POST",
                    url: "Employee_status_chnge",
                    data: {
                              id:id,
                              status:status
                        },
                        success: function(data){
                        $('#successMessage2').html('Changed stock').delay(5000).fadeOut();
                        $('#successMassage2').show();
                        alert("Update Successfully");
                        location.reload();
                        }
                    });
                    return false;
                }
                
            });
            
            $(".Employed").click(function(){
               var result = confirm("change to Employed?");
                var id = $(this).val();//alert(deleteid);
                var status ="Employed"
                if (result) {
                    $.ajax({
                    type: "POST",
                    url: "Employee_status_chnge",
                    data: {
                              id:id,
                              status:status
                        },
                        success: function(data){
                        $('#successMessage2').html('Changed stock').delay(5000).fadeOut();
                        $('#successMassage2').show();
                        alert("Update Successfully");
                        location.reload();
                        }
                    });
                    return false;
                }
            });
            
            $(".delete").click(function(){
               var result = confirm("want to delete?");
                var id = $(this).val();//alert(deleteid);
                if (result) {
                    $("#spinner").show(); 
                    $.ajax({
                    type: "POST",
                    url: "GRN_delete",
                    data: {
                              id:id,
                        },
                        success: function(data){
                        $('#successMessage2').html('Delete Sucessfully').delay(5000).fadeOut();
                        $('#successMassage2').show();
                        alert("delete Successfully");
                        $("#spinner").hide(); 
                        location.reload();
                        }
                    });
                    return false;
                }
                
            });
            
            
        });
        
         function add(){
//              alert("inn add function");
                var name= $("#name").val();
                var code= $("#code").val();
                var mob= $("#mob").val();
                var email= $("#email").val();
                var com= $("#com").val();
                var desc= $("#desc").val();
                var adrs= $("#adrs").val();
                var gst= $("#gst").val();
                
                
               var status="insert";
               $("#spinner").show(); 
               $.ajax({
                    type:"POST",
                     url:"Vender_Master_servlet",
                           data:{ 
                            name:name,
                            code:code,
                            mob:mob,
                            email:email,
                            com:com,
                            desc:desc,
                            adrs:adrs,
                            gst:gst,
                            status:status
                           },
                           success:function(data)
                           {
                               //alert(data);
                               $('#successMessage').html('Data inserted successfully').delay(5000).fadeOut();
                               $('#successMessage').show();
                               $('#Supplier_succ').innerhtml="Data inserted successfully";
                               $("#spinner").hide(); 
//                               data-dismiss="modal";
                                location.reload();
                           }
                       });
                 
          }
    </script>
<jsp:include page="templates/footer.html" />