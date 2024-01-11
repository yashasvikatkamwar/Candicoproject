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
<%!ResultSet data,rs;DataService ds1;ArrayList ar;Iterator ity;Object o1=null;String Bid; Double total=0.0; %>



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
        System.out.println("date >>>>" +date);
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

            <!-- Main content -->
            <section class="content lobipanel">
               <div class="row">
                  <div class="col-sm-12">
                     <div class="panel panel-bd lobidrag">
                        <div class="panel-heading" id="pa" style="background-color: #e8f1f3  ; border-bottom: black" >
                           <div class="btn-group" id="buttonexport">
                              <a href="javascript:void(0)">
                                 <h4>BILL</h4>
                              </a>
                           </div>
                        </div>
                        <div class="panel-body" class="row" style="background-color : #ffffff;"> 
                       
                           <div class="btn-group">
                              <div class="buttonexport"> 
                                  <a class="btn btn-add" onclick="history.back()" > Back  </a>  
                              </div>
			</div>   
                            <div class="form-group" style="float: right" hidden="">
                                <select  autocomplete="off"   name="state"   class="form-control" id="state" style="background: gold;">
                                     <option>MS</option>
                                     <option>OMS</option>
                                 </select>
                               </div>

                            <%
                             Bid=request.getParameter("Bid");
                            // String SHOWPid=Pid.split("=>")[1];
                            // Pid=Pid.split("=>")[0];
                             
                            ds1= new DataService();
                           data=ds1.BILL_Details(Bid);
                            if(data.next()){
                            %>
                            <form class="form-horizontal " id="demo-form3"  method="post" >
							      <input type="hidden" name="sr" id="sr" value="<%=Bid%>" >
								  <input type="hidden" name="hid_pur_item" id="hid_pur_item" value="0" >
								  <input type="hidden" name="hid_item_old_unit" id="hid_item_old_unit" value="" >
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
											<label for="date" class="col-sm-2 control-label">Bill ID : <span class="required">*</span></label>
											<div class="col-sm-4">
                                                                                            <% //
//                                                                                                String Bid="1";
//                                                                                                ds1= new DataService();
//                                                                                                rs=ds1.BILL_getID(data.getString("Com_id"));
//                                                                                                 if(rs.next()){Bid= rs.getString(1) != null ? rs.getString(1):"1";}
                                                                                               %>
                                                                                               <input  name="Bid" required type="text" value="<%=data.getString("Bid")%>"  class="form-control" id="Bid" readonly="">
												<span id="err_inv_date" style="color:red;"></span>
											</div>	
                                                                                                
                                                                                        <label for="date" class="col-sm-2 control-label">Bill Date : <span class="required">*</span></label>
											<div class="col-sm-4">
                                                                                            <!--<body onload="addDate();"/>-->
                                                                                            <!--<input   name="posting_date" required type="date"  class="form-control" id="posting_date">-->
                                                                                            <div class="input-group date" data-date-format="dd.mm.yyyy">
                                                                                                <input  type="text" class="form-control" placeholder="dd/mm/yyyy" name="Bill_date" id="Bill_date" value="<%=dateFormateChnge(data.getString("Bill_date"))%>" >
                                                                                                <div class="input-group-addon" >
                                                                                                  <span class="glyphicon glyphicon-th"></span>
                                                                                                </div>
                                                                                            </div>
												<span id="err_inv_date" style="color:red;"></span>
											</div>
                                                                                    </div>
                                                                                <div class="form-group">
                                                                                    <div>
											<label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">GRN ID : <span class="required">*</span></label>
											<div class="col-sm-4">
                                                                                            <input  autocomplete="off" readonly=""  name="Gid" required type="text" value="<%=data.getObject("Gid")%>"  class="form-control" id="Gid">
                                                                                            <!--<span class="small"><a data-toggle="modal" data-target="#adduser" href="jvascript:void(0);">Add new customer</a></span>-->
												<span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
                                                                                    <div>
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">Company : <span class="required">*</span></label>
                                                                                        <div class="col-sm-4">
                                                                                            <input   readonly=""  name="Cname" required type="text" value="<%=data.getObject("Cname")%>"  class="form-control" id="Cname">
                                                                                            <input  readonly=""  name="com" required type="hidden" value="<%=data.getObject("Cid")%>=><%=data.getObject("Cname")%>=><%=data.getObject("CshortN")%>"  class="form-control" id="com">
												<!--<span class="small"><a data-toggle="modal" data-target="#adduser" href="jvascript:void(0);">Add new customer</a></span>-->
												<span id="err_cust_id" style="color:red;"></span>
											</div> 
                                                                                    </div>
                                                                                </div> 
                                                                                 
                                                                                <div class="form-group">   
                                                                                    <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">Vender Code: <span class="required">*</span></label>

											<div class="col-sm-4">
                                                                                            <input  autocomplete="off" readonly=""  name="Vid" required type="text" value="<%=data.getObject("Vid")%>"  class="form-control" id="Vid">
												<!--<span class="small"><a data-toggle="modal" data-target="#adduser" href="jvascript:void(0);">Add new customer</a></span>-->
												<span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">Vender Name: <span class="required">*</span></label>
                                                                                        <div class="col-sm-4">
                                                                                            <input  autocomplete="off" readonly=""  name="Vname" required type="text" value="<%=data.getObject("Vname")%>"  class="form-control" id="Vname">
                                                                                            <!--<input  readonly=""  name="vender" required type="hidden" value="<%=data.getObject("Vid")%>=><%=data.getObject("Vname")%>"  class="form-control" id="vender">-->
												<!--<span class="small"><a data-toggle="modal" data-target="#adduser" href="jvascript:void(0);">Add new customer</a></span>-->
												<span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                </div>
                                                                                
                                                                 
                                                                                <div class="form-group">
                                                                                    <div>
											<label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">Invoice NO:</label>
											<div class="col-sm-4">
                                                                                            <input   name="invoice_no"  type="text"   class="form-control" id="invoice_no" value="<%=data.getObject("invoice_no")%>">
												<span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
                                                                                     <div>
											<label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">Invoice Date:</label>
											<div class="col-sm-4">
                                                                                            <div class="input-group date" data-date-format="dd.mm.yyyy">
                                                                                                <input  type="text" class="form-control" placeholder="dd/mm/yyyy" name="invoice_date" id="invoice_date"  value="<%=dateFormateChnge(data.getString("invoice_date"))%>">
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
											<label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">Category:</label>
											<div class="col-sm-4">
                                                                                            <input   name="category"  type="text"   class="form-control" id="category" value="<%=data.getObject("category")%>">
												<span id="err_cust_id" style="color:red;"></span>
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
                                                                        <th>Unit</th>
                                                                        <th>HSN</th>
                                                                        <th>RECD. QTY.</th>
                                                                        <th>Shortage QTY.</th>
                                                                        <th>Amount</th>
                                                                        <th>Excess</th>
                                                                      </tr> 
                                                                    </thead>
                                                                    <%int i=0;
                                                                        ds1= new DataService();
                                                                         rs=ds1.BILL_item_list(Bid); 
                                                                     %>
                                                                    <tbody>
                                                                    <%while(rs.next()){%>
                                                                    <tr id="<%=i%>" onclick="edit_btn(<%=i%>)" class="row_tr">
                                                                                    <td><a class="cut" onclick="cuting(this);">-</a><span ></span></td>
                                                                                    <td style="background: #efefef;"><span><%=rs.getString("Iid")%></span></td>
                                                                                    <td style="background: #efefef;"><span ><%=rs.getString("Iname")%></span></td>
                                                                                    <td><span ><%=rs.getString("unit")%></span></td>
                                                                                    <td><span><%=rs.getString("HSN")%></span></td>
                                                                                    <td><span><%=rs.getString("recd_qty")%></span></td>
                                                                                    <td><span><%=rs.getString("shortage_qty")%></span></td>
                                                                                    <td><span contenteditable=""><%=rs.getString("amt")%></span></td>
                                                                                    <td><span contenteditable=""><%=rs.getString("Excess")%></span></td>
                                                                                    </tr>
                                                                                    <%total=total+rs.getDouble("amt");%>
                                                                                    <%i++; }%> 
                                                                                    </tbody>
                                                                             </table>
									</div>
								</div>
								<br>
								
                                                                                  
                                                              <div class="row" style=" background-color: aliceblue;padding-top: 2%;">
                                                                 
                                                                                          
                                                                  <div class="col-md-6">
                                                                      <div class="form-group">
<!--											<label for="date" class="col-sm-2 control-label">FREIGHT : <span class="required">*</span></label>
											<div class="col-sm-4">
                                                                                            <body onload="addDate();"/>
                                                                                            <input  autocomplete="off"   name="freight"  type="text"  class="form-control" id="freight" onkeyup="final_total()">
                                                                                          <span id="err_inv_date" style="color:red;"></span>
											</div>												-->
											
											<label for="month" class="col-sm-4 control-label">GST : <span class="required">*</span></label>
											
											<div class="col-sm-8">
												<%
                                                                                                            ds1= new DataService();
                                                                                                            rs=ds1.Tax_list();
                                                                                                           %>
                                                                                                           <select name="tax" id="tax" class="select2 select2_single form-control" onchange="final_total()" >
                                                                                           <!--<optgroup label="select tax">-->
                                                                                           <option value="<%=data.getObject("gst_code")%>=><%=data.getObject("gst_per")%>"><%=data.getObject("gst_code")%></option>
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
                                                                  </div>
                                                                <div class="col-md-6">
											<div class="col-sm-12">
												<dl class="dl-horizontal">
												  <dt>Total:</dt>
												  <dd>
                                                                                                      &#8377; <span  name="total" id="total" contenteditable=""><%=data.getObject("total")%></span><br>
                                                                                                   </dd>
												</dl>
<!--                                                                                            <dl class="dl-horizontal">
												  <dt>FREIGHT GST amount:</dt>
												  <dd>
                                                                                                      &#8377; <span  name="GST/IGST" id="gst_amt_freight" >0.00</span><br>
                                                                                                      <span  name="gst_per_freight" id="gst_per_freight" hidden="">0.00</span>
                                                                                                   </dd>
												</dl>-->
<!--                                                                                            <dl class="dl-horizontal">
                                                                                                <dt><input class=" other_charge " id="tcsChek" type="checkbox" name="tcsChek" onclick="final_total();" checked=""> TCS (0.10%):</dt>
												  <dd>
                                                                                                      &#8377; <span  name="tcs_tax" id="tcs_tax" >0.00</span><br>
                                                                                                   </dd>
												</dl>-->
                                                                                            <dl class="dl-horizontal">
												  <dt>GST amount:</dt>
												  <dd>
                                                                                                      &#8377; <span  name="gst_amt" id="gst_amt" ><%=data.getObject("gst_amt")%></span><br>
                                                                                                      <span  name="gst_per" id="gst_per" hidden=""><%=data.getObject("gst_per")%></span>
                                                                                                      <span  name="gst_code" id="gst_code" hidden=""><%=data.getObject("gst_code")%></span>
                                                                                                      
                                                                                                   </dd>
                                                                                            </dl>
                                                                                            <dl class="dl-horizontal">
												  <dt>Bill amount:</dt>
												  <dd>
                                                                                                      &#8377; <span  name="bill_amt" id="bill_amt" contenteditable=""><%=data.getObject("bill_amt")%></span><br>
                                                                                                   </dd>
												</dl>
                                                                                            
                                                                                            <dl class="dl-horizontal">
												  <dt>Local Freight:</dt>
												  <dd>
                                                                                                      &#8377; <span  name="fright" id="fright" contenteditable="" onkeyup="final_total()" ><%=data.getObject("fright")%></span><br>
                                                                                                   </dd>
                                                                                            </dl>
                                                                                            
                                                                                            <dl class="dl-horizontal">
												  <dt>Other Expenses:</dt>
												  <dd>
                                                                                                      &#8377; <span  name="other_expences" id="other_expences" contenteditable="" onkeyup="final_total()"><%=data.getObject("other_expences")%></span><br>
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
                
                  //alert('payroll');
              $('.select2').select2();
 $('form#demo-form3').submit(function () {
     
             var sr= document.getElementById("sr").value;
                   var Bid  = $(this).find("[name='Bid']").val();
                   var Bill_date  = $(this).find("[name='Bill_date']").val();
                   var Gid  = $(this).find("[name='Gid']").val();
                   var invoice_no = $(this).find("[name='invoice_no']").val();
                   var invoice_date  = $(this).find("[name='invoice_date']").val();
                   var Vid= document.getElementById("Vid").value;
                   var Vname= document.getElementById("Vname").value;
                  var com= document.getElementById("com").value;
                  var category= document.getElementById("category").value;
                 var total= document.getElementById("total").innerHTML;
                 var gst_per= document.getElementById("gst_per").innerHTML;
                 var gst_code= document.getElementById("gst_code").innerHTML;
                 var gst_amt= document.getElementById("gst_amt").innerHTML;
//                 var tcs_tax= document.getElementById("tcs_tax").innerHTML;
                 var bill_amt= document.getElementById("bill_amt").innerHTML;
                 var fright= document.getElementById("fright").innerHTML;
                 var other_expences= document.getElementById("other_expences").innerHTML;
                 var state= document.getElementById("state").value;

               if(Bid!=""){
//               alert("in if->");
                var cells, price, a, i;
           var obj=[];
           for (var a = document.querySelectorAll('table.inventory tbody tr'), i = 0; a[i]; ++i) {
		// get inventory row cells
		cells = a[i].querySelectorAll('span:last-child');
                var dict={};
                dict["Iid"]=cells[1].innerHTML;
                dict["Iname"]=cells[2].innerHTML;
                dict["unit"]=cells[3].innerHTML;
                dict["HSN"]=cells[4].innerHTML;
                dict["recd_qty"]=cells[5].innerHTML;
                dict["shortage_qty"]=cells[6].innerHTML;
                dict["amt"]=cells[7].innerHTML;
                dict["Excess"]=cells[8].innerHTML;
                
//                alert(cells[5].innerHTML);
                obj.push(dict);
//                alert(JSON.stringify(obj));
            }
           $("#spinner").show();
              $.ajax({
                    type:"POST",
                     url:"BILL_Edit",
                           data:{ 
                               status:"edit",
                               sr:sr,
                             Bid:Bid,
                             Bill_date:Bill_date,
                             Gid:Gid,
                             com:com,
                             invoice_no:invoice_no,
                             invoice_date:invoice_date,
                             Vname:Vname,
                             Vid:Vid,
                             category:category,
                             total:total,
                             gst_per:gst_per,
                             gst_code:gst_code,
                             gst_amt:gst_amt,
                             fright:fright,
                             bill_amt:bill_amt, 
                             other_expences:other_expences,
                             state:state,
                             obj:JSON.stringify(obj)
                            },
                          success:function(data){
//                               alert(data);
                               $('#successMessage').html('Data inserted successfully').delay(5000);
                               $('#successMessage').show();
                               $("#spinner").hide();
                               alert("Data inserted successfully");
//                                location.reload();
                                location.href="index.jsp";
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
//                alert("aa >"+aa.length);
//                alert("aa >>>"+aa[9].innerHTML);
//                var desi = document.getElementById("desi").value;
////                alert("desi"+desi);
//                
//                var P_day = document.getElementById("P_day").value;
//                var A_day = document.getElementById("A_day").value;
//                var O_day = document.getElementById("O_day").value;
//                var H_day = document.getElementById("H_day").value;
//                var R_day = document.getElementById("R_day").value;
//                alert("P_day>>"+P_day);
//                var x = document.getElementById("stock").checked;
//                var y = document.getElementById("loan").checked;
//                var emi=x+"/"+y;
                
                
                
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
        
//        var type;
//        var pro_per;
var item =document.getElementById("item").value;
var Iid=item.split("/")[0];
var name=item.split("/")[1];
var unit=item.split("/")[2];
var rate=0;
        emptyColumn.setAttribute("id","E"+i);
	emptyColumn.innerHTML = '<td><a class="cut" onclick="cuting(this);">-</a><span ></span></td>' +
		'<td style="background: #efefef;"><span contenteditable>'+name+'</span></td>' +
		'<td ><span contenteditable onkeyup="calculate_table_amt()">0</span></td>' +
		'<td ><span >'+unit+'</span></td>' +
                '<td ><span contenteditable onkeyup="calculate_table_amt()">'+rate+'</span></td>' +
		'<td style="background: #efefef;""><span >0</span></td>'+
//                '<td style="background: #efefef;"><span >0</span></td>'+
//                '<td style="background: #efefef;"><span >0</span></td>'+
//                '<td style="background: #efefef;"><span >0</span></td>'+
//                '<td style="background: #efefef;"><span >0</span></td>'+
                '<td class="hidden"><span >'+Iid+'</span></td>';
//                '<td style="background: #efefef;"><span >False/False</span></td>'+
//                '<td ><span ><input type="button" class="btn btn-primary btn-xs btn_edit " data-toggle="modal" data-target="#unit_guard_details"  href="#" onclick="edit_btn('+i+')" value="Edit"></span></td>';
//                '<td style="background: #efefef;"><span contenteditable>0</span></td>'+
//                '<td style="background: #efefef;" onkeyup="calculate_new();"><span contenteditable>0</span></td>'+
//                '<td style="background: #efefef;"><span contenteditable>0</span></td>';

//	return emptyColumn;
        i++;
       document.getElementById("item").value="";
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
                '<td ><span >'+$("#Batch").val()+'</span></td>' +
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
//    var TCS_tax=0;
//    alert("in final_total");
//    var total_qty=0;
    var total = 0;
    
    var tax=$('#tax').val().split("=>");
//    alert(tax);
    var fright=document.getElementById('fright').innerHTML;
    var other_expences=document.getElementById('other_expences').innerHTML;
//    alert(Freight);
    var cells, price, a, i;
           
           for (var a = document.querySelectorAll('table.inventory tbody tr'), i = 0; a[i]; ++i) {
//                alert(i);
		cells = a[i].querySelectorAll('span:last-child');
//                alert("cell >"+cells[2].innerHTML);
//                total_qty=total_qty+Number(cells[12].innerHTML);
                total=total+Number(cells[7].innerHTML);
            }
    
    
    txt_total=(Number(total)*Number(tax[1]))/100;
//    TCS_tax=((Number(total)+Number(Freight)+Number(txt_total))*0.1)/100;
    var Total_Amount=Number(total)+Number(other_expences)+Number(txt_total)+Number(fright);
    document.getElementById("total").innerHTML=Math.round(total);
    document.getElementById("gst_per").innerHTML=tax[1];
    document.getElementById("gst_code").innerHTML=tax[0];
    document.getElementById("gst_amt").innerHTML=Math.round(txt_total);
//    document.getElementById("tcs_tax").innerHTML=Math.round(TCS_tax);
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
            },
        dataType:"json",
        success:function(data){
            $.each(data.aaData,function(i,data)
            {
//                var Pid=data.sr+"=>"+data.text;
//            var div_data='<option value="'+data.sr+'" style="color:black;">'+data.text+'</option>';
//            $(div_data).appendTo('#Pid');
                
                    document.getElementById("Batch").value=data.text;
               
             }); 
            }
             
      });
}
</script>
<jsp:include page="templates/footer.html" />