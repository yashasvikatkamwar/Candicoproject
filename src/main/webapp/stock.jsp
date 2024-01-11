<%@page import="org.apache.poi.util.SystemOutLogger"%>
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

<%!ResultSet rq, data, data2, data3, data4, data5, re, selectData, rs2;
	ResultSetMetaData rsmd;
	Object ob;
	DataService sr1;
	int x;
	Object aval, bval, unitid;
	int i = 0;
	ArrayList ar;
	JSONArray list;
	Iterator ity;
	Object o1;
	String gender;
	String S_tyep, seller_id;%>

<div class="right_col" role="main">
	<div class="">

		<div class="content-wrapper">
			<section class="content lobipanel">
				<div class="row">
					<div class="col-sm-12">
						<div class="panel panel-bd lobidrag">
							<div class="panel-body" class="row"
								style="background-color: #ffffff;">


								<div class="text-right">
									<!-- Print Button -->
									<button onclick="printPage()">Print</button>

									<script>
										function printPage() {
											window.print();
										}
									</script>
									<input type="button" class="DTTT_button"
										onclick="tableToExcel('example', 'W3C Example Table')"
										value="Export to Excel">
								</div>
								<div class="table-responsive" style="height:600px;">
									<table id="stockTable"
										class="table table-striped table-bordered responsive-utilities jambo_table  data-sort-order ">
										<thead>
											<tr class="headings fix_back_color">
												<th>Sr no</th>
												<th>Company Name</th>
												<th>Item Code</th>
												<th>Item Name</th>
												<!-- <th>Base Unit of Measure</th> -->
												<th>Under Test Stock</th>
												<th>CIMS Batch</th>
												<th>Recived Quantity</th>
												<th>Released Qty</th>
												<th>AR.No.</th>
												<th>Vendor Batch No</th>
												<!-- <th>Mfg Batch No.</th> -->
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
												rs2=sr1.StockDetails();
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
												<td><%=rs2.getObject("com_name")%></td> 
												 <td><%=rs2.getObject("Iid")%></td> 
												 <td><%=rs2.getObject("Iname")%></td> 
												<%-- <td><%=rs2.getObject("QTY_in_unit_of_Entry1")%></td> --%>
												<% if(rs2.getObject("result").equals("UNDER PROCESS"))
													{
													%>
														<td class="text-danger bg-red text-center">Under Test</td>
													<% 
													}else
													{
													%>
														<td class="text-success bg-green text-center">Out of Test</td>
													<% 
													}
													
													%>
													
												
												 <td><%=rs2.getObject("CIMS_batch_no")%></td>
												<!--<td class="text-success bg-green text-center"></td>-->
												<td ><%=rs2.getObject("received_QTY")%></td>
												<td ><%=rs2.getObject("RELEASED_QTY")%></td>
												<td ><%=rs2.getObject("AR_no")%></td>
												<td><%=rs2.getObject("vender_batch_no")%></td>
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
													    <td class="text-danger bg-blue text-center"><%= rs2.getObject("result") %></td>
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