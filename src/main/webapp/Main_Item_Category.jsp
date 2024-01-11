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
	text-align: center
}
</style>
<%!ResultSet rq,data,data2,data3,data4,data5,re,selectData,rs2;
ResultSetMetaData rsmd;
Object ob;
DataService sr1;int x;Object aval,bval,unitid; 
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
    %>
<!-- page content -->
<div class="right_col" role="main">

	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3 style="color: black;">Item Category</h3>
			</div>
			<div id="sidebar-menu" class="main_menu_side hidden-print main_menu"></div>
		</div>
		<div class="clearfix"></div>


		<div class="row">

			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title" style="background: #e8f1f3; width: 100%">
						<h2 style="color: black;">Item Category</h2>

						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<div class="text-right">

							<span class="small"><a data-toggle="modal"
								data-target="#addModel" href="jvascript:void(0);"><button
										class="btn fix_back_color">Add Item Category</button></a></span>

							<%
                try{
                sr1=new DataService();
                rs2=sr1.Item_category_list();
                ArrayList rsa=new ArrayList();
                //data=sr1.viewUnitDetails(); 

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
									<!--<th >Item Category code</th>-->
									<!--<th>Itemcat code</th>-->
									<th>Name</th>
									<th>Description</th>
									<th>Code Start From</th>
									<th class=" no-link last"><span class="nobr">Action</span></th>
								</tr>
							</thead>
							<%int i=0,hu=1;
                      //boolean t=data.next();
                      // out.println(" t====================>"+t);
                       while(rs2.next()){%>
							<tr id="<%=i%>">
								<td><%=i+1%></td>
								<!--<td><%=rs2.getObject(1)%></td>-->
								<!--<td><%=rs2.getObject(2)%></td>-->
								<td><%=rs2.getObject(3)%></td>
								<td><%=rs2.getObject(4)%></td>
								<td><%=rs2.getObject(6)%></td>

								<td class=" last">
									<button class="btn btn-primary btn-xs btn_edit"
										data-toggle="modal" data-target="#unit_guard_details"
										value="<%=rs2.getObject(1)%>" id="<%=i%>" href="#">Edit
									</button>
									<%--

                                <!--<button class="btn btn-warning btn-xs" name="id_name" onclick="getId(this.id);" value="row_a<%=i-1%>" id="row_a<%=i-1%>">View Sub Units</button>-->
                               <%-- <a class="btn btn-warning btn-xs" href="view_subunit_details.jsp?unitid=<%=aval%>&unitname=<%=bval%>">View Sub Units</a>
                               --%>
									<button value="<%=rs2.getObject(1)%>"
										class="delete btn btn-danger btn-xs btn_delete">Delete</button>
									<!--                                    <a href="MAin_Customer_bills.jsp?Cid=<%=rs2.getObject(1)%>&name=<%=rs2.getObject(3)%>"><button class=" btn btn-warning btn-xs " >All Bills</button></a>
                                    <a href="MAin_Customer_Membership_cards_view.jsp?Cid=<%=rs2.getObject(1)%>&name=<%=rs2.getObject(3)%>"><button class=" btn btn-success btn-xs " >Memberships</button></a>-->
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


		<div class="modal fade edit_recruit_modal" id="unit_guard_details"
			tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close sub_unit_details_add_close"
							data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Edit Details</h4>
					</div>

					<form id="unit_details_add" action=""
						class="form-horizontal form-label-left">
						<div class="modal-body">
							<div id="successMessage2"
								class="col-md-12 alert alert-success successMessage2"
								style="display: none">
								<span>Item Category Details Updated successfully</span>
							</div>

							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">
									ID:<span class="required">*</span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input type="text" id="Iid" name="Iid" required="required"
										class="form-control col-md-7 col-xs-12" readonly="">
									<div id="err_C_Name" class="err-msg">Please enter Iid</div>
								</div>
							</div>


							<div class="col-md-12 form-group" hidden="">
								<label class="control-label">Itemcat Code</label> <input
									type="text" autocomplete="off" placeholder="Itemcat Code"
									id="code" name="code" required class="form-control"> <span
									class="help-block small err" id="err_Itemcat Code"
									style="display: none"></span>
							</div>

							<div class="col-md-12 form-group">
								<label class="control-label">Item Category Name</label>
								<textarea name="name" id="name" class="form-control"
									placeholder="Item Category Name" cols="30" rows="3"></textarea>
								<!--<input type="text" autocomplete="off"  placeholder="Enter Tax PErcent" id="tax_per" name="tax_per" required class="form-control">-->
								<span class="help-block small err" id="err_cust_ph_no"
									style="display: none"></span>
							</div>

							<div class="col-md-12 form-group">
								<label class="control-label">Item Description</label>
								<textarea name="desc" id="desc" class="form-control"
									placeholder="Item Category Description" cols="30" rows="3"></textarea>
								<!--<input type="text" autocomplete="off"  placeholder="Enter Tax PErcent" id="tax_per" name="tax_per" required class="form-control">-->
								<span class="help-block small err" id="err_cust_ph_no"
									style="display: none"></span>
							</div>

							<div class="col-md-12 form-group">
								<label class="control-label">Item Code Start From</label> <input
									type="text" autocomplete="off"
									placeholder="Item Code start from" id="serials_no_start_from1"
									name="serials_no_start_from1" required class="form-control">
								<span class="help-block small err" id="err_Itemcat Code"
									style="display: none"></span>
							</div>


							<div class="modal-footer">
								<button type="button"
									class="btn btn-default sub_unit_details_add_close"
									data-dismiss="modal" style="margin-bottom: 0;">Close</button>
								<button type="submit" class="btn btn-success ad_dtl_sbmt"
									onclick="edit()">Update</button>

							</div>
						</div>
					</form>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

		<div class="modal fade" id="addModel" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header modal-header-primary">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h3 style="display: inline">
							<i class="fa fa-plus m-r-5"></i> Add new Item Category
						</h3>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-md-12">
								<form class="form-horizontal" method="post" id="customer_form">
									<input type="hidden" name="hid_cust" id="hid_cust" value="N">

									<fieldset>
										<div class="col-md-12 form-group" hidden="">
											<label class="control-label">Itemcat Code</label> <input
												type="text" autocomplete="off" placeholder="Itemcat Code"
												id="cat_code" name="cat_code" required class="form-control">
											<span class="help-block small err" id="err_Itemcat Code"
												style="display: none"></span>
										</div>

										<div class="col-md-12 form-group">
											<label class="control-label">Item Category Name</label>
											<textarea name="cat_name" id="cat_name" class="form-control"
												placeholder="Item Category Name" cols="30" rows="3"></textarea>
											<!--<input type="text" autocomplete="off"  placeholder="Enter Tax PErcent" id="tax_per" name="tax_per" required class="form-control">-->
											<span class="help-block small err" id="err_cust_ph_no"
												style="display: none"></span>
										</div>

										<div class="col-md-12 form-group">
											<label class="control-label">Item Description</label>
											<textarea name="cat_desc" id="cat_desc" class="form-control"
												placeholder="Item Category Description" cols="30" rows="3"></textarea>
											<!--<input type="text" autocomplete="off"  placeholder="Enter Tax PErcent" id="tax_per" name="tax_per" required class="form-control">-->
											<span class="help-block small err" id="err_cust_ph_no"
												style="display: none"></span>
										</div>
										<div class="col-md-12 form-group">
											<label class="control-label">Item Code Start From</label> <input
												type="text" autocomplete="off"
												placeholder="Item Code start from"
												id="serials_no_start_from" name="serials_no_start_from"
												required class="form-control"> <span
												class="help-block small err" id="err_Itemcat Code"
												style="display: none"></span>
										</div>

										<div class="col-md-12 form-group user-form-group">
											<div class="pull-left">
												<button type="button" class="btn btn-danger btn-sm"
													data-dismiss="modal">Cancel</button>
												<button type="submit" name="add_cust" id="add_cust"
													value="add" class="btn btn-add btn-sm" onclick="add();">Add</button>
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

			//        $("document").ready(function(){
			//            alert('hello----------------------')
			//            $('form#unit_details_add').submit(function (){
			//                   alert('hello----------------------')
			function edit() {

				var Iid = $("#Iid").val();
				//                   alert("Iid==============>"+Iid);

				var name = $("#name").val();
				//  alert("Name==============>"+Name);serials_no_start_from1

				var desc = $("#desc").val();

				var code = $("#code").val();

				var serials_no_start_from = $("#serials_no_start_from1").val();

				var status = "edit";

				$("#spinner").show();
				$.ajax({
					type : "POST",
					url : "Item_Category_servlet",
					data : {
						sr_no : Iid,
						Name : name,
						code : code,
						desc : desc,
						status : status,
						serials_no_start_from : serials_no_start_from

					},
					success : function(data) {
						$('#successMessage2').html('Updated Succesfully')
								.delay(5000).fadeOut();
						$('#successMessage2').show();
						$("#spinner").hide();
						location.reload();
					}
				});
				return false;
			}
			//            });

			$("document")
					.ready(
							function() {
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

													$("#Iid").val(valuee);
													//                   $("#code").val(td[2].innerHTML);serials_no_start_from1
													$("#name").val(
															td[1].innerHTML);
													$("#desc").val(
															td[2].innerHTML);
													$("#serials_no_start_from1")
															.val(
																	td[3].innerHTML);

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
													var status = "delete"
													if (result) {
														$("#spinner").show();
														$
																.ajax({
																	type : "POST",
																	url : "Item_Category_servlet",
																	data : {
																		sr_no : id,
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

			function add() {
				//              alert("inn add function");
				var code = $("#cat_code").val();
				//              alert("cust_name >>"+cust_name);
				var Name = $("#cat_name").val();
				//              alert("cust_ph_no >>"+cust_ph_no);serials_no_start_from1
				var desc = $("#cat_desc").val();
				var serials_no_start_from = $("#serials_no_start_from").val();
				var status = "insert";
				$("#spinner").show();
				$
						.ajax({
							type : "POST",
							url : "Item_Category_servlet",
							data : {
								Name : Name,
								code : code,
								desc : desc,
								status : status,
								serials_no_start_from : serials_no_start_from
							},
							success : function(data) {
								//alert(data);
								$('#successMessage').html(
										'Data inserted successfully').delay(
										5000).fadeOut();
								$('#successMessage').show();
								$('#Supplier_succ').innerhtml = "Data inserted successfully";
								$("#spinner").hide();
								//                               data-dismiss="modal";
								location.reload();
							}
						});

			}
		</script>
		<jsp:include page="templates/footer.html" />