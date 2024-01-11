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
<%ResultSet rs,data,data1,data2;
DataService ds1;ArrayList ar;Iterator ity;Object o1=null; %>
<% 
DataService sr1;int x;Object aval,bval;ResultSetMetaData rsmd;
String Vname,Vadrs,Vgst;
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
<%

        String batch_no = request.getParameter("batch_no");
     
   
    sr1=new DataService();
    rs=sr1.viewBatchById(batch_no);
   
if(rs.next()){
%>
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
										<h4> Batch Edit  : <%=rs.getString("batchSize_no")%></h4>
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

								<form class="form-horizontal " action="updatebatch" method="post">
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
                                                      ds1= new DataService();
                                                      //String company_id = rs.getString("company_id");
                                                      //data=ds1.getCompanyname(company_id);
                                                      data =ds1.Company_list();
                                                  %>
                                                  <select name="com" id="com"  class="form-control select2" onchange="generateTableRow();">
                                                      <optgroup label="">
                                                   <option value="<%=rs.getString("company_id")%>=><%=rs.getString("Cname")%>=><%=rs.getString("company_id")%>"><%=rs.getString("Cname")%>
                                               
                                                       <%
                                                               while(data.next()){
                                                                    Object ven= data.getString(1)+"=>"+data.getString(3)+"=>"+data.getString(5);
                                                                    Object ven2= data.getString(3);
                                                             %>
                                                   <option value="<%=ven%>"><%=ven2%></option>
                                                                                                              <% }%> 
                                                      </optgroup>
                                                        </select>
												<!--<span class="small"><a data-toggle="modal" data-target="#adduser" href="jvascript:void(0);">Add new customer</a></span>-->
												<span id="err_cust_id" style="color:red;"></span>
											</div>
											
											
											

												<label for="cust_id" id="cust_id_label"
													class="col-sm-2 control-label">Batch No : <span
													class="required">*</span></label>
												<div class="col-sm-4">
													
													 <input name="batch_no" required type="text" value = "<%=rs.getString("batch_no") %>"  class="form-control" id="batch_no">
                                                       <span id="err_cust_id" style="color:red;"></span> 
												</div>
											</div>
											<div class="form-group">
													<label for="cust_id" id="cust_id_label"
													class="col-sm-2 control-label">Batch Id : <span
													class="required">*</span></label>
												<div class="col-sm-4">

													 <input name="batch_id" required type="text"  value = "<%=rs.getString("batch_id") %>"   class="form-control" id="batch_id">
                                                       <span id="err_cust_id" style="color:red;"></span> 
													<!--<span class="small"><a data-toggle="modal" data-target="#adduser" href="jvascript:void(0);">Add new customer</a></span>-->
													<!--<span id="err_cust_id" style="color: red;"></span>-->
												</div>

												<label for="cust_id" id="cust_id_label"
													class="col-sm-2 control-label">Version : <span
													class="required">*</span></label>
												<div class="col-sm-4">

													 <input name="product_version" required type="text"  value = "<%=rs.getString("product_version") %>"  class="form-control" id="version">
                                                       <span id="err_cust_id" style="color:red;"></span> 
													<!--<span class="small"><a data-toggle="modal" data-target="#adduser" href="jvascript:void(0);">Add new customer</a></span>-->
													<!--<span id="err_cust_id" style="color: red;"></span>-->
												</div>


											</div>

											<div class="form-group">
												<label for="date" class="col-sm-2 control-label">Date
												 : <span class="required">*</span>
												</label>
												<div class="col-sm-4">

													<div class="input-group date" data-date-format="dd/mm/yyyy">
														<input type="date-text" class="form-control"
															placeholder="dd/mm/yyyy" name="batch_date" value="<%=rs.getString("batch_date")%>" id="batch_date" required>
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
													
													 <input name="batch_sizeKg" required type="text"  value="<%=rs.getString("batch_sizeKg")%>" class="form-control" id="batch_sizeKg">
                                                       <span id="err_cust_id" style="color:red;"></span> 
												</div>

											</div>

											<div class="form-group">
											
											
											<label for="month" class="col-sm-2 control-label">Product code: <span class="required">*</span>
												</label>

												<div class="col-sm-4">
													<input name="product_code" required type="text"  value="<%=rs.getString("product_code")%>" class="form-control" id="product_code">
												</div>

											
												
												<label for="cust_id" id="cust_id_label"
													class="col-sm-2 control-label">Batch size(No's) : <span
													class="required">*</span></label>
												<div class="col-sm-4">
													
													 <input name="batchSize_no" required type="text"   value="<%=rs.getString("batchSize_no")%>" class="form-control" id="batchSize_no">
                                                       <span id="err_cust_id" style="color:red;"></span> 
												</div>
											</div>


											<div class="form-group">
												
                                               <label for="cust_id" id="cust_id_label"
													class="col-sm-2 control-label">Product Name:
													<span class="required">*</span>
												</label>
												<div class="col-sm-4">
													
													<input name="product_name" required type="text"  value="<%=rs.getString("product_name")%>" class="form-control" id="product_name">
                                                       <span id="err_cust_id" style="color:red;"></span> 
												</div>
												<label for="cust_id" id="cust_id_label"
													class="col-sm-2 control-label">Items : <span
													class="required">*</span></label>
												<div class="col-sm-4">
												<%
                                                     ds1= new DataService();
                                                     data1=ds1.Item_Master_list();
                                                  %>
                                               <select name="items" id="items" class="select2 select2_single form-control" onchange="" >
                                                 <optgroup label="select Item">
                                                    <option value="">-- Select --</option>
                                                          <%
                                                               while(data1.next()){
                                                               String o= data1.getString("item_name");
                                                               Object f=data1.getString("item_name");
                                                           %>
                                                  <option value="<%=o%>"><%=f%></option>
                                                        <%}%> 
                                                     </optgroup>
                                                  </select>
												<span id="err_item_color" style="color:red;"></span>
											</div>
											</div>
										</div>
									</div>

									<div class="col-md-12"
											style="height: 400px; overflow-x: scroll; overflow-y: scroll">

											<table class="inner-table-2 inventory" id="detailsTBL" >
                                                                    <thead>
                                                                        <tr>
                                                                       
                                                                       
                                                                        <th  style=" width: 21%;text-align: center">Item name</th>
                                                                        <th>QTY</th>
                                                                        <th>unit</th>
                                                                      
                                                                        <th>Productcode</th>
                                                                        
                                                                      </tr> 
                                                                    </thead>
                                                                       <%
                                                                         sr1=new DataService();
                                                                       data2=sr1.batch_product_itemlist(batch_no);
                                                                            %>
                                                                    <tbody>
                                                                     <%
                                                                     int jj=1;
                                                                    while(data2.next()){%>
                                                                 <tr>
                                                                    <td><%=data2.getString("iName") %></td>
                                                                    <td><%=data2.getString("iQuantity") %></td>
                                                                    <td><%=data2.getString("unit") %></td>
                                                                  
                                                                    <td><%=data2.getString("product_code") %></td>
                                                                 </tr>
                                                                  <%}%>
                                                                    </tbody>
                                                                 
                                                                             </table>
										</div>
									<br>
									<div class="row">
									<div class="col-md-12">
										<div class="form-group">
                                          <center> 
                                          
											<div class="col-sm-12">
											<form action ="">
												<button type="submit"  id=" " class="btn btn-success invoice_btn ">Update</button>
												</form>
												<a href="index.jsp" class="btn btn-default">Cancel</a>
												<div id="output3" style=""></div>
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
				
			</section>
			<!-- /.content -->
		</div>
	</div>

</div>	
<%} %>					




<jsp:include page="templates/footer.html" />
