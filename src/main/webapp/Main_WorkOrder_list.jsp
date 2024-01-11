<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"
	errorPage="eror.jsp"%>
<%@page import="org.joda.time.LocalDate"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.DataService"%>
<jsp:include page="templates/header.jsp" />


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
    
    
    
  /* Style the modal */
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgb(0,0,0);
    background-color: rgba(0,0,0,0.4);
    padding-top: 60px;
}

/* Modal content */
.modal-content {
    background-color: #fefefe;
    margin: 5% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 50%;
}

/* Close button */
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
    /* model */
    
    /* .modal-content div{
    	display: flex;
    	align-items: center;
    	justify-content: space-between;
    } */
    /* .modal-content span{
    display: flex;
    	flex-direction: row;
    	margin-left: 40px;
    	margin-right: 40px;
    } */
    
    
    .modal-content .details{
    
    	width:100%;
    	height:auto;    	
    	/* background-color: red; */
    }
    .details .row .col-12{
    	margin-bottom: 10px;
    }
    
    
    
    /* table  */
.table-borderless > tbody > tr > td,
.table-borderless > tbody > tr > th,
.table-borderless > tfoot > tr > td,
.table-borderless > tfoot > tr > th,
.table-borderless > thead > tr > td,
.table-borderless > thead > tr > th {
    border: none;
}
    
 
 .bo tr th{
 	border: 1px solid black;
 }
 .bo tr td{
 	border: 1px solid black;
 }
    
    
</style>
<%--  <%!ResultSet rs,rq,data,data2,data3,data4,data5,re,selectData,rs2;
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
                   
                   LocalDate today = LocalDate.now();
                    System.out.println(today.toString());  
                    String to_date=today.plusDays(1).toString();
                    System.out.println("to_date >"+to_date);
                    String from_date=today.minusMonths(1).toString();
    %>  --%>
    
   <!--  model -->
<!-- Modal -->
<body>
<div id="myModal" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>Work Order Department</h2>
            <hr> 
             
            <table class="table table-borderless">
			  <!-- <thead>
			    <tr>
			      <th scope="col"></th>
			      <th scope="col"></th>
			      <th scope="col"></th>
			      <th scope="col"></th>
			      <th scope="col"></th>
			    </tr>
			  </thead>  -->
  <tbody>
    <tr>
      <td>Work OrderId : <span id="a"></span></td>
      <td></td>
      <td></td>
      <td></td>
      <td>Company Name : <span id="b"></span></td>
    </tr>
    <tr>
      <td>Product Code : <span id="c"></span></td>
      <td></td>
      <td></td>
      <td></td>
      <td>Batch No : <span id="d"></span></td>
    </tr>
    <tr>
      <td>Proposed Work Date : <span id="e"></span></td>
      <td></td>
      <td></td>
      <td></td>
      <td>Header MFG Date : <span id="f"></span></td>
    </tr>
    <tr>
      <td>Department : <span id="g"></span></td>
      <td></td>
      <td></td>
      <td></td>
      <td>Date of Manifacture : <span id="h"></span></td>
    </tr>
  </tbody>
</table>
<hr>

		<table>
			<thead >
			    <tr>
			      <th style="border: 1px solid black">Batch No/AR No</th>
			      <th style="border: 1px solid black">Comp Code/Desc</th>
			      <th style="border: 1px solid black">Issue Details</th>
			      <th style="border: 1px solid black">Batch Expiry Dt</th>
			      <th style="border: 1px solid black">Next Inspection Dt</th>
			      <th style="border: 1px solid black">Retest Date</th>
			      <th style="border: 1px solid black">St Loc</th>
			      <th style="border: 1px solid black">Bin no</th>
			    </tr>
			 </thead>
			 
			 <tbody >
			 	<tr >
			 		<td style="border: 1px solid black">4</td>
			 		<td style="border: 1px solid black">dd</td>
			 		<td style="border: 1px solid black">fr</td>
			 		<td style="border: 1px solid black">dsds</td>
			 		<td style="border: 1px solid black">rr</td>
			 		<td style="border: 1px solid black">ffgr</td>
			 		<td style="border: 1px solid black">de</td>
			 		<td style="border: 1px solid black">xwwxl</td>
			 	</tr>
			 </tbody>

		</table>

           
           
            <div class="butn text-center">
            	<button type="button" id="printbtn" class="btn btn-warning" style="margin-top: 10px" onclick="printOn()">Print</button>
            </div>
        </div>
    </div>
  
    
     <!-- <div class="col-6"> <span><strong>Work Order Id : </strong><p id="a"></p></span>  <span><strong>Company Name :</strong><p id="b"></p></span></div>
            <div> <span><strong>Product Code :</strong><p id="c"></p></span> <span><strong>Batch No :</strong><p id="d"></p></span></div>
            <div> <span><strong>Proposed Work Date :</strong><p id="e"></p></span> <span><strong>Header MFG Date :</strong><p id="f"></p></span></div>
            <div> <span><strong>Department :</strong><p id="g"></p></span> <span><strong>Date of Manifacture :</strong><p id="h"></p></span></div> -->

<!-- page content -->
      <div class="right_col" role="main">
          
        <div class="">
          <div class="page-title">
            <div class="title_left">
              <h3 style="color:black;">
                 WORK ORDER DEPARTMENT
                </h3>
            </div>
              <div id="sidebar-menu" class="main_menu_side hidden-print main_menu"></div>
          </div>
          <div class="clearfix"></div>
          
         
          <div class="row">

            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                  <div class="x_title"  style="background: #e8f1f3; width: 100%">
                  <h2 style="color:black;">WORK ORDER DEPARTMENT </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="text-right">
                       
                     <!--<span class="small"><a data-toggle="modal" data-target="#addModel" href="jvascript:void(0);"><button class="btn fix_back_color">Add Vender</button></a></span>-->
                             
                   
                             
                        <input type="button" class="DTTT_button" onclick="tableToExcel('example', 'W3C Example Table')" value="Export to Excel">
                    </div>
                    <table id="example" class="table table-striped table-bordered responsive-utilities jambo_table  data-sort-order table_unit"  >
                    <thead>
                      <tr class="headings fix_back_color">
                        <th >WorkOrderId</th> 
                        <th >Company Name</th>
                        <th >Product Code</th>
                        <th >Batch No.</th>
                        <th >Proposed Work Date</th>
                      
                        <th >Department</th> 
                        <th >Date of Manifacture</th> 
                        <th class=" no-link last"  ><span class="nobr">Action</span></th>
                      </tr>
                    </thead>
                    
                    <% 
                    int i = 0+1;
			          try{
			        	 
			        	  Class.forName("com.mysql.jdbc.Driver");
			        	  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/candicodb","root","admin@123456789");
			        	  String sql ="select * from work_order_ms";
			        	  PreparedStatement pst = con.prepareStatement(sql);
			        	  ResultSet rs = pst.executeQuery();
			        	  
			        	  while(rs.next())
			        	  { 
			        		  
        			%>
        			
                       <tr id="">
                          <td> <%= rs.getInt(1) %> </td>
		        		  <td> <%= rs.getString(2)%> </td>
		        		  <td> <%=rs.getString(3) %> </td>
		        		  <td> <%=rs.getString(4) %> </td>
		        		  <td> <%=rs.getString(5) %> </td>
		        		 
		        		  <td> <%=rs.getString(6) %> </td>
		        		  <td> <%=rs.getString(7) %> </td>
                      
                              <td class="last">
<!--                                  <button class="btn btn-primary btn-xs btn_edit" data-toggle="modal" data-target="#unit_guard_details" value="" id="" href="#">Edit </button>
                                   <button class="btn btn-primary btn-xs btn_edit" data-toggle="modal" data-target="#unit_guard_details" value=""  href="#">Add </button>-->
                                  
                                  <%--

                                <button class="btn btn-warning btn-xs" name="id_name" onclick="getId(this.id);" value="row_a<%=i-1%>" id="row_a<%=i-1%>">View Sub Units</button>   --%>
                               <%-- <a class="btn btn-warning btn-xs" href="view_subunit_details.jsp?unitid=<%=aval%>&unitname=<%=bval%>">View Sub Units</a>
                               onclick="btnDel(<%= rs.getInt(1) %>)"--%>    
                                    <button value="<%= rs.getInt(1) %>" id="del" class="delete btn btn-danger btn-xs" >Delete</button>
                                    <button id="" class="view btn btn-warning btn-xs" onclick="openModal(<%= rs.getInt(1) %>)">View</button>
                                    <!--<a href="MAin_Customer_Membership_cards_view.jsp?Cid=<%-- <%=rs2.getObject(1)%> --%>&name=<%-- <%=rs2.getObject(3)%> --%>"><button class=" btn btn-success btn-xs " >Memberships</button></a>-->
                            </td>
                        </tr>
                    <% 	  	  
        	  				}

			          }catch(Exception ex){
			        	  out.println(ex.getMessage());
			          }
			      %>
                    
                  </table>
                </div>
              </div>
            </div>
                    
                    <!-- <script>
                        function getId(element) {
                           var id_value = document.getElementById(element).value;
                           
                           return(id_value);
                        }
                    </script>  -->       
            
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
          <%-- <%} catch(Exception y){} finally{try{sr1.c.close();}catch(Exception y3){}}%> --%>
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
                                          <label class="control-label">Vender Code</label>
                                          <!--<textarea name="code" id="code" class="form-control" placeholder="Item  Name" cols="30" rows="1"></textarea>-->
                                          <input type="text" autocomplete="off"  placeholder="Enter  code" id="code1" name="code1" required class="form-control" readonly="">
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
                                        
                                        <div class="col-md-12 form-group" hidden="">
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
    
    
    
    
    <!-- ash -->
    <script>
    
    function printOn() {
    	 document.body.innerHTML = document.querySelector('.modal').outerHTML;
        // Trigger print
        window.print();
        // Restore original content
        location.reload(); 
        
        /* const printBtn = document.getElementById('printbtn');
        printBtn.addEventListener('click', function() {
			print();
		}) */
	}
    
    function openModal(id) {
        var modal = document.getElementById('myModal');
        modal.style.display = 'block';
        
        
         $.ajax({
        	type:'POST',
        	url:'ViewWorkOrder',
        	data:{ id:id },
        	success: function(response){
        		//var result = JSON.parse(response);
        		console.log(response.a5);
        		
        		 $('#a').append(response.a1); 
        		 $('#b').append(response.a2); 
        		 $('#c').append(response.a3); 
        		 $('#d').append(response.a4); 
        		 $('#e').append(response.a5); 
        		 //$('#f').append(response.a6); 
        		 $('#f').append(response.a6); 
        		 $('#g').append(response.a7); 
        	},
        	error: function(xhr, status, error){
        		console.error(xhr.responseText);
        	}
        	
        }); 
        
        
        
       
       
        
        
        
    }
    
    function closeModal() {
        var modal = document.getElementById('myModal');
        modal.style.display = 'none';
        $('#a').empty(); 
		 $('#b').empty(); 
		 $('#c').empty(); 
		 $('#d').empty(); 
		 $('#e').empty(); 
		 //$('#f').empty(); 
		 $('#f').empty(); 
		 $('#g').empty(); 
    }
    
	 //Delete table data
	$(document).ready( function() {
	    $('.delete').click( function() {
	        // Your delete button logic here
	        
	        
	       var a = confirm('Are U Sure To Delete!');
	        if(a==true){
	        	var deleteId = $(this).val(); 
	        	//alert('Yes: ' + deleteId);
	        	
	        	$.ajax({
		        	type:'POST',
		        	url:'DeleteMainWorkOrderListById',
		        	data:{ id:deleteId },
		        	success: function(response){
		        		alert('Data with ID ' + response + ' Deleted successfully!');
		        		location.reload();
		        	},
		        	error: function(xhr, status, error){
		        		console.error(xhr.responseText);
		        	}
		        	
		        });
	        	
	        }else{
	        	alert('no')
	        }
	    });
	    
	    //model
	    
	    	  
	    	
	    
	    
	    
	});
    
    </script>
    
    
    
   
<jsp:include page="templates/footer.html" />
</body>