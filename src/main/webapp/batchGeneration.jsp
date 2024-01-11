<%@page import="bean.impMethods"%>
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

<%!ResultSet rs, rq, data, data2, data3, data4, data5, re, selectData, rs2;
	ResultSetMetaData rsmd;
	Object ob;
	DataService sr1, ds1;
	int x;
	Object aval, bval, unitid;
	int i = 0;
	ArrayList ar;
	JSONArray list;
	Iterator ity;
	Object o1;
	String gender;
	String S_tyep, seller_id;
	impMethods impmethods;%>
<%
//                    S_tyep=(String)session.getAttribute("S_tyep");
//                    S_tyep="DryFruits Store";
seller_id = (String) session.getAttribute("seller_id");

//                   LocalDate today = LocalDate.now();
//                    System.out.println(today.toString());  
//                    String to_date=today.plusDays(1).toString();
//                    System.out.println("to_date >"+to_date);
//                    String from_date=today.minusMonths(1).toString();

String Fdate = "", Tdate = "", Cid = "";
Fdate = request.getParameter("Fdate");
Tdate = request.getParameter("Tdate");
Cid = request.getParameter("Cid");
%>

<%!public String dateFormateChnge(String date) {
		//        convert dd/MM/yyyy to yyyy/MM/dd
		System.out.println("date >>>>" + date.length());
		if (date.length() == 0) {
			return "";
		}
		if (date != null && date != "") {
			String datee[] = date.split("-");
			return datee[2] + "/" + datee[1] + "/" + datee[0];
		}
		return "";
	}%>
<style>
.required {
	color: red;
}

.ui-autocomplete-loading {
	background: white url("assets/dist/img/ui-anim_basic_16x16.gif") right
		center no-repeat;
}

.lobipanel {
	margin-bottom: 25px;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.6), 0 3px 6px rgba(0, 0, 0, 0.23);
}

div.b {
	position: absolute;
	right: 0;
	top: 0;
}

.try_it3 {
	font-family: inherit;
	font-size: inherit;
	line-height: inherit;
	width: 108px;
	border-radius: 5px;
}

.try_it {
	width: 20px;
}

.try_it2 {
	width: 80px;
}

.table-box {
	justify-content: end;
}

.form-main-table, th {
	border: 1px solid #333;
}

.form-main-table {
	/*    margin-left: 13%;*/
	width: 80%;
	float: right;
	text-transform: capitalize;
	border-collapse: collapse;
}

address {
	display: inline;
}

.address h1 {
	text-align: center;
	font-size: 28px;
	text-decoration: underline;
}

td {
	padding: 4px;
	width: 8%;
}

th h3 {
	margin: 4px 0px;
}

th h3 span {
	text-transform: none;
}

th h3 code {
	font-size: 16px;
}

th {
	text-align: left;
	padding-left: 8px;
}

th>h1 {
	text-transform: uppercase;
	font-size: 16px;
}

th div {
	font-weight: bold;
	font-family: arial;
	display: inline-block;
	font-size: 15px;
}

.head-services, .head-invoice {
	text-align: center;
	margin: 8px;
}

.head-invoice h1 {
	margin: 8px 0px;
}

.table-input {
	display: inline-block;
	width: 10%;
}

.inner-table, .inner-table-2 {
	border-collapse: collapse;
	width: 100%;
}

.inner-table td, .inner-table-2 td {
	border: 1px solid #333;
	font-size: 15px;
	text-transform: capitalize;
	padding: 4px 8px;
}

.inner-table input, .work-input {
	margin: -8px;
	height: 18px;
	width: 100%;
	padding: 4px;
	padding-right: 2%;
	font-size: 15px;
}

.inner-table input[type="text"] {
	background-color: #99999918;
	border: 0px;
}

.work-input {
	padding-right: 1% !important;
}

.inner-table-2 th {
	font-size: 15px;
	text-transform: uppercase;
}

.inner-table-2 thead {
	background-color: rgba(128, 128, 128, 0.356);
}

.inner-table-2 input {
	width: 100%;
	margin: -8px -4px;
	height: 22px;
	background-color: rgba(128, 128, 128, 0.13);
	font-size: 15px;
	border: 0px;
}

.inner-table-2 td {
	padding: 4px;
	padding-right: 0px;
}

.condition {
	text-align: center;
	font-size: 24px;
}

.sign {
	vertical-align: baseline;
}

.sign div {
	margin-top: 40%;
}

td b {
	font-size: 14px;
}

.logo {
	width: 25%;
	padding: 0px
}

.logo img {
	width: 280px;
	height: 200px;
}

.DTTT_button {
	margin-left: 59%;
	font-size: 2.3rem;
	margin-bottom: 8px;
}

/* javascript */
.add, .cut {
	border-width: 1px;
	display: block;
	font-size: .8rem;
	padding: 0.25em 1.5em;
	float: left;
	text-align: center;
	width: 0.6em;
}

.add, .cut {
	background: #9AF;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
	background-image: -moz-linear-gradient(#00ADEE 5%, #0078A5 100%);
	background-image: -webkit-linear-gradient(#00ADEE 5%, #0078A5 100%);
	border-radius: 0.5em;
	border-color: #0076A3;
	color: #FFF;
	cursor: pointer;
	font-weight: bold;
	text-shadow: 0 -1px 2px rgba(0, 0, 0, 0.333);
}

.add {
	margin: -2.5em 0 0;
}

.add:hover {
	background: #00ADEE;
}

.cut {
	opacity: 0; /
	position: absolute; /
	top: 0;
	left: -1.5em;
}

.cut {
	-webkit-transition: opacity 100ms ease-in;
}

tr:hover .cut {
	opacity: 1;
}
</style>
<div class="right_col" role="main">
	<div class="">

		<div class="content-wrapper">
			<!-- Main content -->
			<section class="content lobipanel">
				<div class="row">
					<div class="col-sm-12">
						<div class="panel panel-bd lobidrag">
							<div class="panel-heading" id="pa"
								style="background-color: #e8f1f3; border-bottom: black">
								<div class="btn-group" id="buttonexport">
									<a href="javascript:void(0)">
										<h4>Create Batch</h4>
									</a>
								</div>
							</div>
							<div class="panel-body" class="row"
								style="background-color: #ffffff;">

								<div class="btn-group">
									<div class="buttonexport">
										<a class="btn btn-add" onclick="history.back()"> Back </a>
									</div>
								</div>
								<div class="form-group" style="float: right">
									<h5>Version:V1</h5>
								</div>

								<form class="form-horizontal " id="demo-form3" method="post">
									<input type="hidden" name="hid_item" id="hid_item" value="">
									<input type="hidden" name="hid_pur_item" id="hid_pur_item"
										value="0"> <input type="hidden"
										name="hid_item_old_unit" id="hid_item_old_unit" value="">
									<input type="hidden" name="hid_inv_tax_type"
										id="hid_inv_tax_type" value="local"> <input
										type="hidden" name="hid_cust_id" id="hid_cust_id" value="">
									<input type="hidden" name="hid_tax_id" id="hid_tax_id"
										data-val="0.00" value="7"> <input type="hidden"
										name="hid_test_inv" id="hid_test_inv" value="N">
									<div class="row">
										<div class="col-md-12">
											<div class="alert alert-danger" id="err"
												style="display: none">
												Exercise name with same time Already exist<a href="#"
													class="close" data-dismiss="alert" aria-label="close">&times;</a>
											</div>
											<div id="info"></div>


											<div class="form-group">
												<label for="date" class="col-sm-2 control-label">Company
													: <span class="required">*</span>
												</label>
												<div class="col-sm-4">
													<%
													ds1 = new DataService();
													rs = ds1.Company_list();
													%>
													<select name="select_company" id="select_company"
														class="select2 select2_single form-control">
														<!--<optgroup label="select tax">-->
														<optgroup label="">
															<option value="">-- Select Company --</option>
															<%
															while (rs.next()) {
																Object ven = rs.getString(2);
																Object ven2 = rs.getString(3);
															%>
															<option value="<%=ven%>"><%=ven2%></option>
															<%
															}
															%>
														</optgroup>
														<!--</optgroup>-->
													</select> <span id="err_item_color" style="color: red;"></span> <span
														id="err_inv_date" style="color: red;"></span>
												</div>


												<label for="cust_id" id="cust_id_label"
													class="col-sm-2 control-label">Batch No : <span
													class="required">*</span></label>
												<div class="col-sm-4">

													<%
													impmethods = new impMethods();
													String BatchNo = impmethods.BacthIdWiseBacthNo();
													System.out.print("BatchNo>>" + BatchNo);
													%>

													<input name="batchno" required type="text"
														class="form-control" id="batchno" value="<%=BatchNo%>">
													<span id="err_cust_no" style="color: red;"></span>
													<!--<span class="small"><a data-toggle="modal" data-target="#adduser" href="jvascript:void(0);">Add new customer</a></span>-->
													<!--<span id="err_cust_id" style="color: red;"></span>-->
												</div>



											</div>
											<div class="form-group">
												<!--product code-->
												<label for="month" class="col-sm-2 control-label">Product
													code: <span class="required">*</span>
												</label>

												<div class="col-sm-4">
													<select name="productcode" id="productcode"
														class="select2 select2_single form-control" onchange="">
														<!--<optgroup label="select tax">-->
														<option value="">-- Select --</option>

														<!--</optgroup>-->
													</select> <span id="err_item_color" style="color: red;"></span>
												</div>
												<label for="month" class="col-sm-2 control-label">Version:
													<span class="required">*</span>
												</label>
												<div class="col-sm-4">
													<input name="version" required type="text"
														class="form-control" id="version"> <span
														id="err_cust_id" style="color: red;"></span>
												</div>


											</div>

											<div class="form-group">
												<label for="date" class="col-sm-2 control-label">
													Manufacturing Date : <span class="required">*</span>
												</label>
												<div class="col-sm-4">

													<div class="input-group date" data-date-format="dd/mm/yyyy">
														<input type="date-text" class="form-control"
															placeholder="dd/mm/yyyy" name="mfg_date" id="mfg_date"
															required>
														<div class="input-group-addon">
															<span class="glyphicon glyphicon-th"></span>
														</div>
													</div>
													<!--<span class="small"><a data-toggle="modal" data-target="#adduser" href="jvascript:void(0);">Add new customer</a></span>-->
													<!--<span id="err_cust_id" style="color: red;"></span>-->
												</div>

												<label for="cust_id" id="cust_id_label"
													class="col-sm-2 control-label">Batch size(Kg's) : <span
													class="required">*</span></label>
												<div class="col-sm-4">

													<input name="batchsizeinkg" required type="text"
														class="form-control" id="batchsizeinkg"> <span
														id="err_cust_id" style="color: red;"></span>
												</div>

											</div>

											<label for="date" class="col-sm-2 control-label">
												Expiry Date : <span class="required">*</span>
											</label>
											<div class="col-sm-4">

													<div class="input-group date" data-date-format="dd/mm/yyyy">
														<input type="date-text" class="form-control"
															placeholder="dd/mm/yyyy" name="exp_date" id="exp_date"
															required>
														<div class="input-group-addon">
															<span class="glyphicon glyphicon-th"></span>
														</div>
													</div>
													<!--<span class="small"><a data-toggle="modal" data-target="#adduser" href="jvascript:void(0);">Add new customer</a></span>-->
													<!--<span id="err_cust_id" style="color: red;"></span>-->
												</div>
											

											<div class="form-group">
												<!--product name -->
												<label for="cust_id" id="cust_id_label"
													class="col-sm-2 control-label">Product Name: <span
													class="required">*</span>
												</label>
												<div class="col-sm-4">

													<input name="productname" required type="text"
														class="form-control" id="productname"> <span
														id="err_cust_id" style="color: red;"></span>
												</div>
												<label for="cust_id" id="cust_id_label"
													class="col-sm-2 control-label">Batch size(No's) : <span
													class="required">*</span></label>
												<div class="col-sm-4">

													<input name="batchsizeinno" required type="text"
														class="form-control" id="batchsizeinno"> <span
														id="err_cust_id" style="color: red;"></span>
												</div>
											</div>


											<div class="form-group"></div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-12"
											style="height: 400px; overflow-x: scroll; overflow-y: scroll">

											<table class="inner-table-2 inventory" id="mytable">
												<thead>
													<tr>

														<!-- <th style="width: 21%; text-align: center">...</th> -->
														<th>ITEM CODE</th>
														<th>ITEM NAME</th>
														<th>UNIT</th>
														<th>QTY</th>
														<th>CIMS_Batch_no</th>
														<!-- 	//<th>Batch_Expiry</th> -->
													</tr>
												</thead>
												<tbody id="tablebody">

												</tbody>

											</table>
										</div>
									</div>
									<br>

									<div class="row">
										<div class="form-group">
											<div class="col-sm-2"></div>
											<div class="col-sm-10">
												<div class="progress progress-lg progress-tab"
													style="display: none;">
													<div role="progressbar" aria-valuenow="50"
														aria-valuemin="0" aria-valuemax="100" style="width: 0%;"
														class="progress-bar progress-tab-bar progress-bar-accent progress-bar-striped active">
														<span class="sr-only progress-tab-val "
															style="position: relative;">0%</span>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div id="successMessage"
										class="col-md-6 col-md-offset-3 alert alert-success"
										style="display: none;"></div>



									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<div class="col-sm-12 text-center">
													<button type="submit" value="save"
														class="btn btn-success addButton ">Add</button>
													<a href="" class="btn btn-primary">Print</a>
													<div id="output3" style=""></div>
												</div>
											</div>
										</div>
									</div>

								</form>

							</div>
						</div>
					</div>
				</div>

			</section>
			<!-- /.content -->
		</div>
	</div>

</div>
<jsp:include page="templates/footer.html" />

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						function fetchProductCodes(selectedCompany) {
							// Make an AJAX request to fetch product codes
							$
									.ajax({
										type : "POST",
										url : "GetData",
										data : {

											Cid : selectedCompany
										},
										dataType : "json",
										success : function(response) {
											$("#productcode").empty();
											$("#productcode")
													.append(
															'<option value="">--------Select Product Code-------</option>');

											$
													.each(
															response.Data,
															function(index,
																	item) {
																$(
																		"#productcode")
																		.append(
																				'<option value="' + item.proId + '">'
																						+ item.proId
																						+ "-"
																						+ item.productName
																						+ '</option>');
															});
										},
										error : function() {
											alert("Error fetching product codes.");
										}
									});
						}

						$("#select_company").on('change', function() {
							var selectedCompany = $(this).val();
							fetchProductCodes(selectedCompany);
						});
					});
</script>

<script type="text/javascript">
	$(document).ready(
			function() {

				function fetchFieldsByProductCode(selectedProductCode) {
					// Make an AJAX request to fetch product codes

					$.ajax({
						type : "POST",
						url : "GetDataByProductCode",
						data : {

							Pid : selectedProductCode
						},
						dataType : "json",
						success : function(response) {
							//alert(response);
							//$("#version").empty();
							$.each(response.Data, function(index, item) {

								/* $("#version").append(
										'<option value="' + item.version + '">'
												+ item.version + '</option>'); */
							    $("#version").val(item.version);				
								$("#batchsizeinno").val(item.batchSizeNo);
								$("#batchsizeinkg").val(item.batchSizeKg);
								$("#productname").val(item.productName);
							});
						},
						error : function() {
							alert("Error fetching product codes.");
						}
					});
				}

				$("#productcode").on('change', function() {
					var selectedProductCode = $(this).val();
					//alert(selectedProductCode);
					fetchFieldsByProductCode(selectedProductCode);
				});
			});
</script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						function fetchItemsByProductCode(selectedProductCode) {
							//alert("hello");
							// Make an AJAX request to fetch product codes
							$
									.ajax({
										type : "POST",
										url : "getItemByProductCode",
										data : {
											Pid : selectedProductCode
										},
										dataType : "json",
										success : function(response) {
											$("#tablebody").empty();
											var itemBatches = {}; // Store item batches grouped by item_id

											// Group batches by item_id
											$
													.each(
															response.Data,
															function(index,
																	item) {
																if (!itemBatches[item.itemId]) {
																	itemBatches[item.itemId] = [];
																}
																itemBatches[item.itemId]
																		.push(item);
															});

											$
													.each(
															itemBatches,
															function(itemId,
																	batches) {
																var tableData = '<tr>';
																tableData += '<td class="item-id">'
																		+ itemId
																		+ '</td>';
																tableData += '<td class="item-name">'
																		+ batches[0].iName
																		+ '</td>';
																tableData += '<td class="item-unit">'
																		+ batches[0].unit
																		+ '</td>';
																tableData += '<td class="item-qty">'
																		+ batches[0].itemQty
																		+ '</td>';
																tableData += '<td class="batch-number">';
																tableData += '<select class="batchNumberDropdown" data-item-id="' + itemId + '" name="batchNumber">';
																tableData += '<option value="">Select a batch</option>';

																// Add options for each batch related to the item
																$
																		.each(
																				batches,
																				function(
																						index,
																						batch) {
																					tableData += '<option value="' + batch.CIMS_batch_no + '">'
																							+ batch.CIMS_batch_no
																							+ '------'
																							+ batch.expiry_date
																							+ '------'
																							+ batch.RELEASED_QTY
																					'</option>';
																				});

																tableData += '</select>';
																tableData += '</td>';
																tableData += '</tr>';

																$("#tablebody")
																		.append(
																				tableData);
															});

										},
										error : function() {
											alert("Error fetching items.");
										}
									});
						}

						$("#productcode").on('change', function() {
							var selectedProductCode = $(this).val();
							fetchItemsByProductCode(selectedProductCode);
						});

						$("#tablebody").on('change', '.batchNumberDropdown',
								function() {
									var selectedValue = $(this).val();
									alert("Selected Value: " + selectedValue);
									// You can perform further actions with the selected value
								});

					});
</script>


<script type="text/javascript">
	$('.addButton')
			.click(
					function() {
						var select_company = document
								.getElementById("select_company").value;
						var productcode = document
								.getElementById("productcode").value;

						var table = document.getElementById("mytable");
						var data = [];

						// Iterate through table rows (skipping the header row)
						for (var i = 1; i < table.rows.length; i++) {
							var row = table.rows[i];
							var itemId = row.cells[0].textContent;
							var iName = row.cells[1].textContent;
							var itemQty = row.cells[2].textContent;
							var unit = row.cells[3].textContent;

							// Find the selected value of the '.batchNumberDropdown' in this row
							var selectedValue = $(row).find(
									'.batchNumberDropdown').val();

							// Create a rowData object with the selected value as 'CIMS_batch_no'
							var rowData = {
								"itemId" : itemId,
								"iName" : iName,
								"itemQty" : itemQty,
								"unit" : unit,
								"CIMS_batch_no" : selectedValue
							};

							data.push(rowData);
						}

						// Convert the data array to JSON
						var jsonData = JSON.stringify(data, null, 4);

						if (select_company != null && productcode != null) {

							$.ajax({
								method : "POST",
								url : "saveBatches",
								cache : false,
								data : {
									cid : $("#select_company option:selected")
											.val().trim(),
									batchno : $("#batchno").val().trim(),
									productname : $("#productname").val()
											.trim(),
									version : $("#version option:selected")
											.val().trim(),
									Date : $("#mfg_date").val().trim(),
									expdate : $("#exp_date").val().trim(),
									batchsizeinkg : $("#batchsizeinkg").val()
											.trim(),
									productcode : $(
											"#productcode option:selected")
											.val().trim(),
									batchsizeinno : $("#batchsizeinno").val()
											.trim(),
									obj : jsonData

								},
								success : function(data) {
									alert("Data inserted successfully...")

									$('#successMessage').html(
											'Data inserted successfully')
											.delay(5000);
									$('#successMessage').show();
									$("#spinner").hide();
									location.reload();

								}
							});
							return false;
						} else {
							alert("plase fill required fillds");
						}
					});
</script>

