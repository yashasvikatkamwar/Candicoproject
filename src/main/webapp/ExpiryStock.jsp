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
<%!ResultSet rs,rq, data, data2, data3, data4, data5, re, selectData, rs2;
	ResultSetMetaData rsmd;
	Object ob;
	DataService sr1,ds1 ; 
	int x;
	Object aval, bval, unitid;
	int i = 0;
	ArrayList ar;
	JSONArray list;
	Iterator ity;
	Object o1;
	String gender;

	%>
<%

                String Fdate="",Tdate="",company_id="";
                Fdate=request.getParameter("Fdate");
                Tdate=request.getParameter("Tdate");
                company_id=request.getParameter("company_id");
    %>
    
    <div class="right_col" role="main">

	<div class="">
	
	    <div class="page-title">
			<div class="title_left" style="width: 100%">
				<h3 style="color: black;">
				      Expire Stocks
					
									<div class="buttonexport">
										<a class="btn btn-add" onclick="history.back()"> Back </a>
									</div>
							
				</h3>

			</div>
			
			
		</div>
		<div class="clearfix"></div>
		<div class="row">

			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title" style="background: #e8f1f3; width: 100%">

						<form id="demo-form3" action=""
							data-parsley-validate class="form-horizontal form-label-left"
							style="margin-top: 1%;">
							<table>	
								<tr>
									<td>
                           <%
                            ds1= new DataService();
                            rs=ds1.Company_list();
                           %>
                        <select name="company_id" id="company_id" class="form-control select2">
                          <optgroup label="">
                          <option value="">-- Select Company --</option>
                                        <%
                                         while(rs.next()){
                                          String ven= rs.getString(2);
                                          String ven2= rs.getString(3);
                                        %>
                            <option value="<%=ven%>"><%=ven2%></option>
                            
                                          <% }%> 
                            </optgroup>
                        </select>  
                         
                     </td>
									<td>
										<div class="form-group" style="float: right;">
											<!--                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name" style="width:150px;height:30px;margin-right:40px;color:black;">Attendance Date:
                      </label>-->
                                             
											<div class="col-xs-12" style="height: 30px;">
												<!--                          <body onload="addDate();">-->
												<div class="col-xs-6">
													<div class="input-group date" data-date-format="dd/mm/yyyy">
														<input type="date-text" class="form-control"
															placeholder="dd/mm/yyyy" name="Fdate" id="Fdate" required>
														<div class="input-group-addon">
															<span class="glyphicon glyphicon-th"></span>
														</div>
													</div>
												</div>
												<div class="col-xs-6">
													<div class="input-group date" data-date-format="dd/mm/yyyy">
														<input type="date-text" class="form-control"
															placeholder="dd/mm/yyyy" name="Tdate" id="Tdate" required>
														<div class="input-group-addon">
															<span class="glyphicon glyphicon-th"></span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</td>
									<td>
										<div class="col-md-6 col-sm-6 col-xs-12 ">
											<button type="submit" class="btn fix_back_color"
												style="width: 150px; height: 40;">Find</button>
												</div>
									</td>
								</tr>
							</table>
							
							</form>
							
							<div class="clearfix"></div>
							</div>
							
							<div class="x_content">
						<div class="text-right">
						<%
                              try{
                              sr1=new DataService();
                              //rs2 = sr1.view_All_batchgen();
                               //rs2 = sr1.view_All_Batch(company_id);
                              //rs2 = sr1.view_All_Batchbydate(Fdate, Tdate);
                              rs2=sr1.view_All_Batchs(company_id, Fdate, Tdate); 
                             
                              
                              
                              rsmd=rs2.getMetaData();
                              x=rsmd.getColumnCount();
                            %>
						
							<input type="button" class="DTTT_button"
								onclick="tableToExcel('stockTable', 'W3C Example Table')"
								value="Export to Excel">
							</div>
							
							
								<div class="table-responsive" style="height: 460px;">
							<table id="stockTable"
										class="table table-striped table-bordered responsive-utilities jambo_table  data-sort-order ">
										<thead>
											<tr class="headings fix_back_color">
												<th>Sr no</th>
												<th>Company Name</th>
												<th>Item Code</th>
												<th>Item Name</th>
												<th>AR.No.</th>
												<!-- <th>Base Unit of Measure</th> -->
												<th>Under Test Stock</th>
												<th>CIMS Batch</th>
												<th>Recived Quantity</th>
												<th>Released Qty</th>
												
												<th>Vendor Batch No</th>
												<!-- <th>Mfg Batch No.</th> -->
												<th>Sample Date</th>
												<th>Mfg Date</th>
												
												<th>SLED/BBD(Expiry Date)</th>
												<th>Next Insp Date(Reanaylisis Date)</th>
												<th>Manufactuer Retest Date</th>
												<th>Manufacturer Desc</th>
												<!-- <th>Rate</th> -->
												<!-- <th>Value</th> -->
												<th>Vender Name</th>
												<th>Result</th>
											</tr>
										</thead>

										<tbody>

											<%
											try {
												sr1 = new DataService();
												rs2=sr1.getExpireStock(company_id, Fdate, Tdate);
												rsmd = rs2.getMetaData();
												x = rsmd.getColumnCount();
												int no = 1, i = 0;
											%>
											<tr>
												<%
												while (rs2.next()) {
												%>
												<td><%=no++%></td>
												<%-- <td><%=rs2.getObject("Gid") %> --%>
												<td><%=rs2.getObject("Cname")%></td> 
												 <td><%=rs2.getObject("Iid")%></td> 
												 <td><%=rs2.getObject("Iname")%></td> 
												 <td ><%=rs2.getObject("AR_no")%></td>
												<%-- <td><%=rs2.getObject("QTY_in_unit_of_Entry1")%></td> --%>
												<% if(rs2.getObject("result").equals("UNDER PROCESS"))
													{
													%>
														<td class="text-danger bg-red text-center">Under Test</td>
													<% 
													}else
													{
													%>
														<td class="text-success bg-green text-center">Out of  Test</td>
													<% 
													}
													%>
													
												
												 <td><%=rs2.getObject("CIMS_batch_no")%></td>
												<!--<td class="text-success bg-green text-center"></td>-->
												<td ><%=rs2.getObject("received_QTY")%></td>
												<td ><%=rs2.getObject("RELEASED_QTY")%></td>
												
												<td><%=rs2.getObject("vender_batch_no")%></td>
												<td><%=rs2.getObject("sample_date")%></td>
												<td><%=rs2.getObject("MFG_date")%></td>
												<td><%=rs2.getObject("expiry_date")%></td>
												<td><%=rs2.getObject("REANALYSIS_DATE")%></td>
												<td><%=rs2.getObject("MFG_retest_date")%></td>
												<td><%=rs2.getObject("MFG_name")%></td>
												<%-- <td><%=rs2.getObject("rate")%></td> --%>
												<!-- <td class="text-danger text-center">0</td> -->
												<td><%=rs2.getObject("Vname")%></td>
												
												<%
													if (rs2.getObject("result").equals("RELEASED"))
													{
													    
													%>
													    <td class="text-success bg-green text-center"><%= rs2.getObject("result") %></td>
													<%
													}
													else if (rs2.getObject("result").equals("REJECTED"))
													{
													%>
													    <td class="text-danger bg-red text-center"><%= rs2.getObject("result") %></td>
													<%
													}
													else if (rs2.getObject("result").equals("UNDER PROCESS"))
													{
													%>
													    <td class="text-danger bg-BLUE text-center"><%= rs2.getObject("result") %></td>
													<%
													}
													else
													{
													%>
													    <td><%= rs2.getObject("result") %></td>
													<%
													}
													%>
												
												<%=i++%>
											</tr>
											<%
											}

											} catch (Exception Ex) {

											}
											%>
										</tbody>
									</table>
							</div>
							</div>
							</div>
	</div>
	
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
	</div>
	</div>
 
	
<jsp:include page="templates/footer.html" />
<jsp:include page="templates/footer.html" />
<script type="text/javascript">
	function myFunction(id) {
		var x = document.getElementById("myDIV" + id);

		if (x.style.display === "none") {
			x.style.display = "block";
			document.getElementById("btnSuccess" + id).style.display = "block";
			document.getElementById(id).style.display = "none";

		} else {
			x.style.display = "none";
			document.getElementById("btnSuccess" + id).style.display = "none";
		}
	}

	function submitAction(id) {
		var id = id.substring(10);
		//alert(id);
		var buttonId = document.getElementById("btnSuccess" + id).value;
		//alert("buttonId>>"+buttonId);
		var inputBoxValue = document.getElementById("inputBox" + id).value;

		var result = confirm("want to Update?");
		var task = "updateStockToReleased"
		if (result) {

			if (inputBoxValue != null) {
				$.ajax({
					type : "POST",
					url : "updateStockServlet",
					data : {
						inputBoxValue : inputBoxValue,
						buttonId : buttonId
					},
					success : function(data) {
						alert("Item Added Successfully");
						location.reload();
					}
				});

			} else {
				return false;
			}

		}

	}
</script>

<jsp:include page="templates/footer.html" />