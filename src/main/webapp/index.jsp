<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"
	errorPage="eror.jsp"%>
<%@page import="bean.DataService"%>
<%@page import="org.joda.time.format.DateTimeFormat"%>
<%@page import="org.joda.time.format.DateTimeFormatter"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
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


<%!ResultSet rs1, rs;
	DataService ds;
	Object ob;
	String Purchase_date, contract_date, Purchase_date1, contract_date1;
	String s;
	int d, m, y, d1, m1, y1;
	String hotel, customer, order = "0";
	String S_tyep = "0";
	String seller_name;
	String seller_id = "0";
	String total_item = "0";
	String seller_image;%>

<%
	S_tyep = (String) session.getAttribute("S_tyep");
	seller_id = (String) session.getAttribute("seller_id");
	seller_name = (String) session.getAttribute("seller_name");
	seller_image = (String) session.getAttribute("seller_image");
%>
<style>
.content {
	min-height: 250px;
	margin-right: auto;
	margin-left: auto;
	padding: 0 30px 10px;
	background: #ececec;
	padding-top: 20px;
}

.row {
	margin-right: -15px;
	margin-left: -15px;
}

.col-sm-6 {
	width: 50%;
}

.col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3,
	.col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9 {
	float: left;
}

#cardbox1 {
	-moz-box-shadow: 0 0 5px #888;
	-webkit-box-shadow: 0 0 5px #888;
	box-shadow: 0 0 5px #888;
	color: #8a7878;
	cursor: pointer;
	background-color: #ff69b48f;
	height: 130px;
	margin-bottom: 25px;
	border-radius: 4px;
	display: none;
}

.statistic-box {
	padding: 12px;
}

.fa-3x {
	font-size: 3em;
}

.pull-right {
	float: right !important;
}

.statistic-box h3 {
	margin-top: 5px;
	font-weight: 600;
}

* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

#cardbox4 {
	-moz-box-shadow: 0 0 5px #888;
	-webkit-box-shadow: 0 0 5px #888;
	box-shadow: 0 0 5px #888;
	color: #e4e5e7;
	cursor: pointer;
	background-color: #6b69ff85;
	height: 130px;
	margin-bottom: 25px;
	border-radius: 4px;
}

div {
	display: block;
}

.col-lg-1, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3,
	.col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9,
	.col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3,
	.col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9,
	.col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3,
	.col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9,
	.col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3,
	.col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9 {
	position: relative;
	min-height: 1px;
	padding-right: 15px;
	padding-left: 15px;
}

.btn-group-vertical>.btn-group:after, .btn-group-vertical>.btn-group:before,
	.btn-toolbar:after, .btn-toolbar:before, .clearfix:after, .clearfix:before,
	.container-fluid:after, .container-fluid:before, .container:after,
	.container:before, .dl-horizontal dd:after, .dl-horizontal dd:before,
	.form-horizontal .form-group:after, .form-horizontal .form-group:before,
	.modal-footer:after, .modal-footer:before, .modal-header:after,
	.modal-header:before, .nav:after, .nav:before, .navbar-collapse:after,
	.navbar-collapse:before, .navbar-header:after, .navbar-header:before,
	.navbar:after, .navbar:before, .pager:after, .pager:before, .panel-body:after,
	.panel-body:before, .row:after, .row:before {
	display: table;
	content: " ";
}

::selection {
	color: #fff;
	background: #009688;
	text-shadow: none;
}

.content-header {
	/*position: relative;*/
	padding: 5px 30px;
	background-color: #fff;
	border-bottom: 1px solid #e1e6ef;
	margin-bottom: 0px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	margin-bottom: 5px;
}

.content-header .header-icon {
	font-size: 48px;
	color: #009688;
	width: 68px;
	float: left;
	margin-top: -4px;
	line-height: 0;
}

.fa {
	display: inline-block;
	/*font: normal normal normal 14px/1 FontAwesome;*/
	/*font-size: inherit;*/
	text-rendering: auto;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

.content-header .header-title {
	margin-left: 68px;
}

.content-header .header-title h1 {
	margin: 0;
	font-size: 24px;
	color: #222;
	font-weight: 600;
}

small {
	font-size: 13px;
	display: inline-block;
	padding-left: 4px;
	font-weight: 600;
	color: #222;
}

.form-bg {
	background: url(images/<%=seller_image%>);
	background-repeat: no-repeat;
	background-size: 100% 90%;
	background-position: right bottom;
	padding: 0px;
}
</style>

<!--<div class="right_col" role="main">
        <div class="">

          <div class="page-title" style="float: left; padding: 250px 0px 300px; width:100%;">
               
          <h3 style="text-align: center; font-size:44px;color:black;">WELCOME TO SHIVDHAN</h3>
          
          </div>
          <div class="clearfix"></div>
          </div>
          
      </div>   -->

<%
	//    ds=new DataService();
	//    System.out.println("1");
	//    rs=ds.hotel();
	//    if(rs.next()){hotel=rs.getString(1);
	//    System.out.println("hotel >"+hotel);}
	//    System.out.println("2");

	//    rs=ds.customer();
	//    if(rs.next()){customer=rs.getString(1);}

	//    rs=ds.total_item();
	//    if(rs.next()){total_item=rs.getString(1);}

	//    rs=ds.order();
	//    if(rs.next()){order=rs.getString(1);}
	//order="0";
%>


<div class="right_col" role="main">
	<div class="x_panel" style="min-height: 484px;">
		<!--<div class="content-wrapper" style="min-height: 671px;">-->

		<section class="content-header" style="min-height: 50px;">
			<div class="header-icon">
				<i class="fa fa-dashboard"></i>
			</div>
			<div class="header-title">
				<h1><%=seller_name%></h1>
				<!--<small>Dashboard</small>-->
			</div>
		</section>


		<section class="content form-bg " style="min-height: 500px;">
			<div class="row">
				<h1 style="text-align: center">
					WELCOME TO <br>Candico Inventory Management System
				</h1>
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
					<div id="cardbox1">
						<div class="statistic-box">
							<i class="fa fa-suitcase fa-3x"></i>
							<div class="counter-number pull-right">
								<span class="count-number">1</span>

							</div>
							<h3>Total Stores</h3>
						</div>
					</div>
				</div>

				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
					<div id="cardbox1">
						<div class="statistic-box">
							<i class="fa fa-user fa-3x"></i>
							<div class="counter-number pull-right">
								<span class="count-number">0</span>
							</div>
							<h3>Total Customers</h3>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
					<div id="cardbox1">
						<div class="statistic-box">
							<i class="fa fa-file-text fa-3x"></i>
							<div class="counter-number pull-right">
								<span class="count-number">0</span>
							</div>
							<h3>Total Items</h3>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
					<div id="cardbox1">
						<div class="statistic-box">
							<i class="fa fa-file-text fa-3x"></i>
							<div class="counter-number pull-right">
								<span class="count-number">0</span>
							</div>
							<h3>Total Oders</h3>
						</div>
					</div>
				</div>

			</div>



		</section>
	</div>
	<!--</div>-->
</div>
<jsp:include page="templates/footer.html" />