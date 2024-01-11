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
th {
	text-align: center
}

td {
	text-align: center;
	color: black;
}
</style>
<%!ResultSet rq, data, data2, data3, data4, data5, re, selectData, rs2;
	ResultSetMetaData rsmd;
	Object ob;
	DataService sr1;
	int x;
	Object aval, bval, unitid;
	int i = 0;
	ArrayList ar;
	JSONArray list;
	Iterator ity;
	Object o1;
	String gender;
	String S_tyep, seller_id;%>
<%!ResultSet rs;
	DataService ds1;%>
<%
	//                    S_tyep=(String)session.getAttribute("S_tyep");
	//                    S_tyep="DryFruits Store";
	seller_id = (String) session.getAttribute("seller_id");
%>
<!-- page content -->
<div class="right_col" role="main">

	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3 style="color: black;">Company View</h3>
			</div>
			<div id="sidebar-menu" class="main_menu_side hidden-print main_menu"></div>
		</div>
		<div class="clearfix"></div>


		<div class="row">

			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title" style="background: #e8f1f3; width: 100%">
						<h2 style="color: black;">ALL Companies View</h2>

						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<div class="text-right">
							<form id="demo-form3" action="Main_Add_Company_Master.jsp"
								data-parsley-validate class="form-horizontal form-label-left">



								<center>
									<button type="submit" class="btn  fix_back_color">+Company
										Form</button>

								</center>
							</form>



							<%
								try {
									sr1 = new DataService();
									rs2 = sr1.Company_list();
									ArrayList rsa = new ArrayList();
									//data=sr1.viewUnitDetails(); 

									rsmd = rs2.getMetaData();
									x = rsmd.getColumnCount();
							%>

							<input type="button" class="DTTT_button"
								onclick="tableToExcel('example', 'W3C Example Table')"
								value="Export to Excel">
						</div>
						<table id="example"
							class="table table-striped table-bordered responsive-utilities jambo_table  data-sort-order">
							<thead>
								<tr class="headings fix_back_color">
									<th>sr.</th>
									<th>Code</th>
									<th>Company Name</th>
									<th>Company type</th>
									<th>Short Name</th>
									<th>No OF Owner</th>
									<th>HO Address</th>
									<!--<th >Total Rate</th>-->
									<!--<th ></th>-->
									<th class=" no-link last"><span class="nobr">Action</span></th>
								</tr>
							</thead>
							<%
								int i = 0, hu = 1;
									//boolean t=data.next();
									// out.println(" t====================>"+t);
									while (rs2.next()) {
							%>
							<tr id="<%=i%>">
								<td><%=i + 1%></td>
								<td><%=rs2.getObject(2)%></td>
								<td><%=rs2.getString(3)%></td>
								<td><%=rs2.getObject(4)%></td>
								<td><%=rs2.getObject(5)%></td>
								<td><%=rs2.getObject(6)%></td>


								<td><%=rs2.getObject(7)%></td>


								<td class=" last"><a
									href="./Main_Edit_Company_Master.jsp?Cid=<%=rs2.getObject(1)%>"><button
											class="btn btn-primary btn-xs" value="<%=rs2.getObject(1)%>">Edit
										</button></a> <%--

                                <!--<button class="btn btn-warning btn-xs" name="id_name" onclick="getId(this.id);" value="row_a<%=i-1%>" id="row_a<%=i-1%>">View Sub Units</button>-->
                               <%-- <a class="btn btn-warning btn-xs" href="view_subunit_details.jsp?unitid=<%=aval%>&unitname=<%=bval%>">View Sub Units</a>
                               --%>

									<button value="<%=rs2.getObject(1)%>"
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

			<script>
				function getId(element) {
					var id_value = document.getElementById(element).value;

					return (id_value);
				}
			</script>

			<br /> <br /> <br />
			</form>
			<div class="ln_solid"></div>
			<%--!    <div class="form-group">
                      <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <button type="submit" class="btn btn-primary">Cancel</button>
                        <button type="submit" class="btn btn-success">Submit</button>
                      </div>
                    </div>  --%>

			<div id="successMessage"
				class="col-md-6 col-md-offset-3 alert alert-success"
				style="display: none"></div>
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


		<!--     <div class="modal fade edit_recruit_modal" id="unit_guard_details" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close sub_unit_details_add_close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title">Edit  Details</h4>
            </div>

                  <form id="unit_details_add"  action="" class="form-horizontal form-label-left">
            <div class="modal-body">
                <div id="successMessage2" class="col-md-12 alert alert-success successMessage2" style="display:none">
                    <span> Details Updated successfully</span>
                </div>              
                        
                <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12"> ID:<span class="required">*</span></label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="id" name="id" required="required" class="form-control col-md-7 col-xs-12" readonly="">
                        <div id="err_C_Name" class="err-msg">Please enter od</div>
                      </div>
                   </div>
                
                
                <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12"> Material Name:<span class="required">*</span></label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="name" name="name" required="required" class="form-control col-md-7 col-xs-12">
                        <div id="err_c_id" class="err-msg">Please enter Material name</div>
                      </div>
                   </div>
                
                
               <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">Unit.:<span class="required">*</span></label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="unit" name="unit" required="required" class="form-control col-md-7 col-xs-12">
                          <select class="form-control col-md-7 col-xs-12 input-field select2"  placeholder="UNIT name" id="unit" name="unit">
                           
                          </select>
                        <div id="err_Name" class="err-msg">Please enter Unit</div>
                      </div>
                   </div>
                
                 <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">Material Type.:<span class="required">*</span></label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="type" name="type" required="required" class="form-control col-md-7 col-xs-12">
                          <select class="form-control col-md-7 col-xs-12 input-field select2"  placeholder="SElect Material type" id="type" name="type">
                        
                    </select>
                        <div id="err_Name" class="err-msg">Please enter type</div>
                      </div>
                   </div>
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">Basic Rate :<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="basic_rate" name="basic_rate" required="required" class="form-control col-md-7 col-xs-12" onkeyup="calculate()" >
                        <div id="err_Gate_Pass" class="err-msg">Please enter role</div>
                      </div>
                    </div>
                      
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">GST:<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="gst" name="gst" required="required" class="form-control col-md-7 col-xs-12"  onkeyup="calculate()">
                    <div id="err_PF_No" class="err-msg">Please enter GST</div>
                      </div>
                    </div>
                
                <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">Total Rate<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="total_rate" name="total_rate" required="required" class="form-control col-md-7 col-xs-12" readonly="" >
                    <div id="err_PF_No" class="err-msg">Please enter total_rate</div>
                      </div>
                    </div>
                
                      
                  
                     
                    
            <div class="modal-footer">
              <button type="button" class="btn btn-default sub_unit_details_add_close" data-dismiss="modal" style="margin-bottom: 0;">Close</button>
              <button type="submit" class="btn btn-success ad_dtl_sbmt">Update </button>

            </div>
            </div>
            </form>
          </div> /.modal-content 
        </div> /.modal-dialog 
    </div> /.modal -->


		<script>
			function printDiv() {

				var divToPrint = document.getElementById('unit_details_add');

				var newWin = window.open('', 'Print-Window');

				newWin.document.open();

				newWin.document.write('<html><body onload="window.print()">'
						+ divToPrint.innerHTML + '</body></html>');

				newWin.document.close();

				setTimeout(function() {
					newWin.close();
				}, 10);

			}

			$("document")
					.ready(
							function() {
								// alert('hello----------------------')
								var validationArrayRewardval;
								$('form#unit_details_add')
										.submit(
												function() {
													// alert('hello----------------------')
													var error_text = 0;
													validationArrayRewardval = [];
													$(".err-msg").hide();

													var id = $(this)
															.find("#id").val();
													//                   alert("P_id==============>"+P_id);
													if (id == '') {
														$("#err_id").show();
														validationArrayRewardval
																.push('id');
														error_text = 1;
													}

													var name = $(this).find(
															"#name").val();
													//  alert("Name==============>"+Name);
													if (name == '') {
														$("#err_name").show();
														validationArrayRewardval
																.push('name');
														error_text = 1;
													}

													var unit = $(this).find(
															"#unit").val();
													//  alert("Name==============>"+Name);
													if (unit == '') {
														$("#err_unit").show();
														validationArrayRewardval
																.push('unit');
														error_text = 1;
													}

													var type = $(this).find(
															"#type").val();
													//  alert("Name==============>"+Name);
													if (type == '') {
														$("#err_type").show();
														validationArrayRewardval
																.push('type');
														error_text = 1;
													}

													var basic_rate = $(this)
															.find("#basic_rate")
															.val();
													// alert("Gate_Pass==============>"+Gate_Pass);
													if (basic_rate == '') {
														$("#err_basic_rate")
																.show();
														validationArrayRewardval
																.push('basic_rate');
														error_text = 1;
													}
													var gst = $(this).find(
															"#gst").val();
													if (gst == '') {
														$("#err_gst").show();
														validationArrayRewardval
																.push('gst');
														error_text = 1;
													}

													var total_rate = $(this)
															.find("#total_rate")
															.val();

													if (error_text == 1) {
														$(
																"#"
																		+ validationArrayRewardval[0])
																.focus();
														return false;
													} else {
														$("#spinner").show();
														$
																.ajax({
																	type : "POST",
																	url : "Edit_Materials",
																	data : {
																		id : id,
																		name : name,
																		unit : unit,
																		type : type,
																		basic_rate : basic_rate,
																		gst : gst,
																		total_rate : total_rate,
																		status : "edit"
																	},
																	success : function(
																			data) {
																		$(
																				'#successMessage2')
																				.html(
																						'Updated Succesfully')
																				.delay(
																						5000)
																				.fadeOut();
																		$(
																				'#successMessage2')
																				.show();
																		$(
																				"#spinner")
																				.hide();
																		location
																				.reload();
																	}
																});
														return false;
													}
												});

								$(".btn_edit")
										.click(
												function() {
													var tr_id = this.id;
													var valuee = this.value;
													//alert(tr_id);
													var tr = document
															.getElementById(tr_id);
													var td = tr
															.getElementsByTagName("td");
													$("#unitid option")
															.each(
																	function() {
																		if ($(
																				this)
																				.html() == td[0].innerHTML) {
																			$(
																					this)
																					.attr(
																							"selected",
																							"selected");
																			return;
																		}
																	});
													//  $("#Designation").val(td[0].innerHTML);
													//  alert(td[0]);

													$("#id").val(valuee);
													$("#name").val(
															td[1].innerHTML);
													$("#unit").val(
															td[2].innerHTML);
													$("#type").val(
															td[3].innerHTML);
													$("#basic_rate")
															.val(
																	td[4].innerHTML
																			.split(" ")[0]);
													$("#gst").val(
															td[5].innerHTML);
													$("#total_rate")
															.val(
																	td[6].innerHTML
																			.split(" ")[0]);
													//                   $("#datee").val(td[6].innerHTML);

												});

								$(".UnEmployed")
										.click(
												function() {
													var result = confirm("change to UnEmployed?");
													var id = $(this).val();//alert(deleteid);
													var status = "UnEmployed"
													if (result) {
														$
																.ajax({
																	type : "POST",
																	url : "Employee_status_chnge",
																	data : {
																		id : id,
																		status : status
																	},
																	success : function(
																			data) {
																		$(
																				'#successMessage2')
																				.html(
																						'Changed stock')
																				.delay(
																						5000)
																				.fadeOut();
																		$(
																				'#successMassage2')
																				.show();
																		alert("Update Successfully");
																		location
																				.reload();
																	}
																});
														return false;
													}

												});

								$(".Employed")
										.click(
												function() {
													var result = confirm("change to Employed?");
													var id = $(this).val();//alert(deleteid);
													var status = "Employed"
													if (result) {
														$
																.ajax({
																	type : "POST",
																	url : "Employee_status_chnge",
																	data : {
																		id : id,
																		status : status
																	},
																	success : function(
																			data) {
																		$(
																				'#successMessage2')
																				.html(
																						'Changed stock')
																				.delay(
																						5000)
																				.fadeOut();
																		$(
																				'#successMassage2')
																				.show();
																		alert("Update Successfully");
																		location
																				.reload();
																	}
																});
														return false;
													}
												});

								$(".delete")
										.click(
												function() {
													var result = confirm("want to delete?");
													var id = $(this).val();//alert(deleteid);
													var status = "delete";
													if (result) {
														$("#spinner").show();
														$
																.ajax({
																	type : "POST",
																	url : "Edit_Company",
																	data : {
																		id : id,
																		status : status
																	},
																	success : function(
																			data) {
																		$(
																				'#successMessage2')
																				.html(
																						'Delete Sucessfully')
																				.delay(
																						5000)
																				.fadeOut();
																		$(
																				'#successMassage2')
																				.show();
																		alert("delete Successfully");
																		$(
																				"#spinner")
																				.hide();
																		location
																				.reload();
																	}
																});
														return false;
													}

												});

							});

			function calculate() {
				//              alert("in calculate");
				var basic = document.getElementById("basic_rate").value;
				var gst = document.getElementById("gst").value;

				var total_rate = (Number(basic) / 100) * Number(gst);
				document.getElementById("total_rate").value = Number(total_rate)
						+ Number(basic);
			}
		</script>
		<jsp:include page="templates/footer.html" />