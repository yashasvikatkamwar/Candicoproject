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
	String S_tyep, seller_id;%>
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
	/position: absolute;/
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
	      <section class="content lobipanel">
	        <div class="row">
	           <div class="col-sm-12">
	               <div class="panel panel-bd lobidrag">
	                  <div class="panel-heading" id="pa"
								style="background-color: #e8f1f3; border-bottom: black">
								<div class="btn-group" id="buttonexport">
									<a href="javascript:void(0)">
										<h3>Batch Issue</h3>
									</a>
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


												<label for="date" class="col-sm-2 control-label"> Issue Date
													: <span class="required">*</span>
												</label>
												<div class="col-sm-4">

													<div class="input-group date" data-date-format="dd/mm/yyyy">
														<input type="date-text" class="form-control"
															placeholder="dd/mm/yyyy" name="issue_date" id="issue_date" required>
														<div class="input-group-addon">
															<span class="glyphicon glyphicon-th"></span>
														</div>
													</div>
													
												</div>



											</div>
											<div class="form-group">
												<!--product code-->
												<label for="month" class="col-sm-2 control-label">Department
													: <span class="required">*</span>
												</label>

												<div class="col-sm-4">

													<input name="batchno" required type="text"
														class="form-control" id="batchno"> <span
														id="err_cust_no" style="color: red;"></span>
													<!--<span class="small"><a data-toggle="modal" data-target="#adduser" href="jvascript:void(0);">Add new customer</a></span>-->
													<!--<span id="err_cust_id" style="color: red;"></span>-->
												</div>
											</div>
											
											
											<div class="form-group">
												<!--product code-->
												<label for="month" class="col-sm-2 control-label">Remark
													: <span class="required">*</span>
												</label>
                                                 <div class="col-sm-4">

													<input name="batchno" required type="text"
														class="form-control" id="batchno"> <span
														id="err_cust_no" style="color: red;"></span>
													<!--<span class="small"><a data-toggle="modal" data-target="#adduser" href="jvascript:void(0);">Add new customer</a></span>-->
													<!--<span id="err_cust_id" style="color: red;"></span>-->
												</div>
												
												

											</div>
											<div class="form-group"></div>
											
											
									   
									  </div>
									</div>	
									<%-- <%
									String Iid = request.getParameter("Iid");
								    sr1=new DataService();
								    rs=sr1.getitemBycode(Iid);
									%> --%>
									<div class="row">
										<div class="col-md-12"
											style="height: 400px; overflow-x: scroll; overflow-y: scroll">

											<table class ="table table-striped table-bordered responsive-utilities jambo_table  data-sort-order "  id="mytable">
												<thead>
													<tr>

														<!-- <th style="width: 21%; text-align: center">...</th> -->
														<th>ITEM CODE</th>
														<th>ITEM NAME</th>
														<th>UNIT</th>
														<th>QTY</th>
													</tr>
												</thead>
												<tbody id="tablebody">
                                                   <tr> 
                                                    <td><input name="batchno" required type="text"
														class="form-control" id="batchno"></td>
                                                    <td><input name="batchno" required type="text"
														class="form-control" id="batchno"></td>
                                                    <td><input name="batchno" required type="text"
														class="form-control" id="batchno"></td>
                                                    <td><input name="batchno" required type="text"
														class="form-control" id="batchno"></td>
                                                    </tr>
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
									<div id="successMessage"
										class="col-md-6 col-md-offset-3 alert alert-success"
										style="display: none;"></div>



									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<div class="col-sm-12 text-center">
													<button type="submit" value="save"
														class="btn btn-success addButton ">Issue</button>
													<!-- <a href="" class="btn btn-primary">Print</a>
													<div id="output3" style=""></div> -->
												</div>
											</div>
										</div>
									</div>
								</form>
								
								</div>
							</div>
	               </div>
	           </div>
	        </div>
	      </section>
	   </div>
	</div>
</div>	
<jsp:include page="templates/footer.html" />