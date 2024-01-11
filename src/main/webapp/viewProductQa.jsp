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


<%!ResultSet rs,rq, data, data2, data3, data4, data5, re, selectData, rs2;
	ResultSetMetaData rsmd;
	Object ob;
	DataService sr1,ds1 ; 
	int x;
	Object aval, bval, unitid;
	int i = 0;
	ArrayList ar;
	JSONArray list;
	Iterator ity;
	Object o1;
	String gender;
	String S_tyep, seller_id;%>
<%
	//                    S_tyep=(String)session.getAttribute("S_tyep");
	//                    S_tyep="DryFruits Store";
	seller_id = (String) session.getAttribute("seller_id");
	String Fdate="",Tdate="",Cid="";
    Fdate=request.getParameter("Fdate");
    Tdate=request.getParameter("Tdate");
    Cid=request.getParameter("Cid");
    
    
    

	LocalDate today = LocalDate.now();
	System.out.println(today.toString());
	String to_date = today.plusDays(1).toString();
	System.out.println("to_date >" + to_date);
	String from_date = today.minusMonths(1).toString();
%>


<%!
     public String dateFormateChnge(String date){
//        convert dd/MM/yyyy to yyyy/MM/dd
        System.out.println("date >>>>" +date.length());
        if(date.length()==0){return "";}
        if(date!=null && date!=""){
        String datee[]=date.split("/");
        return datee[0]+"-"+datee[1]+"-"+datee[2];
        }
        return "";
    }
%>
<!-- page content -->
<div class="right_col" role="main">

	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3 style="color: black;">View Product</h3>
			</div>
			<div id="sidebar-menu" class="main_menu_side hidden-print main_menu"></div>
		</div>
		<div class="clearfix"></div>


		<div class="row">

			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<!-- <div class="x_title" style="background: #e8f1f3; width: 100%">
						<h2 style="color: black;">View Product</h2>

						<div class="clearfix"></div>
					</div> -->
					<div class="x_content">
					 <div class="x_title"  style="background: #e8f1f3; width: 100%">
                  
                  <form id="demo-form3" action="viewProductQa.jsp"  data-parsley-validate class="form-horizontal form-label-left" style="margin-top: 1%;">
             <table>
                 <tr>
                     <td>
                         <%
                            ds1= new DataService();
                            rs=ds1.Company_list();
                           %>
                        <select name="Cid" id="Cid" class="form-control selectCom">
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
		                        <div class="input-group date" data-date-format="dd/mm/yyyy">
									<input type="date-text" class="form-control" placeholder="dd/mm/yyyy"  id="Fdate" name="Fdate"  class="form-control " >
		                      		<div class="input-group-addon">
									<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
	                        </div>
                        <div class="col-xs-6">
		                        <div class="input-group date" data-date-format="dd/mm/yyyy">
									<input type="date-text" class="form-control" placeholder="dd/mm/yyyy"  id="Tdate" name="Tdate"  class="form-control " >
		                      		<div class="input-group-addon">
									<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
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
						<div class="text-right">

							<%
								try {
									sr1 = new DataService();
									rs2 = sr1.ProductFormulaByCFT(Fdate,Tdate,Cid);
									
									rsmd=rs2.getMetaData();
					                x=rsmd.getColumnCount();
							%>

							<input type="button" class="DTTT_button"
								onclick="tableToExcel('example', 'W3C Example Table')"
								value="Export to Excel">
						</div>
						<table id="example"
							class="table table-striped table-bordered responsive-utilities jambo_table  data-sort-order">
							<thead>
								<tr class="headings fix_back_color">
									<th>Sr no</th>
									<th>Date</th>
									<th>Product Code</th>
									<th>Product Name</th>
									<th>Company Name</th>
									<th>Version</th>
									<th class=" no-link last"><span class="nobr">Action</span></th>
								</tr>
							</thead>
							<%
								int i = 0, hu = 1;
									/* boolean t=data.next();
									 out.println(" t====================>"+t); */
									while (rs2.next()) {
							%>
							 <%--  <script type="text/javascript">
    				            alert("<%=rs2%>");							
    				            </script>
							<%
							
							%> --%>
							
							<tr id="<%=i%>">
								<td><%=i + 1%></td>
								<td><%=rs2.getObject(4)%></td>
								<td><%=rs2.getObject(3)%></td>
								<td><%=rs2.getObject(7)%></td>
								<td><%=rs2.getObject(9)%></td>
								<td><%=rs2.getObject(8)%></td>
								
								<td class=" last">

									<a href="createProductQaDetails.jsp?productId=<%=rs2.getObject(3)%>"><button value="<%=rs2.getObject(3)%>"
										class="info btn btn-info btn-xs btn_info">Details</button></a>
										
									<a href="createProductQaEdit.jsp?productId=<%=rs2.getObject(3)%>"><button class=" btn btn-success btn-xs " >Edit</button></a>
										
									<button value="<%=rs2.getObject(3)%>"
										class="delete btn btn-danger btn-xs btn_delete">Delete</button>
								</td>
							</tr>
							<%
								i++;
									}
							%>
						</table>
					</div>
				</div>
			</div>

		

			<br /> <br /> <br />
			</form>
			<div class="ln_solid"></div>
			<%--!    <div class="form-group">
                      <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <button type="submit" class="btn btn-primary">Cancel</button>
                        <button type="submit" class="btn btn-success">Submit</button>
                      </div>
                    </div>  --%>

			
			<%
				} catch (Exception y) {
				} finally {
					try {
						sr1.c.close();
					} catch (Exception y3) {
					}
				}
			%>
		</div>






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
        
        $('#Gid').find('option').remove().end().append('<option disabled=""  style="color:black;">Data</option>').val(' ');

    $.ajax({
        type: "POST",
        url:"getCustomer_GRNs_COMBO",
        data:{
               Cid:Cid
            },
        dataType:"json",
        success:function(data){
            $.each(data.aaData,function(i,data)
            {
//                var Pid=data.sr+"=>"+data.text;
            var div_data='<option value="'+data.text.split("=>")[0]+'" style="color:black;">'+data.sr+'</option>';
            $(div_data).appendTo('#Gid');
             }); 
            }
             
      });
     
    });
});
   </script>



		
		
		

		
	<script type="text/javascript">	
		 
          /*   
           $("document").ready(function(){  
            $(".btn_edit").click(function(){
                var tr_id = this.id;
                var valuee=this.value;
                //alert(tr_id);
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
                    
                  $("#productId").val(valuee);
                
                  
            }); */

		
			$(".btn_delete").click(
					function() {
						var result = confirm("want to delete?");
						var productId = $(this).val();
						//alert(productId);
						var task = "delete"
						if (result) {
							$("#spinner").show();
							$.ajax({
								type : "POST",
								url : "CreateProductFormulaServlet",
								data : {
									productId : productId,
									task : task
								},
								success : function(data) {
									$('#successMessage2').html(
											'Delete Sucessfully').delay(5000)
											.fadeOut();
									$('#successMassage2').show();
									alert("delete Successfully..!");
									$("#spinner").hide();
									location.reload();
								}
							});
							return false;
						}

					});
		</script>
		<jsp:include page="templates/footer.html" />