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
				      View All Batch
					
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
								onclick="tableToExcel('example', 'W3C Example Table')"
								value="Export to Excel">
							</div>
							
							
								<div class="table-responsive" style="height: 460px;">
							<table id="example"
								class="table table-striped table-bordered responsive-utilities jambo_table  data-sort-order ">
								
								<thead>
								
								<tr class="headings fix_back_color">
									<th>batchId</th>
									<th>batchNo</th>
									<th>Date</th>
									<th>Product Code</th>
									<th>Product Name</th>
									<th>Company Name</th>
									<th>Version</th>
									<th class=" no-link last"><span class="nobr">Action</span></th>
								</tr>
							</thead>
								<%
								int i = 0, hu = 1;
									
									while (rs2.next()) {
							%>
							<tr id="<%=i%>">
							     <td><%=rs2.getObject("batch_id")%></td>
							    <td><%=rs2.getObject("batch_no")%></td>
								<td><%=rs2.getObject("batch_date")%></td>
								<td><%=rs2.getObject("product_code")%></td>
								<td><%=rs2.getObject("product_name")%></td>
								<td><%=rs2.getObject("Cname")%></td>
								
								<td><%=rs2.getObject("product_version")%></td>
								
								<td class=" last">

                <!-- Print Button -->
    <form action="batch_generation_view.jsp" method="post">
                     <input type="hidden" name="batch_no" value="<%=rs2.getObject("batch_no")%>">
                     <button type="submit" class="btn btn-success btn-xs">View</button>
                  </form>                    
										
		       <form action="Batch_edit_delete" method="post">
                   <input type="hidden" name="batch_no" value="<%=rs2.getString("batch_no")%>">
                   <button type="submit" class="btn btn-danger btn-xs btn_delete">Delete</button>
               </form>
								</td>
							</tr>
							<%
								i++;
									}
							%>
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