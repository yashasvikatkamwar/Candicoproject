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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

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
	/position: absolute;/
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
										<h4>OUTWARD GATE PASS</h4>
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
												<%-- <label for="" id=""
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
												</div> --%>
												<label for="com" id="cust_id_label"
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
												<label for="date" class="col-sm-2 control-label">Date
													: <span class="required">*</span>
												</label>
												<div class="col-sm-4">

													<div class="input-group date" data-date-format="dd/mm/yyyy">

														<%
														impmethods = new impMethods();
														String date = impmethods.todaysDate();
														System.out.print("date>>" + date);
														%>
														<input type="text-date" class="form-control"
															placeholder="dd/mm/yyyy" name="date" id="date"
															value="<%=date%>" required>
														<div class="input-group-addon">
															<span class="glyphicon glyphicon-th"></span>
														</div>
													</div>
													<span id="err_inv_date" style="color: red;"></span>
												</div>


											</div>

											<div class="form-group">
											<div class="form-group">
												<label for="" id="" class="col-sm-2 control-label">OGP No<span
													class="required">*</span></label>
												<div class="col-sm-4">

													<input autocomplete="off" name="OdeliveryNo" required type="text"
														class="form-control" id="OdeliveryNo" >
													<span id="err_statecode" style="color: red;"></span>
												</div>
												

												<label for="" class="col-sm-2 control-label">Mode of Trasport <span class="required">*</span>
												</label>
												<div class="col-sm-4">

													<select name = "modeoftransport" id = "modeoftransport" class="form-control form-inline col-sm-3">
													<option>Air Transporation</option>
                                                     <option>Rail Transport </option>
                                                      <option>Ship</option>
                                                      <option>Train</option>
                                                       <option>Rapid Transmit</option>
                                                        <option>Bus</option>
													</select>
													<span id="err_statecode" style="color: red;"></span>
												</div>


											</div>

										</div>
										<div class="form-group">
											<label for="Purpose" class="col-sm-2 control-label">Purpose
												: <span class="required">*</span>
											</label>
											<div class="col-sm-4">

												<input autocomplete="off" name="Purpose" required
													type="text" class="form-control" id="Purpose"> <span
													id="err_version" style="color: red;"></span>


											</div>
											<!-- <label for="month" class="col-sm-2 control-label">Batch -->
											<!-- <label for="sizeNo"class="col-sm-2 control-label">Size(No's) : <span class="required">*</span>
												</label>

												<div class="col-sm-4">
													<input autocomplete="off" name="batchNo" required
														type="text" class="form-control" id="batchNo">
													<span id="err_batchNo" style="color: red;"></span>
												</div> -->
											<label for="Purpose" class="col-sm-2 control-label">Remark
												: <span class="required">*</span>
											</label>
											<div class="col-sm-4">

												<input autocomplete="off" name="Remark"  required
													type="text" class="form-control" id="Remark"> <span
													id="err_version" style="color: red;"></span>


											</div>


										</div>
										<div class="form-group">
											<label for="Purpose" class="col-sm-2 control-label">Suppier Name
												: <span class="required">*</span>
											</label>
											<div class="col-sm-4">

												<input autocomplete="off" name="suplierno" id = "suplierno" required
													type="text" class="form-control" > <span
													id="err_version" style="color: red;"></span>


											</div>
											<!-- <label for="month" class="col-sm-2 control-label">Batch -->
											<!-- <label for="sizeNo"class="col-sm-2 control-label">Size(No's) : <span class="required">*</span>
												</label>

												<div class="col-sm-4">
													<input autocomplete="off" name="batchNo" required
														type="text" class="form-control" id="batchNo">
													<span id="err_batchNo" style="color: red;"></span>
												</div> -->
											<label for="Purpose" class="col-sm-2 control-label">Vehicle No:
												: <span class="required">*</span>
											</label>
											<div class="col-sm-4">

												<input autocomplete="off" name="Vehicleno"  required
													type="text" class="form-control" id="Vehicleno"> <span
													id="err_version" style="color: red;"></span>


											</div>


										</div>
										<div class="form-group">
											
										</div>



									</div>

									<div class="row">
										<div class="col-md-12"
											style="height: 400px; overflow-x: scroll; overflow-y: scroll">

											<table
												class="table table-striped table-bordered responsive-utilities jambo_table data-sort-order"
												id="tablebody">
												<thead>
													<tr>
														<th>ITEM CODE</th>
														<th>ITEM NAME</th>
														<th>UNIT</th>
														<th>CIMS_Batch_no</th>
														<th>QTY</th>
														<th>Actions</th>
													</tr>
												</thead>
												<tbody id="tablebody">
													<tr>
														<td><input name="Iid" required id="Iid" type="text"
															class="form-control" onblur="fetchItemsByItemCode(this)"></td>
														<td><input name="item_name" id="item_name" required
															type="text" class="form-control" readonly></td>
														<td><input name="unit" id="unit" required type="text"
															class="form-control" readonly></td>
														<td class="text-center"><select name="CIMS_batch_no"
															id="CIMS_batch_no"
															class="select2 select2_single form-control" onchange="">
																<!--<optgroup label="select tax">-->
																<option value="">-- Select --</option>


																<!--</optgroup>-->
														</select></td>
														<td><input name="qty" id="qty" required type="text"
															class="form-control"></td>
														<td class="text-center">
															<button type="button" onclick="addRow()">
																<i class="fas fa-plus"></i>
															</button>
															<button type="button" onclick="deleteRow(this)">
																<i class="fas fa-trash"></i>
															</button>
														</td>
													</tr>
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
														class="btn btn-success addButton " onclick="saveoutwardgatepass();">ADD</button>
													<a href="index.jsp" class="btn btn-default">Cancel</a>
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
				<!-- User Modal1 -->


				<!-- /.modal -->
			</section>
			<!-- /.content -->
		</div>
	</div>
</div>

<jsp:include page="templates/footer.html" />
<script type="text/javascript">
	
				
			
				function fetchItemsByItemCode(inputElement) {
				    var Iidcode = inputElement.value;
				    var row = $(inputElement).closest("tr");

				    $.ajax({
				        type: "POST",
				        url: "Getitembycode", 
				        data: {
				            Iid: Iidcode
				        },
				        dataType: "json",
				        success: function (response) {
				            if (response.Data && response.Data.length >= 0) {
				                const item = response.Data[0];
				                const selectElement = row.find("select[name='CIMS_batch_no']");
				                selectElement.empty(); 

				                selectElement.append('<option value=""> CIMS NO -- Expiry Date -- QTY Available --</option>');

				                response.Data.forEach(function (batch) {
				                    selectElement.append('<option value="' + batch.CIMS_batch_no + '">' + batch.CIMS_batch_no + ' -- ' + batch.expiry_date +' --        '+batch.RELEASED_QTY+ '</option>');
				                });
				                row.find("input[name='item_name']").val(item.item_name);
				                row.find("input[name='unit']").val(item.unit);
				            }
				        },
				        error: function () {
				            alert("Error fetching items.");
				        }
				    });
				}


				
		
</script>


<script>
    function addRow() {
        const tbody = document.getElementById("tablebody");
        const newRow = document.createElement("tr");
        newRow.innerHTML = `
        	 <tbody >
            <tr>

                <td><input name="Iid" required id="Iid" type="text" class="form-control" onblur="fetchItemsByItemCode(this)"></td>
                <td><input name="item_name" id = "item_name" required type="text" class="form-control" readonly></td>
                <td><input name="unit"  id = "unit" required type="text" class="form-control" readonly></td>
                <td class="text-center"><select name="CIMS_batch_no" id="CIMS_batch_no"
					class="select2 select2_single form-control" onchange="">
					<!--<optgroup label="select tax">-->
					<option value="">-- Select --</option>

					<!--</optgroup>-->
				</select></td>
                <td><input name="qty" id = "qty"required type="text" class="form-control"></td>
                <td class="text-center">
                     <button type="button" onclick="addRow()"><i class="fas fa-plus" ></i></button> 
                    <button type="button" onclick="deleteRow(this)"><i class="fas fa-trash"></i> </button> 
                </td>
            </tr>
        </tbody>
        `;
        tbody.appendChild(newRow);
    }

    function deleteRow(button) {
        const row = button.closest("tr");
        if (row.parentNode) {
            row.parentNode.removeChild(row);
        }
    }
</script>
<!-- <script type="text/javascript">
function getDeliveryNo() {
	var com = document.getElementById("com").value;
	//alert(com);
	var Cid = com.split("=>")[0];
	$.ajax({
		type : "POST",
		url : "delivery_challan_no",
		data : {
			Cid : Cid
		},
		dataType : "json",
		success : function(data) {
			$.each(data.aaData, function(i, data) {
				document.getElementById("OdeliveryNo").value = data.ogp;
				
			});
		}

	});

}
</script> -->
<script type="text/javascript">
function getDeliveryNo() {
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
				//document.getElementById("DchallanNo").value = data.text;
				document.getElementById("OdeliveryNo").value = data.ogp;
				
			});
		}

	});

}
</script>

<script type="text/javascript">

     function saveoutwardgatepass(){
    	 var selectcompany = document.getElementById("com").value;
    	 alert(selectcompany);
    	 var date = document.getElementById("date").value;
    	 alert(date);
    	 var OdeliveryNo = document.getElementById("OdeliveryNo").value;
    	 alert(OdeliveryNo);
    	 var modeOfTransport = document.getElementById("modeoftransport").value;
    	 alert(modeOfTransport);
    	 var Purpose = document.getElementById("Purpose").value;
    	 alert(Purpose);
    	 var Remark = document.getElementById("Remark").value;
    	 alert(Remark);
    	 var suplierno = document.getElementById("suplierno").value;
    	 alert(suplierno);
    	 var Vehicleno = document.getElementById("Vehicleno").value;
    	 alert(Vehicleno);
    	
    	
    	
    	 var data = [];

    	    var table = document.getElementById('tablebody');
    	    var rows = table.getElementsByTagName('tr');

    	    for (var i = 1; i < rows.length; i++) {
    	        var row = rows[i];
    	        var Iid = row.querySelector('input[name="Iid"]').value;
    	        alert("Iid :" +Iid);
    	        var item_name = row.querySelector('input[name="item_name"]').value;
    	        alert("item_name :" +item_name);
    	        var unit = row.querySelector('input[name="unit"]').value;
    	        alert("unit :"+unit);
    	        var selectElement = row.querySelector('select[name="CIMS_batch_no"]').value;
    	        alert("selectElement:"+selectElement);
    	        var qty = row.querySelector('input[name="qty"]').value;
    	        alert("qty :"+qty);
    	        
    	        var rowData = {
    	                "itemId": Iid,
    	                "iName": item_name,
    	                "unit": unit,
    	                "CIMS_batch_no": selectElement,
    	                "itemQty": qty
    	            };
    	        
    	        

    	        data.push(rowData);
    	       }
    	    var jsonData = JSON.stringify(data);
    	    $.ajax({
    	        method: "POST",
    	        url: "Saveoutwardgate",
    	        cache: false,
    	        data: {
    	            company_id: selectcompany, 
    	            ogpdate: date,
    	            OgpNo: OdeliveryNo,
    	            modeOfTransport: modeOfTransport,
    	            Purpose: Purpose,
    	            Remark: Remark,
    	            suplierno:suplierno,
    	            Vehicleno:Vehicleno,
    	            
    	            
    	            obj: jsonData
    	        },
    	        success: function (response) {
    	            alert("Data inserted successfully");
    	            $('#successMessage').html('Data inserted successfully').delay(5000).show();
    	            location.reload();
    	        },
    	        error: function (error) {
    	            alert("Error occurred: " + error.responseText);
    	        }
    	    });

    	    return false;

    	   
     }

</script>

