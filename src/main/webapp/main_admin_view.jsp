<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"
	errorPage="eror.jsp"%>
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

<%
	//String driverName = "com.mysql.jdbc.Driver";
	//String connectionUrl = "jdbc:mysql://103.14.99.198:3306/";
	//String dbName = "security_force";
	//String userId = "root";
	//String password = "9QT2{gZvm[Gx~b";

	DataService c1;
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>

<!-- page content -->
<div class="right_col" role="main">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3 style="color: black;">Manage Admin Users</h3>
			</div>

		</div>
		<div class="clearfix"></div>

		<div class="row">

			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<button onclick="goBack()" class="btn btn-success btn-xs">Go
						Back</button>
					<div class="x_content">
						<table style="color: black;" id=""
							class="table table-striped responsive-utilities jambo_table">
							<thead>
								<tr class="headings fix_back_color">
									<th>username</th>
									<th>password</th>
									<th>name</th>
									<th>roles</th>
									<th>admin date</th>

									<th class=" no-link last"><span class="nobr">Action</span>
									</th>
								</tr>
							</thead>

							<tbody>
								<%
									try {
										c1 = new DataService();
										// connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
										statement = c1.c.createStatement();
										String sql = "SELECT * FROM admin_user";

										resultSet = statement.executeQuery(sql);
										int i = 0;
										while (resultSet.next()) {
								%>
								<tr id="<%=i%>">
									<td><%=resultSet.getString("username")%></td>
									<td><%=resultSet.getString("password")%></td>
									<td><%=resultSet.getString("name")%></td>
									<td><%=resultSet.getString("roles")%></td>
									<td><%=resultSet.getString("admin_date")%></td>
									<td hidden><%=resultSet.getString("id")%></td>
									<td class=" last">
										<%--   <button class="btn btn-danger btn-xs" href="#">Delete User</button>--%>
										<a><button value="<%=resultSet.getString("id")%>"
												class="deleteUnit btn btn-danger btn-xs btn_delete">Delete
												Users</button></a>
									</td>
								</tr>
								<%
									}

									} catch (Exception e) {
										e.printStackTrace();
									}
								%>
							</tbody>
						</table>
						<script>
							$(".deleteUnit").click(function() {

								var result = confirm("Want to delete?");
								var id = $(this).val();
								alert(id);
								if (result) {
									$.ajax({
										type : "POST",
										url : "Delete_Admin_Servlet",
										data : {
											id : id
										},
										success : function(data) {
											//$('#successMessage2').html('Unit Details Updated Succesfully').delay(5000).fadeOut();
											$('#successMassage2').show();
											alert("Deleted Successfully");
											location.reload();
										}
									});
									return false;
								}

							});

							function goBack() {
								window.history.back();
							}
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="templates/footer.html" />