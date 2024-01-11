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
										<h4>Tax Invoice</h4>
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
												<label for="" id="" class="col-sm-2 control-label">Invoice No<span
													class="required">*</span></label>
												<div class="col-sm-4">

													<input autocomplete="off" name="OdeliveryNo" required type="text"
														class="form-control" id="OdeliveryNo" onblur = "ogpnodata()">
													<span id="err_statecode" style="color: red;"></span>
												</div>
														

												<label for="" id="" class="col-sm-2 control-label">Invoice Date<span
													class="required">*</span></label>
												<div class="input-group date" data-date-format="dd/mm/yyyy">
														<input type="date-text" class="form-control" placeholder="dd/mm/yyyy" name="OdeliveryDate" id="OdeliveryDate"  readonly>
														<div class="input-group-addon">
															<span class="glyphicon glyphicon-th"></span>
														</div>
													</div>
											</div>

											<%-- <div class="form-group">
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
											</div> --%>
											
											
											
											<div class="form-group">
												


												<label for="" id="" class="col-sm-2 control-label">State Name<span
													class="required">*</span></label>
												<div class="col-sm-4">

													<input autocomplete="off" name="statename" required type="text"
														class="form-control" id="statename" >
													<span id="err_statecode" style="color: red;"></span>
												</div>
																								
												<label for="" id="" class="col-sm-2 control-label">State Code<span
													class="required">*</span></label>
												<div class="col-sm-4">

													<input autocomplete="off" name="statecode" required type="text"
														class="form-control" id="statecode" >
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
														

												<label for="" id="" class="col-sm-2 control-label">Fassi no : <span
													class="required">*</span></label>
												<div class="col-sm-4">

													<input autocomplete="off" name="fssaino" required type="text"
														class="form-control" id="fssaino" >
													<span id="err_statecode" style="color: red;"></span>
												</div>
											</div>
											
											
											
											<div class="form-group">
												<label for="" id="" class="col-sm-2 control-label">Buyers order No : <span
													class="required">*</span></label>
												<div class="col-sm-4">

													<input autocomplete="off" name="byersorderno" required type="text"
														class="form-control" id="byersorderno" >
													<span id="err_statecode" style="color: red;"></span>
												</div>
														

												<label for="" id="" class="col-sm-2 control-label">Buyers order Date <span
													class="required">*</span></label>
												<div class="input-group date" data-date-format="dd/mm/yyyy">
														<input type="date-text" class="form-control" placeholder="dd/mm/yyyy" name="buyersorderDate" id="buyersorderDate"  readonly>
														<div class="input-group-addon">
															<span class="glyphicon glyphicon-th"></span>
														</div>
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
											
											<div class="form-group">
												<label for="" id="" class="col-sm-2 control-label">Carrier<span
													class="required">*</span></label>
												<div class="col-sm-4">

													<input autocomplete="off" name="carreir" required type="text"
														class="form-control" id="carreir" >
													<span id="err_statecode" style="color: red;"></span>
												</div>
														

												<label for="" id="" class="col-sm-2 control-label">Destination : <span
													class="required">*</span></label>
												<div class="col-sm-4">

													<input autocomplete="off" name="destination" required type="text"
														class="form-control" id="destination" >
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
														<th>Sr no.</th>
														<th style="width: 21%; text-align: center">Discription of food</th>
														<th >GST %</th>
														<th> Batch No </th>
														<th>Wt per CB</th>
														<th>Qty In Kgs</th>
														<th>Qty In CB</th>
														<th >Rate per CB <span style="font-size:small ;"></span> </th>
														<th >Discount <span style="font-size:small ;"></span> </th>
														<th >Taxable value <span style="font-size:small ;"></span> </th>
													</tr>
												</thead>
												<tbody id="gettable">
												<tr>
												<td>1</td>
												<td>candy</td>
												<td>HSN145</td>
												<td>005</td>
												<td>1000</td>
												<td>kg</td>
												<td>152</td>
												<td id="tax_value">2000</td>
												<td>suhk</td>
												<td >ghbj</td>
												</tr>
												<tr>
												<td>1</td>
												<td>candy</td>
												<td>HSN145</td>
												<td>005</td>
												<td>1000</td>
												<td>kg</td>
												<td>152</td>
												<td id="tax_value">2000</td>
												<td>suhk</td>
												<td >ghbj</td>
												</tr>
												<tr>
												<td>1</td>
												<td>candy</td>
												<td>HSN145</td>
												<td>005</td>
												<td>1000</td>
												<td>kg</td>
												<td>152</td>
												<td id="tax_value">2000</td>
												<td>suhk</td>
												<td >ghbj</td>
												</tr>
												</tbody>

											</table>
										</div>
									</div>
									
								<div class="row">
										<div class="col-md-6">
										
											<div class="form-group">
												<label for="inv_remark" class="col-sm-4 control-label">Amount In words
													: </label>
												<div class="col-sm-8">
													<input name="amtinwords" value="" class="form-control"
														placeholder="" id="amtinwords"></input>
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
														<input name="total" id="total"  value="1.00" > &#8377;
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
														<dt>Value including GST:</dt>
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
													<dt>Net Value :</dt>
												</div>
												
												<div class="col-sm-4">
											     	<span></span>
												</div>
												
												<div class="col-sm-4" style="display:flex; justify-content:end">
													<input name="netvalue" id="netvalue"  >&#8377; 
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
										<div class="col-md-12"
											style="height: 400px; overflow-x: scroll; overflow-y: scroll">

											<table class="inner-table-2 inventory" id="detailsTBL">
												<thead>
													<tr>
														
														<th style="width: 20%; text-align: center" rowspan="2">HSN/SAC</th>
														<th rowspan="2">Taxable values</th>
														<th colspan="2" style="text-align: center;">CGST</th>
														<th colspan="2" style="text-align: center;">SGST</th>
														<th colspan="2" style="text-align: center;">IGST</th>
														<th rowspan="2">Total</th>
														
													</tr>
													
													<tr>
													<th>Rate %</th>
													<th>Amount</th>
													<th>Rate %</th>
													<th>Amount</th>
													<th>Rate %</th>
													<th>Amount</th>
													</tr>
													
												</thead>
												<tbody id="OrignalQnty">
												
												</tbody>
                                                      
                                                      
											</table>
										</div>
									</div>



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