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
	<%
	impmethods = new impMethods();
	String date = impmethods.todaysDate();
	System.out.print("date>>" + date);
	%>

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
										<h4>Delivery Challan</h4>
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
											<h2><B>Ship To</B> </h2>
											</div>
											
											
											<div class="form-group">
												<label for="" id="" class="col-sm-2 control-label">Outward Delivery No<span
													class="required">*</span></label>
												<div class="col-sm-4">

													<input autocomplete="off" name="OdeliveryNo" required type="text"
														class="form-control" id="OdeliveryNo" onblur = "ogpnodata(); fetchitembyogp(this);">
													<span id="err_statecode" style="color: red;"></span>
												</div>
														

												<label for="" id="" class="col-sm-2 control-label">Outward Delivery Date<span
													class="required">*</span></label>
												<div class="input-group date" data-date-format="dd/mm/yyyy">
														<input type="date-text" class="form-control" placeholder="dd/mm/yyyy" name="OdeliveryDate" id="OdeliveryDate"  readonly>
														<div class="input-group-addon">
															<span class="glyphicon glyphicon-th"></span>
														</div>
													</div>
											</div>

											<div class="form-group">
												<label for="cust_id" id="cust_id_label"
													class="col-sm-2 control-label">Company : <span
													class="required">*</span></label>
												<div class="col-sm-4">

													<select name="com" onchange="getDeliveryNo()" id="com" class="form-control select2"
														>
														<optgroup label="">
															<option value="">-- Select --</option>
															<%
																sr1 = new DataService();
																rs2 = sr1.Company_list();
																while (rs2.next()) {
																	String companyDetails = rs2.getString(2);
															%>
															<option  value="<%=companyDetails%>"><%=rs2.getString(3) + "(" + rs2.getString(2) + ")"%></option>
															<%
																}
															%>
														</optgroup>
													</select>
													<!--<span class="small"><a data-toggle="modal" data-target="#adduser" href="jvascript:void(0);">Add new customer</a></span>-->
													<span id="err_cust_id" style="color: red;"></span>
												</div>

												<label for="" id=""
													class="col-sm-2 control-label">Company Address<span
													class="required">*</span></label>
												<div class="col-sm-4">

													<input autocomplete="off" name="compaddressto" required type="text"
														class="form-control" id="compaddressto" >
													<span id="err_compaddressto" style="color: red;"></span>
												</div>
											</div>
											
											
											
											<div class="form-group">
												<label for="" id="" class="col-sm-2 control-label">Delivery Challan No.<span
													class="required" onchange = "getDeliveryNo()">*</span></label>
												<div class="col-sm-4">

													<input autocomplete="off" name="DchallanNo" required type="text"
														class="form-control" id="DchallanNo" >
													<span id="err_statecode" style="color: red;"></span>
												</div>


												<label for="" id="" class="col-sm-2 control-label">State Name<span
													class="required">*</span></label>
												<div class="col-sm-4">

													<input autocomplete="off" name="statename" required type="text"
														class="form-control" id="statename" >
													<span id="err_statecode" style="color: red;"></span>
												</div>
											</div>
											
											
											
											<div class="form-group">
												<label for="" id="" class="col-sm-2 control-label">GSTin/Unique ID<span
													class="required">*</span></label>
												<div class="col-sm-4">

													<input autocomplete="off" name="uniqueId" required type="text"
														class="form-control" id="uniqueId" >
													<span id="err_statecode" style="color: red;"></span>
												</div>
														

												<label for="" id="" class="col-sm-2 control-label">Mode Of Transport<span
													class="required">*</span></label>
												<div class="col-sm-4">

													<input autocomplete="off" name="TrMode" required type="text"
														class="form-control" id="TrMode" >
													<span id="err_statecode" style="color: red;"></span>
												</div>
											</div>
											
											
											
											<div class="form-group">
												<label for="" id="" class="col-sm-2 control-label">D.L.No<span
													class="required">*</span></label>
												<div class="col-sm-4">

													<input autocomplete="off" name="DLno" required type="text"
														class="form-control" id="DLno" >
													<span id="err_statecode" style="color: red;"></span>
												</div>
														

												<label for="" id="" class="col-sm-2 control-label">D.L.State<span
													class="required">*</span></label>
												<div class="col-sm-4">

													<input autocomplete="off" name="DLstate" required type="text"
														class="form-control" id="DLstate" >
													<span id="err_statecode" style="color: red;"></span>
												</div>
											</div>
											
											<div class="form-group">
																								
												<label for="" id="" class="col-sm-2 control-label">State Code<span
													class="required">*</span></label>
												<div class="col-sm-4">

													<input autocomplete="off" name="statecode" required type="text"
														class="form-control" id="statecode" >
													<span id="err_statecode" style="color: red;"></span>
												</div>
														

												<label for="" id="" class="col-sm-2 control-label">Delivery Challan Date<span
													class="required">*</span></label>
												<div class="col-sm-4">
													<!--<body onload="addDate();"/>-->
													<!--<input  autocomplete="off"   name="Date" required type="date"  class="form-control" id="Date">-->
													

														<input type="date" class="form-control"
															placeholder="dd/mm/yyyy" name="DchallanDate" id="DchallanDate"
															value="<%=date%>" required>
															
													<span id="err_inv_date" style="color: red;"></span>
												</div>
											</div>
											
											
											
											
											
											
											<div class="form-group">
												<label for="" id="" class="col-sm-2 control-label">L.R.No<span
													class="required">*</span></label>
												<div class="col-sm-4">

													<input autocomplete="off" name="LRno" required type="text"
														class="form-control" id="LRno" >
													<span id="err_statecode" style="color: red;"></span>
												</div>
														

												<label for="" id="" class="col-sm-2 control-label">L.R.Date<span
													class="required">*</span></label>
												<div class="col-sm-4">
													<!--<body onload="addDate();"/>-->
													<!--<input  autocomplete="off"   name="Date" required type="date"  class="form-control" id="Date">-->
													
														<input type="date" class="form-control"
															placeholder="dd/mm/yyyy" name="LRdate" id="LRdate"
															value="<%=date%>" required>
														
													
													<span id="err_inv_date" style="color: red;"></span>
												</div>
											</div>
											
											
											
											
											<div class="form-group">
												<label for="" id="" class="col-sm-2 control-label">E.Way Bill No<span
													class="required">*</span></label>
												<div class="col-sm-4">

													<input autocomplete="off" name="EwayBill" required type="text"
														class="form-control" id="EwayBill" >
													<span id="err_statecode" style="color: red;"></span>
												</div>
														

												<label for="" id="" class="col-sm-2 control-label">E.Way Bill Date<span
													class="required">*</span></label>
												<div class="col-sm-4">
													
														<input type="date" class="form-control"
															placeholder="dd/mm/yyyy" name="eWayBillDate" id="eWayBillDate"
															value="<%=date%>" required>
														
													<span id="err_inv_date" style="color: red;"></span>
												</div>
											</div>
											
											
											
											<div class="form-group">
												<label for="" id="" class="col-sm-2 control-label">Vehicle No<span
													class="required">*</span></label>
												<div class="col-sm-4">

													<input autocomplete="off" name="vehicleNo" required type="text"
														class="form-control" id="vehicleNo" >
													<span id="err_statecode" style="color: red;"></span>
												</div>
														

												<label for="" id="" class="col-sm-2 control-label">Transporter Name<span
													class="required">*</span></label>
												<div class="col-sm-4">

													<input autocomplete="off" name="transporterName" required type="text"
														class="form-control" id="transporterName" >
													<span id="err_statecode" style="color: red;"></span>
												</div>
											</div>
											
											
											</div>
										</div>
									</div>

									
									<div class="row">
										<div class="col-md-12"
											style="height: 400px; overflow-x: scroll; overflow-y: scroll">

											<table class="inner-table-2 inventory"  id="tablee">
												<thead>
													<tr>
														<th>Item Code</th>
														<th>Item Name</th>
													    <th>HSN</th>
														<th>CIMS Batch No </th>
														<th>itemQty</th>
														<th>unit</th>
														<th>Per Unit Price </th>
														<th >Total Price <span style="font-size:small ;">(without tax)</span> </th>
													</tr>
												</thead>
												<tbody id="gettable">
												<tr>
												<td><input name="itemId" required id="itemId" type="text"
															class="form-control" readonly></td>
												<td><input name="iName" id="iName" required
															type="text" class="form-control" readonly></td>
												<td><input name="HSN" id="HSN" required
															type="text" class="form-control" readonly></td>
												<td><input name="CIMS_batch_no" id="CIMS_batch_no" required
															type="text" class="form-control" readonly></td>
												<td><input name="itemQty" id="itemQty" required
															type="text" class="form-control" readonly></td>
												<td><input name="unit" id="unit" required
															type="text" class="form-control" readonly></td>
											    <td>
                                           <input name="priceper" id="priceper" required type="text" class="form-control" onblur="calculateTotalPriceWithoutTax()">
                                        </td> 

												<td id="tax_value"></td>
												</tr>
												</tbody>

											</table>
										</div>
									</div>
									
								<div class="row">
										<div class="col-md-6">
										
											<div class="form-group">
												<label for="inv_remark" class="col-sm-4 control-label">Remark
													: </label>
												<div class="col-sm-8">
													<input name="remark" value="" class="form-control"
														placeholder="" id="remark"></input>
													<span id="err_inv_remark" style="color: red;"></span>
												</div>
											</div>
											<br>
											<br>
											
										</div>

										<div class="col-md-6">

											<div class="col-sm-12">
												<dl class="dl-horizontal" >
												
													<div class="col-sm-4">
														<dt>Total:</dt>
													</div>
													
													<div class="col-sm-4">
											     		<span></span>
													</div>
													
													<div class="col-sm-4" style="display:flex; justify-content:end">
														<input name="total" id="total"   >
													</div>
													<br>				
												</dl>
												
												
												
												<dl class="dl-horizontal">
													<div class="col-sm-4">
														<dt>IGST:</dt>
											    	</div>
											     	<div class="col-sm-4">
											     	<%
													ds1 = new DataService();
														rs = ds1.Tax_list();
													%>
											     		<select name="seligst" id="seligst"  style="display:flex; justify-content:center;" onchange="cal_gst()">
											     			<option value="0=>0">-- Select --</option>
													<%
														while (rs.next()) {
															
																String o = rs.getObject(3) + "=>" + rs.getObject(4);
																Object f = rs.getObject(3);
													%>
													<option value="<%=o%>"><%=rs.getObject(3) + "  " + rs.getObject(4)+"%"%></option>
													<%
														}
													%>
											     		</select>
													</div>
											    	<div class="col-sm-4" style="display:flex; justify-content:end">
														<input name="igst" id="igst" >&#8377;
													</div>
													<br>
												</dl>
												
												
												<dl class="dl-horizontal">
													<div class="col-sm-4">
														<dt>CGST:</dt>
											    	</div>
											    	
											     	<div class="col-sm-4"  >
											     		<%
													ds1 = new DataService();
														rs = ds1.Tax_list();
													%>
											     		<select name="selcgst" id="selcgst" onchange="cal_gst()">
											     			<option value="0=>0">-- Select --</option>
													<%
														while (rs.next()) {
															
																String o = rs.getObject(3) + "=>" + rs.getObject(4);
																Object f = rs.getObject(3);
													%>
													<option value="<%=o%>"><%=rs.getObject(3) + "  " + rs.getObject(4)+"%"%></option>
													<%
														}
													%>
											     		</select>
													</div>
											    
											    	<div class="col-sm-4" style="display:flex; justify-content:end">
														<input name="cgst" id="cgst" >&#8377;
													</div>
													<br>
												</dl>
												
												
												
												<dl class="dl-horizontal">
													<div class="col-sm-4">
														<dt>SGST:</dt>
											    	</div>
											    	
											    	<div class="col-sm-4">
											     		<%
													ds1 = new DataService();
														rs = ds1.Tax_list();
													%>
											     		<select name="selsgst" id="selsgst" onchange="cal_gst()">
											     			<option value="0=>0">-- Select --</option>
													<%
														while (rs.next()) {
															
																String o = rs.getObject(3) + "=>" + rs.getObject(4);
																Object f = rs.getObject(3);
													%>
													<option value="<%=o%>"><%=rs.getObject(3) + "  "+ rs.getObject(4)+"%"%></option>
													<%
														}
													%>
											     		</select>
													</div>
											    
											    	<div class="col-sm-4" style="display:flex; justify-content:end">
														<input name="sgst" id="sgst"    >&#8377;
													</div>
													<br>
												</dl>
												
												
												<dl class="dl-horizontal">
													<div class="col-sm-4">
														<dt>Comp.Cess:</dt>
													</div>
													
													<div class="col-sm-4">
											     		<span></span>
													</div>
													
													<div class="col-sm-4" style="display:flex; justify-content:end">
													  	<input name="compcess" id="compcess"  onblur="cal_gst()" > &#8377;
												    </div>
												    <br>
												</dl>
												
												
												<dl class="dl-horizontal">
												<div class="col-sm-4">
													<dt>Other :</dt>
												</div>
												
												<div class="col-sm-4">
											     	<span></span>
												</div>
												
												<div class="col-sm-4" style="display:flex; justify-content:end">
													<input name="roundOff" id="roundOff" onblur="cal_gst()" >&#8377; 
												</div>
												<br>
												</dl>




												<dl class="dl-horizontal">
													<div class="col-sm-4">
														<dt>Total amount:</dt>
													</div>
													
													<div class="col-sm-4">
											     		<span></span>
													</div>
													
													<div class="col-sm-4" style="display:flex; justify-content:end">
														<input name="Total_Amount" id="Total_Amount"  >&#8377; 
													</div>
													<br>
												</dl>
											</div>


											
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
									<div id="successMessage" class="col-md-6 col-md-offset-3 alert alert-success" 
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
<script>
function ogpnodata(inputElement) {
    var ogpno = document.getElementById("OdeliveryNo").value;
    alert(ogpno);
    // Other variables are defined here (com, oddate, trmode, vno)

    $.ajax({
        type: "POST",
        url: "getdatabyogpno",
        data: {
            ogpno: ogpno
        },
        dataType: "json",
        success: function(response) {
            console.log(response); // Log entire response

            if (response && response.Data && response.Data.length > 0) {
                var data = response.Data[0]; // Assuming a single object is returned
                $('#com').val(data.comn || '');
                $('#OdeliveryDate').val(data.OdeliveryDatee || '');
                $('#TrMode').val(data.TrModee || '');
                $('#vehicleNo').val(data.vehicleNoo || '');

                alert(data.comn || '');
                alert(data.OdeliveryDatee || '');
                alert(data.TrModee || '');
                alert(data.vehicleNoo || '');
            } else {
                alert("No data found.");
            }
            getDeliveryNo();
        },
        error: function(xhr, status, error) {
            var errorMessage = "Error fetching data.";
            if (xhr.responseJSON && xhr.responseJSON.error) {
                errorMessage = xhr.responseJSON.error;
            }
            alert(errorMessage);
        }
    });
}


</script>

<script>
function fetchitembyogp(inputElement) {
    var ogpno = document.getElementById("OdeliveryNo").value;
    var row = $(inputElement).closest("tr");

    $.ajax({
        type: "POST",
        url: "Getogpbyogpitem",
        data: {
            ogpno: ogpno
        },
        dataType: "json",
        success: function (response) {
            if (response && response.Data && response.Data.length > 0) {
                const item = response.Data[0];

                $("#itemId").val(item.itemId || '');
                $("#iName").val(item.iName || '');
                $("#HSN").val(item.HSN || '');
                $("#CIMS_batch_no").val(item.CIMS_batch_no || '');
                $("#itemQty").val(item.itemQty || '');
                $("#unit").val(item.unit || '');
                
                // Additional fields if available in response
                $("#priceper").val(item.priceper || '');

                // Calculate and set total price without tax based on values
                calculateTotalPriceWithoutTax();
                
            } else {
                alert("No data found for the given OGP number.");
            }
        },
        error: function () {
            alert("Error fetching items. Please try again.");
        }
    });
}

// Function to calculate total price without tax (customize as needed)
function calculateTotalPriceWithoutTax() {
    var itemQty = parseFloat($("#itemQty").val()) || 0;
    var pricePer = parseFloat($("#priceper").val()) || 0;
    var totalPrice = itemQty * pricePer;
    
    // Set the total price without tax in the #tax_value input field
    $("#tax_value").text(totalPrice.toFixed(2));

    // Set the total price without tax in the #total input field
    $("#total").val(totalPrice.toFixed(2));
}


</script>


<script type="text/javascript">
	var i = 0;
	

	

	$('.addButton').click(function() {
		//var task ="createProduct";
	    var com = document.getElementById("com").value;
	    alert("1"+com);
	    var cid = com.split("=>")[0];
	    alert("2"+cid);
	    var cadd = document.getElementById("compaddressto").value;
	    alert("3"+cadd);
		var statecode = document.getElementById("statecode").value;
		alert("4"+statecode);
	    var statename = document.getElementById("statename").value;
	    alert("5"+statename);
	    var uniqueid = document.getElementById("uniqueId").value;
	    alert("6"+uniqueid);
	    var trmode = document.getElementById("TrMode").value;
	    alert("7"+trmode);
	    var dlno = document.getElementById("DLno").value;
	    alert("8"+dlno);
	    var dlstate = document.getElementById("DLstate").value;
	    alert("9"+dlstate);
	    var dcno = document.getElementById("DchallanNo").value;
	    alert("10"+dcno);
	    var dcdate = document.getElementById("DchallanDate").value;
	    alert("11"+dcdate);
	    var odno = document.getElementById("OdeliveryNo").value;
	    alert("12"+odno);
	    var oddate = document.getElementById("OdeliveryDate").value;
	    alert("13"+oddate);
	    var lrno = document.getElementById("LRno").value;
	   // alert("14"+lrno);
	    var lrdate = document.getElementById("LRdate").value;
//alert("15"+lrdate);
	    var ewaybillno = document.getElementById("EwayBill").value;
	    //alert("16"+ewaybillno);
	    var ewaybilldate = document.getElementById("eWayBillDate").value;
	   // alert("17"+ewaybilldate);
	    var vno = document.getElementById("vehicleNo").value;
	   // alert("18"+vno);
	    var trname = document.getElementById("transporterName").value;
	    //alert("19"+trname);
	    
	    
	    
	    var total = document.getElementById("total").value; 
	    //alert("20"+total);
	    var igst = document.getElementById("igst").value;
	    //alert("21"+igst);
	    var cgst = document.getElementById("cgst").value;
	    //alert("22"+cgst);
	    var sgst = document.getElementById("sgst").value;
	   // alert("23"+sgst);
	    var compcess = document.getElementById("compcess").value;
	    //alert("24"+compcess);
	    var roundoff = document.getElementById("roundOff").value;
	    //alert("25"+roundoff);
	    var totalamount = document.getElementById("Total_Amount").value;
	    //alert("26"+totalamount);
	    if(dcno !== null && odno !== null)
	    {
	    alert("in if->");
	         
	         var table= document.getElementById("gettable");
	         alert(table);
	        var obj = [];
	        for (var i = 0; i<table.rows.length;i++) {
	           
	            var row=table.rows[i];
	            alert(row);
	            var itemId = row.cells[0].querySelector('input[name="itemId"]').value;
	            alert("itemid"+itemId);
	            var iName = row.cells[1].querySelector('input[name="iName"]').value;
	            alert("iName"+iName);
	            var hsncode = row.cells[2].querySelector('input[name="HSN"]').value;
	            alert("hsncode"+hsncode);
	            var batchno = row.cells[3].querySelector('input[name="CIMS_batch_no"]').value;
	            alert("batchno"+batchno);
	            var qty = row.cells[4].querySelector('input[name="itemQty"]').value;
	            alert("qty"+qty);
	            var unit = row.cells[5].querySelector('input[name="unit"]').value;
	            alert("unit"+unit);
	            var unitprice = row.cells[6].querySelector('input[name="priceper"]').value;
	            alert("unitprice"+unitprice);
	            //var taxvalue =  $("#tax_value").text(totalPrice.toFixed(2));
	             var taxvalue = row.cells[7].textContent;
	            alert("taxvalue"+taxvalue);
	           
	           
	          
	            
	            var dict = {};

	            dict["itemId"] = itemId;
	            dict["iName"] = iName;
	            dict["hsncode"] = hsncode;
	            dict["batchno"] = batchno;
	            dict["qty"] = qty;
	            dict["unit"] = unit;
	            dict["unitprice"] = unitprice;
	           dict["taxvalue"] = taxvalue;
	            obj.push(dict);
	            
	            /* var dict = {};

	            dict["iName"] = cells[1].innerHTML;
	            dict["hsncode"] = cells[2].innerHTML;
	            dict["batchno"] = cells[3].innerHTML;
	            dict["qty"] = cells[4].innerHTML;
	            dict["unit"] = cells[5].innerHTML;
	            dict["unitprice"] = cells[6].innerHTML;
	            dict["taxvalue"] = cells[7].innerHTML;
	            obj.push(dict); */
	            
	        } 
	        alert("obj"+obj);
	        //$("#spinner").show();
	        $.ajax({
	            type: "POST",
	            url: "Create_Delivery_Challan", // Corrected servlet name
	            data: {
	            	//task:task,
	                com: com,
	                cid:cid,
	                comaddress: cadd,
	                statecode: statecode,
	                statename: statename,
	                uniqueid: uniqueid,
	                trmode: trmode,
	                dlno: dlno,
	                dlstate:dlstate,
	                dcno:dcno,
	                dcdate:dcdate,
	                odno:odno,
	                oddate: oddate,
	                lrno: lrno,
	                lrdate: lrdate,
	                ewaybillno: ewaybillno,
	                ewaybilldate: ewaybilldate,
	                vno: vno,
	                trname: trname,
	                
	                total: total,
	                igst: igst,
	                cgst: cgst,
	                sgst: sgst,
	                compcess: compcess,
	                roundoff: roundoff,
	                totalamount: totalamount,
	                obj: JSON.stringify(obj)
	            },
	            success : function(data) {
					                     alert(data);
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
<script>

//var tax_value = document.getElementById("tax_value").textContent;
const table=document.getElementById("tablee");
const tbody=table.getElementsByTagName('tbody')[0];
let totall =0;
const rows = tbody.getElementsByTagName('tr');
//const rows = tbody.getElementById("gettable");
for(let i=0; i<rows.length;i++)
	{
	const row =rows[i];
	const cells = row.getElementsByTagName('td');
	const tax_value = parseFloat(cells[7].textContent);
	totall +=tax_value;
	}
document.getElementById("total").value = totall;

</script>


<script type="text/javascript">


function getDeliveryNo(){
	var com = document.getElementById("com").value;
	//alert(com);
	var Cid = com.split("=>")[0];
	//alert(Cid);
	//        alert(Cid);
	//        $('#Pid').find('option').remove().end().append('<option disabled=""  style="color:black;">Data</option>').val(' ');

	$.ajax({
		type : "POST",
		url : "delivery_challan_no",
		data : {
			Cid : Cid
		},
		dataType : "json",
		success : function(data) {
			$.each(data.aaData, function(i, data) {
				//                var Pid=data.sr+"=>"+data.text;
				//            var div_data='<option value="'+data.sr+'" style="color:black;">'+data.text+'</option>';
				//            $(div_data).appendTo('#Pid');
				document.getElementById("DchallanNo").value = data.dli;
				//document.getElementById("OdeliveryNo").value = data.ogp;
				
			});
		}

	});

}
</script>
<script type="text/javascript">


function cal_gst(){
    
    //alert("in igst");
    var igst=$('#seligst').val().split("=>");
    var cgst=$('#selcgst').val().split("=>");
    var sgst=$('#selsgst').val().split("=>");
    
    //alert(igst[1]);
    var total=document.getElementById('total').value;
    var Compcess=document.getElementById('compcess').value;
    var Otheramt=document.getElementById('roundOff').value;
    
    //alert(total);
    
    if((igst[0]).toUpperCase() === ("igst").toUpperCase() )
    {
    	 var txt_totaligst = (Number(total)*Number(igst[1]))/100;
    	
    }
    //else if((igst[0]).localeCompare("gst", undefined,{ numeric: true, sensitivity: 'base'}))
    else if((igst[0]).toUpperCase() === ("gst").toUpperCase())
    {
    	 var txt_totaligst = (Number(total)*Number(igst[1]))/200;
    	    
    } 
    else
    {
    	var txt_totaligst =0;
    }
    
    
    
    if((cgst[0]).toUpperCase() === ("cgst").toUpperCase())
    {
    	var txt_totalcgst = (Number(total)*Number(cgst[1]))/100;
    	
    }
    else if((cgst[0]).toUpperCase() === ("gst").toUpperCase() )
    {
    	 var txt_totalcgst = (Number(total)*Number(cgst[1]))/200;
    }
    else
    {
    	var txt_totalcgst =0;
    }
    
    
    if((sgst[0]).toUpperCase() === ("sgst").toUpperCase())
    {
    	var txt_totalsgst = (Number(total)*Number(sgst[1]))/100;
    	
    }
    else if((sgst[0]).toUpperCase() === ("gst").toUpperCase() )
    {
    	var txt_totalsgst = (Number(total)*Number(sgst[1]))/200;
    }
    else
    {
    	var txt_totalsgst =0;
    }
    
    
    document.getElementById("igst").value = txt_totaligst;
    document.getElementById("cgst").value = txt_totalcgst;
    document.getElementById("sgst").value = txt_totalsgst;
    
    var t_amt=(Number(total)+Number(txt_totaligst)+Number(txt_totalcgst)+Number(txt_totalsgst)+Number(Compcess)+Number(Otheramt))
    document.getElementById("Total_Amount").value = t_amt;

    
}
</script>


