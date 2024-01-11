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
<%!ResultSet rq,data,data2,data3,data4,data5,re,selectData,rs2;
ResultSetMetaData rsmd;
Object ob;
String Cid;
DataService sr1;int x;Object aval,bval,unitid; 
int i=0;ArrayList ar;
JSONArray list; Iterator ity;Object o1;String gender;String S_tyep,seller_id;%>
<%
//                    S_tyep=(String)session.getAttribute("S_tyep");
//                    S_tyep="DryFruits Store";
                   seller_id=(String)session.getAttribute("seller_id");
    %>
    <style>
        td{text-align: center;color: black}
        
       
    </style>
        
    <%
        Cid=request.getParameter("Cid");
    %>
<!-- page content -->
      <div class="right_col" role="main">
          
        <div class="">
          <div class="page-title">
<!--            <div class="title_left">
              <h3 style="color:black;">
                  Stocks
                </h3>
            </div>-->
              <div id="sidebar-menu" class="main_menu_side hidden-print main_menu"></div>
          </div>
          <div class="clearfix"></div>
          
<!--           <form id="demo-form3" action="main_Add_color.jsp" data-parsley-validate class="form-horizontal form-label-left">
   
                             
                             
                             <center> 
                        <button type="submit" class="btn btn-primary" style="background-color:darkcyan;color:white;">+Add Item color</button>
                
                </center>
               </form>           -->
          <div class="row">

            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2 style="color:black;">Company ID : <%=Cid%></h2>
                  
                  <div class="clearfix"></div>
                </div>
             
                  
                  
                  
                  
                  <!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="author" content="sayyed sajid" />
    <title>index</title>
    <!--<link rel="stylesheet" href="./css/bootstrap.min.css" />-->
    <!--<link rel="stylesheet" href="./css/bootstrap.css.map" />-->
    <!--<link rel="stylesheet" href="./css/bootstrap-grid.min.css" />-->
    
    <!-- <link rel="stylesheet" href="./css/jquery-ui.min.css" /> -->

    <!-- <link rel="stylesheet" href="./css/all.min.css" /> -->
    <link rel="stylesheet" href="./scss/style.css" />

    <style>
        body{
            color:#000;
        }
      /* Style the form */
#company-master-form {
  margin: 100px auto;
  padding: 40px;
  width: 70%;
  min-width: 300px;
}

/* Style the input fields */
input {
  padding: 10px;
  width: 100%;
  font-size: 17px;
  font-family: Raleway;
  border: 1px solid #aaaaaa;
}

input::-webkit-input-placeholder {
  font-family: Arial, Helvetica, sans-serif;
}

input:-ms-input-placeholder {
  font-family: Arial, Helvetica, sans-serif;
}

input::-ms-input-placeholder {
  font-family: Arial, Helvetica, sans-serif;
}

input::placeholder {
  font-family: Arial, Helvetica, sans-serif;
}

/* Mark input boxes that gets an error on validation: */
input.invalid {
  background-color: #ffdddd;
}

form {
  background-color: #fffff7;
  -webkit-box-shadow: 0px 0px 6px #ccc;
  box-shadow: 0px 0px 6px #ccc;
  padding: 32px;
}

form input,
form select,
form label {
  margin: 8px;
}

form input {
  border-radius: 3px;
  font-family: Arial, Helvetica, sans-serif;
}

form label {
  font-weight: 500;
}

form button {
  padding: 8px 16px;
  border: 1px solid transparent;
  font-weight: 500;
  opacity: 0.8;
  -webkit-transition: 0.4s;
  transition: 0.4s;
}

form button:hover {
  opacity: 1;
}

button#nextBtn {
  background-color: #16a516;
}

button#prevBtn {
  margin-right: 8px;
  background-color: #e09a1a;
}

.form-title {
  padding: 8px;
}

.detail-title h3 {
  border-bottom: 2px solid #b37504;
  padding: 8px;
}

/* Hide all steps by default: */
.tab {
  display: none;
}

/* Make circles that indicate the steps of the form: */
.step {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbbbbb;
  border: none;
  border-radius: 50%;
  display: inline-block;
  opacity: 0.5;
}

/* Mark the active step: */
.step.active {
  opacity: 1;
}

/* Mark the steps that are finished and valid: */
.step.finish {
  background-color: #4caf50;
}
/*# sourceMappingURL=style.css.map */

    </style>
  </head>
  <body>

    <!-- header end -->

    <!-- section -->
    <section class="main-section">
      <div class="wrap">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <!-- main title -->
<!--              <div class="form-title">
                <h2>company master</h2>
              </div>-->
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <!--company master form -->
                <div class="container">
                  <div class="row">
                    <div class="col">
                      <!-- sub-title -->
                      <div class="detail-title">
                        <h3>Company Edit</h3>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      
                        
<form id="" method="post" action="Edit_Company" class="form-horizontal form-label-left">

    <input type="hidden" id="status" name="status" value="edit">
    <input type="hidden" id="id" name="id" value="<%=Cid%>">
    <%
    try{
                sr1=new DataService();
                rs2=sr1.Company_details(Cid);
                if(rs2.next()){
            %>           
      <!-- <h1>Register:</h1> -->

      <!-- One "tab" for each step in the form: -->
      <div class="tab company-details-tab" id="company-details-tab">
<div class="container">
  <div class="row">
    <div class="col-md-3">
      <h4>company details</h4>
    </div>
  </div>
          <div class="row">
         <div class="col-md-3">
                      <div class="label-div">
                        <label for="company-code" class="form-label">company code</label>
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="code"
                          id="code"
                          placeholder="company code"
                          value="<%=rs2.getObject("code")%>"
                          class="form-control chek" readonly=""/>
                      </div>
                    </div>
                        <div class="col-md-3">
                      <div class="label-div">
                        <label for="company-name" class="form-label"
                          >company name</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="Cname"
                          id="Cname"
                          placeholder="company name"
                          value="<%=rs2.getObject("Cname")%>"
                          class="form-control chek"
                        />
                      </div>
                    </div>
        </div>
                    <div class="row">
                    <div class="col-md-3">
                      <div class="label-div">
                        <label for="company-code" class="form-label"
                          >company type</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="Ctype"
                          id="Ctype"
                          placeholder="company Type"
                          value="<%=rs2.getObject("Ctype")%>"
                          class="form-control"
                        />
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="label-div">
                        <label for="company-shot_name" class="form-label">
                          Short Name</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="shot_name"
                          id="shot_name"
                          placeholder=" shot_name"
                          value="<%=rs2.getObject("shot_name")%>"
                          class="form-control chek"
                        />
                      </div>
                    </div>
                  </div>
                   <div class="row">
                    <div class="col-md-3">
                      <div class="label-div">
                        <label for="company-no-owner" class="form-label"
                          >number of owner</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="noOFowner"
                          id="noOFowner"
                          value="<%=rs2.getObject("noOFowner")%>"
                          placeholder="company no-owner"
                          class="form-control"
                        />
                      </div>
                    </div>
             
                  </div>
</div>

      </div>

<!-- ho details -->
      <div class="tab ho-details-tab" id="ho-details-tab">
<div class="container">
    <div class="row">
    <div class="col-md-3">
      <h4>HO details</h4>
    </div>
  </div>
  <div class="row">
                    <div class="col-md-3">
                      <div class="label-div">
                        <label for="ho-address" class="form-label"
                          >HO addresss </label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="HO_addresss"
                          id="HO_addresss"
                          value="<%=rs2.getObject("HO_addresss")%>"
                          placeholder="HO address"
                          class="form-control chek"
                        />
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="label-div">
                        <label for="ho-location" class="form-label"
                          >location</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="location"
                          id="location"
                          value="<%=rs2.getObject("location")%>"
                          placeholder="location"
                          class="form-control"
                        />
                      </div>
                    </div>
             
                  </div>
 <div class="row">
          
                    <div class="col-md-3">
                      <div class="label-div">
                        <label for="corporate-country" class="form-label"
                          >country</label
                        >
                      </div>
                    </div>
                       <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="country"
                          id="country"
                          value="<%=rs2.getObject("country")%>"
                          placeholder="country"
                          class="form-control"
                        />
                      </div>
                    </div>
                              <div class="col-md-3">
                      <div class="label-div">
                        <label for="corporate-state" class="form-label"
                          >state</label
                        >
                      </div>
                    </div>
                     <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="state"
                          id="state"
                          value="<%=rs2.getObject("state")%>"
                          placeholder="state"
                          class="form-control"
                        />
                      </div>
                    </div>
             
                  </div>
  <div class="row">
             <div class="col-md-3">
                      <div class="label-div">
                        <label for="corporate-city" class="form-label"
                          >city</label
                        >
                      </div>
                    </div>
                     <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="city"
                          id="city"
                          value="<%=rs2.getObject("city")%>"
                          placeholder="city"
                          class="form-control"
                        />
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="label-div">
                        <label for="corporate-pincode" class="form-label"
                          >pincode</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="pincode"
                          id="pincode"
                          value="<%=rs2.getObject("pincode")%>"
                          placeholder="pincode"
                          class="form-control"
                        />
                      </div>
                    </div>
             
                  </div>
  <div class="row">
                    <div class="col-md-3">
                      <div class="label-div">
                        <label for="corporate-phone-1" class="form-label"
                          >phone 1</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="phone1"
                          id="phone1"
                          value="<%=rs2.getObject("phone1")%>"
                          placeholder="phone 1"
                          class="form-control"
                        />
                      </div>
                    </div>
              <div class="col-md-3">
                      <div class="label-div">
                        <label for="corporate-phone-2" class="form-label"
                          >phone 2</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="phone2"
                          id="phone2"
                          value="<%=rs2.getObject("phone2")%>"
                          placeholder="phone 2"
                          class="form-control"
                        />
                      </div>
                    </div>
             
                  </div>
  <div class="row">
                    <div class="col-md-3">
                      <div class="label-div">
                        <label for="corporate-mobile-1" class="form-label"
                          >mobile 1</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="mobile1"
                          id="mobile1"
                          value="<%=rs2.getObject("mobile1")%>"
                          placeholder="mobile 1"
                          class="form-control"
                        />
                      </div>
                    </div>
              <div class="col-md-3">
                      <div class="label-div">
                        <label for="corporate-mobile-2" class="form-label"
                          >mobile 2</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="mobile2"
                          id="mobile2"
                          value="<%=rs2.getObject("mobile2")%>"
                          placeholder="mobile 2"
                          class="form-control"
                        />
                      </div>
                    </div>
             
                  </div>

  <div class="row">
           
                    <div class="col-md-3">
                      <div class="label-div">
                        <label for="ho-email" class="form-label"
                          >email ID</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="email"
                          id="email"
                          value="<%=rs2.getObject("email")%>"
                          placeholder="email"
                          class="form-control"
                        />
                      </div>
                    </div>
             
                  </div>
</div>

      </div>

<!-- corporate details -->
      <div class="tab corporate-details" id="corporate-details">
        <div class="container">
            <div class="row">
    <div class="col-md-3">
      <h4>corporate details</h4>
    </div>
  </div>
  <div class="row">
                    <div class="col-md-3">
                      <div class="label-div">
                        <label for="corporate-address" class="form-label"
                          >office addresss </label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="ofc_addresss"
                          id="ofc_addresss"
                          value="<%=rs2.getObject("ofc_addresss")%>"
                          placeholder="officce address"
                          class="form-control"
                        />
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="label-div">
                        <label for="corporate-location" class="form-label"
                          >location</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="ofc_location"
                          id="ofc_location"
                          value="<%=rs2.getObject("ofc_location")%>"
                          placeholder="location"
                          class="form-control"
                        />
                      </div>
                    </div>
             
                  </div>
  <div class="row">
          
                    <div class="col-md-3">
                      <div class="label-div">
                        <label for="corporate-country" class="form-label"
                          >country</label
                        >
                      </div>
                    </div>
                       <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="ofc_country"
                          id="ofc_country"
                          value="<%=rs2.getObject("ofc_country")%>"
                          placeholder="country"
                          class="form-control"
                        />
                      </div>
                    </div>
                              <div class="col-md-3">
                      <div class="label-div">
                        <label for="corporate-state" class="form-label"
                          >state</label
                        >
                      </div>
                    </div>
                     <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="ofc_state"
                          id="ofc_state"
                          value="<%=rs2.getObject("ofc_state")%>"
                          placeholder="state"
                          class="form-control"
                        />
                      </div>
                    </div>
             
                  </div>
  <div class="row">
             <div class="col-md-3">
                      <div class="label-div">
                        <label for="corporate-city" class="form-label"
                          >city</label
                        >
                      </div>
                    </div>
                     <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="ofc_city"
                          id="ofc_city"
                          value="<%=rs2.getObject("ofc_city")%>"
                          placeholder="city"
                          class="form-control"
                        />
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="label-div">
                        <label for="corporate-pincode" class="form-label"
                          >pincode</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="ofc_pincode"
                          id="ofc_pincode"
                          value="<%=rs2.getObject("ofc_pincode")%>"
                          placeholder="pincode"
                          class="form-control"
                        />
                      </div>
                    </div>
             
                  </div>
  <div class="row">
                    <div class="col-md-3">
                      <div class="label-div">
                        <label for="corporate-phone-1" class="form-label"
                          >phone 1</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="ofc_phone1"
                          id="ofc_phone1"
                          value="<%=rs2.getObject("ofc_phone1")%>"
                          placeholder="phone 1"
                          class="form-control"
                        />
                      </div>
                    </div>
              <div class="col-md-3">
                      <div class="label-div">
                        <label for="corporate-phone-2" class="form-label"
                          >phone 2</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="ofc_phone2"
                          id="ofc_phone2"
                          value="<%=rs2.getObject("ofc_phone2")%>"
                          placeholder="phone 2"
                          class="form-control"
                        />
                      </div>
                    </div>
             
                  </div>
  <div class="row">
                    <div class="col-md-3">
                      <div class="label-div">
                        <label for="corporate-mobile-1" class="form-label"
                          >mobile 1</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="ofc_mobile1"
                          id="ofc_mobile1"
                          value="<%=rs2.getObject("ofc_mobile1")%>"
                          placeholder="mobile 1"
                          class="form-control"
                        />
                      </div>
                    </div>
              <div class="col-md-3">
                      <div class="label-div">
                        <label for="corporate-mobile-2" class="form-label"
                          >mobile 2</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="ofc_mobile2"
                          id="ofc_mobile2"
                          value="<%=rs2.getObject("ofc_mobile2")%>"
                          placeholder="mobile 2"
                          class="form-control"
                        />
                      </div>
                    </div>
             
                  </div>

  <div class="row">
           
                    <div class="col-md-3">
                      <div class="label-div">
                        <label for="corporate-email" class="form-label"
                          >email ID</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="ofc_email"
                          id="ofc_email"
                          value="<%=rs2.getObject("ofc_email")%>"
                          placeholder="email"
                          class="form-control"
                        />
                      </div>
                    </div>
                      <div class="col-md-3">
                      <div class="label-div">
                        <label for="corporate-website" class="form-label"
                          >website </label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="ofc_website"
                          id="ofc_website"
                          value="<%=rs2.getObject("ofc_website")%>"
                          placeholder="website"
                          class="form-control"
                        />
                      </div>
                    </div>
             
                  </div>
                  
             
                  </div>
</div>

      <!-- </div> -->
<!-- sales details -->
      <div class="tab sales-details" id="sales-details">
    <div class="container">
    <div class="row">
    <div class="col-md-3">
      <h4>sales details</h4>
    </div>
  </div>
  <div class="row">
                    <div class="col-md-3">
                      <div class="label-div">
                        <label for="sales-address" class="form-label"
                          >sale office addresss </label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="sale_ofc_addresss"
                          id="sale_ofc_addresss"
                          value="<%=rs2.getObject("sale_ofc_addresss")%>"
                          placeholder="sale office address"
                          class="form-control"
                        />
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="label-div">
                        <label for="sales-location" class="form-label"
                          >location</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="sale_ofc_location"
                          id="sale_ofc_location"
                          value="<%=rs2.getObject("sale_ofc_location")%>"
                          placeholder="location"
                          class="form-control"
                        />
                      </div>
                    </div>
             
                  </div>
  <div class="row">
          
                    <div class="col-md-3">
                      <div class="label-div">
                        <label for="sales-country" class="form-label"
                          >country</label
                        >
                      </div>
                    </div>
                       <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="sale_ofc_country"
                          id="sale_ofc_country"
                          value="<%=rs2.getObject("sale_ofc_country")%>"
                          placeholder="sale_ofc_country"
                          class="form-control"
                        />
                      </div>
                    </div>
                              <div class="col-md-3">
                      <div class="label-div">
                        <label for="sales-state" class="form-label"
                          >state</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="sale_ofc_state"
                          id="sale_ofc_state"
                          value="<%=rs2.getObject("sale_ofc_state")%>"
                          placeholder="sale_ofc_state"
                          class="form-control"
                        />
                      </div>
                    </div>
             
                  </div>
  <div class="row">
             <div class="col-md-3">
                      <div class="label-div">
                        <label for="sales-city" class="form-label"
                          >city</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="sale_ofc_city"
                          id="sale_ofc_city"
                          value="<%=rs2.getObject("sale_ofc_city")%>"
                          placeholder="sale_ofc_city"
                          class="form-control"
                        />
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="label-div">
                        <label for="sales-pincode" class="form-label"
                          >pincode</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="sale_ofc_pincode"
                          id="sale_ofc_pincode"
                          value="<%=rs2.getObject("sale_ofc_pincode")%>"
                          placeholder="pincode"
                          class="form-control"
                        />
                      </div>
                    </div>
             
                  </div>
  <div class="row">
                    <div class="col-md-3">
                      <div class="label-div">
                        <label for="sales-phone-1" class="form-label"
                          >phone 1</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="sale_ofc_phone1"
                          id="sale_ofc_phone1"
                          value="<%=rs2.getObject("sale_ofc_phone1")%>"
                          placeholder="phone 1"
                          class="form-control"
                        />
                      </div>
                    </div>
              <div class="col-md-3">
                      <div class="label-div">
                        <label for="sales-phone-2" class="form-label"
                          >phone 2</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="sale_ofc_phone2"
                          id="sale_ofc_phone2"
                          value="<%=rs2.getObject("sale_ofc_phone2")%>"
                          placeholder="phone 2"
                          class="form-control"
                        />
                      </div>
                    </div>
             
                  </div>
  <div class="row">
                    <div class="col-md-3">
                      <div class="label-div">
                        <label for="sales-mobile-1" class="form-label"
                          >mobile 1</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="sale_ofc_mobile1"
                          id="sale_ofc_mobile1"
                          value="<%=rs2.getObject("sale_ofc_mobile1")%>"
                          placeholder="mobile 1"
                          class="form-control"
                        />
                      </div>
                    </div>
              <div class="col-md-3">
                      <div class="label-div">
                        <label for="sales-mobile-2" class="form-label"
                          >mobile 2</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="sale_ofc_mobile2"
                          id="sale_ofc_mobile2"
                          value="<%=rs2.getObject("sale_ofc_mobile2")%>"
                          placeholder="mobile 2"
                          class="form-control"
                        />
                      </div>
                    </div>
             
                  </div>

  <div class="row">
           
                    <div class="col-md-3">
                      <div class="label-div">
                        <label for="sales-email" class="form-label"
                          >email ID</label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="sale_ofc_email"
                          id="sale_ofc_email"
                          value="<%=rs2.getObject("sale_ofc_email")%>"
                          placeholder="email"
                          class="form-control"
                        />
                      </div>
                    </div>
             
                  </div>
</div>
      </div>

      <!-- bank details -->
      <div class="tab bank-details" id="bank-details">
        <div class="container">
          <div class="row">
            <h4>bank details</h4>
          </div>
          <div class="row">
                     <div class="col-md-3">
                      <div class="label-div">
                        <label for="bank-name" class="form-label"
                          >bank name </label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="bank_name"
                          id="bank_name"
                          value="<%=rs2.getObject("bank_name")%>"
                          placeholder="bank name"
                          class="form-control"
                        />
                      </div>
                    </div>
                     <div class="col-md-3">
                      <div class="label-div">
                        <label for="bank-branch" class="form-label"
                          >bank branch </label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="branch"
                          id="branch"
                          value="<%=rs2.getObject("branch")%>"
                          placeholder="bank branch"
                          class="form-control"
                        />
                      </div>
                    </div>
          </div>
          <div class="row">
                     <div class="col-md-3">
                      <div class="label-div">
                        <label for="bank-account-number" class="form-label"
                          > account number </label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="account_number"
                          id="account_number"
                          value="<%=rs2.getObject("account_number")%>"
                          placeholder="bank account-number"
                          class="form-control"
                        />
                      </div>
                    </div>
                     <div class="col-md-3">
                      <div class="label-div">
                        <label for="bank-ifsc" class="form-label"
                          > IFSC code </label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="IFSC"
                          id="IFSC"
                          value="<%=rs2.getObject("IFSC")%>"
                          placeholder="bank ifsc code"
                          class="form-control"
                        />
                      </div>
                    </div>
          </div>
          <div class="row">
                     <div class="col-md-3">
                      <div class="label-div">
                        <label for="bank-favour" class="form-label"
                          > in favour </label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="in_favour"
                          id="in_favour"
                          value="<%=rs2.getObject("in_favour")%>"
                          placeholder="bank favour"
                          class="form-control"
                        />
                      </div>
                    </div>
                     <div class="col-md-3">
                      <div class="label-div">
                        <label for="bank-registration" class="form-label"
                          > registration office </label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="registration_office"
                          id="registration_office"
                          value="<%=rs2.getObject("registration_office")%>"
                          placeholder=" registration office "
                          class="form-control"
                        />
                      </div>
                    </div>
          </div>
          <div class="row">
              <div class="col-md-3">
                      <div class="label-div">
                        <label for="bank-registration" class="form-label"
                          >holder name </label
                        >
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="input-div">
                        <input
                          type="text"
                          name="holder_name"
                          id="holder_name"
                          value="<%=rs2.getObject("holder_name")%>"
                          placeholder=" Holder name"
                          class="form-control"
                        />
                      </div>
                    </div>
          </div>
        </div>
      </div>
<!--      <div class="tab logo-details" id="logo-details" >
        <div class="container">
          <div class="row">
            <div class="col-md-3">
              <div class="label-div">
                <label for="company-logo">
                  company logo
                </label>
              </div>
            </div>
            <div class="col-md-3">
              <div class="input-div">
                <input type="file" name="logo_img" id="logo_img" class="form-control">
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-3">
              <div class="label-div">
                <label for="profile-logo">
                  profile logo
                </label>
              </div>
            </div>
            <div class="col-md-3">
              <div class="input-div">
                <input type="file" name="profile_img" id="profile_img" class="form-control">
              </div>
            </div>
          </div>
        </div>
      </div>-->

      <div style="overflow: auto">
        <div style="float: right">
          <button type="button" id="prevBtn" onclick="nextPrev(-1)">
            Previous
          </button>
          <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
          <button type="submit" class="btn btn-success" id="add" style="display: none">Update</button>
        </div>
      </div>

      <!-- Circles which indicates the steps of the form: -->
      <div style="text-align: center; margin-top: 40px">
        <span class="step"></span>
        <span class="step"></span>
        <span class="step"></span>
        <span class="step"></span>
        <span class="step"></span>
      </div>
      
      <%}%>
      <%} catch(Exception y){System.out.println("y >"+y);} finally{try{sr1.c.close();}catch(Exception y3){}}%>
    </form>
            
            
              <!-- company master form end -->
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- section end -->
    <!-- js -->
    <script src="./js/jquery.js"></script>
    <script src="./js/jquery-ui.min.js"></script>
    <script src="./js/bootstrap.bundle.min.js"></script>
    <script
      src="https://kit.fontawesome.com/d98415454e.js"
      crossorigin="anonymous"
    ></script>

    <script src="./js/javascript.js"></script>


    <script>
var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the current tab

function showTab(n) {
  // This function will display the specified tab of the form ...
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  // ... and fix the Previous/Next buttons:
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == x.length - 1) {
//    document.getElementById("nextBtn").innerHTML = "Submit";
    document.getElementById("nextBtn").style.display = "none";
    document.getElementById("add").style.display = "inline";
  } else {
      document.getElementById("nextBtn").style.display = "inline";
      document.getElementById("add").style.display = "none";
    document.getElementById("nextBtn").innerHTML = "Next";
  }
  // ... and run a function that displays the correct step indicator:
  fixStepIndicator(n);
}

function nextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  if (n == 1 && !validateForm()) return false;
  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  // if you have reached the end of the form... :
  if (currentTab >= x.length) {
    //...the form gets submitted:
    document.getElementById("company-master-form").submit();
    return false;
  }
  // Otherwise, display the correct tab:
  showTab(currentTab);
}

function validateForm() {
  // This function deals with validation of the form fields
  var x,
    y,a,
    z,
    i,
    valid = true;
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByTagName("input");
  z = x[currentTab].getElementsByTagName("select");
  
  a = x[currentTab].getElementsByClassName("chek");

//    A loop that checks every class chek in the current tab:
  for (i = 0; i < a.length; i++) {
    // If a field is empty...
    if (a[i].value == "") {
      // add an "invalid" class to the field:
      a[i].className += " invalid";
      // and set the current valid status to false:
      valid = false;
    }
  }
  
  
  
  // A loop that checks every input field in the current tab:
//  for (i = 0; i < y.length; i++) {
//    // If a field is empty...
//    if (y[i].value == "") {
//      // add an "invalid" class to the field:
//      y[i].className += " invalid";
//      // and set the current valid status to false:
//      valid = false;
//    }
//  }

  // select
  // for (i = 0; i < z.length; i++) {
  //   // If a field is empty...
  //   if (z[i].value == "") {
  //     // add an "invalid" class to the field:
  //     z[i].className += " invalid";
  //     // and set the current valid status to false:
  //     valid = false;
  //   }
  // }
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
    document.getElementsByClassName("step")[currentTab].className += " finish";
  }
  return valid; // return the valid status
}

function fixStepIndicator(n) {
  // This function removes the "active" class of all steps...
  var i,
    x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }
  //... and adds the "active" class to the current step:
  x[n].className += " active";
}

    </script>

                  
                  
                  
                  
                  
                  
              </div>
            </div>  
          </div>            
       
                    <div class="ln_solid"></div>
<%--!    <div class="form-group">
                      <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <button type="submit" class="btn btn-primary">Cancel</button>
                        <button type="submit" class="btn btn-success">Submit</button>
                      </div>
                    </div>  --%>

          <div id="successMessage" class="col-md-6 col-md-offset-3 alert alert-success" style="display:none">      
         </div>

    
    <script>
        
        function printDiv()
{

  var divToPrint=document.getElementById('unit_details_add');

  var newWin=window.open('','Print-Window');

  newWin.document.open();

  newWin.document.write('<html><body onload="window.print()">'+divToPrint.innerHTML+'</body></html>');

  newWin.document.close();

  setTimeout(function(){newWin.close();},10);

}
        
        $("document").ready(function(){
           // alert('hello----------------------')
            var validationArrayRewardval;
            $('form#unit_details_add').submit(function () {
                  // alert('hello----------------------')
                var error_text = 0;
                validationArrayRewardval=[];
                $(".err-msg").hide();
                
                 var sr = $(this).find("#sr_no").val();
//                   alert("sr==============>"+sr);
               
               var sr_no = document.getElementById("sr"+sr).value;
//               alert("sr_no >>"+sr_no);
                
                 var Name = $(this).find("#Name").val();
                 //  alert("Name==============>"+Name);
                
                
                var unit = $(this).find("#unit").val();
                 //  alert("Name==============>"+Name);
                 
                   var qty = $(this).find("#qty").val();
                 //  alert("Name==============>"+Name);
                 
               var sell_price = $(this).find("#sell_price").val();
               var emp_per_update = $(this).find("#emp_per_update").val();

               

           
                if(error_text == 1){
                    $("#"+validationArrayRewardval[0]).focus();
                    return false;
                } else{
                    $.ajax({
                    type: "POST",
                    url: "Edit_stock",
                    data: {
                        
                        sr_no:sr_no,
                        Name:Name,
                        unit:unit,
                        qty:qty,
                        sell_price:sell_price,
                        emp_per_update:emp_per_update,
                        status:"edit"
                        
                         },
                        success: function(data){
                        $('#successMessage2').html('Updated Succesfully').delay(5000).fadeOut();
                        $('#successMessage2').show();
                        location.reload();
                        }
                    });
                    return false;
                }
            });
            
            
            $(".btn_edit").click(function(){
                var tr_id = this.id;
                //alert(tr_id);
                var tr = document.getElementById(tr_id);
                var td = tr.getElementsByTagName("td");
                     $("#unitid option").each(function () {
                        if ($(this).html() == td[0].innerHTML) {
                            $(this).attr("selected", "selected");
                            return;
                        }
                    });
                  //  $("#Designation").val(td[0].innerHTML);
                  //  alert(td[0]);
                    
                   $("#sr_no").val(td[0].innerHTML);
                   $("#Name").val(td[1].innerHTML);
                   $("#qty").val(td[2].innerHTML);
                   $("#unit").val(td[3].innerHTML);
                   $("#sell_price").val(td[4].innerHTML.split(" ")[1]);
                   $("#emp_per_update").val(td[5].innerHTML.split(" ")[0]);
            });
            
        
            
        $(".deleteUnit").click(function(){
                
               var result = confirm("Want to delete?");
                var sr_no = $(this).val();//alert(deleteid);
                var status="delete"
                if (result) {
                    $.ajax({
                    type: "POST",
                    url: "Edit_stock",
                    data: {
                               sr_no:sr_no,
                               status:status
                        },
                        success: function(data){
                        $('#successMessage2').html('Delete Succesfully').delay(5000).fadeOut();
                        $('#successMassage2').show();
                        alert("Deleted Successfully");
                        location.reload();
                        }
                    });
                    return false;
                }
                
            });
            
            
        });
        
          function add(){
//              alert("inn add function");
              var mater= $("#add_material").val();
               var Sid=<%=seller_id%>;
               var unit= document.getElementById("unit_select").value;
//              alert("unit >>"+unit);
                var sell_price =document.getElementById("sell_price_add").value;
                var emp_per =document.getElementById("emp_per").value;
              if(mater == ""){
                  alert("enter Product Name");
              }
              else{
               $.ajax({
                    type:"POST",
                     url:"add_materials",
                           data:{ 
                             mater:mater,
                             unit:unit,
                             Sid:Sid,
                             sell_price:sell_price,
                             emp_per:emp_per
                           },
                           success:function(data)
                           {
                               //alert(data);
                               $('#successMessage').html('Data inserted successfully').delay(5000).fadeOut();
                               $('#successMessage').show();
                               $('#add_material').val("");
//                               data-dismiss="modal";
                               location.reload();
                           }
                       });
                   }
          }
    </script>
<jsp:include page="templates/footer.html" />