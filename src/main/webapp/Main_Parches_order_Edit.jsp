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
<%!ResultSet rs,data,data1;DataService ds1;ArrayList ar;Iterator ity;Object o1=null; %>
<%! 
DataService sr1;int x;Object aval,bval;ResultSetMetaData rsmd;
String Vname,Vadrs,Vgst;
%>



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

</style> 

  <%
//                        String a= request.getParameter("a");
                        String Pid= request.getParameter("Pid");
                       System.out.println("Pid >"+Pid);
   
    sr1=new DataService();
//  String Pid=request.getParameter("Pid");
    //int year=Integer.parseInt(request.getParameter("year".trim()));
    //int month=Integer.parseInt(request.getParameter("month".trim()));
 
   data=sr1.PO_details(Pid); 
if(data.next()){
%>



   <div class="right_col" role="main">
        <div class="">

<div class="content-wrapper">
            <!-- Content Header (Page header) -->
<!--            <section class="content-header">
               <div class="header-icon">
                  <i class="fa fa-sticky-note-o"></i>
               </div>
               <div class="header-title">
                  <h1>Edit Purchase Order Register</h1>
                  <br>
               </div>
            </section>-->

            <!-- Main content -->
            <section class="content lobipanel">
               <div class="row">
                  <div class="col-sm-12">
                     <div class="panel panel-bd lobidrag">
                        <div class="panel-heading" id="pa" style="background-color: #e8f1f3  ; border-bottom: black" >
                           <div class="btn-group" id="buttonexport">
                              <a href="javascript:void(0)">
                                 <h4>Edit Purchase Order Register</h4>
                              </a>
                           </div>
                        </div>
                        <div class="panel-body" class="row" style="background-color : #ffffff;"> 
                       
                           <div class="btn-group">
                              <div class="buttonexport"> 
                                  <a class="btn btn-add" onclick="history.back()" > Back </a>  
                              </div>
				</div>   
                       <div class="form-group" style="float: right">
                            <select  autocomplete="off"   name="state"   class="form-control" id="state" style="background: gold;">
                             <option><%=data.getString("state")%></option>
                             <option>MS</option>
                             <option>OMS</option>
                            </select>
                        </div> 
                            <form class="form-horizontal " id="demo-form3"  method="post" >
							      <input type="hidden" name="hid_item" id="hid_item" value="" >
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
//                                                                                        String st=request.getParameter("Invoice_No");
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
											<label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">Company : <span class="required">*</span></label>
											<div class="col-sm-4">
                                                                                                    
                                                                                            <%
                                                                                                ds1= new DataService();
                                                                                                rs=ds1.Company_list();
                                                                                               %>
                                                                                            <select name="com" id="com" readonly class="form-control select2">
                                                                                              <optgroup label="">
                                                                                              <option value="<%=data.getString("Com_id")%>=><%=data.getString("Com_name")%>=><%=data.getString("Com_short_name")%>"><%=data.getString("Com_name")%></option>
<!--                                                                                                            <%
                                                                                                             while(rs.next()){
                                                                                                              Object ven= rs.getString(1)+"=>"+rs.getString(3)+"=>"+rs.getString(5);
                                                                                                              Object ven2= rs.getString(3);
                                                                                                            %>
                                                                                                <option value="<%=ven%>"><%=ven2%></option>
                                                                                                              <% }%> -->
                                                                                                </optgroup>
                                                                                            </select>
												<!--<span class="small"><a data-toggle="modal" data-target="#adduser" href="jvascript:void(0);">Add new customer</a></span>-->
												<span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                
											<label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">PO ID : <span class="required">*</span></label>
											<div class="col-sm-4">
                                                                                            <%
//                                                                                                String Pid="1";
//                                                                                                ds1= new DataService();
//                                                                                                rs=ds1.PO_getID();
//                                                                                                 if(rs.next()){Pid=rs.getString(1);}
                                                                                               %>
                                                                                               <input  autocomplete="off"   name="Pid" readonly="" required type="number" value="<%=Pid%>"  class="form-control" id="Pid" style="display: none">
                                                                                                <input  autocomplete="off"  name="CPid" readonly=""required type="number" value="<%=data.getString("com_vise_PO_no")%>"  class="form-control" id="CPid">
                                                                                            <span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                 </div>           
										<div class="form-group">
											<label for="date" class="col-sm-2 control-label">Date : <span class="required">*</span></label>
											<div class="col-sm-4">
                                                                                            <!--<body onload="addDate();"/>-->
                                                                                            <!--<input  autocomplete="off"   name="Date" required type="date"  class="form-control" id="Date" value="<%=data.getString("datee")%>">-->
                                                                                             <%String ab1=data.getString("datee");
                                                                                                String date2[]=ab1.split("-");
                                                                                                String datee=date2[2]+"/"+date2[1]+"/"+date2[0];
                                                                                                %>
                                                                                            <div class="input-group date" data-date-format="dd/mm/yyyy">
                                                                                                <input  type="text" class="form-control" placeholder="dd/mm/yyyy" name="Date" id="Date" value="<%=datee%>" required>
                                                                                                <div class="input-group-addon" >
                                                                                                  <span class="glyphicon glyphicon-th"></span>
                                                                                                </div>
                                                                                            </div>
												<span id="err_inv_date" style="color:red;"></span>
											</div>												
											
											<label for="month" class="col-sm-2 control-label">GST : <span class="required">*</span></label>
											
											<div class="col-sm-4">
												<%
                                                                                                            ds1= new DataService();
                                                                                                            rs=ds1.Tax_list();
                                                                                                           %>
                                                                                                           <select name="tax" id="tax" class="select2 select2_single form-control" onchange="gst_cal()" >
                                                                                           <!--<optgroup label="select tax">-->
                                                                                           <option value="<%=data.getString("gst_name")%>=><%=data.getString("gst_per")%>"><%=data.getString("gst_name")%></option>
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

										<div class="form-group">
											<label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">Vender : <span class="required">*</span></label>
											<div class="col-sm-4">
                                                                                                    
                                                                                            <%
                                                                                                ds1= new DataService();
                                                                                                rs=ds1.Vender_list();
                                                                                               %>
                                                                                            <select name="vender" id="vender" class="form-control select2">
                                                                                              <optgroup label="">
                                                                                              <option value="<%=data.getString("vid")%>=><%=data.getString("Vname")%>"><%=data.getString("Vname")%></option>
                                                                                                            <%
                                                                                                             while(rs.next()){
                                                                                                              Object ven= rs.getString(1)+"=>"+rs.getString(2);
                                                                                                              Object ven2= rs.getString(2);
                                                                                                            %>
                                                                                                <option value="<%=ven%>"><%=ven2%></option>
                                                                                                              <% }%> 
                                                                                                </optgroup>
                                                                                            </select>
												<!--<span class="small"><a data-toggle="modal" data-target="#adduser" href="jvascript:void(0);">Add new customer</a></span>-->
												<span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                                
                                                                                        <label for="item_unit_id" class="col-sm-2 control-label">Items :</label>
											<div class="col-sm-4">
												<%
                                                                                                            ds1= new DataService();
                                                                                                            rs=ds1.Item_Master_list();
                                                                                                           %>
                                                                                                           <select name="item" id="item" class="select2 select2_single form-control" onchange="generateTableRow();" >
                                                                                           <optgroup label="select Item">
                                                                                           <option value="">-- Select --</option>
                                                                                                         <%
                                                                                                          while(rs.next()){
                                                                                                              String o=rs.getObject(1)+"=>"+rs.getObject(2)+"=>"+rs.getObject(3)+"=>"+rs.getObject(4);
                                                                                                              Object f=rs.getObject(2);
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

								<div class="row">	
								<div class="col-md-12" style="height:400px;overflow-x:scroll;overflow-y:scroll">
                                                                    
                                                                   <table class="inner-table-2 inventory" id="detailsTBL" >
                                                                    <thead>
                                                                        <tr>
                                                                        <th >-</th>
                                                                        <th  style=" width: 21%;text-align: center">Item name</th>
                                                                        <th>QTY</th>
                                                                        <th>unit</th>
                                                                        <th>Rate</th>
                                                                        <th>Amt. In Rs.</th>
                                                                        <th style="display: none">Iid</th>
                                                                        <th style="display: none">HSN</th>
                                                                      </tr> 
                                                                    </thead>
                                                                     <%  sr1=new DataService();
                                                                   data1=sr1.PO_items(Pid); 
                                                                        %>
                                                                    <tbody><%
                                                                 int j=1;
                                                                while(data1.next()){%>
                                                                 <tr>
                                                                    <td><a class="cut" onclick="cuting(this);">-</a><span ></span></td>
                                                                    <td style="background: #efefef;"><span contenteditable><%=data1.getString("Item_name")%></span></td>
                                                                    <td ><span contenteditable onkeyup="calculate_table_amt()"><%=data1.getString("qty")%></span></td>
                                                                    <td ><span ><%=data1.getString("unit")%></span></td>
                                                                    <td ><span contenteditable onkeyup="calculate_table_amt()"><%=data1.getString("rate")%></span></td>
                                                                    <td style="background: #efefef;""><span ><%=data1.getString("amt")%></span></td>
                                                                    <td class="hidden"><span ><%=data1.getString("Iid")%></span></td>
                                                                    <td class="hidden"><span ><%=data1.getString("HSN")%></span></td>      
                                                                 </tr>
                                                                <%}%>
                                                                    </tbody>
<!--                                                                                <tr>
                                                                                    <td></td>
                                                                                    <td></td>
                                                                                    <td></td>
                                                                                    <td></td>
                                                                                    <td></td>
                                                                                    <td></td>
                                                                                    <td></td>
                                                                                    <td></td>
                                                                                    <td></td>
                                                                                    <td></td>
                                                                                    <td></td>
                                                                                    </tr>-->
                                                                             </table>
									</div>
								</div>
								<br>
								
                                                                
                                                                	<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="inv_remark" class="col-sm-4 control-label">Remark : </label>
											<div class="col-sm-8">
												<textarea name="remark" value="" class="form-control" placeholder="" id="remark"><%=data.getString("remark")%></textarea>
												<span id="err_inv_remark" style="color:red;"></span>
											</div>
										</div>

<!--										<div class="form-group">
											<div class="col-sm-12">
												<label  class="radio-inline"><input class=" other_charge " id="Other_Charges" type="checkbox" name="Other_Charges" onclick="myFunction();">  Other Charge</label>
												<span id="" style="color:red;"></span>
											</div>
										</div>-->

<!--										<div class="form-group" id="other_charge_div" style="display :none">
											<label for="oth_chrges_lbl" class="col-sm-2 control-label">Label : </label>
											<div class="col-sm-4">
												<input  autocomplete="off"   name="oth_chrges_lbl"  type="text" value="" class="form-control" placeholder="Other Charges Label" id="oth_chrges_lbl">
												<span id="err_item_name" style="color:red;"></span>
											</div>
											<label for="oth_chrges_val" class="col-sm-2 control-label">Value: </label>
											<div class="col-sm-4">
												<input  autocomplete="off" placeholder="Other Charges Value"  name="oth_chrges_val"  type="text" class="form-control"  id="oth_chrges_val">
												<span id="err_item_name" style="color:red;"></span>
											</div>
										</div>-->
									</div>
									
									<div class="col-md-6">
										
											<div class="col-sm-12">
												<dl class="dl-horizontal">
												  <dt>Total:</dt>
												  <dd>
                                                                                                      &#8377; <span  name="tot" id="tot" ><%=data.getString("total_amt")%></span><br>
                                                                                                   </dd>
												</dl>
                                                                                                   <dl class="dl-horizontal">
												  <dt>Freight/Packing:</dt>
												  <dd>
                                                                                                      &#8377; <span  name="Total_Freight" id="Total_Freight" contenteditable="" onkeyup="final_total()"><%=data.getString("packing_charg")%></span><br>
                                                                                                   </dd>
                                                                                            </dl>
                                                                                            <dl class="dl-horizontal">
												  <dt>GST amount:</dt>
												  <dd>
                                                                                                      &#8377; <span  name="GST/IGST" id="gst_tot" ><%=data.getString("gst_amt")%></span><br>
                                                                                                   </dd>
												</dl>
                                                                                            <dl class="dl-horizontal">
                                                                                                <dt><input class=" other_charge " id="tcsChek" type="checkbox" name="tcsChek" onclick="final_total();" <%=data.getString("tcs_amt").equals("0") ? "" : "checked"%> > TCS (0.10%):</dt>
												  <dd>
                                                                                                      &#8377; <span  name="TCS_tax" id="TCS_tax" ><%=data.getString("tcs_amt")%></span><br>
                                                                                                   </dd>
												</dl>
                                                                                            
                                                                                      
                                                                                            
                                                                                            
                                                                                            <dl class="dl-horizontal">
												  <dt>Total amount:</dt>
												  <dd>
                                                                                                      &#8377; <span  name="Total_Amount" id="Total_Amount" ><%=data.getString("final_total")%></span><br>
                                                                                                   </dd>
												</dl>
											</div>
									

										<div class="col-sm-12">
											<dl class="dl-horizontal">
												  <dt>Total Quantity : </dt>
												  <dd>
												  <input name="hid_total_quantity" type="hidden" id="hid_total_quantity">
												  <span class="" id="Total_Quantity" name="Total_Quantity"><%=data.getString("qty")%></span>
												  </dd>
											</dl>
										</div>
									</div>

								</div>					
								
								<div class="row">
                                                                    <div class="col-sm-3">
                                                                            <%
                                                                                        ds1= new DataService();
                                                                                        rs=ds1.Item_Master_list();
                                                                                       %>
                                                                             <select name="itemA" id="itemA" class="select2 form-control form-inline"  >
                                                                                   <optgroup label="select Item">
                                                                                   <option value="">-- Select --</option>
                                                                                                 <%
                                                                                                  while(rs.next()){
                                                                                                      String o=rs.getObject(1)+"=>"+rs.getObject(2)+"=>"+rs.getObject(3);
                                                                                                      Object f=rs.getObject(2);
                                                                                                 %>
                                                                                        <option value="<%=o%>"><%=f%></option>
                                                                                                   <%}%> 
                                                                                      </optgroup>
                                                                              </select>
                                                                    </div>
                                                                    <input type="date" name="Adate" id="Adate"class="form-inline">
                                                                    <input type="button" value="Add Date" class="btn-info btn" onclick="generateTableRow_Date()">
                                                                    <input type="button" value="Copy" class="btn-warning btn" onclick="Copy_table()" style="float: right">
								<div class="col-md-12" style="height:400px;overflow-x:scroll;overflow-y:scroll">
                                                                    
                                                                   <table class="inner-table-2 inventory2" id="detailsTBL2" >
                                                                    <thead>
                                                                        <tr>
                                                                        <th >-</th>
                                                                        <th  style=" width: 21%;text-align: center">Item name</th>
                                                                        <th>QTY</th>
                                                                        <th>Schedule QTY</th>
                                                                        <th>Arrival_Date (DD-MM-YYYY)</th>
                                                                        <th></th>
                                                                        <th>Remark</th>
                                                                      </tr>     
                                                                    </thead>
                                                                     <%
                                                                         sr1=new DataService();
                                                                       data1=sr1.PO_items_Arraival(Pid); 
                                                                            %>
                                                                    <tbody>
                                                                        <%
                                                                     int jj=1;
                                                                    while(data1.next()){%>
                                                                    <tr>
                                                                    <td><a class="cut" onclick="cuting_Date(this);">-</a><span ></span></td>
                                                                    <td style="background: #efefef;"><span contenteditable><%=data1.getString("item_name")%></span></td>
                                                                    <td ><span contenteditable><%=data1.getString("item_qty_total")%></span></td>
                                                                    <td ><span contenteditable><%=data1.getString("qty")%></span></td>
                                                                    <%String ab=data1.getString("Arrival_date");
                                                                        String date1[]=ab.split("-");
                                                                        %>
                                                                    <td style="background: #efefef;"><span contenteditable><%=date1[2]+"-"+date1[1]+"-"+date1[0]%></span></td>
                                                                    <td ><span ></span></td>
                                                                    <td><span contenteditable><%=data1.getString("remark")%></span></td>
                                                                    </tr>
                                                                    <%}%>
                                                                    </tbody>
<!--                                                                                <tr>
                                                                                    <td></td>
                                                                                    <td></td>
                                                                                    <td></td>
                                                                                    <td></td>
                                                                                    <td></td>
                                                                                    <td></td>
                                                                                    <td></td>
                                                                                    <td></td>
                                                                                    <td></td>
                                                                                    <td></td>
                                                                                    <td></td>
                                                                                    </tr>-->
                                                                             </table>
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
  
<%}%>                                                                                    
                                                                                              
                                                                                              
      
        
         <script>
           $(document).ready(function () {
                  //alert('payroll');
              $('.select2').select2();
 $('form#demo-form3').submit(function () {
     
             var Pid  = $(this).find("[name='Pid']").val();
             var CPid  = $(this).find("[name='CPid']").val();
                   var Date  = $(this).find("[name='Date']").val();
//                    alert("Invoice_Date->"+Invoice_Date);
                       
                    
                    var vender  = $(this).find("[name='vender']").val();
//                 alert("Customer->"+Customer);
                       var com  = $(this).find("[name='com']").val();
                       
                    var tax  = $(this).find("[name='tax']").val();
//                   alert("Board_Type->"+Board_Type);remark
                  var remark  = $(this).find("[name='remark']").val();
                
                  var tot= document.getElementById("tot").innerHTML;
                  var gst_amt= document.getElementById("gst_tot").innerHTML;
                  var TCS_tax= document.getElementById("TCS_tax").innerHTML;
                  var Total_Freight= document.getElementById("Total_Freight").innerHTML;
                  var final_total= document.getElementById("Total_Amount").innerHTML;
                  var Total_Quantity= document.getElementById("Total_Quantity").innerHTML;
                 
                 var state= document.getElementById("state").value;
                 
               if(vender !="" && final_total !="0"){
               
                var cells, price, a, i;
           var obj=[];
           for (var a = document.querySelectorAll('table.inventory tbody tr'), i = 0; a[i]; ++i) {
		// get inventory row cells
		cells = a[i].querySelectorAll('span:last-child');
                var dict={};
                dict["item_name"]=cells[1].innerHTML;
                dict["qty"]=cells[2].innerHTML;
                dict["unit"]=cells[3].innerHTML;
                dict["rate"]=cells[4].innerHTML;
                dict["amt"]=cells[5].innerHTML;
                dict["Iid"]=cells[6].innerHTML;
                dict["hsn"]=cells[7].innerHTML;
//                alert(cells[5].innerHTML);
                obj.push(dict);
//                alert(JSON.stringify(obj));
            }
            var objA=[];
           for (var a = document.querySelectorAll('table.inventory2 tbody tr'), i = 0; a[i]; ++i) {
		// get inventory row cells
		cells = a[i].querySelectorAll('span:last-child');
//                var dict={};
//                dict["item_name"]=cells[1].innerHTML;
////                dict["qty"]=cells[3].innerHTML;
////                dict["Adate"]=cells[4].innerHTML;
//                dict["a"]=cells[5].innerHTML;
//                dict["remarks"]=cells[6].innerHTML;
                
                var qtys=cells[3].innerHTML.split("<br>");
                var Adates=cells[4].innerHTML.split("<br>");
                for(var j = 0; j < qtys.length; j++) {
                    var dict={};
//                    alert("qtys >"+ qtys[j]);
                    if(qtys[j]!=""){
                        dict["qty"]=qtys[j];
                            if(Adates[j]!=""){
                               dict["Adate"]=Adates[j];
                             } else{
                                 alert("Shedule date Not Set");
                                  return false;
                             } 
                             
                        dict["item_name"]=cells[1].innerHTML;
                        dict["item_qty_total"]=cells[2].innerHTML;
                        dict["a"]=cells[5].innerHTML;
                        dict["remarks"]=cells[6].innerHTML;    
                        objA.push(dict);
                    }
                }
//                alert("qtys >"+ qtys[0])
//                objA.push(dict);
//                alert(JSON.stringify(objA));
            }
           $("#spinner").show();
              $.ajax({
                    type:"POST",
                     url:"Purches_Order_insert",
                           data:{ 
                               CPid:CPid,
                          Pid:Pid,
                          Date:Date,
                          vender:vender,
                          com:com,
                          tax:tax,
                          tot:tot,
                          gst_amt:gst_amt,
                          TCS_tax:TCS_tax,
                          Total_Freight:Total_Freight,
                          final_total:final_total,
                          Total_Quantity:Total_Quantity,
                          remark:remark,
                          state:state,
                            obj:JSON.stringify(obj),
                             objA:JSON.stringify(objA)
                            },
                          success:function(data){
//                               alert(data);
                               $('#successMessage').html(data).delay(5000);
                               $('#successMessage').show();
                               $("#spinner").hide();
                               alert(data);
//                                location.reload();
                                location.href="Main_Parches_order_form.jsp";
                         
                           }
                       });
                 
                      
                   }
                   else{
                       alert("plase fill required fillds");
                   }
                    return false;
                   });
               });
         
              
              
           function  edit_btn(id){
//                 alert("in edit >"+id);
//                var tr_id = this.id;
                var tr_id ="E"+id;
                var tr = document.getElementById(tr_id);
//                alert("tr >"+tr);
//                var td = tr.getElementsByTagName("td");
                
                var aa= tr.querySelectorAll("span");
//                alert("aa >"+aa.length);
//                alert("aa >>>"+aa[9].innerHTML);
                
                var Eid=aa[1].innerHTML;
                var atnds=aa[10].innerHTML;
                var day=atnds.split("-");
//                var emi=aa[11].innerHTML.split("/");
  
//                    alert("td >"+td.);
//                    var a = document.querySelectorAll('table.inventory tbody tr');
//                    var cells = a[id].querySelectorAll('span:last-child');
                    
//                   alert("token >"+td[1].innerHTML);
//                   $("#token").val(td[1].innerHTML);
                   
                   $("#token").val(Eid);
                   $("#row_id").val(tr_id);
                   
                   $("#O_day").val(aa[6].innerHTML);
                   $("#H_day").val(aa[9].innerHTML);
                   $("#P_day").val(aa[5].innerHTML);
                   $("#A_day").val(aa[7].innerHTML);
                   $("#R_day").val(aa[8].innerHTML);
                   
                   $("#desi").val(aa[3].innerHTML);
//                    alert(emi[0]);
//                    alert(emi[1]);
//                   document.getElementById("stock").checked = (emi[0]=='true');
//                   document.getElementById("loan").checked = (emi[1]=='true');
                   
                   $("#day1").val(day[0]);
                   $("#day2").val(day[1]);
                   $("#day3").val(day[2]);
                   $("#day4").val(day[3]);
                   $("#day5").val(day[4]);
                   
                   $("#day6").val(day[5]);
                   $("#day7").val(day[6]);
                   $("#day8").val(day[7]);
                   $("#day9").val(day[8]);
                   $("#day10").val(day[9]);
                   
                   $("#day11").val(day[10]);
                   $("#day12").val(day[11]);
                   $("#day13").val(day[12]);
                   $("#day14").val(day[13]);
                   $("#day15").val(day[14]);
                   
                   $("#day16").val(day[15]);
                   $("#day17").val(day[16]);
                   $("#day18").val(day[17]);
                   $("#day19").val(day[18]);
                   $("#day20").val(day[19]);
                   
                   $("#day21").val(day[20]);
                   $("#day22").val(day[21]);
                   $("#day23").val(day[22]);
                   $("#day24").val(day[23]);
                   $("#day25").val(day[24]);
                   
                   $("#day26").val(day[25]);
                   $("#day27").val(day[26]);
                   $("#day28").val(day[27]);
                   $("#day29").val(day[28]);
                   $("#day30").val(day[29]);
                   
                   $("#day31").val(day[30]);
                   
                   mon();
            }
              
              
                 function  update_attendance(){
                     alert("Updated");
            $("#spinner").show();
                var row_id = document.getElementById("row_id").value;
                var tr = document.getElementById(row_id);
                var aa= tr.querySelectorAll("span");
//                alert("aa >"+aa.length);
//                alert("aa >>>"+aa[9].innerHTML);
                var desi = document.getElementById("desi").value;
//                alert("desi"+desi);
                
                var P_day = document.getElementById("P_day").value;
                var A_day = document.getElementById("A_day").value;
                var O_day = document.getElementById("O_day").value;
                var H_day = document.getElementById("H_day").value;
                var R_day = document.getElementById("R_day").value;
//                alert("P_day>>"+P_day);
//                var x = document.getElementById("stock").checked;
//                var y = document.getElementById("loan").checked;
//                var emi=x+"/"+y;
                
                var atnd;
                var i;
               for(i=1;i<=31;i++){
                    var a= document.getElementById("day"+i).value;
                   
                    if(i==1){
                        atnd=a.charAt(0).toUpperCase() + a.slice(1);
                    }
                    else{
                        atnd=atnd+"-"+a.charAt(0).toUpperCase() + a.slice(1);
                    }
                 }
                
                aa[5].innerHTML=P_day;
                aa[6].innerHTML=O_day;
                aa[7].innerHTML=A_day;
                aa[8].innerHTML=R_day;
                aa[9].innerHTML=H_day;
                aa[10].innerHTML=atnd;
//                aa[11].innerHTML=emi;
                aa[3].innerHTML=desi;
                
                $("#spinner").hide();
                
//                var Eid=aa[1].innerHTML;
//                var atnds=aa[9].innerHTML;
//                var day=atnds.split("-");
//  
//                    alert("td >"+td.);
//                    var a = document.querySelectorAll('table.inventory tbody tr');
//                    var cells = a[id].querySelectorAll('span:last-child');
                    
//                   alert("token >"+td[1].innerHTML);
//                   $("#token").val(td[1].innerHTML);
                   
                  
                   
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
 
 
 
 
 
 
    



/*$('#quantity1').change(calculate);
                    $('#rate').change(calculate);
                  //  $('#Stock_EMI').keyup(calculate);
                    function calculate(e)
                    {
                        alert("----cccc");
                        $('#value1').val($('#quantity1').val() * $('#rate').val());
                       $('#Total_Amount').val($('#quantity1').val() * $('#rate').val());
                    }*/


//function calculate(){
//     var quantity1 =document.getElementById("quantity1").value;
//     
//     var rate =document.getElementById("rate").value;
//      
//     
//     var total=parseInt(quantity1)* parseInt(rate);
//     //alert("valueTotal_Duties="+valueTotal_Duties);
//     document.getElementById("value1").value=total;
//      document.getElementById("Total_Amount").value=total;
//  }



 
            
    

//    $.ajax({
//       
//        type:"POST",
//        url:"Recruitment_Combo_Servlet",
//        data:{
////                 company_name:company_name
//       
//            },
//        dataType:"json",
//           
//        success:function(data){
//            $.each(data.aaData,function(i,data)
//            {
//            //alert(data.value+":"+data.text);
//              //     alert("hello"+Unit_name);
//
//             document.getElementById("company_id").value=data.text;
//          
//            
//             }); 
//             
//            }
//             
//      });
   

//    });
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
var Iid=item.split("=>")[0];
var name=item.split("=>")[1];
var unit=item.split("=>")[2];
var hsn=item.split("=>")[3];
var rate=0;
        emptyColumn.setAttribute("id","E"+i);
	emptyColumn.innerHTML = '<td><a class="cut" onclick="cuting(this);">-</a><span ></span></td>' +
		'<td style="background: #efefef;"><span >'+name+'</span></td>' +
		'<td ><span contenteditable onkeyup="calculate_table_amt()">0</span></td>' +
		'<td ><span >'+unit+'</span></td>' +
                '<td ><span contenteditable onkeyup="calculate_table_amt()">'+rate+'</span></td>' +
		'<td style="background: #efefef;""><span >0</span></td>'+
//                '<td style="background: #efefef;"><span >0</span></td>'+
//                '<td style="background: #efefef;"><span >0</span></td>'+
//                '<td style="background: #efefef;"><span >0</span></td>'+
//                '<td style="background: #efefef;"><span >0</span></td>'+
                '<td class="hidden"><span >'+Iid+'</span></td>'+
                '<td class="hidden"><span >'+hsn+'</span></td>';
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



     var j=0;
    function generateTableRow_Date() {
	var emptyColumn = document.createElement('tr');
//var item =document.getElementById("item").value;
var item =document.getElementById("itemA").value;
var Iid=item.split("=>")[0];
var name=item.split("=>")[1];
var unit=item.split("=>")[2];
var date =document.getElementById("Adate").value;
var qty =document.getElementById("Total_Quantity").innerHTML;
        emptyColumn.setAttribute("id","D"+j);
	emptyColumn.innerHTML = '<td><a class="cut" onclick="cuting_Date(this);">-</a><span ></span></td>' +
		'<td style="background: #efefef;"><span contenteditable>'+name+'</span></td>' +
		'<td ><span contenteditable></span></td>' +
                '<td ><span contenteditable></span></td>' +
		'<td style="background: #efefef;"><span >'+date+'</span></td>' +
                '<td ><span ></span></td>' +
		'<td><span contenteditable></span></td>';
//                '<td style="background: #efefef;"><span >False/False</span></td>'+
//                '<td ><span ><input type="button" class="btn btn-primary btn-xs btn_edit " data-toggle="modal" data-target="#unit_guard_details"  href="#" onclick="edit_btn('+i+')" value="Edit"></span></td>';
//                '<td style="background: #efefef;"><span contenteditable>0</span></td>'+
//                '<td style="background: #efefef;" onkeyup="calculate_new();"><span contenteditable>0</span></td>'+
//                '<td style="background: #efefef;"><span contenteditable>0</span></td>';

//	return emptyColumn;
        j++;
       document.getElementById("itemA").value="";
       document.querySelector('table.inventory2 tbody').appendChild(emptyColumn);
}     
  


function Copy_table() {
    
     var cells, price, a, i;
           for (var a = document.querySelectorAll('table.inventory tbody tr'), i = 0; a[i]; ++i) {
		// get inventory row cells
		cells = a[i].querySelectorAll('span:last-child');
                var name=cells[1].innerHTML;
                var qty=cells[2].innerHTML;
//                dict["unit"]=cells[3].innerHTML;
//                dict["rate"]=cells[4].innerHTML;
//                dict["amt"]=cells[5].innerHTML;
//                dict["Iid"]=cells[6].innerHTML;
                
                var emptyColumn = document.createElement('tr');
                emptyColumn.innerHTML = '<td><a class="cut" onclick="cuting_Date(this);">-</a><span ></span></td>' +
		'<td style="background: #efefef;"><span contenteditable>'+name+'</span></td>' +
		'<td ><span >'+qty+'</span></td>' +
                '<td ><span contenteditable>'+qty+'</span></td>' +
		'<td style="background: #efefef;"><span contenteditable></span></td>' +
                '<td ><span ></span></td>' +
		'<td><span contenteditable></span></td>';
                document.querySelector('table.inventory2 tbody').appendChild(emptyColumn);
            }
}





function cuting(val){
//    alert("The paragraph was clicked.");
    var empTab = document.getElementById('detailsTBL');
    empTab.deleteRow(val.parentNode.parentNode.rowIndex);
    calculate_table_amt();
  }
function cuting_Date(val){
//    alert("The paragraph was clicked.");
    var empTab = document.getElementById('detailsTBL2');
    empTab.deleteRow(val.parentNode.parentNode.rowIndex);
  }
  
  
    
   
    
    
//$(document).ready(function () {

        




$(document).ready(function() 
{ 
        $('#unit').change(function(){
        var unit = document.getElementById("unit").value;
//        var com = document.getElementById("com").value;
//        alert(unit);
        
        $('#desi').find('option').remove().end().append('<option value="whatever">Data</option>').val(' ');

    $.ajax({
        type: "POST",
        url:"unit_designation_Combo",
        data:{
                   unit:unit
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


$('.cal').keyup(function(){
            alert("in click");
            calculate_table_amt();
});


 function gst_cal(){
       final_total();
   }

function calculate_table_amt(){
    var cells, price, a, i;
           var obj=[];
           
           for (var a = document.querySelectorAll('table.inventory tbody tr'), i = 0; a[i]; ++i) {
		// get inventory row cells
//                alert(i);
		cells = a[i].querySelectorAll('span:last-child');
//                alert("cell >"+cells[2].innerHTML);
                var dict={};
                
                var qty=cells[2].innerHTML;
                var rate=cells[4].innerHTML;
                cells[5].innerHTML=qty*rate;
            }
            final_total()
}

function final_total(){
    var txt_total=0;
    var TCS_tax=0;
//    alert("in final_total");tcsChek
    var total_qty=0;
    var total = 0;
    
     var tcsChek = document.getElementById("tcsChek").checked;
    var tax=$('#tax').val().split("=>")[1];
//    alert(tax);
    var Freight=document.getElementById('Total_Freight').innerHTML;
//    alert(Freight);
    var cells, price, a, i;
           
           for (var a = document.querySelectorAll('table.inventory tbody tr'), i = 0; a[i]; ++i) {
//                alert(i);
		cells = a[i].querySelectorAll('span:last-child');
//                alert("cell >"+cells[2].innerHTML);
                total_qty=total_qty+Number(cells[2].innerHTML);
                total=total+Number(cells[5].innerHTML);
            }
    
    
//    txt_total=(Number(total)*Number(tax))/100;
    txt_total=((Number(total)+Number(Freight))*Number(tax))/100;
    if(tcsChek){
//        TCS_tax=(Number(total)*0.1)/100;
        TCS_tax=((Number(total)+Number(txt_total))*0.1)/100;
    }else{
        TCS_tax=0;
    }
    var Total_Amount=Number(total)+Number(TCS_tax)+Number(txt_total)+Number(Freight);
    document.getElementById("tot").innerHTML=Math.round(total);
    document.getElementById("gst_tot").innerHTML=Math.round(txt_total);
    document.getElementById("TCS_tax").innerHTML=Math.round(TCS_tax);
    document.getElementById("Total_Amount").innerHTML=Math.round(Total_Amount);
    document.getElementById("Total_Quantity").innerHTML=total_qty;
}
</script>
<jsp:include page="templates/footer.html" />