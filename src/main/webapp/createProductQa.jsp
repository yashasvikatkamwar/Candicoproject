<%@page import="bean.impMethods"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
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
// 		System.out.println("" + uname);

	} else {
		response.sendRedirect("/login.jsp");
	}
%>
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
	opacity: 0;
	/*position: absolute;*/
	top: 0;
	left: -1.5em;
}

.cut {
	-webkit-transition: opacity 100ms ease-in;
}

.cut {
	opacity: 1;
}
</style>

<%!ResultSet rs, rq, data, data2, data3, data4, data5, re, selectData, rs2;
	ResultSetMetaData rsmd;
	Object ob;
	DataService sr1, ds1;
	int x;
	Object aval, bval, unitid;
	int i = 0;
	JSONArray list;
	Object o1;
	String gender;
	String S_tyep, seller_id;
	impMethods impmethods;%>

<div class="right_col" role="main">
	<div class="">

		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<!--            <section class="content-header">
               <div class="header-icon">
                  <i class="fa fa-sticky-note-o"></i>
               </div>
               <div class="header-title">
                  <h1>Add Purchase Order Register</h1>
                  <br>
               </div>
            </section>-->

			<!-- Main content -->
			<section class="content lobipanel">
				<div class="row">
					<div class="col-sm-12">
						<div class="panel panel-bd lobidrag">
							<div class="panel-heading" id="pa"
								style="background-color: #e8f1f3; border-bottom: black">
								<div class="btn-group" id="buttonexport">
									<a href="javascript:void(0)">
										<h4>Create New Product</h4>
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
									<div class="buttonexport">
										<lable> <b>Version:</b> <span class="version"
											id="version">V1</span></lable>
									</div>
								</div>

								<form class="form-horizontal " id="demo-form3"  method="post">
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
												<label for="cust_id" id="cust_id_label"
													class="col-sm-2 control-label">Company : <span
													class="required">*</span></label>
												<div class="col-sm-4">

													<select name="com" id="com" class="form-control select2"
														>
														<optgroup label="">
															<option value="">-- Select --</option>
															<%
																sr1 = new DataService();
																rs2 = sr1.Company_list();
																while (rs2.next()) {
																	String companyDetails = rs2.getString(2);
															%>
															<option value="<%=companyDetails%>"><%=rs2.getString(3) + "(" + rs2.getString(2) + ")"%></option>
															<%
																}
															%>
														</optgroup>
													</select>
													<!--<span class="small"><a data-toggle="modal" data-target="#adduser" href="jvascript:void(0);">Add new customer</a></span>-->
													<span id="err_cust_id" style="color: red;"></span>
												</div>

												<label for="" id=""
													class="col-sm-2 control-label">Product Code : <span
													class="required">*</span></label>
												<div class="col-sm-4">

													<%
														impmethods = new impMethods();
														String productId = impmethods.productDateWiseProductId();
														System.out.print("productId>>" + productId);
													%>

													<input autocomplete="off" name="productId" required type="text"
														class="form-control" id="productId" value="<%=productId%>">
													<span id="err_productId" style="color: red;"></span>
												</div>
											</div>
											<div class="form-group">
												<label for="date" class="col-sm-2 control-label">Date
													: <span class="required">*</span>
												</label>
												<div class="col-sm-4">
													<!--<body onload="addDate();"/>-->
													<!--<input  autocomplete="off"   name="Date" required type="date"  class="form-control" id="Date">-->
													<div class="input-group date" data-date-format="dd/mm/yyyy">

														<%
															impmethods = new impMethods();
															String date = impmethods.todaysDate();
															System.out.print("date>>" + date);
														%>
														<input type="date-text" class="form-control"
															placeholder="dd/mm/yyyy" name="date" id="date"
															value="<%=date%>" required>
														<div class="input-group-addon">
															<span class="glyphicon glyphicon-th"></span>
														</div>
													</div>
													<span id="err_inv_date" style="color: red;"></span>
												</div>

												<label for="month" class="col-sm-2 control-label">Batch
													Size(Kg's) : <span class="required">*</span>
												</label>

												<div class="col-sm-4">
													<input autocomplete="off" name="batchKg" required
														type="text" class="form-control" id="batchKg">
													<span id="err_batchKg" style="color: red;"></span>
												</div>
											</div>
											</div>
                                                                                                                                                                                                <div class="form-group">
												<label for="version2"
													class="col-sm-2 control-label">Version : <span
													class="required">*</span></label>
												<div class="col-sm-4">

													<input autocomplete="off" name="version2" required
														type="text" class="form-control" id="version2">
													<span id="err_version" style="color: red;"></span>

												</div>                                                                                                                                      <label for="month" class="col-sm-2 control-label">Batch
													Size(No's) : <span class="required">*</span>
												</label>

												<div class="col-sm-4">
													<input autocomplete="off" name="batchNo" required
														type="text" class="form-control" id="batchNo">
													<span id="err_batchNo" style="color: red;"></span>
												</div>
											
											
											

											<div class="form-group">
												<label for="cust_id" id="cust_id_label"
													class="col-sm-2 control-label">Product Name : <span
													class="required">*</span></label>
												<div class="col-sm-4">
													<input autocomplete="off" name="productName" required
														type="text" class="form-control" id="productName">
													<span id="err_product_name" style="color: red;"></span>

												</div>

												<label for="item_unit_id" class="col-sm-2 control-label">Items
													:</label>
												<div class="col-sm-4">
													<select name="item" id="item"
														class="select2 select2_single form-control"
														onchange="generateTableRow();">
														<optgroup label="select Item">
															<option value="">-- Select --</option>
														</optgroup>
														<%
															sr1 = new DataService();
															rs2 = sr1.Item_Master_list();
															while (rs2.next()) {
																String value = rs2.getString(1) + "/" + rs2.getString(2) + "/" + rs2.getString(3);
																//System.out.println(value);
														%>
														<option value="<%=value%>"><%=rs2.getObject("item_name")%></option>
														<%
															}
														%>
													</select> <span id="err_item_color" style="color: red;"></span>
												</div>

											</div>


										</div>
									</div>

									<div class="row">
										<div class="col-md-12"
											style="height: 400px; overflow-x: scroll; overflow-y: scroll">

											<table class="inner-table-2 inventory" id="detailsTBL">
												<thead>
													<tr>
														<th>-</th>
														<th style="width: 21%; text-align: center">Item name</th>
														<th>Unit</th>
														<th>QTY</th>
														<th style="display: none">Iid</th>
													</tr>
												</thead>
												<tbody>
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
														class="btn btn-success addButton "  id="addButton">ADD</button>
													<a href="index.jsp" class="btn btn-default">Cancel</a>
													<div id="output3" style="" ></div>
												</div>
											</div>
										</div>
									</div>
								</form>

							</div>
						</div>
					</div>
				</div>
				<!-- User Modal1 -->


				<!-- /.modal -->
			</section>
			<!-- /.content -->
		</div>
	</div>
</div>

<jsp:include page="templates/footer.html" />
<script type="text/javascript">
	var i = 0;
	function generateTableRow() {
		var emptyColumn = document.createElement('tr');
		var item = document.getElementById("item").value;
		var Iid = item.split("/")[0];
		//alert(Iid);
		var name = item.split("/")[1];
		var unit = item.split("/")[2];
		var qty = 0;
		emptyColumn.setAttribute("id", "E" + i);
		emptyColumn.innerHTML = '<td><a class="cut" onclick="cuting(this);">-</a><span ></span></td>'
				+ '<td style="background: #efefef;"><span>'
				+ name
				+ '</span></td>'
				+ '<td><span>'
				+ unit
				+ '</span></td>'
				+ '<td><span contenteditable>'
				+ qty
				+ '</span></td>'
				+ '<td class="hidden"><span>'
				+ Iid
				+ '</span></td>';

		i++;
		document.querySelector('table.inventory tbody')
				.appendChild(emptyColumn);
	}

	function cuting(val) {
		//    alert("The paragraph was clicked.");
		var empTab = document.getElementById('detailsTBL');
		empTab.deleteRow(val.parentNode.parentNode.rowIndex);
		calculate_table_amt();
	}

	$('.addButton').click(function() {
		var task ="createProduct";
	    var com = document.getElementById("com").value;
	    //alert("com>>>" + com);
	    var version2 = document.getElementById("version2").value;
	    //alert("version>>>" + version2);
	    var productId = document.getElementById("productId").value;
	    //alert("productId>>>" + productId);
	    var date = document.getElementById("date").value;
	    //alert("date>>>" + date);
	    var batchKg = document.getElementById("batchKg").value;
	    //alert("batchKg>>>" + batchKg);
	    var batchNo = document.getElementById("batchNo").value;
	    //alert("batchNo>>>" + batchNo);
	    var productName = document.getElementById("productName").value;
	    //alert("productName>>>" + productName);
	    var item = document.getElementById("item").value;
	    //alert("Items>>>" + item);

	    // Check for empty fields
	    if (productName !==null && com !==null) {
	        //alert("in if->");
	        var cells, price, a, i;
	        var obj = [];
	        for (var a = document.querySelectorAll('table.inventory tbody tr'), i = 0; a[i]; ++i) {
	            // get inventory row cells
	            cells = a[i].querySelectorAll('span:last-child');
	            var dict = {};

	            dict["iName"] = cells[1].innerHTML;
	            dict["qty"] = cells[2].innerHTML;
	            dict["unit"] = cells[3].innerHTML;
	            dict["iId"] = cells[4].innerHTML;
	            obj.push(dict);
	        }
	        $("#spinner").show();
	        $.ajax({
	            type: "POST",
	            url: "CreateProductFormulaServlet", // Corrected servlet name
	            data: {
	            	task:task,
	                com: com,
	                version2: version2,
	                productId: productId,
	                date: date,
	                batchKg: batchKg,
	                batchNo: batchNo,
	                productName: productName,
	                item: item,
	                obj: JSON.stringify(obj)
	            },
	            success : function(data) {
					//                     alert(data);
					alert("Data Saved Successfully..!");
					$('#successMessage').html(
							'Data inserted successfully')
							.delay(5000);
					$('#successMessage').show();
					$("#spinner").hide();
					location.reload();
					//                      location.href="invoice_view1.jsp?Invoice_No="+state;
				}
	        });
	        return false;
	    } else {
	        alert("Please fill required fields");
	    }
	});
	
</script>
