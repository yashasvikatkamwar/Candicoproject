<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"
	errorPage="eror.jsp"%>
<%@page import="org.joda.time.LocalDate"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.DataService"%>
<%@page import="bean.impMethods"%>
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

tr:hover .cut {
	opacity: 1;
}
</style>

<%! ResultSet rs,rq,data,data2,data3,data4,data5,re,selectData,rs2;
	ResultSetMetaData rsmd;
	Object ob;
	DataService sr1,ds1;int x;Object aval,bval,unitid; 
	int i=0;ArrayList ar;
	JSONArray list; Iterator ity;Object o1;String gender;
	String S_tyep,seller_id;
	impMethods impmethods;
	%>


<div class="right_col" role="main">
	<div class="">

						<%
                            ds1= new DataService();
                            rs=ds1.Company_list();
                           %>

		<div class="content-wrapper">
		
		
    
    
    
    
<script type="text/javascript">
    $(document).ready(function() {
        
        function fetchProductCodes(selectedCompany) {
            // Make an AJAX request to fetch product codes
            $.ajax({
                type: "POST", 
                url: "GetAshData", 
                data: { 
                	Cid : selectedCompany
                }, 
                dataType: "json", 
                success: function(response) {
                	//alert(response.Data);
                	console.log(response.Data);
                    $("#item11").empty();
                    $("#item11").append('<option value="">--------Select Product Code-------</option>');

                    
                    $.each(response.Data, function(index, item) {
                        $("#item11").append('<option value="' + item.proId + '">' + item.proId + '</option>');
                        
                    });
                },
                error: function() {
                    alert("Error fetching product codes.");
                }
            });
        }

       
        $("#com").on('change', function() {
            var selectedCompany = $(this).val();
            //alert(selectedCompany);
            fetchProductCodes(selectedCompany); 
        });
    });
</script>

<script type="text/javascript">
    $(document).ready(function() {
        
        function fetchProductCodes(selectedData) {
            // Make an AJAX request to fetch product codes
            $.ajax({
                type: "POST", 
                url: "GetProductData", 
                data: { 
                	
                	Cid : selectedData
                }, 
                dataType: "json", 
                success: function(response) {
                	
                	/* console.log(response.Data); */
                	
                    $("#batchcode").empty();
                    $("#batchcode").append('<option value="">--------Select Batch Code-------</option>');

                    
                    $.each(response.Data, function(index, item) {
                        $("#batchcode").append('<option value="' + item.proId + '">' + item.proId + '</option>');
                        //alert(item.proName);
                    });
                },
                error: function() {
                    alert("Error fetching product codes.");
                }
            });
        }

       
        $("#item11").on('change', function() {
            var selectedData = $(this).val();
            //alert(selectedData);
            fetchProductCodes(selectedData); 
        });
    });
</script>




		
		
                           
                           
			<!-- Main content -->
			<section class="content lobipanel">
				<div class="row">
					<div class="col-sm-12">
						<div class="panel panel-bd lobidrag">
							<div class="panel-heading" id="pa"
								style="background-color: #e8f1f3; border-bottom: black">
								<div class="btn-group" id="buttonexport">
									<a href="javascript:void(0)">
										<h4>Proposal Work Order Prepare</h4>
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
									<select autocomplete="off" name="state" class="form-control"
										id="state" style="background: gold;">
										<option>MS</option>
										<option>OMS</option>
									</select>
								</div>
								
								
								

								<form  class="form-horizontal " id="demo-form3" method="post">
								
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
													class="col-sm-2 control-label">Company Name : <span
													class="required">*</span></label>
												<div class="col-sm-4">
													<select name="com" id="com" class="form-control select2"
														onchange="company_chnge()">
														<optgroup label="">
															<option value="">-- Select --</option>
															<%
															while (rs.next()) {
																Object a = rs.getString(1);
																Object c = rs.getString(2);
																Object n = rs.getString(3);
															%>
															<option id="cn" value="<%=c%>"><%=c%>&nbsp;<%=n%></option>

															<%
															}
															%>
														</optgroup>
													</select> <span id="err_cust_id" style="color: red;"></span>
												</div>



												<!-- onclick="save()" -->
												<label for="cust_id" id="cust_id_label"
													class="col-sm-2 control-label">Prop. Work Date:
													<span class="required">*</span>
												</label>

												<div class="input-group date" data-date-format="dd/mm/yyyy">
													<%
													impmethods = new impMethods();
													String date = impmethods.todaysDate();
													System.out.print("date>>" + date);
													%>
													<input type="date-text" class="form-control"
														placeholder="dd/mm/yyyy" name="pwdate" id="pwdate"
														value="<%=date%>" required>
													<div class="input-group-addon">
														<span class="glyphicon glyphicon-th"></span>
													</div>
												</div>
											</div>

											<div class="form-group">

												<div class="col-sm-4">

													<span id="err_inv_date" style="color: red;"></span>
												</div>

											</div>


											<div class="form-group">

												<label for="item_unit_id" class="col-sm-2 control-label">Product
													Code :</label>
												<div class="col-sm-4">
													<select id="item11" name="item11"
														class="select2 select2_single form-control">
														<optgroup label="select Item">
															<option value="">-- Select --</option>
														</optgroup>
													</select>
												</div>



												<label for="cust_id" id="cust_id_label"
													class="col-sm-2 control-label">Batch no. : <span
													class="required">*</span></label>
												<div class="col-sm-4">
													<select name="batchcode" id="batchcode"
														class="form-control select2">
														<optgroup label="">
															<option value="">-- Select --</option>
															<option value=""></option>
														</optgroup>
													</select> <span id="err_cust_id" style="color: red;"></span>
												</div>

											</div>

											<div class="form-group">
												<label for="cust_id" id="cust_id_label"
													class="col-sm-2 control-label">Batch MFG Date : <span
													class="required">*</span>
												</label>
												<div class="col-sm-4">
													<div class="input-group date" data-date-format="dd/mm/yyyy">
														<input type="date-text" class="form-control"
															placeholder="dd/mm/yyyy" name="dom" id="dom" required>
														<div class="input-group-addon">
															<span class="glyphicon glyphicon-th"></span>
														</div>
													</div>
												</div>
												<label for="cust_id" id="cust_id_label"
													class="col-sm-2 control-label">Batch Expiry Date :
													<span class="required">*</span>
												</label>
												<div class="col-sm-4">
													<div class="input-group date" data-date-format="dd/mm/yyyy">
														<input type="date-text" class="form-control"
															placeholder="dd/mm/yyyy" name="expdt" id="expdt" required>
														<div class="input-group-addon">
															<span class="glyphicon glyphicon-th"></span>
														</div>
													</div>
												</div>

											</div>


											<div class="form-group">
												<label for="cust_id" id="cust_id_label"
													class="col-sm-2 control-label">Department : <span
													class="required">*</span></label>
												<div class="col-sm-4">

													<input autocomplete="off" name="department" id="department"
														type="text" class="form-control">
													<!-- <select name="com" id="com" class="form-control select2"
														onchange="getPOID()">
														<optgroup label="">
															<option value="">-- Select --</option>
															<option value=""></option>
														</optgroup>
													</select> -->
													<!--<span class="small"><a data-toggle="modal" data-target="#adduser" href="jvascript:void(0);">Add new customer</a></span>-->
													<span id="err_cust_id" style="color: red;"></span>
												</div>

												<label for="cust_id" id="cust_id_label"
													class="col-sm-2 control-label">Product Name : <span
													class="required">*</span></label>
												<div class="col-sm-4">

													<input autocomplete="off" name="pn" required type="text"
														class="form-control" id="pn"> <span
														id="err_cust_id" style="color: red;"></span>
												</div>
												<div class="col-sm-4">
													<%
													//                                                                                                String Pid="1";
													//                                                                                                ds1= new DataService();
													//                                                                                                rs=ds1.PO_getID();
													//                                                                                                 if(rs.next()){Pid=rs.getString(1);}
													%>
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
														
														<th style="width: 20%; text-align: center" rowspan="2">Batch No/AR No</th>
														<th rowspan="2">Comp Code/Desc</th>
														<th colspan="4" style="text-align: center;">Issue Detail</th>
														<th rowspan="2">Batch Expiry Dt</th>
														<th rowspan="2">Next Inspection Dt</th>
														<th rowspan="2">Retest Date</th>
														
													
													</tr>
													
													<tr>
													<th>Original Qty</th>
													<th>UOM</th>
													<th>Redetermined Qty</th>
													<th>UOM</th>
													</tr>
												</thead>
												<tbody id="OrignalQnty">
												
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
												<center>
													<div class="col-sm-12">
														<button value="save" class="btn btn-success invoice_btn addButton" onclick="performActions()">Add</button>
														<a href="index.jsp" class="btn btn-default">Cancel</a>
														<div id="output3" style=""> </div>
													</div>
												</center>
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


$(document).ready(function() {
    $("#batchcode").on('change', function() {
        var batchCode = $(this).val();
        fetchBatchData(batchCode);
    });

    function fetchBatchData(batchCode) {
        $.ajax({
            type: "POST",
            url: "GetTableDataByBatchCode",
            data: {
                Bcode: batchCode
            },
            dataType: "json",
            success: function(response) {
                $("#OrignalQnty").empty(); // Clear the table

                if (response.Data) {
                    populateTable(response.Data, "Original Qty");
                   // populateTable(response.Data2, "Batch Expiry Dt");
                } else {
                    alert("Data not found.");
                }
            },
            error: function() {
                alert("Error fetching data.");
            }
        });
    }

    function populateTable(data, dateColumnName) {
        var table = $("#detailsTBL tbody");
        $.each(data, function(index, item) {
            var row = $("<tr>");
            
            row.append($("<td>").text(item.three).attr("id", "ID1"));//
            row.append($("<td>").text(item.five+"/"+item.seven).attr("id", "ID2"));
            //alert(item.seven);
            row.append($("<td>").text(item.two).attr("id", "ID3"));
            row.append($("<td>").text(item.one));
            row.append($("<td>").html('<input type="text"  name="redeterminedQty" value=" " />').attr("id", "ID4")); // Input field for Redetermined Qty
            
            row.append($("<td>").text(item.one).attr("id", "ID5"));
            row.append($("<td>").text(item.six).attr("id", "ID6"));
            // Batch Expiry Dt
            row.append($("<td>").text(item.eight).attr("id", "ID7"));
            row.append($("<td>").text(item.nine).attr("id", "ID8"));
           
          
            
            table.append(row);
        });
        
        
    }
});

	
	</script>
	
	
	
<script>
	//get Product Name by Batch Code
	$(document).ready(function() {
	
	$("#batchcode").on('change', function() {
	    var batchCode = $(this).val();
	    //alert(batchCode);
	    fetchProductname(batchCode); 
	});


	function fetchProductname(batchCode){
        $.ajax({
            type: "POST", 
            url: "GetProductNameByBatchCode", 
            data: {
            	Bcode : batchCode
            },
            dataType: "json",
            success: function(response) {
                // $("#Ori").empty();
					console.log(response.Data.productname);
				
				
			  
                  $.each(response.Data, function(index, item) {
                    $('#pn').val(item.productname);
                    $('#expdt').val(item.expdate);
                    $('#dom').val(item.dtofmfg);
                    
                	  
                });  
            },
            error: function() {
                alert("Error fetching product codes.");
            }
        });
    }
	
	
	
	
	
});
	




	
</script>



 
<!-- <script>
$('.addButton').click(function() {
    var com = $("#cn").text();
    var pwdate = $("#pwdate").val();
    var batchcode = $("#batchcode").val();
    var productCode = $("#item11").val();
    var hmd = $("#hmd").val();
    var department = $("#department").val();
    var dom = $("#dom").val();
    var data = []; // Define rowDataArray here

    
    alert(com);
    alert(pwdate);
    alert(batchcode);
    alert(productCode);
    alert(hmd);
    alert(department);
    alert(dom);
   
   

	var jsonData = JSON.stringify(data);
	

	$.ajax({
		method : "POST",
		url : "Createworkorders",
		cache : false,
		data : {
			  com: com,
	             pwdate: pwdate,
	             batchcode: batchcode,
	             productCode: productCode,
	             hmd: hmd,
	             department: department,
	             dom: dom,
	             obj: jsonData,
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
	
});


</script>
 -->
 <!-- <script>
 $('.addButton').click(function() {
	    // Extract and store the form data
	    var com = $("#cn").text();
	    var pwdate = $("#pwdate").val();
	    var batchcode = $("#batchcode").val();
	    var productCode = $("#item11").val();
	    var hmd = $("#hmd").val();
	    var department = $("#department").val();
	    var dom = $("#dom").val();

	    alert(com);
	    alert(pwdate);
	    alert(batchcode);
	    alert(productCode);
	    alert(hmd);
	    alert(department);
	    alert(dom);
	    
	    // Prepare an object for form data
	    var formData = {
	        com: com,
	        pwdate: pwdate,
	        batchcode: batchcode,
	        productCode: productCode,
	        hmd: hmd,
	        department: department,
	        dom: dom
	    };

	    // Perform an AJAX POST request to save form data only once
	     $.ajax({
	        method: "POST",
	        url: "Createworder", // Replace with your servlet URL
	        cache: false,
	        data: {
	            formData: JSON.stringify(formData),
	            obj1: JSON.stringify({}) // You can send an empty object or any data related to the form
	        },
	        success: function(response) {
	            alert("Form data saved successfully.");
	        },
	        error: function(error) {
	            alert("Error: " + error.responseText);
	        }
	    }); 

	    // Loop through the table rows and save data for each row
	    $("#detailsTBL tbody tr").each(function(index, row) {
	        var rowData = {};

						        // Extract data from the current row
	        rowData.cimsbatchno = $(row).find("#ID1").text();
	        rowData.company_id = $(row).find("#ID2").text();
	        rowData.original = $(row).find("#ID3").text();
	        rowData.redetermine = $(row).find("#ID4 input").val(); // Assuming it's an input field
	        rowData.uomr = $(row).find("#ID5").text();
	        rowData.batchexp = $(row).find("#ID6").text();
	        rowData.nextinsp = $(row).find("#ID7").text();
	        rowData.ratestdt = $(row).find("#ID8").text();
	        rowData.sloc = "-";
	        rowData.binno = "-";
	        
	        var cimsbatchno = rowData.cimsbatchno;
	        var company_id = rowData.company_id;
	        var original = rowData.original;
	        var redetermine =  rowData.redetermine;
	        var uomr =  rowData.uomr;
	        var batchexp = rowData.batchexp;
	        var nextinsp = rowData.nextinsp;
	        var ratestdt = rowData.ratestdt;
	        var sloc = rowData.sloc;
	        var binno = rowData.binno;
	        /* var redetermine =  rowData.redetermine;
	        var uomr =  rowData.uomr; */
	        
            alert(cimsbatchno);
            alert(company_id);
            alert(original);
            alert(redetermine);
            alert(uomr);
            alert(batchexp);
            alert(nextinsp);
            alert(ratestdt);
         
            /* alert(redetermine);
            alert(rowData.nextinsp);
            alert(rowData.ratestdt);
            alert(rowData.sloc);
            alert(rowData.binno); */

	        // Perform an AJAX POST request to save data for each row
	        $.ajax({
	            method: "POST",
	            url: "Createworder", // Replace with your servlet URL
	            cache: false,
	            data: {
	                formData: JSON.stringify(formData), // Send form data only once
	                obj1: JSON.stringify(rowData) // Send data related to the current row
	            },
	            success: function(response) {
	                alert("Data for row " + (index + 1) + " saved successfully.");
	            },
	            error: function(error) {
	                alert("Error: " + error.responseText);
	            }
	        });
	    });
	});

</script>
 --> 
 
 <script type="text/javascript">

 /* $('#addButton').click(function() {
   
    
    var elementsWithID1 = document.querySelectorAll('td[id="ID1"]');
     var elementsWithID2 = document.querySelectorAll('td[id="ID3"]');
    var elementsWithID3 = document.querySelectorAll('td[id="ID2"]');
    var elementsWithID4 = document.querySelectorAll('td[id="ID4"]');
    var elementsWithID5 = document.querySelectorAll('td[id="ID5"]');
    var elementsWithID6 = document.querySelectorAll('td[id="ID6"]');
    var elementsWithID7 = document.querySelectorAll('td[id="ID7"]');
    var elementsWithID8 = document.querySelectorAll('td[id="ID8"]');
  

 
 var data = [];//iquntity
 elementsWithID2.forEach(function(element) {
   data.push(element.textContent);
 });
 
 var data2 = [];//cname
 elementsWithID3.forEach(function(element2) {
   data2.push(element2.textContent);
 });
 
 var data3 =[];//cimsbatchno
 elementsWithID1.forEach(function(element) {
	   data3.push(element.textContent);
	 });
 
 var data4 =[];
 elementsWithID4.forEach(function(td) {
	  // Find the input element within the current table cell
	  var input = td.querySelector('input[name="redeterminedQty"]');
	  
	  if (input) {
	    // Check if the value exists and is not empty
	    if (input.value !== "" && input.value !== null) {
	    	data4.push(input.value);
	    } else {
	      alert("Enter the redertemine");
	    }
	  }
	});

 
 
 
 var data5 =[];
 elementsWithID5.forEach(function(element) {
	   data5.push(element.textContent);
	 });
 
 var data6 =[];
 elementsWithID6.forEach(function(element) {
	   data6.push(element.textContent);
	 });
 
 var data7 =[];
 elementsWithID7.forEach(function(element) {
	   data7.push(element.textContent);
	 });
 
 var data8 =[];
 elementsWithID8.forEach(function(element) {
	   data8.push(element.textContent);
	 });
    

     
     
 alert("cimsbatch"+data3);
 alert(" cid"+data2);
 alert("origin"+data);
 alert("rederterminr"+data4);
 alert("unit"+data5);
 alert("expirydate"+data6);
 alert("batch"+batchcode)
 
 

var requestData = {
		data: data,
		  data2: data2,
		  data3: data3,
		  data4: data4,
		  data5: data5,
		  data6: data6,
		  data7: data7,
		  data8: data8,
		  batchcode: batchcode,
};
 
const myJSON = JSON.stringify(requestData);

$.ajax({
    method: "POST",
    url: "TestingCreateWorkOrder", // Replace with your servlet URL
    cache: false,
    data : myJSON,
    //contentType: "application/json",
    
    success: function(data) {
    	alert("Data inserted successfully...");
        $('#successMessage').html('Data inserted successfully').delay(5000);
        $('#successMessage').show();
        $("#spinner").hide();
      //location.reload();
    },
    error: function(error) {
        alert("Error: " + error.responseText);
    }
});




     
});    */ 



   
  

function sendFormdata() {
    var com = $("#cn").text();
    var pwdate = $("#pwdate").val();
    var batchcode = $("#batchcode").val();
    var productCode = $("#item11").val();
    //var hmd = $("#hmd").val();
    var department = $("#department").val();
    var dom = $("#dom").val();

    alert(com);
    alert(pwdate);
    alert(batchcode);
    alert(productCode);
    //alert(hmd);
    alert(department);
    alert(dom);

    var formdata = {
        com: com,
        pwdate: pwdate,
        batchcode: batchcode,
        productCode: productCode,
       // hmd: hmd,
        department: department,
        dom: dom
    };

    // Send the form data via AJAX
    $.ajax({
        method: "POST",
        url: "CreateWorkOrder", // Replace with your form data endpoint
        data: formdata,
        success: function(response) {
        	alert("Data inserted successfully...");
            $('#successMessage').html('Data inserted successfully').delay(5000);
            $('#successMessage').show();
            $("#spinner").hide();
        },
        error: function(error) {
            console.error("Error in the form data AJAX call: " + error.responseText);
        }
    });
}

function sendTableData() {
	 var batchcode = $("#batchcode").val();
    var elementsWithID1 = document.querySelectorAll('td[id="ID1"]');
     var elementsWithID2 = document.querySelectorAll('td[id="ID3"]');
    var elementsWithID3 = document.querySelectorAll('td[id="ID2"]');
    var elementsWithID4 = document.querySelectorAll('td[id="ID4"]');
    var elementsWithID5 = document.querySelectorAll('td[id="ID5"]');
    var elementsWithID6 = document.querySelectorAll('td[id="ID6"]');
    var elementsWithID7 = document.querySelectorAll('td[id="ID7"]');
    var elementsWithID8 = document.querySelectorAll('td[id="ID8"]');
  

 
 var data = [];//iquntity
 elementsWithID2.forEach(function(element) {
   data.push(element.textContent);
 });
 
 var data2 = [];//cname
 elementsWithID3.forEach(function(element2) {
   data2.push(element2.textContent);
 });
 
 var data3 =[];//cimsbatchno
 elementsWithID1.forEach(function(element) {
	   data3.push(element.textContent);
	 });
 
 var data4 =[];
 elementsWithID4.forEach(function(td) {
	  // Find the input element within the current table cell
	  var input = td.querySelector('input[name="redeterminedQty"]');
	  
	  if (input) {
	    // Check if the value exists and is not empty
	    if (input.value !== "" && input.value !== null) {
	    	data4.push(input.value);
	    } else {
	      alert("Enter the redertemine");
	    }
	  }
	});

 
 
 
 var data5 =[];
 elementsWithID5.forEach(function(element) {
	   data5.push(element.textContent);
	 });
 
 var data6 =[];
 elementsWithID6.forEach(function(element) {
	   data6.push(element.textContent);
	 });
 
 var data7 =[];
 elementsWithID7.forEach(function(element) {
	   data7.push(element.textContent);
	 });
 
 var data8 =[];
 elementsWithID8.forEach(function(element) {
	   data8.push(element.textContent);
	 });
    

     
     
 alert("cimsbatch"+data3);
 alert(" cid"+data2);
 alert("origin"+data);
 alert("rederterminr"+data4);
 alert("unit"+data5);
 alert("expirydate"+data6);
 alert("batch"+batchcode)
 
 

var requestData = {
		data: data,
		  data2: data2,
		  data3: data3,
		  data4: data4,
		  data5: data5,
		  data6: data6,
		  data7: data7,
		  data8: data8,
		  batchcode: batchcode,
};
 
const myJSON = JSON.stringify(requestData);

$.ajax({
    method: "POST",
    url: "TestingCreateWorkOrder", // Replace with your servlet URL
    cache: false,
    data : myJSON,
    //contentType: "application/json",
    
    success: function(data) {
    	alert("Data inserted successfully...");
        $('#successMessage').html('Data inserted successfully').delay(5000);
        $('#successMessage').show();
        $("#spinner").hide();
      //location.reload();
    },
    error: function(error) {
        alert("Error: " + error.responseText);
    }
});

}

    	
    
    


</script> 
<script>


function performActions() {
    sendFormdata();
    sendTableData();
}
</script>