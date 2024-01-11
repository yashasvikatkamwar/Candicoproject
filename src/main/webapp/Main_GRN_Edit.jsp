<%@page import="java.util.Calendar"%>
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
<%!ResultSet data,rs;DataService ds1;ArrayList ar;Iterator ity;Object o1=null;String Gid; %>



<!--<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css" rel="stylesheet" type="text/css" />-->

		 <style>
.required{
	color: red;
}
  .ui-autocomplete-loading {
    background: white url("assets/dist/img/ui-anim_basic_16x16.gif") right center no-repeat;
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
.try_it{
    width: 20px;
}
.try_it2{
    width: 80px;
}



.table-box{
    justify-content: end;
}

.form-main-table,th{
    border: 1px solid #333;
 
}
.form-main-table{
/*    margin-left: 13%;*/
    width: 80%;
    float:right;
    text-transform: capitalize;
    border-collapse: collapse;
}
address{
    display: inline;
}
.address h1{
    text-align: center;
    font-size: 28px;
    text-decoration: underline;
}
td{
    padding: 4px; 
    width: 8%;
}
th h3{
    margin: 4px 0px;
}
th h3 span{
    text-transform: none;
}
th h3 code{
    font-size: 16px;
}
th{
    text-align: left;
    padding-left: 8px;
}
th > h1{
    text-transform: uppercase;
    font-size: 16px;
}
th div{
    font-weight: bold;
    font-family: arial;
    display: inline-block;
    font-size: 15px;
}
.head-services,.head-invoice{
    text-align: center;
    margin: 8px;
}
.head-invoice h1{
    margin: 8px 0px;
}
.table-input{
    display: inline-block;
    width: 10%;
}
.inner-table,.inner-table-2{
    border-collapse: collapse;
    width: 100%;

}
.inner-table td,.inner-table-2 td{
    border: 1px solid #333;
    font-size: 15px;
    text-transform: capitalize;
    padding: 4px 8px;
}
.inner-table input,.work-input{
    margin: -8px;
    height: 18px;
    width: 100%;
    padding: 4px;
    padding-right: 2%;
    font-size: 15px;

}
.inner-table input[type="text"]{
    background-color: #99999918;
    border: 0px;

}
.work-input{
    padding-right: 1% !important;

}
.inner-table-2 th{
    font-size: 15px;
    text-transform: uppercase;
}
.inner-table-2 thead{
    background-color: rgba(128, 128, 128, 0.356);
}

.inner-table-2 input{
    width: 100%;
    margin: -8px -4px;
    height: 22px;
    background-color: rgba(128, 128, 128, 0.13);
    font-size: 15px;
    border: 0px;
    
}
.inner-table-2 td{
    padding: 4px;
    padding-right: 0px;
}
.condition{
    text-align: center;
    font-size: 24px;
}
.sign{
vertical-align: baseline;
}
.sign div{
    margin-top: 40%;
}
td b{
    font-size: 14px;
}
.logo{
    width: 25%;
padding: 0px
}
.logo img{
    width: 280px;
    height: 200px;
}
.DTTT_button{
        margin-left: 59%;
    font-size: 2.3rem;
    margin-bottom: 8px;
}

/* javascript */

.add, .cut
{
	border-width: 1px;
	display: block;
	font-size: .8rem;
	padding: 0.25em 1.5em;	
	float: left;
	text-align: center;
	width: 0.6em;
}

.add, .cut
{
	background: #9AF;
	box-shadow: 0 1px 2px rgba(0,0,0,0.2);
	background-image: -moz-linear-gradient(#00ADEE 5%, #0078A5 100%);
	background-image: -webkit-linear-gradient(#00ADEE 5%, #0078A5 100%);
	border-radius: 0.5em;
	border-color: #0076A3;
	color: #FFF;
	cursor: pointer;
	font-weight: bold;
	text-shadow: 0 -1px 2px rgba(0,0,0,0.333);
}

.add { margin: -2.5em 0 0; }

.add:hover { background: #00ADEE; }

.cut { opacity: 0; 
      /*position: absolute;*/ 
      top: 0; left: -1.5em; }
.cut { -webkit-transition: opacity 100ms ease-in; }

tr:hover .cut { opacity: 1; }

html, body { margin:0; padding:0; font-family:Arial, Helvetica, sans-serif; font-size:12px; background:#CCC; }
.wrapper { width:980px; margin:auto; }
ul.tabs { margin:0; padding:0; float:left; }
ul.tabs li {  display:inline;  cursor:pointer; font-weight:bold;  }
ul.tabs li a {  line-height:30px; background:#09F; text-align:center; float:left; text-decoration:none; color:#fff;    padding-left: 8px;padding-right: 26px; }
ul.tabs li a:hover, ul.tabs li a.active { background:#fff; color:#09f; }

.tab_content_container { width:940px; height:300px; float:left; background:#fff; padding:20px; margin-top:1px; font-size:14px; border-radius:0 0 10px 10px; -moz-border-radius:0 0 10px 10px; -webkit-border-radius:0 0 10px 10px; display:block;}
.tab_content { display:none; position:absolute;    width: 97%;  height:83%; overflow:auto; overflow-x:hidden;}
.tab_content_active { display:block; position:absolute; overflow:auto; overflow-x:hidden;  }
.tab_content_active span { float:left; width:100px; margin-right:20px; }



</style> 

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<%!
     public String dateFormateChnge(String date){
//        convert dd/MM/yyyy to yyyy/MM/dd
        System.out.println("date >>>>" +date.length());
        if(date.length()==0){return "";}
        if(date!=null && date!=""){
        String datee[]=date.split("-");
        return datee[2]+"/"+datee[1]+"/"+datee[0];
        }
        return "";
    }
%>


   <div class="right_col" role="main">
        <div class="">

<div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
<!--               <div class="header-icon">
                  <i class="fa fa-sticky-note-o"></i>
               </div>-->
<!--               <div class="header-title">
                  <h1> Good Receipt Note</h1>
                  <br>
               </div>-->
            </section>
 <%
                             Gid=request.getParameter("Gid");
                            // String SHOWPid=Pid.split("=>")[1];
                            // Pid=Pid.split("=>")[0];
                             
                            ds1= new DataService();
                           data=ds1.GRN_Details(Gid);
                            if(data.next()){
                            %>
            <!-- Main content -->
            <section class="content lobipanel">
               <div class="row">
                  <div class="col-sm-12">
                     <div class="panel panel-bd lobidrag">
                        <div class="panel-heading" id="pa" style="background-color: #e8f1f3  ; border-bottom: black" >
                           <div class="btn-group" id="buttonexport">
                              <a href="javascript:void(0)">
                                 <h4>Goods Receipt Note</h4>
                              </a>
                           </div>
                        </div>
                        <div class="panel-body" class="row" style="background-color : #ffffff;"> 
                       
                           <div class="btn-group">
                              <div class="buttonexport"> 
                                  <a class="btn btn-add" onclick="history.back()" > Back  </a>  
                              </div>
			</div>   
                            
                            <div class="form-group" style="float: right">
                                <select  autocomplete="off"   name="state"   class="form-control" id="state" style="background: gold;">
                                     <option><%=data.getString("state")%></option>
                                     <option>MS</option>
                                     <option>OMS</option>
                                 </select>
                             </div>
                            <div class="form-group" style="float: right">
                                <select  autocomplete="off"   name="GRN_BY"   class="form-control btn-info" id="GRN_BY" >
                                     <option><%=data.getString("GRN_BY")%></option>
                                    <option>Without Purchase Order</option>
                                     <option>Inter Generate</option>
                                 </select>
                            </div>

                           
                            <form class="form-horizontal " id="demo-form3"  method="post" >
							      <!--<input type="hidden" name="hid_item" id="hid_item" value="" >-->
								  <input type="hidden" name="sr" id="sr" value="<%=data.getString("sr")%>" >
								  <input type="hidden" name="com_vise_GRN_no" id="com_vise_GRN_no" value="<%=data.getString("com_vise_GRN_no")%>" >
								  <input type="hidden" name="hid_inv_tax_type" id="hid_inv_tax_type" value="local" >
								  <input type="hidden" name="hid_cust_id" id="hid_cust_id" value="" >
								  <input type="hidden" name="hid_tax_id" id="hid_tax_id" data-val="0.00" value="7" >
								  
								  								   <input type="hidden" name="hid_test_inv" id="hid_test_inv" value="N" >
								   <div class="row">
									<div class="col-md-12">
										<div class="alert alert-danger" id="err" style="display: none">Exercise name with same time  Already exist<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
										</div>		
										<div id="info"></div>
                                                                                  <%
//                                                                                       HttpSession session_login = request.getSession();
//                                                                                         String com =session_login.getAttribute("cnameP").toString();
//                                                                                        String unit;
                                                                                       
//                                                                                        System.out.println("st >>"+st);
                                                                                        
                                                                                        Calendar cal = Calendar.getInstance();
                                                                                        int year = cal.get(Calendar.YEAR);
                                                                                        System.out.println("year >>"+year);
                                                                                            String a =Integer.toString(year).split("",3)[2];
                                                                                            int aa= Integer.parseInt(a)+1;
                                                                                            System.out.println("aa >> "+a+"/"+aa);
                                                                                            String yr=a+"/"+aa;
                                                                                            System.out.println("yr >> "+yr);
                                                                                     
                                                                                    %>
                                                                                    <div class="form-group">
											<label for="date" class="col-sm-2 control-label">GRN ID : <span class="required">*</span></label>
											<div class="col-sm-4">
                                                                                            <%
//                                                                                                String Gid="1";
//                                                                                                ds1= new DataService();
//                                                                                                rs=ds1.GRN_getID(data.getString("Com_id"));
//                                                                                                 if(rs.next()){Gid= rs.getString(1) != null ? rs.getString(1):"1";}
                                                                                               %>
                                                                                               <input  autocomplete="off"   name="Gid" required type="text"  class="form-control" id="Gid" readonly="" value="<%=data.getString("Gid")%>">
												<span id="err_inv_date" style="color:red;"></span>
											</div>										 		
											<div>
											<label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">PO ID : <span class="required">*</span></label>
											<div class="col-sm-4">
                                                                                            <input  autocomplete="off" readonly=""  name="Pid"  type="text" value="<%=data.getString("Pid")%>"  class="form-control" id="Pid" >
                                                                                            <input  autocomplete="off" readonly=""  name="Pid_sr"  type="hidden" value="<%=data.getString("Pid")%>"  class="form-control" id="Pid_sr">
												<!--<span class="small"><a data-toggle="modal" data-target="#adduser" href="jvascript:void(0);">Add new customer</a></span>-->
												<span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
                                                                               
											
                                                                                </div> 
                                                                                    <div class="form-group">
											<label for="date" class="col-sm-2 control-label">Document Date : <span class="required">*</span></label>
											<div class="col-sm-4">
                                                                                            <!--<body onload="addDate();"/>-->
                                                                                            <!--<input   name="document_date" required type="text"  class="form-control " id="document_date" placeholder="dd/mm/yyyy" >-->
											   <div class="input-group date" data-date-format="dd.mm.yyyy">
                                                                                                <input  type="text" class="form-control" placeholder="dd/mm/yyyy" name="document_date" id="document_date"  value="<%=dateFormateChnge(data.getString("document_date"))%>">
                                                                                                <div class="input-group-addon" >
                                                                                                  <span class="glyphicon glyphicon-th"></span>
                                                                                                </div>
                                                                                            </div>
                                                                                            <span id="err_inv_date" style="color:red;"></span>
											</div>												
											
                                                                               
											<label for="date" class="col-sm-2 control-label">Posting Date : <span class="required">*</span></label>
											<div class="col-sm-4">
                                                                                            <!--<body onload="addDate();"/>-->
                                                                                            <!--<input   name="posting_date" required type="date"  class="form-control" id="posting_date">-->
                                                                                            <div class="input-group date" data-date-format="dd.mm.yyyy">
                                                                                                <input  type="text" class="form-control" placeholder="dd/mm/yyyy" name="posting_date" id="posting_date"  value="<%=dateFormateChnge(data.getString("posting_date"))%>">
                                                                                                <div class="input-group-addon" >
                                                                                                  <span class="glyphicon glyphicon-th"></span>
                                                                                                </div>
                                                                                            </div>
												<span id="err_inv_date" style="color:red;"></span>
											</div>
                                                                                </div>     
                                                                                <div class="form-group">   
                                                                                    <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">
                                                                                        <%
                                                                                                        ds1= new DataService();
                                                                                                        rs=ds1.Vender_list();
                                                                                                %>
                                                                                                <select name="select_vender" id="select_vender" class="form-control form-inline col-sm-3"  onchange="vender_chnge()" style="width: 49%;top: -7px;background: #f8f6c4;">
                                                                                                   <!--<optgroup label="storage_location">-->
                                                                                                   <option value="">Vender</option>
                                                                                                                 <%
                                                                                                                  while(rs.next()){
                                                                                                                      String o=rs.getObject("code")+"=>"+rs.getObject("name");
                                                                                                                      Object f=rs.getObject("name");
                                                                                                                 %>
                                                                                                        <option value="<%=o%>"><%=f%></option>
                                                                                                                   <%}%> 
                                                                                                      <!--</optgroup>-->
                                                                                              </select>
                                                                                           Vender : <span class="required">*</span></label>

											<div class="col-sm-4">
                                                                                            <input  autocomplete="off" readonly=""  name="Vname" required type="text"  class="form-control" id="Vname" value="<%=data.getString("Vname")%>">
                                                                                            <input  readonly=""  name="vender" required type="hidden"   class="form-control" id="vender" value="<%=data.getString("Vid")%>=><%=data.getString("Vname")%>">
												<!--<span class="small"><a data-toggle="modal" data-target="#adduser" href="jvascript:void(0);">Add new customer</a></span>-->
												<span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                                
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">
                                                                                            <!--<div class="col-sm-9">-->
                                                                                                 <%
                                                                                                        ds1= new DataService();
                                                                                                        rs=ds1.Company_list();
                                                                                                %>
                                                                                                <select name="select_company" id="select_company" class="form-control form-inline col-sm-3"  onchange="company_chnge()" style="width: 49%;top: -7px;background: #f8f6c4;" disabled="">
                                                                                                   <!--<optgroup label="storage_location">-->
                                                                                                   <option value="">Company</option>
                                                                                                                 <%
                                                                                                                  while(rs.next()){
                                                                                                                      String o=rs.getObject("code")+"=>"+rs.getObject("Cname")+"=>"+rs.getObject("shot_name");
                                                                                                                      Object f=rs.getObject("Cname");
                                                                                                                 %>
                                                                                                        <option value="<%=o%>"><%=f%></option>
                                                                                                                   <%}%> 
                                                                                                      <!--</optgroup>-->
                                                                                              </select>
                                                                                             <!--</div>-->
                                                                                            Company : <span class="required">*</span></label>
                                                                                        <div class="col-sm-4">
                                                                                            <input   readonly=""  name="Cname" required type="text"  class="form-control" id="Cname" value="<%=data.getString("com_name")%>">
                                                                                            <input  readonly=""  name="com" required type="hidden"   class="form-control" id="com" value="<%=data.getString("Com_id")%>=><%=data.getString("com_name")%>=><%=data.getString("CshortN")%>">
												<!--<span class="small"><a data-toggle="modal" data-target="#adduser" href="jvascript:void(0);">Add new customer</a></span>-->
												<span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                
                                                                                                
										</div>

										<div class="form-group">
                                                                                    <div>
                                                                                       <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">Delivery Chalan No : </label>
											<div class="col-sm-4">
                                                                                            <input    name="delevery_challan_no"  type="text"   class="form-control" id="delevery_challan_no" value="<%=data.getString("delevery_challan_no")%>">
												<!--<span class="small"><a data-toggle="modal" data-target="#adduser" href="jvascript:void(0);">Add new customer</a></span>-->
												<span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
                                                                                    <div>
											<label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">Challan Date</label>
											<div class="col-sm-4">
                                                                                           <!--<input   name="challan_date" required type="date"   class="form-control" id="challan_date">-->
                                                                                            <div class="input-group date" data-date-format="dd.mm.yyyy">
                                                                                                <input  type="text" class="form-control" placeholder="dd/mm/yyyy" name="challan_date" id="challan_date"  value="<%=dateFormateChnge(data.getString("challan_date"))%>">
                                                                                                <div class="input-group-addon" >
                                                                                                  <span class="glyphicon glyphicon-th"></span>
                                                                                                </div>
                                                                                            </div>
												<span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
										</div>
                                                                                                
                                                                                <div class="form-group">
                                                                                    <div>
											<label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">Bill NO:</label>
											<div class="col-sm-4">
                                                                                            <input   name="bill_no"  type="text"   class="form-control" id="bill_no" value="<%=data.getString("bill_no")%>">
												<span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
                                                                                     <div>
											<label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">Bill Date:</label>
											<div class="col-sm-4">
                                                                                           <!--<input    name="Bill_date" required type="date"   class="form-control" id="Bill_date">-->
                                                                                            <div class="input-group date" data-date-format="dd.mm.yyyy">
                                                                                                <input  type="text" class="form-control" placeholder="dd/mm/yyyy" name="Bill_date" id="Bill_date"  value="<%=dateFormateChnge(data.getString("Bill_date"))%>">
                                                                                                <div class="input-group-addon" >
                                                                                                  <span class="glyphicon glyphicon-th"></span>
                                                                                                </div>
                                                                                            </div>
												<span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
                                                                                    
										</div>
                                                                                <div class="form-group">
                                                                                      <div>
											<label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">LR NO:</label>
											<div class="col-sm-4">
                                                                                            <input    name="LR_no"  type="text"   class="form-control" id="LR_no" value="<%=data.getString("LR_no")%>">
												<span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
                                                                                    <div>
											<label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">LR Date:</label>
											<div class="col-sm-4">
                                                                                           <!--<input     name="LR_date" required type="date"   class="form-control" id="LR_date">-->
                                                                                            <div class="input-group date" data-date-format="dd.mm.yyyy">
                                                                                                <input  type="text" class="form-control" placeholder="dd/mm/yyyy" name="LR_date" id="LR_date"  value="<%=dateFormateChnge(data.getString("LR_date"))%>">
                                                                                                <div class="input-group-addon" >
                                                                                                  <span class="glyphicon glyphicon-th"></span>
                                                                                                </div>
                                                                                            </div>
												<span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
                                                                                </div>
                                                                               <div class="form-group">
                                                                                    <div>
                                                                                       <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">Transport Name : </label>
											<div class="col-sm-4">
                                                                                            <input    name="transport_name"  type="text"   class="form-control" id="transport_name" value="<%=data.getString("transport_name")%>">
												<span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
                                                                                    <div>
											<label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">Vehicle No:</label>
											<div class="col-sm-4">
                                                                                            <input    name="vehicle_no"  type="text"   class="form-control" id="vehicle_no" value="<%=data.getString("vehicle_no")%>">
												<span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
										</div>
                                                                                <div class="form-group">
                                                                                    <div>
                                                                                       <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">Way Bill NO: </label>
											<div class="col-sm-4">
                                                                                            <input   name="way_bill_no"  type="text"   class="form-control" id="way_bill_no" value="<%=data.getString("way_bill_no")%>">
												<span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
                                                                                    <div>
                                                                                       <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">Way Bill Date : </label>
											<div class="col-sm-4">
                                                                                            <!--<input     name="way_bill_date"  type="date"   class="form-control" id="way_bill_date">-->
                                                                                            <div class="input-group date" data-date-format="dd.mm.yyyy">
                                                                                                <input  type="text" class="form-control" placeholder="dd/mm/yyyy" name="way_bill_date" id="way_bill_date"  value="<%=dateFormateChnge(data.getString("way_bill_date"))%>">
                                                                                                <div class="input-group-addon" >
                                                                                                  <span class="glyphicon glyphicon-th"></span>
                                                                                                </div>
                                                                                            </div>
												<span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
										</div>
                                                                                <div class="form-group">
                                                                                    <div>
                                                                                       <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">Header Text : </label>
											<div class="col-sm-4">
                                                                                            <input   name="header_text"  type="text"   class="form-control" id="header_text" value="<%=data.getString("header_text")%>">
												<span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
                                                                                    <div>
                                                                                       <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">No of Container : </label>
											<div class="col-sm-4">
                                                                                            <input     name="total_container"  type="text"   class="form-control" id="total_container" value="<%=data.getString("total_container")%>">
												<span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
										</div>
                                                                                                      
                                                                                                <div class="form-group" hidden="">
                                                                                    <div>
                                                                                       <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">Items : </label>
											<div class="col-sm-4">
                                                                                            <%
                                                                                                        ds1= new DataService();
                                                                                                        rs=ds1.Item_Master_list();
                                                                                                %>
                                                                                                <select name="select_Items" id="select_Items" class="form-control select2 "  onchange="generateTableRow()" >
                                                                                                   <!--<optgroup label="storage_location">-->
                                                                                                   <option value="">Select Items</option>
                                                                                                                 <%
                                                                                                                  while(rs.next()){
                                                                                                                      String o=rs.getObject("Iid")+"=>"+rs.getObject("item_name")+"=>"+rs.getObject("unit")+"=>"+rs.getObject("HSN_code");
                                                                                                                      Object f=rs.getObject("item_name");
                                                                                                                 %>
                                                                                                        <option value="<%=o%>"><%=f%></option>
                                                                                                                   <%}%> 
                                                                                                      <!--</optgroup>-->
                                                                                              </select>
											</div>
                                                                                    </div>
										</div>
										
									</div>
								</div>

								<div class="row">	
								<div class="col-md-12" style="height:400px;overflow-x:scroll;overflow-y:scroll">
                                                                    
                                                                   <table class="inner-table-2 inventory" id="detailsTBL" >
                                                                    <thead>
                                                                        <tr id="E">
                                                                        <th >-</th>
                                                                        <th >Iid</th>
                                                                        <th  style=" width: 21%;text-align: center">Item_name</th>
                                                                        <th>HSN</th>
                                                                        <th>vender_metrial_no</th>
                                                                        <th>MPN_material</th>
                                                                        <th>material_grup</th>
                                                                        <th>valuation_type</th>
                                                                        <th>EAN_in_order_unit</th>
                                                                        <th>EAN_check</th>
                                                                        
                                                                        <th>QTY_in_delivery_note</th>
                                                                        <th>QTY_in_delivery_note1</th>
                                                                        <th>QTY_in_unit_of_Entry</th>
                                                                        
                                                                        <th>QTY_in_unit_of_Entry1</th>
                                                                        <th>QTY_in_SKU</th>
                                                                        <th>QTY_in_SKU1</th>
                                                                        <th>QTY_in_short</th>
                                                                        <th>QTY_in_short1</th>
                                                                        <th>QTY_ordered</th>
                                                                        <th>QTY_ordered1</th>
                                                                        <th>GR_QTY</th>
                                                                        <th>No_containers</th>
                                                                        <th>No_containers1</th>
                                                                        
                                                                        <th>Movement_type</th>
                                                                        <th>stock_type</th>
                                                                        <th>plant</th>
                                                                        <th>plant_id</th>
                                                                        <th>storage_location</th>
                                                                        <th>storage_location_id</th>
                                                                        <th>goods_recipient</th>
                                                                        <th>unloading_point</th>
                                                                        <th>text</th>
                                                                        <th>item_category</th>
                                                                        
                                                                        <th>Del_Completed_Ind</th>
                                                                        <th>Requistioner</th>
                                                                        <th>Cent_enclosed</th>
                                                                        <th>Manufacturer_id</th>
                                                                        <th>Manufacturer_name</th>
                                                                        <th>Manufacturer_adrs</th>
                                                                        <th>Batch</th>
                                                                        <th>vender_Batch</th>
                                                                        <th>Date_of_manufacture</th>
                                                                        <th>SLED_BBD</th>
                                                                        
                                                                        <th>Rate</th>
                                                                        <th>basic_amt</th>
                                                                        <th>gst_code</th>
                                                                        <th>gst_per</th>
                                                                        <th>gst_amt</th>
                                                                        <th>total_amt</th>
                                                                        
                                                                        <th>retest_date</th>
                                                                        
                                                                        
                                                                        
                                                                      </tr> 
                                                                    </thead>
                                                                    <%  int i=0;
                                                                        ds1= new DataService();
                                                                         rs=ds1.GRN_item_list(Gid);
                                                                     %>
                                                                    <tbody>
                                                                    <%while(rs.next()){%>
                                                              	<tr id="<%=i%>" onclick="edit_btn(<%=i%>)" class="row_tr">
                                                                                    <td><a class="cut" onclick="cuting(this);">-</a><span ></span></td>
                                                                                    <td style="background: #efefef;"><span><%=rs.getString("Iid")%></span></td>
                                                                                    <td style="background: #efefef;"><span ><%=rs.getString("Iname")%></span></td>
                                                                                    <td style="background: #efefef;"><span ><%=rs.getString("HSN")%></span></td>
                                                                                    <td><span><%=rs.getString("vender_metrial_no")%></span></td>
                                                                                    <td><span><%=rs.getString("MPN_material")%></span></td>
                                                                                    <td><span><%=rs.getString("material_grup")%></span></td>
                                                                                    <td><span><%=rs.getString("valuation_type")%></span></td>
                                                                                    <td><span><%=rs.getString("EAN_in_order_unit")%></span></td>
                                                                                    <td><span><%=rs.getString("EAN_check")%></span></td>
                                                                                    <td><span><%=rs.getString("QTY_in_delivery_note")%></span></td>
                                                                                    <td><span><%=rs.getString("QTY_in_delivery_note1")%></span></td>
                                                                                    <td><span><%=rs.getString("QTY_in_unit_of_Entry")%></span></td>
                                                                                    
                                                                                    <td><span><%=rs.getString("QTY_in_unit_of_Entry1")%></span></td>
                                                                                    <td><span><%=rs.getString("QTY_in_SKU")%></span></td>
                                                                                    <td><span><%=rs.getString("QTY_in_SKU1")%></span></td>
                                                                                    <td><span><%=rs.getString("QTY_in_short")%></span></td>
                                                                                    <td><span><%=rs.getString("QTY_in_short")%></span></td>
                                                                                    
                                                                                    <td><span><%=rs.getString("QTY_ordered")%></span></td>
                                                                                    <td><span><%=rs.getString("QTY_ordered1")%></span></td>
                                                                                    <td><span><%=rs.getString("GR_QTY")%></span></td>
                                                                                    <td><span><%=rs.getString("No_containers")%></span></td>
                                                                                    <td><span><%=rs.getString("No_containers1")%></span></td>
                                                                                    
                                                                                    <td><span><%=rs.getString("Movement_type")%></span></td>
                                                                                    <td><span><%=rs.getString("stock_type")%></span></td>
                                                                                    <td><span><%=rs.getString("plant")%></span></td>
                                                                                    <td><span><%=rs.getString("plant_id")%></span></td>
                                                                                    <td><span><%=rs.getString("storage_location")%></span></td>
                                                                                    <td><span><%=rs.getString("storage_location_id")%></span></td>
                                                                                    <td><span><%=rs.getString("goods_recipient")%></span></td>
                                                                                    <td><span><%=rs.getString("unloading_point")%></span></td>
                                                                                    <td><span><%=rs.getString("text")%></span></td>
                                                                                    <td><span><%=rs.getString("item_category")%></span></td>
                                                                                    
                                                                                    <td><span><%=rs.getString("Del_Completed_Ind")%></span></td>
                                                                                    <td><span><%=rs.getString("Requistioner")%></span></td>
                                                                                    <td><span><%=rs.getString("Cent_enclosed")%></span></td>
                                                                                    <td><span><%=rs.getString("Manufacturer_id")%></span></td>
                                                                                    <td><span><%=rs.getString("Manufacturer_name")%></span></td>
                                                                                    <td><span><%=rs.getString("Manufacturer_adrs")%></span></td>
                                                                                    <td><span class="id"><%=rs.getString("Batch")%></span></td>
                                                                                    <td><span><%=rs.getString("vender_Batch")%></span></td>
                                                                                    <td><span><%=rs.getString("Date_of_manufacture")%></span></td>
                                                                                    <td><span><%=rs.getString("SLED_BBD")%></span></td>
                                                                                    
                                                                                    <td><span><%=rs.getString("rate")%></span></td>
                                                                                    <td><span><%=rs.getString("basic_amt")%></span></td>
                                                                                    <td><span><%=rs.getString("gst_code")%></span></td>
                                                                                    <td><span><%=rs.getString("gst_per")%></span></td>
                                                                                    <td><span><%=rs.getString("gst_amt")%></span></td>
                                                                                    <td><span><%=rs.getString("total_amt")%></span></td>
                                                                                    
                                                                                    <td><span><%=rs.getString("retest_date")%></span></td>
                                                                                    
                                                                                    </tr>
                                                                                    <%i++; }%> 
                                                                                    </tbody>
                                                                             </table>
									</div>
								</div>
								<br>
								
                                                                
                                                                <div class="row">
                                                        <div class="col-sm-12">
                                                                    <!--<div class="wrapper">-->
                                                                        <ul class="tabs">
                                                                            <li><a href="javascript:void(0); return false;" rel="#tabcontent1" class="tab active">Material</a></li>
                                                                            <li><a href="javascript:void(0); return false;" rel="#tabcontent2" class="tab">Quantity</a></li>
                                                                            <li><a href="javascript:void(0); return false;" rel="#tabcontent3" class="tab">where</a></li>
                                                                            <li><a href="javascript:void(0); return false;" rel="#tabcontent4" class="tab">Purchase Order Data</a></li>
                                                                            <li><a href="javascript:void(0); return false;" rel="#tabcontent5" class="tab">Partner</a></li>
                                                                            <li><a href="javascript:void(0); return false;" rel="#tabcontent6" class="tab">Batch</a></li>
                                                                            <li><a href="javascript:void(0); return false;" rel="#tabcontent7" class="tab">Cost Assignment</a></li>
                                                                            
<!--                                                                            <li><a href="javascript:void(0); return false;" rel="#tabcontent7" class="tab">Account Assignment</a></li>
                                                                            <li><a href="javascript:void(0); return false;" rel="#tabcontent8" class="tab">Additional Data</a></li>-->
                                                                        </ul>
                                                                    <input type="button" class="btn btn-success" value="Save" style="float: right;" onclick="update_table_row()">
                                                                    <input type="button" class="btn btn-success" value="Add New Row" style="float: right;" onclick="Add_table_row()">
                                                                    <input type="hidden" id="row_id" >
                                                                        <div class="tab_content_container">
                                                                            <div class="tab_content tab_content_active" id="tabcontent1">
                                                                                <div class="col-md-12">
                                                                                    <div class="form-group">   
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Material :</label>
                                                                                            <div class="col-sm-4">
                                                                                                <input  autocomplete="off" name="Iname"  type="text"   class="form-control" id="Iname" readonly="">
                                                                                                 <span id="err_cust_id" style="color:red;"></span>
                                                                                             </div>
                                                                                             <!--<label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">Company : <span class="">*</span></label>-->
                                                                                             <div class="col-sm-2">
                                                                                                 <input  autocomplete="off"   name="Iid"  type="text"   class="form-control" id="Iid" readonly="">
                                                                                                 <input  autocomplete="off"   name="HSN"  type="hidden"   class="form-control" id="HSN" readonly="">
                                                                                                 <span id="err_cust_id" style="color:red;"></span>
                                                                                             </div>
                                                                                     </div>
                                                                                    <div class="form-group">   
                                                                                         <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Vendor Material No. :</label>
                                                                                            <div class="col-sm-3">
                                                                                                 <input  autocomplete="off"name="vender_metrial_no"  type="text"   class="form-control" id="vender_metrial_no">
                                                                                                 <span id="err_cust_id" style="color:red;"></span>
                                                                                             </div>
                                                                                     </div>
                                                                                    <div class="form-group">   
                                                                                         <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">MPN MATERIAL :</label>
                                                                                            <div class="col-sm-2">
                                                                                                 <input  autocomplete="off"name="MPN_material"  type="text"   class="form-control" id="MPN_material">
                                                                                                 <span id="err_cust_id" style="color:red;"></span>
                                                                                             </div>
                                                                                     </div>
                                                                                    <div class="form-group">   
                                                                                         <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">MATERIAL Group :</label>
                                                                                            <div class="col-sm-2">
                                                                                                 <input  autocomplete="off"name="material_grup"  type="text"   class="form-control" id="material_grup">
                                                                                                 <span id="err_cust_id" style="color:red;"></span>
                                                                                             </div>
                                                                                         <div class="col-sm-7 control-label">
                                                                                            <label for="cust_id" id="cust_id_label" class="col-sm-6 control-label">Valuation Type:</label>
                                                                                            <div class="col-sm-6">
                                                                                                 <input  autocomplete="off"name="valuation_type"  type="text"   class="form-control" id="valuation_type">
                                                                                                 <span id="err_cust_id" style="color:red;"></span>
                                                                                             </div>
                                                                                            <label for="cust_id" id="cust_id_label" class="col-sm-6 control-label">EAN in order unit:</label>
                                                                                            <div class="col-sm-6">
                                                                                                 <input  autocomplete="off"name="EAN_in_order_unit"  type="text"   class="form-control" id="EAN_in_order_unit">
                                                                                                 <span id="err_cust_id" style="color:red;"></span>
                                                                                             </div>
                                                                                            <label for="cust_id" id="cust_id_label" class="col-sm-6 control-label">EAN Check:</label>
                                                                                            <div class="col-sm-6">
                                                                                                 <input  autocomplete="off"name="EAN_check"  type="text"   class="form-control" id="EAN_check">
                                                                                                 <span id="err_cust_id" style="color:red;"></span>
                                                                                             </div>
                                                                                         </div>
                                                                                     </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="tab_content" id="tabcontent2">
                                                                            <div class="col-md-12">
                                                                                <div class="form-group">   
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Qty in Delivery Note:</label>
                                                                                            <div class="col-sm-4">
                                                                                                 <input  autocomplete="off" name="QTY_in_delivery_note"  type="text"   class="col-sm-8" id="QTY_in_delivery_note">
                                                                                                 <input  autocomplete="off" name="QTY_in_delivery_note1"  type="text"   class="col-sm-4" id="QTY_in_delivery_note1">
                                                                                             </div>
                                                                                </div>
                                                                                <div class="form-group">   
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Qty in Unit Of Entry :</label>
                                                                                            <div class="col-sm-4">
                                                                                                <input  autocomplete="off" name="QTY_in_unit_of_Entry"  type="text"   class="col-sm-8" id="QTY_in_unit_of_Entry" onkeyup="short_cal()">
                                                                                                 <input  autocomplete="off" name="QTY_in_unit_of_Entry1"  type="text"   class="col-sm-4" id="QTY_in_unit_of_Entry1">
                                                                                             </div>
                                                                                </div>
                                                                                <div class="form-group">   
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Qty in SKU :</label>
                                                                                            <div class="col-sm-4">
                                                                                                 <input  autocomplete="off" name="QTY_in_SKU"  type="text"   class="col-sm-8" id="QTY_in_SKU">
                                                                                                 <input  autocomplete="off" name="QTY_in_SKU1"  type="text"   class="col-sm-4" id="QTY_in_SKU1" >
                                                                                             </div>
                                                                                </div>
                                                                                <div class="form-group">   
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Short QTY:</label>
                                                                                            <div class="col-sm-4">
                                                                                                 <input  autocomplete="off" name="QTY_in_short"  type="text"   class="col-sm-8" id="QTY_in_short">
                                                                                                 <input  autocomplete="off" name="QTY_in_short1"  type="text"   class="col-sm-4" id="QTY_in_short1">
                                                                                             </div>
                                                                                </div>
                                                                                 <div class="form-group">   
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Quantity Ordered :</label>
                                                                                            <div class="col-sm-4">
                                                                                                <input   name="QTY_ordered"  type="text"   class="col-sm-8" id="QTY_ordered"  style="background: beige;">
                                                                                                 <input   name="QTY_ordered11"  type="text"   class="col-sm-4" id="QTY_ordered1" style="background: beige;">
                                                                                             </div>
                                                                                     </div>
                                                                                 <div class="form-group">   
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">GR Quantity :</label>
                                                                                            <div class="col-sm-4">
                                                                                                <input  name="GR_QTY"  type="text"   class="col-sm-8" id="GR_QTY" style="background: beige;" readonly="">
                                                                                                 <!--<input  autocomplete="off" name="GR_QTY1"  type="text"   class="col-sm-4" id="GR_QTY1">-->
                                                                                             </div>
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label" style="text-align: left;">No. Containers :</label>
                                                                                            <div class="col-sm-2">
                                                                                                 <input  autocomplete="off" name="No_containers"  type="text"   class="col-sm-8" id="No_containers">
                                                                                                 <input  autocomplete="off" name="No_containers1"  type="text"   class="col-sm-4" id="No_containers1">
                                                                                             </div>
                                                                                     </div>
                                                                                
                                                                            </div>
                                                                                
                                                                            </div>

                                                                            <div class="tab_content" id="tabcontent3">
                                                                                <div class="col-md-12">
                                                                                    <div class="form-group">   
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Movement Type :</label>
                                                                                            <div class="col-sm-2">
                                                                                                 <select   name="Movement_type"  type="text"   class="form-control" id="Movement_type">
                                                                                                     <option>Receipt</option>
                                                                                                     <option>Issue PRD</option>
                                                                                                     <option>EMRN</option>
                                                                                                     <option>Access material Note</option>
                                                                                                     <option>EMPM</option>
                                                                                                     <option>Issue Trail</option>
                                                                                                     <option>Write Top</option>
                                                                                                     <option>MIST Issue</option>
                                                                                                 </select>
                                                                                                 <!--<input  autocomplete="off"name="Movement_type"  type="text"   class="form-control" id="Movement_type">-->
                                                                                                 <span id="err_cust_id" style="color:red;"></span>
                                                                                             </div>
                                                                                             <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label">Stock Type :</label>
                                                                                             <div class="col-sm-3">
                                                                                                 <select   name="stock_type"  type="text"   class="form-control" id="stock_type">
                                                                                                     <option>Quality Inspection</option>
                                                                                                     <option>Blocked Stock</option>
                                                                                                     <option>Unrestricted Use</option>
                                                                                                 </select>
                                                                                             </div>
                                                                                     </div>
                                                                                    <div class="form-group">   
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Plant :</label>
                                                                                            <div class="col-sm-6">
                                                                                                 <input  autocomplete="off" name="plant"  type="text"   class="col-sm-8" id="plant">
                                                                                                 <input  autocomplete="off" name="plant_id"  type="text"   class="col-sm-4" id="plant_id" >
                                                                                             </div>
                                                                                     </div>
                                                                                    <div class="form-group">   
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Storage Location :</label>
                                                                                            <div class="col-sm-9">
                                                                                                 <input  autocomplete="off" name="storage_location"  type="text"   class="col-sm-6" id="storage_location">
                                                                                                 <input  autocomplete="off" name="storage_location_id"  type="text"   class="col-sm-2" id="storage_location_id" >
                                                                                                 <%
                                                                                                        ds1= new DataService();
                                                                                                        rs=ds1.Company_list();
                                                                                                %>
                                                                                                <select name="storage" id="storage" class="form-control form-inline col-sm-3"  onchange="store_chnge()" style="width: 30%;">
                                                                                                   <!--<optgroup label="storage_location">-->
                                                                                                   <option value="">-- Select storage_location --</option>
                                                                                                                 <%
                                                                                                                  while(rs.next()){
                                                                                                                      String o=rs.getObject("code")+"/"+rs.getObject("shot_name");
                                                                                                                      Object f=rs.getObject("shot_name");
                                                                                                                 %>
                                                                                                        <option value="<%=o%>"><%=f%></option>
                                                                                                                   <%}%> 
                                                                                                      <!--</optgroup>-->
                                                                                              </select>
                                                                                             </div>
                                                                                     </div>
                                                                                    <div class="form-group">   
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Goods recipient:</label>
                                                                                            <div class="col-sm-4">
                                                                                                 <input  autocomplete="off" name="goods_recipient"  type="text"  class="form-control"   id="goods_recipient">
                                                                                              </div>
                                                                                     </div>
                                                                                    <div class="form-group">   
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Unloading Point:</label>
                                                                                            <div class="col-sm-6">
                                                                                                 <input  autocomplete="off" name="unloading_point"  type="text"   class="form-control"  id="unloading_point"> 
                                                                                             </div>
                                                                                     </div>
                                                                                    <div class="form-group">   
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Text :</label>
                                                                                            <div class="col-sm-8">
                                                                                                 <input  autocomplete="off" name="text"  type="text" class="form-control"    id="text">
                                                                                             </div>
                                                                                     </div>
                                                                                </div>
                                                                                </div>

                                                                            <div class="tab_content" id="tabcontent4">
                                                                               <div class="col-md-12">
                                                                                    <div class="form-group">   
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Purchase Order :</label>
                                                                                            <div class="col-sm-4">
                                                                                                <input  autocomplete="off" name="Vname"  type="text"   class="col-sm-6" id="Vname">
                                                                                                <input  autocomplete="off" name="Vname"  type="text"   class="col-sm-3" id="Vname" >
                                                                                           </div>
                                                                                             <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label" style="text-align: left;">Item Category :</label>
                                                                                             <div class="col-sm-3">     
                                                                                                 <input  autocomplete="off" name="item_category"  type="text" class="form-control" value="Standard"   id="item_category">
                                                                                            </div>
                                                                                     </div>
                                                                                   <div class="form-group"> 
                                                                                             <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">"Del.Completed" Ind. :</label>
                                                                                             <div class="col-sm-3">
                                                                                                 <select  autocomplete="off"   name="Del_Completed_Ind"  type="text"   class="form-control" id="Del_Completed_Ind">
                                                                                                     <option>Set automatically</option>
                                                                                                     <option>Set</option>
                                                                                                     <option>Do not set</option>
                                                                                                 </select>
                                                                                             </div>
                                                                                     </div>
                                                                                   <div class="form-group">  
                                                                                             <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Requistioner :</label>
                                                                                             <div class="col-sm-3">     
                                                                                                 <input  autocomplete="off" name="Requistioner"  type="text" class="form-control" value="Standard"   id="Requistioner">
                                                                                            </div>
                                                                                     </div>
                                                                                    <div class="form-group"> 
                                                                                             <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Cert. enclosed?:</label>
                                                                                             <div class="col-sm-3">
                                                                                                 <select  autocomplete="off"   name="Cent_enclosed"  type="text"   class="form-control" id="Cent_enclosed">
                                                                                                     <option></option>
                                                                                                     <option>YES</option>
                                                                                                     <option>NO</option>
                                                                                                 </select>
                                                                                             </div>
                                                                                             <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label">Supplier's COA</label>
                                                                                     </div>
                                                                               </div>
                                                                               </div>

                                                                            <div class="tab_content" id="tabcontent5">
                                                                              <div class="col-md-12">
                                                                                    <div class="form-group">   
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Vendor :</label>
                                                                                            <div class="col-sm-4">
                                                                                                <input  autocomplete="off" name=""  type="text"   class="col-sm-8" id="" >
                                                                                                 <input  autocomplete="off" name=""  type="text"   class="col-sm-4" id=""  >
                                                                                             </div>
                                                                                     </div>
                                                                                   <div class="form-group">   
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Supplier Vendor :</label>
                                                                                            <div class="col-sm-4">
                                                                                                 <input  autocomplete="off" name=""  type="text"   class="col-sm-8" id="" >
                                                                                                 <input  autocomplete="off" name=""  type="text"   class="col-sm-4" id="">
                                                                                             </div>
                                                                                             <div class="col-sm-4">
                                                                                                <%
//                                                                                                        ds1= new DataService();
//                                                                                                        rs=ds1.Manufacture_list(data.getString("vid"));
                                                                                                %>
                                                                                                <select name="vmanu" id="vmanu" class="form-control form-inline"  onchange="Vmanu_chnge()">
                                                                                                   <optgroup label="select Manufacture">
                                                                                                   <option value="">-- Select --</option>
                                                                                                                 <%
//                                                                                                                  while(rs.next()){
//                                                                                                                      String o=rs.getObject(1)+"/"+rs.getObject(2)+"/"+rs.getObject(3);
//                                                                                                                      Object f=rs.getObject(2);
                                                                                                                 %>
                                                                                                        <!--<option value=""></option>-->
                                                                                                                   <%//}%> 
                                                                                                      </optgroup>
                                                                                              </select>
                                                                                             </div>
                                                                                     </div>
                                                                                   <div class="form-group">   
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Manufactures :</label>
                                                                                            <div class="col-sm-8">
                                                                                                 <input  autocomplete="off" name="Manufacturer_name"  type="text"   class="col-sm-4" id="Manufacturer_name">
                                                                                                 <input  autocomplete="off" name="Manufacturer_id"  type="text"   class="col-sm-3" id="Manufacturer_id" >
                                                                                                 <input  autocomplete="off" name="Manufacturer_adrs"  type="text"   class="col-sm-5" id="Manufacturer_adrs" >
                                                                                             </div>
                                                                                     </div>
                                                                              </div>
                                                                              </div>
                                                                            
                                                                             <div class="tab_content" id="tabcontent6">
                                                                               <div class="col-md-12">
                                                                                    <div class="form-group">   
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Batch :</label>
                                                                                            <div class="col-sm-4">
                                                                                                 <input  autocomplete="off" name="Batch"  type="text"   class="col-sm-8" id="Batch">
                                                                                                 <input  autocomplete="off"  type="button" value="generate"  class="col-sm-3 btn btn-info" onclick="random_number()">
                                                                                             </div>
                                                                                     </div>
                                                                                    <div class="form-group">   
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Vendor Batch :</label>
                                                                                            <div class="col-sm-4">
                                                                                                 <input  autocomplete="off" name="vender_Batch"  type="text"   class="col-sm-10" id="vender_Batch">
                                                                                             </div>
                                                                                     </div>
                                                                                    <div class="form-group">   
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Date of Manufactures :</label>
                                                                                            <div class="col-sm-4">
                                                                                                 <input  autocomplete="off" name="Date_of_manufacture"  type="text"   class="col-sm-8" id="Date_of_manufacture">
                                                                                             </div>
                                                                                     </div>
                                                                                    <div class="form-group">   
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Retest Date :</label>
                                                                                            <div class="col-sm-4">
                                                                                                 <input  autocomplete="off" name="retest_date"  type="text"   class="col-sm-8" id="retest_date">
                                                                                             </div>
                                                                                     </div>
                                                                                    <div class="form-group">   
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">SLED/BBED :</label>
                                                                                            <div class="col-sm-4">
                                                                                                 <input  autocomplete="off" name="SLED_BBD"  type="text"   class="col-sm-8" id="SLED_BBD">
                                                                                             </div>
                                                                                     </div>
<!--                                                                                    <div class="form-group">   
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Valuation Type :</label>
                                                                                            <div class="col-sm-4">
                                                                                                 <input  autocomplete="off" name="Vname" required type="text"   class="col-sm-8" id="Vname">
                                                                                             </div>
                                                                                     </div>-->
                                                                               </div>
                                                                               </div>
                                                                                                      
                                                                              
                                                                            <div class="tab_content" id="tabcontent7">
                                                                               <div class="col-md-12">
                                                                                    <div class="form-group">   
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Rate :</label>
                                                                                            <div class="col-sm-3">
                                                                                                <input  autocomplete="off" name="rate"  type="text" class="form-control"   id="rate" onkeyup="Item_cal()">
                                                                                           </div>
                                                                                             <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label" style="text-align: left;">Basic Amt :</label>
                                                                                             <div class="col-sm-3">     
                                                                                                 <input  autocomplete="off" name="basic_amt"  type="text" class="form-control"   id="basic_amt" >
                                                                                            </div>
                                                                                     </div>
                                                                                   <div class="form-group"> 
                                                                                             <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">GST :</label>
                                                                                             <div class="col-sm-3">
                                                                                                 <%
                                                                                                    ds1= new DataService();
                                                                                                    rs=ds1.Tax_list();
                                                                                                  %>
                                                                                                  <select  autocomplete="off"   name="tax"  type="text"   class="form-control" id="tax" onchange="Item_cal()">
                                                                                                <option value="0=>0">-- Select --</option>
                                                                                           <%
                                                                                             while(rs.next()){
                                                                                             String o=rs.getObject(3)+"=>"+rs.getObject(4);
                                                                                             Object f=rs.getObject(3);
                                                                                            %>
                                                                                                    <option value="<%=o%>"><%=f%></option>
                                                                                            <%}%> 
                                                                                                 </select>
                                                                                             </div>
                                                                                     </div>
                                                                                                 <input type="hidden" name="gst_code" id="gst_code">
                                                                                                 <input type="hidden" name="gst_per" id="gst_per">
                                                                                   <div class="form-group">  
                                                                                             <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">GST Amt. :</label>
                                                                                             <div class="col-sm-3">     
                                                                                                 <input  autocomplete="off" name="gst_amt"  type="text" class="form-control" id="gst_amt">
                                                                                            </div>
                                                                                     </div>
                                                                                    <div class="form-group">  
                                                                                             <label for="cust_id" id="cust_id_label" class="col-sm-3 control-label" style="text-align: left;">Total Amt. :</label>
                                                                                             <div class="col-sm-3">     
                                                                                                 <input  autocomplete="off" name="total_amt"  type="text" class="form-control" id="total_amt">
                                                                                            </div>
                                                                                     </div>
                                                                               </div>
                                                                               </div>                          
                                                                        </div>
                                                                    </div>    
								<!--</div>-->					
                                                                </div>
                                                                                                 
                                                              <div class="row" style=" background-color: aliceblue;padding-top: 2%;">
                                                                 <div class="form-group">
											<label for="date" class="col-sm-2 control-label">FREIGHT : <span class="required">*</span></label>
											<div class="col-sm-4">
                                                                                            <!--<body onload="addDate();"/>-->
                                                                                            <input  autocomplete="off"   name="freight"  type="text"  class="form-control" id="freight" onkeyup="final_total()" value="<%=data.getString("freight")%>">
                                                                                          <span id="err_inv_date" style="color:red;"></span>
											</div>												
											
											<label for="month" class="col-sm-2 control-label">FREIGHT GST : <span class="required">*</span></label>
											
											<div class="col-sm-4">
												<%
                                                                                                            ds1= new DataService();
                                                                                                            rs=ds1.Tax_list();
                                                                                                           %>
                                                                                                           <select name="freight_tax" id="freight_tax" class="select2 select2_single form-control" onchange="final_total()" >
                                                                                           <!--<optgroup label="select tax">-->
                                                                                           <option value="0=>0">-- Select --</option>
                                                                                                         <%
                                                                                                             while(rs.next()){
                                                                                                                 String o=rs.getObject(3)+"=>"+rs.getObject(4);
                                                                                                                 Object f=rs.getObject(3);
                                                                                                         %>
                                                                                                        <option value="<%=o%>"><%=f%></option>
                                                                                                           <%}%> 
                                                                                              <!--</optgroup>-->
                                                                                          </select>
												<span id="err_item_color" style="color:red;"></span>
											</div>
										</div>
                                                                                          
                                                                <div class="col-md-6"></div>
                                                                <div class="col-md-6">
											<div class="col-sm-12">
												<dl class="dl-horizontal">
												  <dt>Total:</dt>
												  <dd>
                                                                                                      &#8377; <span  name="total" id="total" ><%=data.getString("total")%></span><br>
                                                                                                   </dd>
												</dl>
                                                                                            <dl class="dl-horizontal">
												  <dt>FREIGHT GST amount:</dt>
												  <dd>
                                                                                                      &#8377; <span  name="GST/IGST" id="gst_amt_freight" ><%=data.getString("gst_amt_freight")%></span><br>
                                                                                                      <span  name="gst_per_freight" id="gst_per_freight" hidden=""><%=data.getString("gst_per_freight")%></span>
                                                                                                   </dd>
												</dl>
                                                                                            <dl class="dl-horizontal">
                                                                                                <dt><input class=" other_charge " id="tcsChek" type="checkbox" name="tcsChek" onclick="final_total();" <%=data.getString("tcs_tax").equals("0") ? "" : "checked"%>> TCS (0.10%):</dt>
												  <dd>
                                                                                                      &#8377; <span  name="tcs_tax" id="tcs_tax" ><%=data.getString("tcs_tax")%></span><br>
                                                                                                   </dd>
												</dl>
                                                                                            
                                                                                            <dl class="dl-horizontal">
												  <dt>Bill amount:</dt>
												  <dd>
                                                                                                      &#8377; <span  name="bill_amt" id="bill_amt" ><%=data.getString("bill_amt")%></span><br>
                                                                                                   </dd>
												</dl>
                                                                                            
                                                                                            <dl class="dl-horizontal">
												  <dt>Local Freight:</dt>
												  <dd>
                                                                                                      &#8377; <span  name="local_freight" id="local_freight" contenteditable="" ><%=data.getString("local_freight")%></span><br>
                                                                                                   </dd>
                                                                                            </dl>
                                                                                            
                                                                                            <dl class="dl-horizontal">
												  <dt>Other Expenses:</dt>
												  <dd>
                                                                                                      &#8377; <span  name="other_expensess" id="other_expensess" contenteditable="" onkeyup="final_total()"><%=data.getString("other_expensess")%></span><br>
                                                                                                   </dd>
                                                                                            </dl>
                                                                                            
                                                                                            
                                                                                           
											</div>
									

                                                                    <div class="col-sm-12" hidden="">
											<dl class="dl-horizontal">
												  <dt>Total Quantity : </dt>
												  <dd>
												  <input name="hid_total_quantity" type="hidden" id="hid_total_quantity">
												  <span class="" id="Total_Quantity" name="Total_Quantity"></span>
												  </dd>
											</dl>
										</div>
									</div>
                                                             </div>  
                                                                
                                                                
								
								<div class="row">
									<div class="form-group">
										<div class="col-sm-2"></div>
										<div class="col-sm-10">
											<div class="progress progress-lg progress-tab" style="display:none;">
												<div role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:0%;" class="progress-bar progress-tab-bar progress-bar-accent progress-bar-striped active">
													<span class="sr-only progress-tab-val " style="position:relative;">0%</span>
												</div>
											</div>
										</div>
									</div>
								</div>
                                                                <div id="successMessage" class="col-md-6 col-md-offset-3 alert alert-success" style="display:none;"></div>
  

								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
                                                                                    <center> 
							
                                                                                        
                                                                                        
                                                                                        <div class="col-sm-12">
												<button type="submit"  value="save" class="btn btn-success invoice_btn ">Add</button>
												<a href="index.jsp" class="btn btn-default">Cancel</a>
												<div id="output3" style=""></div>
											</div>
                                                                                    </center>
										</div>
									</div>	
								  </div>
							</form>

                            <%}%>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- User Modal1 -->

              
               <!-- /.modal -->
            </section>
            <!-- /.content -->
         </div>
        </div></div>
  
                                                                                              
                                                                                              
                                                                                              
      
        
         <script>
           $(document).ready(function () {
               
//                $('.input-group.date').datepicker({format: "dd/mm/yyyy"}); 
                
                  //alert('payroll');com_vise_GRN_no
              $('.select2').select2();
 $('form#demo-form3').submit(function () {
//     for edit paramenter
             var sr  = $(this).find("[name='sr']").val();
             var com_vise_GRN_no  = $(this).find("[name='com_vise_GRN_no']").val();
//             end

                   var Gid  = $(this).find("[name='Gid']").val();
//                    alert("Gid->"+Gid);GRN_BY
                       
                    var Pid  = $(this).find("[name='Pid']").val();
//                 alert("Pid->"+Pid);
                    var Pid_sr  = $(this).find("[name='Pid_sr']").val();
//                       alert("Pid->"+Pid);
                    var document_date  = $(this).find("[name='document_date']").val();
//                   alert("Board_Type->"+Board_Type);remark
                    var posting_date  = $(this).find("[name='posting_date']").val();
                
                  var Vname= document.getElementById("Vname").value;
//                  var Vid= document.getElementById("Vid").value;
                  var vender= document.getElementById("vender").value;
                  var Cname= document.getElementById("Cname").value;
                  var com= document.getElementById("com").value;
                  
                  var delevery_challan_no= document.getElementById("delevery_challan_no").value;
                  var challan_date= document.getElementById("challan_date").value;
                 
                 var bill_no= document.getElementById("bill_no").value;
                 var Bill_date= document.getElementById("Bill_date").value;
                 var LR_no= document.getElementById("LR_no").value;
                 var LR_date= document.getElementById("LR_date").value;
                 var transport_name= document.getElementById("transport_name").value;
                 var vehicle_no= document.getElementById("vehicle_no").value;
                 var way_bill_no= document.getElementById("way_bill_no").value;
                 var way_bill_date= document.getElementById("way_bill_date").value;
                 var header_text= document.getElementById("header_text").value;
                 var total_container= document.getElementById("total_container").value;
//                 alert("Pid_sr->"+Pid_sr);
                 var total= document.getElementById("total").innerHTML;
                 var freight= document.getElementById("freight").value;
                 var gst_per_freight= document.getElementById("gst_per_freight").innerHTML;
                 var gst_amt_freight= document.getElementById("gst_amt_freight").innerHTML;
                 var tcs_tax= document.getElementById("tcs_tax").innerHTML;
                 var bill_amt= document.getElementById("bill_amt").innerHTML;
                 var local_freight= document.getElementById("local_freight").innerHTML;
                 var other_expensess= document.getElementById("other_expensess").innerHTML;
                 var state= document.getElementById("state").value;
                 var GRN_BY= document.getElementById("GRN_BY").value;
               if(Gid!="" && Vname!="" && Cname!=""){
//               alert("in if->");
                var cells, price, a, i;
           var obj=[];
           for (var a = document.querySelectorAll('table.inventory tbody tr'), i = 0; a[i]; ++i) {
		// get inventory row cells
		cells = a[i].querySelectorAll('span:last-child');
                var dict={};
                dict["Iid"]=cells[1].innerHTML;
                dict["Iname"]=cells[2].innerHTML;
                dict["HSN"]=cells[3].innerHTML;
                dict["vender_metrial_no"]=cells[4].innerHTML;
                dict["MPN_material"]=cells[5].innerHTML;
                dict["material_grup"]=cells[6].innerHTML;
                dict["valuation_type"]=cells[7].innerHTML;
                dict["EAN_in_order_unit"]=cells[8].innerHTML;
                dict["EAN_check"]=cells[9].innerHTML;
                dict["QTY_in_delivery_note"]=cells[10].innerHTML;
                
                dict["QTY_in_delivery_note1"]=cells[11].innerHTML;
                dict["QTY_in_unit_of_Entry"]=cells[12].innerHTML;
                dict["QTY_in_unit_of_Entry1"]=cells[13].innerHTML;
                dict["QTY_in_SKU"]=cells[14].innerHTML;
                dict["QTY_in_SKU1"]=cells[15].innerHTML;
                dict["QTY_in_short"]=cells[16].innerHTML;
                dict["QTY_in_short1"]=cells[17].innerHTML;
                dict["QTY_ordered"]=cells[18].innerHTML;
                dict["QTY_ordered1"]=cells[19].innerHTML;
                dict["GR_QTY"]=cells[20].innerHTML;
                
                dict["No_containers"]=cells[21].innerHTML;
                dict["No_containers1"]=cells[22].innerHTML;
                dict["Movement_type"]=cells[23].innerHTML;
                dict["stock_type"]=cells[24].innerHTML;
                dict["plant"]=cells[25].innerHTML;
                dict["plant_id"]=cells[26].innerHTML;
                dict["storage_location"]=cells[27].innerHTML;
                dict["storage_location_id"]=cells[28].innerHTML;
                dict["goods_recipient"]=cells[29].innerHTML;
                dict["unloading_point"]=cells[30].innerHTML;
                
                dict["text"]=cells[31].innerHTML;
                dict["item_category"]=cells[32].innerHTML;
                dict["Del_Completed_Ind"]=cells[33].innerHTML;
                dict["Requistioner"]=cells[34].innerHTML;
                dict["Cent_enclosed"]=cells[35].innerHTML;
                dict["Manufacturer_id"]=cells[36].innerHTML;
                dict["Manufacturer_name"]=cells[37].innerHTML;
                dict["Manufacturer_adrs"]=cells[38].innerHTML;
                dict["Batch"]=cells[39].innerHTML;
                dict["vender_Batch"]=cells[40].innerHTML;
                
                dict["Date_of_manufacture"]=cells[41].innerHTML;
                dict["SLED_BBD"]=cells[42].innerHTML;
                
                dict["rate"]=cells[43].innerHTML;
                dict["basic_amt"]=cells[44].innerHTML;
                dict["gst_code"]=cells[45].innerHTML;
                dict["gst_per"]=cells[46].innerHTML;
                dict["gst_amt"]=cells[47].innerHTML;
                dict["total_amt"]=cells[48].innerHTML;
                
                dict["retest_date"]=cells[49].innerHTML;
                
//                alert(cells[5].innerHTML);
                obj.push(dict);
//                alert(JSON.stringify(obj));
            }
           $("#spinner").show();
              $.ajax({
                    type:"POST",
                     url:"GRN_Edit",
                           data:{ 
                               sr:sr,
                               com_vise_GRN_no:com_vise_GRN_no,
                             GRN_BY:GRN_BY,
                             Gid:Gid,
                             Pid:Pid,
                             Pid_sr:Pid_sr,
                             document_date:document_date,
                             posting_date:posting_date,
                             Vname:Vname,
//                             Vid:Vid,
                             vender:vender,
                             Cname:Cname,
                             com:com,
                             delevery_challan_no:delevery_challan_no,
                             challan_date:challan_date,
                             bill_no:bill_no,
                             Bill_date:Bill_date,
                             LR_no:LR_no,
                             LR_date:LR_date,
                             transport_name:transport_name,
                             vehicle_no:vehicle_no,
                             way_bill_no:way_bill_no,
                             way_bill_date:way_bill_date,
                             header_text:header_text,
                             total_container:total_container,
//                             GRN_BY:"Purchase Order",
                             total:total,
                             freight:freight,
                             gst_per_freight:gst_per_freight,
                             gst_amt_freight:gst_amt_freight,
                             tcs_tax:tcs_tax,
                             bill_amt:bill_amt,
                             local_freight:local_freight,
                             other_expensess:other_expensess,   
                             state:state,
                             obj:JSON.stringify(obj)
                            },
                          success:function(data){
//                               alert(data);
                               $('#successMessage').html('Data inserted successfully').delay(5000);
                               $('#successMessage').show();
                               $("#spinner").hide();
                                location.reload();
//                                location.href="invoice_view1.jsp?Invoice_No="+state;
                           }
                       });
                       return false;
                   }
                   else{
                       alert("plase fill required fillds");
                   }
                   });
               });
         
              
              
           function  edit_btn(id){
//                 alert("in edit >"+id);
//                var tr_id = this.id;
//                var tr_id ="E"+id;
                var tr = document.getElementById(id);
//                alert("tr >"+tr);
//                var td = tr.getElementsByTagName("td");
                
                var aa= tr.querySelectorAll("span");
                
//                var emi=aa[11].innerHTML.split("/");
  
//                    alert("td >"+td.);
//                    var a = document.querySelectorAll('table.inventory tbody tr');
//                    var cells = a[id].querySelectorAll('span:last-child');
                    
//                   alert("token >"+td[1].innerHTML);
//                   $("#token").val(td[1].innerHTML);row_id
                   
//                   $("#token").val(aa[0].innerHTML);
                    $("#row_id").val(id);
                   $("#Iid").val(aa[1].innerHTML);
                   $("#Iname").val(aa[2].innerHTML);
                   $("#HSN").val(aa[3].innerHTML);
                   $("#vender_metrial_no").val(aa[4].innerHTML);
                   $("#MPN_material").val(aa[5].innerHTML);
                   $("#material_grup").val(aa[6].innerHTML);
                   $("#valuation_type").val(aa[7].innerHTML);
                   $("#EAN_in_order_unit").val(aa[8].innerHTML);
                   $("#EAN_check").val(aa[9].innerHTML);
                   
                   
                   
                   $("#QTY_in_delivery_note").val(aa[10].innerHTML);
                   $("#QTY_in_delivery_note1").val(aa[11].innerHTML);
                   $("#QTY_in_unit_of_Entry").val(aa[12].innerHTML);
                   $("#QTY_in_unit_of_Entry1").val(aa[13].innerHTML);
                   $("#QTY_in_SKU").val(aa[14].innerHTML);
                   $("#QTY_in_SKU1").val(aa[15].innerHTML);
                   $("#QTY_in_short").val(aa[16].innerHTML);
                   $("#QTY_in_short1").val(aa[17].innerHTML);
                   $("#QTY_ordered").val(aa[18].innerHTML);
                   $("#QTY_ordered1").val(aa[19].innerHTML);
                   $("#GR_QTY").val(aa[20].innerHTML);
                   $("#No_containers").val(aa[21].innerHTML);
                   $("#No_containers1").val(aa[22].innerHTML);
                   
                   $("#Movement_type").val(aa[23].innerHTML);
                   $("#stock_type").val(aa[24].innerHTML);
                   $("#plant").val(aa[25].innerHTML);
                   $("#plant_id").val(aa[26].innerHTML);
                   $("#storage_location").val(aa[27].innerHTML);
                   $("#storage_location_id").val(aa[28].innerHTML);
                   $("#goods_recipient").val(aa[29].innerHTML);
                   $("#unloading_point").val(aa[30].innerHTML);
                   $("#text").val(aa[31].innerHTML);
                   $("#item_category").val(aa[32].innerHTML);
                   
                   $("#Del_Completed_Ind").val(aa[33].innerHTML);
                   $("#Requistioner").val(aa[34].innerHTML);
                   $("#Cent_enclosed").val(aa[35].innerHTML);
                   $("#Manufacturer_id").val(aa[36].innerHTML);
                   $("#Manufacturer_name").val(aa[37].innerHTML);
                   $("#Manufacturer_adrs").val(aa[38].innerHTML);
                   $("#Batch").val(aa[39].innerHTML);
                   $("#vender_Batch").val(aa[40].innerHTML);
                   $("#Date_of_manufacture").val(aa[41].innerHTML);
                   $("#SLED_BBD").val(aa[42].innerHTML);
                   
                   $("#rate").val(aa[43].innerHTML);
                   $("#basic_amt").val(aa[44].innerHTML);
                   $("#gst_code").val(aa[45].innerHTML);
                   $("#gst_per").val(aa[46].innerHTML);
                   $("#gst_amt").val(aa[47].innerHTML);
                   $("#total_amt").val(aa[48].innerHTML);
                   
                   $("#retest_date").val(aa[49].innerHTML);
                   
                   row_color_chnge(id);
            }
            
            function row_color_chnge(id){
//                $(".row_tr").style.background='cyan';
                var elements = document.getElementsByClassName('row_tr'); // get all elements
                for(var i = 0; i < elements.length; i++){
		elements[i].style.backgroundColor = "white";
                }
                document.getElementById(id).style.background = "cyan";

            }
              
              
                 function  update_table_row(){
//                     alert("Updated");
            $("#spinner").show();
                var row_id = document.getElementById("row_id").value;
                if(row_id!=''){
                var tr = document.getElementById(row_id);
                var aa= tr.querySelectorAll("span");
                aa[1].innerHTML=$("#Iid").val();
                aa[2].innerHTML=$("#Iname").val();
                aa[3].innerHTML=$("#HSN").val();
                aa[4].innerHTML=$("#vender_metrial_no").val();
                aa[5].innerHTML=$("#MPN_material").val();
                aa[6].innerHTML=$("#material_grup").val();
                aa[7].innerHTML=$("#valuation_type").val();
                aa[8].innerHTML=$("#EAN_in_order_unit").val();
                aa[9].innerHTML=$("#EAN_check").val();
                
                aa[10].innerHTML=$("#QTY_in_delivery_note").val();
                aa[11].innerHTML=$("#QTY_in_delivery_note1").val();
                aa[12].innerHTML=$("#QTY_in_unit_of_Entry").val();
                
                
                aa[13].innerHTML=$("#QTY_in_unit_of_Entry1").val();
                aa[14].innerHTML=$("#QTY_in_SKU").val();
                aa[15].innerHTML=$("#QTY_in_SKU1").val();
                
                aa[16].innerHTML=$("#QTY_in_short").val();
                aa[17].innerHTML=$("#QTY_in_short1").val();
                aa[18].innerHTML=$("#QTY_ordered").val();
                aa[19].innerHTML=$("#QTY_ordered1").val();
                aa[20].innerHTML=$("#GR_QTY").val();
                aa[21].innerHTML=$("#No_containers").val();
                aa[22].innerHTML=$("#No_containers1").val();
                
                aa[23].innerHTML=$("#Movement_type").val();
                aa[24].innerHTML=$("#stock_type").val();
                aa[25].innerHTML=$("#plant").val();
                aa[26].innerHTML=$("#plant_id").val();
                aa[27].innerHTML=$("#storage_location").val();
                aa[28].innerHTML=$("#storage_location_id").val();
                aa[29].innerHTML=$("#goods_recipient").val();
                aa[30].innerHTML=$("#unloading_point").val();
                aa[31].innerHTML=$("#text").val();
                aa[32].innerHTML=$("#item_category").val();
                
                aa[33].innerHTML=$("#Del_Completed_Ind").val();
                aa[34].innerHTML=$("#Requistioner").val();
                aa[35].innerHTML=$("#Cent_enclosed").val();
                aa[36].innerHTML=$("#Manufacturer_id").val();
                aa[37].innerHTML=$("#Manufacturer_name").val();
                aa[38].innerHTML=$("#Manufacturer_adrs").val();
                aa[39].innerHTML=$("#Batch").val();
                aa[40].innerHTML=$("#vender_Batch").val();
                aa[41].innerHTML=$("#Date_of_manufacture").val();
                aa[42].innerHTML=$("#SLED_BBD").val();
                
                aa[43].innerHTML=$("#rate").val();
                aa[44].innerHTML=$("#basic_amt").val();
                aa[45].innerHTML=$("#gst_code").val();
                aa[46].innerHTML=$("#gst_per").val();
                aa[47].innerHTML=$("#gst_amt").val();
                aa[48].innerHTML=$("#total_amt").val();
                
                aa[49].innerHTML=$("#retest_date").val();
                
                }
                  
                     $("#spinner").hide();
                     final_total();
            }
              
              
              
              
              
  $(document).ready(function() 
           { 
               
               
               
 
       function quan(){
     // alert("call");
        var Item_Size =document.getElementById("Item_Size").value;
     //   alert("From_Date===>"+From_Date1);
        
       var Item_Color =document.getElementById("Item_Color").value;
       // alert("Item_Color===>"+Item_Color);
        
        var   Finished_Grade_Item = document.getElementById("Finished_Grade_Item").value;
      // alert("Finished_Grade_Item===>"+Finished_Grade_Item);
     //   alert("stock amount call");
        
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
                        //   alert("To_Date===>111111111111111");
   var a=document.getElementById("quantity1").innerHTML = this.responseText;
   document.getElementById("quantity1").value=a;
   var a=document.getElementById("Total_Quantity").innerHTML = this.responseText;
   document.getElementById("Total_Quantity").value=a;
   //alert("p===>"+p);
    }
  };
  var url="invoice_quantity_combo?Item_Size="+Item_Size+"&Item_Color="+Item_Color+"&Finished_Grade_Item="+Finished_Grade_Item;
  xhttp.open("GET",url, true);
  xhttp.send(); 
        
 }  
 
 

});
 
 


    
    
    
    
    
//     alert("unidt=============> ");
      $("#Data").change(function(){
   //        alert("unidt=============> 1111111111111111");
        var  Data=document.getElementById("Data").value;
   //  alert("unidt=============> "+Unit_Id);
          var res=Data.split("-");
    document.getElementById("company_id").value=res[0];
    
       });
    


   $(document).ready(function() {
      $(".select2_single").select2({
        placeholder: "Select a state",
        allowClear: true
      });
      $(".select2_group").select2({});
      
    $(".select2_multiple").select2({
        maximumSelectionLength: 9,
        placeholder: "With Max Selection limit 9",
        allowClear: true
      });
    });


//function myFunction() {
// // var checkBox = document.getElementById("Other_Charges");
//  var checkBox = document.getElementById("Other_Charges");
//  var text = document.getElementById("text");
//  var text1 = document.getElementById("text1");
//  if (checkBox.checked == true){
//    text.style.display = "block";
//    text1.style.display = "block";
//  } else {
//     text.style.display = "none";
//     text1.style.display = "none";
//  }
//}other_charge_div



function myFunction() {
 // var checkBox = document.getElementById("Other_Charges");
  var checkBox = document.getElementById("Other_Charges");
  var text = document.getElementById("other_charge_div");
//  var text1 = document.getElementById("text1");
  if (checkBox.checked == true){
    text.style.display = "block";
    text.style.transition = "1s";  
//    text1.style.display = "block";
  } else {
     text.style.display = "none";
     text.style.transition = "1s"
//     text1.style.display = "none";
  }
}


function addDate(){
//    alert("in date");
date = new Date();
var month = date.getMonth()+1;
var day = date.getDate();
var year = date.getFullYear();

if (document.getElementById('Date').value == ''){
document.getElementById('Date').value = day + '-' + month + '-' + year;
}
}


/*function today1(){
     var Item_Size =document.getElementById("Item_Size").value;
     
     var valuesize=Item_Size;
     //alert("valueTotal_Duties="+valueTotal_Duties);
      
     
     document.getElementById("size").value=valuesize;
      document.getElementById("sub_size").value=valuesize;
     
  }   

 function color1(){
     var Item_Color =document.getElementById("Item_Color").value;
     
     var valuecolor=Item_Color;
     //alert("valueTotal_Duties="+valueTotal_Duties);
     document.getElementById("color").value=valuecolor;
      
  }   

 
/*function calculate(){
     var   quantity1 =document.getElementById("quantity1").value;
     //alert("quantity1="+quantity1);
     var  rate =document.getElementById("rate").value;
      //alert("rate="+rate);
   
     var valueB=(parseInt(rate)* parseFloat(quantity1));
     //alert("valueTotal_Duties="+valueTotal_Duties);
     document.getElementById("value1").value=valueB;
 }*/
                  
  
             
             
             
             
  
       





   function add_customer(){
//              alert("inn add function");
              var cust_name= $("#cust_name").val();
//              alert("cust_name >>"+cust_name);
                var cust_ph_no= $("#cust_ph_no").val();
//              alert("cust_ph_no >>"+cust_ph_no);

                var cust_addr= $("#cust_addr").val();
//              alert("cust_addr >>"+cust_addr);
                var cust_gst_no= $("#cust_gst_no").val();
//              alert("cust_gst_no >>"+cust_gst_no);

                var state_id= $("#state_id").val();
//              alert("state_id >>"+state_id);
                var cust_email= $("#cust_email").val();
//              alert("cust_email >>"+cust_email);
              
               $.ajax({
                    type:"POST",
                     url:"Customer_insert",
                           data:{ 
                            Name:cust_name,
                            Phone_No:cust_ph_no,
                            Address:cust_addr,
                            GST_NO:cust_gst_no,
                            Email_Id:cust_email,
                            State:state_id
                           },
                           success:function(data)
                           {
                               //alert(data);
                               $('#successMessage').html('Data inserted successfully').delay(5000).fadeOut();
                               $('#successMessage').show();
                               $('#cust_name').val("");
                               $('#cust_ph_no').val("");
                                $('#cust_addr').val("");
                               $('#cust_gst_no').val("");
                                $('#state_id').val("");
                               $('#cust_email').val("");
                               $('#Supplier_succ').innerhtml="Data inserted successfully";
//                               data-dismiss="modal";
                           }
                       });
                 
          }

        var i=0;
    function generateTableRow() {
         
//       alert("generateTableRow");
	var emptyColumn = document.createElement('tr');
        
var item =document.getElementById("select_Items").value;
var Iid=item.split("=>")[0];
var name=item.split("=>")[1];
var unit=item.split("=>")[2];
var hsn=item.split("=>")[3];
var rate=0;
        emptyColumn.setAttribute("id",i);
        emptyColumn.setAttribute("onclick",'edit_btn('+i+')');
        emptyColumn.setAttribute("class","row_tr");
	emptyColumn.innerHTML = '<td><a class="cut" onclick="cuting(this);">-</a><span ></span></td>' +
		'<td style="background: #efefef;"><span>'+Iid+'</span></td>' +
		'<td style="background: #efefef;"><span >'+name+'</span></td>' +
		'<td style="background: #efefef;"><span >'+hsn+'</span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span ></span></td>' +
                
                '<td ><span ></span></td>' +
                '<td ><span >'+unit+'</span></td>' +
                '<td ><span ></span></td>' +
                
                '<td ><span >'+unit+'</span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span >'+unit+'</span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span >'+unit+'</span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span >'+unit+'</span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span ></span></td>' +
                
                '<td ><span >Receipt</span></td>' +
                '<td ><span >Quality Inspection</span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span >Standard</span></td>' +
                
                '<td ><span >Set Automatically</span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span class="id"></span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span ></span></td>' +
        
                '<td ><span ></span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span ></span></td>' +
                '<td ><span ></span></td>' +
                
                '<td ><span ></span></td>' ;

//	return emptyColumn;
        i++;
       document.getElementById("select_Items").value="";
       document.querySelector('table.inventory tbody').appendChild(emptyColumn);
}



//     var j=0;
    function Add_table_row(){
       
        var id =  Number($('.inventory tr:last').attr('id'))+1;
//         alert("in >"+id);
	var emptyColumn = document.createElement('tr');
//var item =document.getElementById("item").value;
//var item =document.getElementById("itemA").value;
//var Iid=item.split("/")[0];
//var name=item.split("/")[1];
//var unit=item.split("/")[2];
        emptyColumn.setAttribute("id",id);
        emptyColumn.setAttribute("onclick",'edit_btn('+id+')');
	emptyColumn.innerHTML = '<td><a class="cut" onclick="cuting(this);">-</a><span ></span></td>' +
		'<td style="background: #efefef;"><span>'+$("#Iid").val()+'</span></td>' +
                '<td style="background: #efefef;"><span>'+$("#Iname").val()+'</span></td>' +
                '<td style="background: #efefef;"><span>'+$("#HSN").val()+'</span></td>' +
		'<td ><span >'+$("#vender_metrial_no").val()+'</span></td>' +
                '<td ><span >'+$("#MPN_material").val()+'</span></td>' +
                '<td ><span >'+$("#material_grup").val()+'</span></td>' +
                '<td ><span >'+$("#valuation_type").val()+'</span></td>' +
                '<td ><span >'+$("#EAN_in_order_unit").val()+'</span></td>' +
                '<td ><span >'+$("#EAN_check").val()+'</span></td>' +
                
                '<td ><span >'+$("#QTY_in_delivery_note").val()+'</span></td>' +
                '<td ><span >'+$("#QTY_in_delivery_note1").val()+'</span></td>' +
                '<td ><span >'+$("#QTY_in_unit_of_Entry").val()+'</span></td>' +
                
                '<td ><span >'+$("#QTY_in_unit_of_Entry1").val()+'</span></td>' +
                '<td ><span >'+$("#QTY_in_SKU").val()+'</span></td>' +
                '<td ><span >'+$("#QTY_in_SKU1").val()+'</span></td>' +
                '<td ><span >'+$("#QTY_in_short").val()+'</span></td>' +
                '<td ><span >'+$("#QTY_in_short1").val()+'</span></td>' +
                '<td ><span >'+$("#QTY_ordered").val()+'</span></td>' +
                '<td ><span >'+$("#QTY_ordered1").val()+'</span></td>' +
                '<td ><span >'+$("#GR_QTY").val()+'</span></td>' +
                '<td ><span >'+$("#No_containers").val()+'</span></td>' +
                '<td ><span >'+$("#No_containers1").val()+'</span></td>' +
                
                '<td ><span >'+$("#Movement_type").val()+'</span></td>' +
                '<td ><span >'+($("#stock_type").val()!=null ? $("#stock_type").val():'')+'</span></td>' +
                '<td ><span >'+$("#plant").val()+'</span></td>' +
                '<td ><span >'+$("#plant_id").val()+'</span></td>' +
                '<td ><span >'+$("#storage_location").val()+'</span></td>' +
                '<td ><span >'+$("#storage_location_id").val()+'</span></td>' +
                '<td ><span >'+$("#goods_recipient").val()+'</span></td>' +
                '<td ><span >'+$("#unloading_point").val()+'</span></td>' +
                '<td ><span >'+$("#text").val()+'</span></td>' +
                '<td ><span >'+$("#item_category").val()+'</span></td>' +
                
                '<td ><span >'+($("#Del_Completed_Ind").val()!=null ? $("#Del_Completed_Ind").val():'')+'</span></td>' +
                '<td ><span >'+$("#Requistioner").val()+'</span></td>' +
                '<td ><span >'+($("#Cent_enclosed").val()!=null ? $("#Cent_enclosed").val():'')+'</span></td>' +
                '<td ><span >'+$("#Manufacturer_id").val()+'</span></td>' +
                '<td ><span >'+$("#Manufacturer_name").val()+'</span></td>' +
                '<td ><span >'+$("#Manufacturer_adrs").val()+'</span></td>' +
                '<td ><span class="id">'+$("#Batch").val()+'</span></td>' +
                '<td ><span >'+$("#vender_Batch").val()+'</span></td>' +
                '<td ><span >'+$("#Date_of_manufacture").val()+'</span></td>' +
                '<td ><span >'+$("#SLED_BBD").val()+'</span></td>' +
        
                '<td ><span >'+$("#rate").val()+'</span></td>' +
                '<td ><span >'+$("#basic_amt").val()+'</span></td>' +
                '<td ><span >'+$("#gst_code").val()+'</span></td>' +
                '<td ><span >'+$("#gst_per").val()+'</span></td>' +
                '<td ><span >'+$("#gst_amt").val()+'</span></td>' +
                '<td ><span >'+$("#total_amt").val()+'</span></td>' +
                
                '<td ><span >'+$("#retest_date").val()+'</span></td>' ;
                        
        
                
                
                
//                '<td style="background: #efefef;"><span >False/False</span></td>'+
//                '<td ><span ><input type="button" class="btn btn-primary btn-xs btn_edit " data-toggle="modal" data-target="#unit_guard_details"  href="#" onclick="edit_btn('+i+')" value="Edit"></span></td>';
//                '<td style="background: #efefef;"><span contenteditable>0</span></td>'+
//                '<td style="background: #efefef;" onkeyup="calculate_new();"><span contenteditable>0</span></td>'+
//                '<td style="background: #efefef;"><span contenteditable>0</span></td>';

//	return emptyColumn;
//        j++;
//       document.getElementById("item").value="";
       document.querySelector('table.inventory tbody').appendChild(emptyColumn);
       final_total();
}     
  


function cuting(val){
//    alert("The paragraph was clicked.");
    var empTab = document.getElementById('detailsTBL');
    empTab.deleteRow(val.parentNode.parentNode.rowIndex);
//    calculate_table_amt();
    final_total();
  }
function cuting_Date(val){
//    alert("The paragraph was clicked.");
    var empTab = document.getElementById('detailsTBL2');
    empTab.deleteRow(val.parentNode.parentNode.rowIndex);
    
  }
  
  
    
   
    
    
//$(document).ready(function () {

        




$(document).ready(function() 
{ 
        $('#Pid').change(function(){
        var Pid = document.getElementById("Pid").value;
//        var com = document.getElementById("com").value;
//        alert(unit);
        
        $('#desi').find('option').remove().end().append('<option value="whatever">Data</option>').val(' ');

    $.ajax({
        type: "POST",
        url:"unit_designation_Combo",
        data:{
                   Pid:Pid
            },
        dataType:"json",
        success:function(data){
            $.each(data.aaData,function(i,data)
            {
            var div_data='<option value="'+data.text+'">'+data.text+'</option>';
            $(div_data).appendTo('#desi');
             }); 
            }
             
      });
     
    });
});


//$('.cal').keyup(function(){
//            alert("in click");
//            calculate_table_amt();
//});


 function gst_cal(){
       final_total();
   }

//function calculate_table_amt(){
//    var cells, price, a, i;
//           var obj=[];
//           
//           for (var a = document.querySelectorAll('table.inventory tbody tr'), i = 0; a[i]; ++i) {
//		// get inventory row cells
////                alert(i);
//		cells = a[i].querySelectorAll('span:last-child');
////                alert("cell >"+cells[2].innerHTML);
//                var dict={};
//                
//                var qty=cells[2].innerHTML;
//                var rate=cells[4].innerHTML;
//                cells[5].innerHTML=qty*rate;
//            }
//            final_total();
//}

function final_total(){
    var txt_total=0;
    var TCS_tax=0;
//    alert("in final_total");
    var total_qty=0;
    var total = 0;
    var tcsChek = document.getElementById("tcsChek").checked;
    var tax=$('#freight_tax').val().split("=>");
//    alert(tax);
    var Freight=document.getElementById('freight').value;
//    alert(Freight);
    var cells, price, a, i;
           
           for (var a = document.querySelectorAll('table.inventory tbody tr'), i = 0; a[i]; ++i) {
//                alert(i);
		cells = a[i].querySelectorAll('span:last-child');
//                alert("cell >"+cells[2].innerHTML);
                total_qty=total_qty+Number(cells[12].innerHTML);
                total=total+Number(cells[48].innerHTML);
            }
    
    
    txt_total=(Number(Freight)*Number(tax[1]))/100;
     if(tcsChek){
//        TCS_tax=(Number(total)*0.1)/100;
        TCS_tax=((Number(total)+Number(Freight)+Number(txt_total))*0.1)/100;
    }else{
        TCS_tax=0;
    }
//    TCS_tax=((Number(total)+Number(Freight)+Number(txt_total))*0.1)/100;
    var Total_Amount=Number(total)+Number(TCS_tax)+Number(txt_total)+Number(Freight);
    document.getElementById("total").innerHTML=Math.round(total);
    document.getElementById("gst_per_freight").innerHTML=tax[1];
    document.getElementById("gst_amt_freight").innerHTML=Math.round(txt_total);
    document.getElementById("tcs_tax").innerHTML=Math.round(TCS_tax);
    document.getElementById("bill_amt").innerHTML=Math.round(Total_Amount);
}



$(document).ready(function(){
	$(".tabs li a").click(function() {
		
		// Active state for tabs
		$(".tabs li a").removeClass("active");
		$(this).addClass("active");
		
		// Active state for Tabs Content
		$(".tab_content_container > .tab_content_active").removeClass("tab_content_active").fadeOut(200);
		$(this.rel).fadeIn(500).addClass("tab_content_active");
		
	});	

});



function Vmanu_chnge(){
//    alert("12");
    var menu=$("#vmanu").val();
    $("#Manufacturer_id").val(menu.split("/")[0]);
    $("#Manufacturer_name").val(menu.split("/")[1]);
    $("#Manufacturer_adrs").val(menu.split("/")[2]);
}
function  store_chnge(){
    var storage=$("#storage").val();
    $("#storage_location_id").val(storage.split("/")[0]);
    $("#storage_location").val(storage.split("/")[1]);
}

function short_cal() {
    var QTY_in_delivery_note=$("#QTY_in_delivery_note").val();
    var QTY_in_unit_of_Entry=$("#QTY_in_unit_of_Entry").val();
    var unit=$("#QTY_in_unit_of_Entry1").val();
    $("#QTY_in_short").val(Number(QTY_in_delivery_note)-Number(QTY_in_unit_of_Entry));
    $("#QTY_in_short1").val(unit);
    Item_cal();
}

function Item_cal() {
    var qty=$("#QTY_in_unit_of_Entry").val();
    var rate=$("#rate").val();
    var tax=$('#tax').val().split("=>");
    
    var basic=Number(qty)*Number(rate);
    var gst_amt=(Number(basic)*Number(tax[1]))/100;
    var total_amt=basic+gst_amt;
    $("#basic_amt").val(basic);
    $("#gst_code").val(tax[0]);
    $("#gst_per").val(tax[1]);
    $("#gst_amt").val(gst_amt);
    $("#total_amt").val(total_amt);
}

function random_number(){
//    alert("in");
//    $("#Batch").val(Math.floor(Math.random() * 9999999999));
    var max = 0;
    $('.id').each(function()
    {
       $this = parseInt( $(this).text() );
       if ($this > max) max = $this;
    });
//    alert(max);
    $.ajax({
        type: "POST",
        url:"Get_new_BachNO",
        data:{
            max:max
            },
        dataType:"json",
        success:function(data){
            $.each(data.aaData,function(i,data)
            {
//                var Pid=data.sr+"=>"+data.text;
//            var div_data='<option value="'+data.sr+'" style="color:black;">'+data.text+'</option>';
//            $(div_data).appendTo('#Pid');
//                 alert(data.text);
                document.getElementById("Batch").value=data.text;
             }); 
            }
             
      });
}

function vender_chnge(){
    var select_vender=$('#select_vender').val();
    $("#Vname").val(select_vender.split("=>")[1]);
    $("#vender").val(select_vender);
    getVenderManufactures();
}

function company_chnge(){
    var select_company=$('#select_company').val();
    $("#Cname").val(select_company.split("=>")[1]);
    $("#com").val(select_company);
    getGRNID();
}

function getGRNID(){
        var com = document.getElementById("com").value;
        var Cid=com.split("=>")[0];
//        alert(Cid);
//        $('#Pid').find('option').remove().end().append('<option disabled=""  style="color:black;">Data</option>').val(' ');

    $.ajax({
        type: "POST",
        url:"Company_next_GRN_ID_get_COMBO",
        data:{
               Cid:Cid
            },
        dataType:"json",
        success:function(data){
            $.each(data.aaData,function(i,data)
            {
//                var Pid=data.sr+"=>"+data.text;
//            var div_data='<option value="'+data.sr+'" style="color:black;">'+data.text+'</option>';
//            $(div_data).appendTo('#Pid');
            document.getElementById("Gid").value=data.text;
             }); 
            }
             
      });
     
    }
    
    function getVenderManufactures(){
        var vender = document.getElementById("vender").value;
        var Vid=vender.split("=>")[0];
//        alert(Vid);
        $('#vmanu').find('option').remove().end().append('<option value=""  style="color:black;">select Manufacture</option>').val(' ');

    $.ajax({
        type: "POST",
        url:"get_Vender_Manufactures_list_COMBO",
        data:{
               Vid:Vid
            },
        dataType:"json",
        success:function(data){
            $.each(data.aaData,function(i,data)
            {
//                var Pid=data.sr+"=>"+data.text;
            var div_data='<option value="'+data.text+'" style="color:black;">'+data.sr+'</option>';
            $(div_data).appendTo('#vmanu');
//            document.getElementById("Gid").value=data.text;
             }); 
            }
             
      });
     
    }
</script>  
<jsp:include page="templates/footer.html" />