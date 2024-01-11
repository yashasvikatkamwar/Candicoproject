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
<%!ResultSet data,rs;DataService ds1;ArrayList ar;Iterator ity;Object o1=null;String Pid; %>



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
                                 <h4>QUALITY CONTROL DEPARTMENT</h4>
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
                            <div class="form-group" style="float: right" hidden="">
                                <select  autocomplete="off"   name="GRN_BY"   class="form-control btn-info" id="GRN_BY" >
                                     <option>Without Purchase Order</option>
                                     <option>Inter Generate</option>
                                 </select>
                            </div>

                            <%
//                             Pid=request.getParameter("Pid");
//                            // String SHOWPid=Pid.split("=>")[1];
//                            // Pid=Pid.split("=>")[0];
//                             
//                            ds1= new DataService();
//                           data=ds1.PO_details(Pid);
//                            if(data.next()){
                            %>
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
                                                                                
                                                                                  <div class="form-group">   
                                                                                   
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">Company : <span class="required">*</span></label>
                                                                                        <div class="col-sm-4">
                                                                                             <%
                                                                                                        ds1= new DataService();
                                                                                                        rs=ds1.Company_list();
                                                                                                %>
                                                                                                <select name="select_company" id="select_company" class="form-control form-inline col-sm-3 select2"  onchange="company_chnge()">
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
												<span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                                      
                                                                                        <label for="date" class="col-sm-2 control-label">Stock Type : <span class="required">*</span></label>
											<div class="col-sm-4">
                                                                                            <select name="stock_type" id="stock_type" class="form-control form-inline col-sm-3">
                                                                                                   <!--<optgroup label="stock_type">-->
                                                                                                   <option>Quality Inspection</option>
                                                                                                     <option>Blocked Stock</option>
                                                                                                     <option>Unrestricted Use</option>
                                                                                                      <!--</optgroup>-->
                                                                                              </select>
												<span id="err_inv_date" style="color:red;"></span>
											</div>	
										</div>
                                                                                                      
                                                                                    <div class="form-group">
											<label for="date" class="col-sm-2 control-label">GRN ID : <span class="required">*</span></label>
											<div class="col-sm-4">
                                                                                            <select name="Gid" id="Gid" class="form-control form-inline col-sm-3 select2" onchange="GRN_chnge()"  >
                                                                                                   <!--<optgroup label="GRN">-->
                                                                                                   <option value="" >GRN</option>
                                                                                                      <!--</optgroup>-->
                                                                                              </select>
												<span id="err_inv_date" style="color:red;"></span>
											</div>										 		
											<div>
											<label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">SUPPLER NAME : <span class="required">*</span></label>
											<div class="col-sm-4">
                                                                                            <input  autocomplete="off" readonly=""  name="Vname" required type="text" value=""  class="form-control" id="Vname">
                                                                                            <input  autocomplete="off" readonly=""  name="Vid" required type="hidden" value=""  class="form-control" id="Vid">
											<span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
                                                                               
											
                                                                                </div> 
                                                                                    <div class="form-group">
                                                                                        <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">Material : <span class="required">*</span></label>
                                                                                        <div class="col-sm-4">
                                                                                                <select name="items" id="items" class="form-control form-inline col-sm-3 "  onchange="Iid_chnge()">
                                                                                                   <optgroup label="select material">
                                                                                                      </optgroup>
                                                                                              </select>
											</div>
											<div>
                                                                                       <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">MFG NAME : </label>
											<div class="col-sm-4">
                                                                                            <input    name="MFG_name" required type="text"   class="form-control" id="MFG_name">
                                                                                            <span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>											
											
                                                                                </div>     
                                                                                <div class="form-group">   
                                                                                    <div>
                                                                                    <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">MATERIAL CODE  : </label>
											<div class="col-sm-4">
                                                                                            <input    name="Iid" required type="text"   class="form-control" id="Iid">
                                                                                            <span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
                                                                                    <div>
                                                                                    <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">MATERIAL NAME : </label>
											<div class="col-sm-4">
                                                                                            <input    name="Iname" required type="text"   class="form-control" id="Iname">
                                                                                            <input    name="HSN" required type="hidden"   class="form-control" id="HSN" >
                                                                                            <span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
										</div>
                                                                                                      
                                                                                <div class="form-group">   
                                                                                    <div>
                                                                                    <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">CIMS BATCH NO. : </label>
											<div class="col-sm-4">
                                                                                            <input    name="CIMS_batch_no"  type="text"   class="form-control" id="CIMS_batch_no">
                                                                                            <span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
                                                                                    <div>
                                                                                    <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">VENDOR BATCH NO.: </label>
											<div class="col-sm-4">
                                                                                            <input    name="vender_batch_no"  type="text" class="form-control" id="vender_batch_no">
                                                                                            <span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
										</div>
                                                                                                      
                                                                                <div class="form-group">   
                                                                                    <div>
                                                                                    <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">NO OF CONTAINER : </label>
											<div class="col-sm-4">
                                                                                            <input    name="no_of_container"  type="text"   class="form-control" id="no_of_container">
                                                                                            <span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
                                                                                    <div>
                                                                                    <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">MFG DATE : </label>
											<div class="col-sm-4">
                                                                                            <div class="input-group date" data-date-format="dd.mm.yyyy">
                                                                                                <input  type="text" class="form-control" placeholder="dd/mm/yyyy" name="MFG_date" id="MFG_date" >
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
                                                                                    <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">EXPIRY DATE: </label>
											<div class="col-sm-4">
                                                                                            <div class="input-group date" data-date-format="dd.mm.yyyy">
                                                                                                <input  type="text" class="form-control" placeholder="dd/mm/yyyy" name="expiry_date" id="expiry_date" >
                                                                                                <div class="input-group-addon" >
                                                                                                  <span class="glyphicon glyphicon-th"></span>
                                                                                                </div>
                                                                                            </div>
                                                                                            <span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
                                                                                    <div>
                                                                                    <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">MFG RETEST DATE: </label>
											<div class="col-sm-4">
                                                                                            <div class="input-group date" data-date-format="dd.mm.yyyy">
                                                                                                <input  type="text" class="form-control" placeholder="dd/mm/yyyy" name="MFG_retest_date" id="MFG_retest_date" >
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
                                                                                    <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">RECEIVED QTY. : </label>
											<div class="col-sm-4">
                                                                                            <input    name="received_QTY"  type="text" class="form-control" id="received_QTY">
                                                                                            <span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
                                                                                    <div>
                                                                                    <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">DOCUMENT DATE : </label>
											<div class="col-sm-4">
                                                                                            <div class="input-group date" data-date-format="dd.mm.yyyy">
                                                                                                <input  type="text" class="form-control" placeholder="dd/mm/yyyy" name="document_date" id="document_date" required>
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
                                                                                    <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">A.R. NO.: </label>
											<div class="col-sm-4">
                                                                                            <input    name="AR_no"  type="text" class="form-control" id="AR_no">
                                                                                            <span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
                                                                                    <div>
                                                                                    <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">SAMPLE QTY : </label>
											<div class="col-sm-4">
                                                                                            <input    name="sample_QTY"  type="text"   class="form-control" id="sample_QTY">
                                                                                            <span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
										</div>
                                                                                                      
                                                                                <div class="form-group">   
                                                                                    <div>
                                                                                    <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">SAMPLE DATE: </label>
											<div class="col-sm-4">
                                                                                            <div class="input-group date" data-date-format="dd.mm.yyyy">
                                                                                                <input  type="text" class="form-control" placeholder="dd/mm/yyyy" name="sample_date" id="sample_date" >
                                                                                                <div class="input-group-addon" >
                                                                                                  <span class="glyphicon glyphicon-th"></span>
                                                                                                </div>
                                                                                            </div>
                                                                                            <span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
                                                                                    <div>
                                                                                    <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">DATE : </label>
											<div class="col-sm-4">
                                                                                            <div class="input-group date" data-date-format="dd.mm.yyyy">
                                                                                                <input  type="text" class="form-control" placeholder="dd/mm/yyyy" name="RELEASED_REJECTED_DATED" id="RELEASED_REJECTED_DATED" >
                                                                                                <div class="input-group-addon" >
                                                                                                  <span class="glyphicon glyphicon-th"></span>
                                                                                                </div>
                                                                                            </div>
                                                                                            <span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
										</div>
                                                                                            
                                                                                <div class="form-group"> 
                                                                                      <div class="col-sm-6"></div>
                                                                                        <label for="date" class="col-sm-2 control-label">Result : <span class="required">*</span></label>
											<div class="col-sm-4">
                                                                                            <select name="result" id="result" class="form-control form-inline col-sm-3">
                                                                                                   <!--<optgroup label="stock_type">-->
                                                                                                   <option>UNDER PROCESS</option>
                                                                                                   <option>RELEASED</option>
                                                                                                     <option>REJECTED</option>
                                                                                                     
                                                                                                      <!--</optgroup>-->
                                                                                              </select>
												<span id="err_inv_date" style="color:red;"></span>
											</div>	
										</div>
                                                                                                      
                                                                                <div class="form-group">  
                                                                                    <div>
                                                                                    <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">REANALYSIS DATE : </label>
											<div class="col-sm-4">
                                                                                            <div class="input-group date" data-date-format="dd.mm.yyyy">
                                                                                                <input  type="text" class="form-control" placeholder="dd/mm/yyyy" name="REANALYSIS_DATE" id="REANALYSIS_DATE" >
                                                                                                <div class="input-group-addon" >
                                                                                                  <span class="glyphicon glyphicon-th"></span>
                                                                                                </div>
                                                                                            </div>
                                                                                            <span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
                                                                                    <div>
                                                                                    <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">LOT QTY.: </label>
											<div class="col-sm-4">
                                                                                            <input    name="LOT_QTY"  type="text"   class="form-control" id="LOT_QTY">
                                                                                            <span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
										</div>
                                                                                                      
                                                                                <div class="form-group">   
                                                                                    <div>
                                                                                    <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">RELEASED QTY. : </label>
											<div class="col-sm-4">
                                                                                            <input    name="RELEASED_QTY"  type="text" class="form-control" id="RELEASED_QTY">
                                                                                            <span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
                                                                                    <div>
                                                                                    <label for="cust_id" id="cust_id_label" class="col-sm-2 control-label">REJECTED  QTY.  : </label>
											<div class="col-sm-4">
                                                                                            <input    name="REJECTED_QTY"  type="text"   class="form-control" id="REJECTED_QTY">
                                                                                            <span id="err_cust_id" style="color:red;"></span>
											</div>
                                                                                    </div>
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

                            <% //}%>
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
     
             
                   var select_company  = $(this).find("[name='select_company']").val();
//                    alert("Gid->"+Gid);GRN_BY
                       
                    var stock_type  = $(this).find("[name='stock_type']").val();
//                 alert("Pid->"+Pid);
                    var Gid  = $(this).find("[name='Gid']").val();
//                       alert("Pid->"+Pid);
                    var Vname  = $(this).find("[name='Vname']").val();
//                   alert("Board_Type->"+Board_Type);remark
                    var Vid  = $(this).find("[name='Vid']").val();
                
                  var MFG_name= document.getElementById("MFG_name").value;
                  var Iname= document.getElementById("Iname").value;
                  var Iid= document.getElementById("Iid").value;
                  var HSN= document.getElementById("HSN").value;
                  
                  var CIMS_batch_no= document.getElementById("CIMS_batch_no").value;
                  var vender_batch_no= document.getElementById("vender_batch_no").value;
                  var no_of_container= document.getElementById("no_of_container").value;
                  var MFG_date= document.getElementById("MFG_date").value;
                  var expiry_date= document.getElementById("expiry_date").value;
                  var MFG_retest_date= document.getElementById("MFG_retest_date").value;
                  var received_QTY= document.getElementById("received_QTY").value;
                  var document_date= document.getElementById("document_date").value;
                  var AR_no= document.getElementById("AR_no").value;
                  
                  var sample_QTY= document.getElementById("sample_QTY").value;
                  var sample_date= document.getElementById("sample_date").value;
                  
                  var RELEASED_REJECTED_DATED= document.getElementById("RELEASED_REJECTED_DATED").value;
                  var REANALYSIS_DATE= document.getElementById("REANALYSIS_DATE").value;
                  var LOT_QTY= document.getElementById("LOT_QTY").value;
                  var RELEASED_QTY= document.getElementById("RELEASED_QTY").value;
                  var REJECTED_QTY= document.getElementById("REJECTED_QTY").value;
                  
                  var result= document.getElementById("result").value;

               if(Gid!="" && Vname!="" && Iid!=""){
//               alert("in if->");
            $("#spinner").show();
              $.ajax({
                    type:"POST",
                     url:"QCD_insert",
                           data:{ 
                               select_company:select_company,
                               stock_type:stock_type,
                               Gid:Gid,
                               Vname:Vname,
                               Vid:Vid,
                               MFG_name:MFG_name,
                               Iname:Iname,
                               Iid:Iid,
                               HSN:HSN,
                               CIMS_batch_no:CIMS_batch_no,
                               vender_batch_no:vender_batch_no,
                               no_of_container:no_of_container,
                               MFG_date:MFG_date,
                               expiry_date:expiry_date,
                               MFG_retest_date:MFG_retest_date,
                               received_QTY:received_QTY,
                               document_date:document_date,
                               AR_no:AR_no,
                               sample_QTY:sample_QTY,
                               sample_date:sample_date,
                               RELEASED_REJECTED_DATED:RELEASED_REJECTED_DATED,
                               REANALYSIS_DATE:REANALYSIS_DATE,
                               LOT_QTY:LOT_QTY,
                               RELEASED_QTY:RELEASED_QTY,
                               REJECTED_QTY:REJECTED_QTY,
                               result:result
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
    TCS_tax=((Number(total)+Number(Freight)+Number(txt_total))*0.1)/100;
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
        var Cid=select_company.split("=>")[0];
//        alert(Cid);
        $('#Gid').find('option').remove().end().append('<option value=""  style="color:black;">select GRN</option>').val(' ');

    $.ajax({
        type: "POST",
        url:"getCustomer_GRNs_COMBO",
        data:{
               Cid:Cid
            },
        dataType:"json",
        success:function(data){
            $.each(data.aaData,function(i,data)
            {
//                var Pid=data.sr+"=>"+data.text;GRN_chnge
            var div_data='<option value="'+data.text+'" style="color:black;">'+data.sr+'</option>';
            $(div_data).appendTo('#Gid');
//            document.getElementById("Gid").value=data.text;
             }); 
            }
             
      });
     
    }
    
    function GRN_chnge(){
        var GRN=$('#Gid').val();
        var Gid=GRN.split("=>")[0];
        $("#Vid").val(GRN.split("=>")[2]);
        $("#Vname").val(GRN.split("=>")[3]);
//        alert(Cid);
        $('#items').find('option').remove().end().append('<option value=""  style="color:black;">select Materials</option>').val(' ');

    $.ajax({
        type: "POST",
        url:"get_GRNs_Iid_COMBO",
        data:{
               Gid:Gid
            },
        dataType:"json",
        success:function(data){
            $.each(data.aaData,function(i,data)
            {
//                var Pid=data.sr+"=>"+data.text;GRN_chnge
            var div_data='<option value="'+data.text+'" style="color:black;">'+data.sr+'</option>';
            $(div_data).appendTo('#items');
//            document.getElementById("Gid").value=data.text;
             }); 
            }
             
      });
     
    }
    
    function Iid_chnge(){
        var items=$('#items').val();
        var item=items.split("=>");
//        $("#Iid").val(item[0]);
        $("#Iid").val(item[1]);
        $("#Iname").val(item[2]);
        $("#HSN").val(item[3]);
        $("#MFG_name").val(item[4]);
        $("#CIMS_batch_no").val(item[5]);
        $("#vender_batch_no").val(item[6]);
        $("#no_of_container").val(item[7]);
        $("#MFG_date").val(item[8]);
        $("#expiry_date").val(item[9]);
        $("#MFG_retest_date").val(item[10]);
        $("#received_QTY").val(item[11]);
//        alert(Cid);
//        $('#Gid').find('option').remove().end().append('<option value=""  style="color:black;">select GRN</option>').val(' ');
//
//    $.ajax({
//        type: "POST",
//        url:"get_GRNs_Iid_COMBO",
//        data:{
//               Cid:Cid
//            },
//        dataType:"json",
//        success:function(data){
//            $.each(data.aaData,function(i,data)
//            {
////                var Pid=data.sr+"=>"+data.text;GRN_chnge
//            var div_data='<option value="'+data.text+'" style="color:black;">'+data.sr+'</option>';
//            $(div_data).appendTo('#Gid');
////            document.getElementById("Gid").value=data.text;
//             }); 
//            }
//             
//      });
     
    }
</script>  
<jsp:include page="templates/footer.html" />