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
							<div class="panel-heading" id="pa"
								style="background-color: #e8f1f3; border-bottom: black">
								<div class="btn-group" id="buttonexport">
									<a href="javascript:void(0)">
										<h4>Stock Inspection</h4>
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
								<div class="text-right">
									<input type="button" class="DTTT_button"
										onclick="tableToExcel('example', 'W3C Example Table')"
										value="Export to Excel">
								</div>
								<div class="table-responsive" style="height: 460px;">
									<table id="example"
										class="table table-striped table-bordered responsive-utilities jambo_table  data-sort-order ">
										<thead>
											<tr class="headings fix_back_color">
												<th>Sr no</th>
												<th>Item Name</th>
												<th>In Qual. Insp. / Under Test</th>
												<th>Released Stocks</th>
												<th>Action</th>
											</tr>
										</thead>

										<tbody>

											<%
												try {
													sr1 = new DataService();
													rs2 = sr1.getAllInspectionElement();
													int no = 1;
											%>




											<tr>
												<%
													while (rs2.next()) {
												%>
												<td><%=no++%></td>
												<td><%=rs2.getObject(1)%></td>
												<td><%=rs2.getObject(2)%></td>
												<td><%=rs2.getObject(3)%></td>
												<td><button class="btn btn-xs btn-success">Add To Stock</button> </td>
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