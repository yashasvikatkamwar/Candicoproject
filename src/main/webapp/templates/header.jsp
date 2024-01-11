
<%@page import="org.joda.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"
	errorPage="eror.jsp"%>
<%!String uname;
	String str1;
	String S_tyep = "0";
	String seller_id = "0";%>
<%
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://103.14.99.198:3306/";
	String dbName = "salon";
	String userId = "root";
	String password = "9QT2{gZvm[Gx~b";

	try {
		Class.forName(driverName);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html lang="en">

<head>
<style>

input[type=text],textarea{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 3px solid #ccc;
  -webkit-transition: 0.5s;
  transition: 0.5s;
  outline: none;
}


input[type=text]:focus,textarea:focus {
  border: 3px solid #037bba;
}

body {
	background: #008080;
	color: black;
	font-family: verdana;
}

ul:active {
	background: #2e97ce;
}

li:hover {
	color: white;
	background: #2e97ce;
}

li:active {
	background: #2e97ce;
}

ul.components {
	background-color: #037bba;
}

ul li a {
	border-bottom: 1px solid #51515118;
	color: white;
}

.nav.side-menu>li>a, .nav.child_menu>li>a {
	color: #ffffff !important;
	font-weight: 500;
}

ul.components {
	padding: 20px 0;
	box-shadow: 0px 6px 6px #064668;
}

.bg_color_css {
	background-color: #8d9986;
}

.spinner {
	position: fixed;
	text-align: center;
	z-index: 1234;
	overflow: auto;
	width: 100%;
	height: 100%;
}

.gif {
	top: 40%;
	position: relative;
}

.fix_back_color {
	text-align: center;
	background-color: #76a4bc;
	color: white;
}

td {
	color: black;
}

.fa {
	font-size: inherit;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Candico</title>
<link rel="shortcut icon" href="images/infosai.jpeg">
<!-- Bootstrap core CSS -->

<link href="css/bootstrap.min.css" rel="stylesheet">

<link href="fonts/css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">

<!-- Custom styling plus plugins -->
<link href="css/custom.css" rel="stylesheet">
<link href="css/icheck/flat/green.css" rel="stylesheet">
<!-- editor -->
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css"
	rel="stylesheet">
<link href="css/editor/external/google-code-prettify/prettify.css"
	rel="stylesheet">
<link href="css/editor/index.css" rel="stylesheet">
<!-- select2 -->
<link href="css/select/select2.min.css" rel="stylesheet">
<!-- switchery -->
<link rel="stylesheet" href="css/switchery/switchery.min.css" />
<link href="css/datatables/tools/css/dataTables.tableTools.css"
	rel="stylesheet">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css"
	rel="stylesheet" type="text/css" />
	
	

<script src="js/jquery.min.js"></script>
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!-- <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="plugins/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script> -->

</head>


<body class="nav-md" style="font-family: verdana;">

	<div class="container body" style="background: #309bd3;">

		<%--session.setAttribute("cname","abc");--%>
		<div class="main_container">

			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">

					<div class="navbar nav_title"
						style="border: 0; background: #037bba; color: #000;">
						<a href="index.jsp" class="site_title"><i class="fa fa-shield"
							style="border: none; color: white"></i> <span>Candico</span></a>
					</div>
					<div class="clearfix bg_color_css"></div>

					<!-- sidebar menu -->
					<div id="sidebar-menu"
						class="main_menu_side hidden-print main_menu">

						<%
							uname = (String) session.getAttribute("uname");
							S_tyep = (String) session.getAttribute("S_tyep");
							seller_id = (String) session.getAttribute("seller_id");
												System.out.println("uname > " + uname);
														System.out.println("S_tyep > " + S_tyep);
							// 							System.out.println("seller_id > " + seller_id);
							try {
								connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
								statement = connection.createStatement();
								//                    String sql = "SELECT roles FROM admin_user WHERE username='"+uname+"'";

								//                    resultSet = statement.executeQuery(sql);
								//                    resultSet.next();
								//                    str1 = resultSet.getString(1);

							} catch (Exception e) {
								e.printStackTrace();
							}
						%>

						<%
							LocalDate today = LocalDate.now();
							// 							System.out.println(today);
							String date = today.toString();
							String fdate = today.minusMonths(1).toString();
						%>
						<div class="menu_section">
							<ul class="nav side-menu components">
								<!--<li><a href="#"><i class="fa fa-home"></i> Home</a></li>-->



								<%
									if (S_tyep.equals("admin")) {
								%>

								<!--                 <li><a><i class="fa fa-user"></i> Main login <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                    <li><a href="Main_login.jsp">Add user</a></li>
                  </ul>
                </li>-->
								<li><a><i class="fa fa-user"></i> <lable>Admin
										Management</lable> <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="admin_add.jsp"><lable>Add Admin
												Users</lable></a></li>
										<li><a href="main_admin_view.jsp"><lable>Manage
												Admin Users</lable></a></li>
										<!--<li><a href="logo_add.jsp"><lable >Add Logo</lable></a></li>-->
									</ul></li>

								<li><a><i class="fa fa-user"></i> <lable>Basic
										Master</lable> <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="Main_Item_Category.jsp"><lable>Item
												</lable></a></li>
										<li><a href="Main_Item_Master.jsp"><lable>Item
												Master</lable></a></li>
										<li><a href="Main_Company_View.jsp"><lable>Company
												Master</lable></a></li>
										<li><a href="Main_Vender_View.jsp"><lable>Vender
												Master</lable></a></li>
										<!--<li><a href="Main_Project_View.jsp"><lable >Project  Master</lable></a></li>-->
										<!--<li><a href="Main_Employee_Master.jsp"><lable>Employee Master</lable></a></li>-->
										<li><a href="Main_Tax_Master.jsp"><lable>Tax
												Master</lable></a></li>
										<li><a href="Main_Unit_Master.jsp"><lable>Unit
												Master</lable></a></li>
									</ul></li>

								<li><a><i class="fa fa-user"></i> <lable>PO
										Management</lable> <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="Main_Parches_order_form.jsp"><lable>Add
												PO</lable></a></li>
										<li><a
											href="Main_Parches_order_View_list.jsp"><lable>PO
												View</lable></a></li>
									</ul></li>

								<li><a><i class="fa fa-user"></i> <lable>GRN</lable> <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="Main_PO_List_for_GRN.jsp"><lable>Add
												GRN</lable></a></li>
										<li><a href="Main_GRN_Without_PO.jsp"><lable>Add
												GRN Without PO</lable></a></li>
										<li><a
											href="Main_GRN_View_list.jsp"><lable>DSRR
												List</lable></a></li>
									</ul></li>
								<li><a><i class="fa fa-user"></i> <lable>QCD</lable> <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="Main_QCD_form.jsp"><lable>Add
												QCD</lable></a></li>
										<li><a href="Main_QCD_list.jsp"><lable>QCD
												list</lable></a></li>
									</ul></li>
								<li><a><i class="fa fa-user"></i> <lable>Stock
										</lable> <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="stock.jsp"><lable>View Stock</lable></a></li>
									</ul></li>

								<li><a><i class="fa fa-user"></i> <lable>Bill</lable> <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="Main_GRN_List_for_Bill.jsp"><lable>Add
												Bill</lable></a></li>
										<!--<li><a href="Main_Bill_form.jsp"><lable>Add Bill</lable></a></li>-->
										<li><a
											href="Main_Bill_list.jsp?Fdate=<%=fdate%>&Tdate=<%=date%>"><lable>Bill
												list</lable></a></li>
									</ul></li>
								<!--                 <li><a ><i class="fa fa-user"></i><lable >Day To Day Master</lable> <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" >
                      <li><a href="Main_Item_Category.jsp"><lable >Item Category</lable></a></li>
                      <li><a href="Main_Item_Master.jsp"><lable>Item Master</lable></a></li>
                      <li><a href="Main_OverHead_Master.jsp"><lable>OverHead Master</lable></a></li>
                      <li><a href="Main_Rate_Analysis_Master.jsp"><lable>Rate Analysis Master</lable></a></li>
                  </ul>
                </li>-->


								<!--                 <li><a ><i class="fa fa-user"></i><lable >Materials Management</lable> <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" >
                      <li><a href="Main_Materials_Add.jsp"><lable >Add Materials </lable></a></li>
                      <li><a href="Main_Materials_View.jsp"><lable>View Materials</lable></a></li>
                  </ul>
                </li>-->

								<!--                <li><a ><i class="fa fa-user"></i><lable >Labor Rate Management</lable> <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" >
                      <li><a href="Main_Labor_rate_Add.jsp"><lable >Add Labor Rate </lable></a></li>
                      <li><a href="Main_Labor_rate_View.jsp"><lable>View Labor Rate</lable></a></li>
                  </ul>
                </li>-->

								<!--                <li><a ><i class="fa fa-user"></i><lable >Equipment Management</lable> <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" >
                      <li><a href="Main_equipment_Add.jsp"><lable >Add Equipment  </lable></a></li>
                      <li><a href="Main_equipment_View.jsp"><lable>View Equipment </lable></a></li>
                  </ul>
                </li>-->




								<%
									}
								%>

								<%
									if (S_tyep.equals("PO")) {
								%>

								<li><a><i class="fa fa-user"></i> <lable>PO
										Management</lable> <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="Main_Parches_order_form.jsp"><lable>Add
												PO</lable></a></li>
										<li><a
											href="Main_Parches_order_View_list.jsp?Fdate=<%=fdate%>&Tdate=<%=date%>"><lable>PO
												View</lable></a></li>
									</ul></li>
								<%
									}
								%>

								<%
									if (S_tyep.equals("GRN")) {
								%>

								<li><a><i class="fa fa-user"></i> <lable>GRN</lable> <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="Main_PO_List_for_GRN.jsp"><lable>Add
												GRN</lable></a></li>
										<li><a
											href="Main_GRN_View_list.jsp?Fdate=<%=fdate%>&Tdate=<%=date%>"><lable>GRN
												List</lable></a></li>
									</ul></li>
								<%
									}
								%>
								<li><a><i class="fa fa-user"></i> <lable>QA
										Entry</lable> <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="createProductQa.jsp"><lable>Create
												Product</lable></a></li>
										<li><a href="viewProductQa.jsp"><lable>View
												Product</lable></a></li>
									</ul></li>

                              <li><a><i class="fa fa-user"></i> <lable>Batch Generation
										</lable> <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="batchGeneration.jsp"><lable>Batch Generation</lable></a></li>
										<li><a href="view_all_batch.jsp"><lable>View All Batch</lable></a></li>
									</ul></li>


								<li><a><i class="fa fa-user"></i> <lable>Work
										Order </lable> <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="workOrder.jsp"><lable>Work Order
												Prepare Stores</lable></a></li>
										<li><a href="Main_WorkOrder_list.jsp"><lable>Work
												Order View</lable></a></li>
							           <li><a href="workOrder_Issue.jsp"><lable>Issue Work
												Order</lable></a></li>					
									</ul></li>
                                <li><a><i class="fa fa-user"></i> <lable>Issue/Return
										</lable> <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="bulk_sam_issue.jsp"><lable>Bulk/SAM Issue</lable></a></li>
										<li><a href="batch_issue.jsp"><lable>Batch Issue</lable></a></li>
										<li><a href="bulk_sam_mrn.jsp"><lable>Bulk/SAM MRN</lable></a></li>
										<li><a href="batch_mrn.jsp"><lable>Batch MRN</lable></a></li>
								   </ul></li>
								   
								   
								    <li><a><i class="fa fa-user"></i> <lable>Outwards Gate Pass 
										</lable> <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
									
									    <li><a href="outwardGatePass.jsp"><lable>Outward Gate Pass</lable></a></li>
									    <li><a href="Viewallogp.jsp"><lable>View all OGP</lable></a></li>
									    
										<li><a href="deliveryChallan.jsp"><lable>Delivery Challan</lable></a></li>
										<li><a href="Viewdeliverychalan.jsp"><lable>View all Deliverychalan</lable></a></li>
										<li><a href="taxInvoice.jsp"><lable>Tax Invoice</lable></a></li>
										
										
								   </ul></li>
								   
								   <li><a><i class="fa fa-user"></i> <lable>Reports
										</lable> <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="itemAndArWiseStocksReport.jsp"><lable>Item & AR Wise Stock</lable></a></li>
										<li><a href="underTestStock.jsp"><lable>Under Test Stock Reports</lable></a></li>
										<li><a href="releasedStock.jsp"><lable>Released Stock</lable></a></li>
										<li><a href="rejectedStock.jsp"><lable>Rejected Stock</lable></a></li>
										<li><a href="nearExpStock.jsp"><lable>Near Exp. Stock</lable></a></li>
										<li><a href="ExpiryStock.jsp"><lable>Expired Stock</lable></a></li>
										<li><a href="consumptionStatment.jsp"><lable>Consumption Statment</lable></a></li>
										<li><a href="stockInspection.jsp"><lable>Total</lable></a></li>
								   		<li><a href="itemWiseLedger.jsp"><lable>Item Wise Ledger</lable></a></li>
										<li><a href="supplierWiseLedger.jsp"><lable>Supplier Wise Ledger</lable></a></li>
										
								   </ul></li>


							</ul>
						</div>


					</div>
					<!-- /sidebar menu -->

					<!-- /menu footer buttons -->
					<div class="sidebar-footer hidden-small"></div>
					<!-- /menu footer buttons -->
				</div>
			</div>
			<!-- top navigation -->
			<div class="top_nav" style='background: whitesmoke;'>

				<div class="nav_menu" style='background: whitesmoke;'>
					<nav class="" role="navigation" style='background: whitesmoke;'>
						<div class="nav toggle" class="fix_back_color">
							<a id="menu_toggle"><i class="fa fa-bars"></i></a>
						</div>


						<ul class="nav navbar-nav navbar-right"
							style='background: whitesmoke; color: white;'>
							<li class="log_out_btn" style="border-radius: 17%;"><a
								href="logout.jsp" class=" user-profile dropdown-toggle">
									<button class="btn btn-upload" style="padding: 6px 12px;">Log
										Out</button>
							</a></li>

						</ul>
					</nav>
				</div>

			</div>
			<!-- /top navigation -->
			<div class="spinner spinner-border"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>