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
<%! ResultSet rs;DataService ds1;ArrayList ar;Iterator ity;Object o1=null; %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    .err-msg{display:none; color:#ff0000;}
    
    
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

.input-container {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  width: 100%;
  margin-bottom: 15px;
}

.icon {
  padding: 10px;
  background: dodgerblue;
  color: white;
  min-width: 50px;
  text-align: center;
}

.input-field {
  width: 100%;
  padding: 10px;
  outline: none;
  color: black;
}

.input-field:focus {
  border: 2px solid dodgerblue;
}

/* Set a style for the submit button */
.btn {
  background-color: dodgerblue;
  color: white;
  padding: 15px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.btn:hover {
  opacity: 1;
}
.spinner {
    position: fixed;
    text-align:center;
    z-index:1234;
    overflow: auto;
    width: 100%;
    height: 100%;
}
.gif{
    top: 40%;
    position: relative;
}
.select2{
    color: black;
}
</style>
<%!String S_tyep,seller_id;%>
<%
// S_tyep="DryFruits Store";
 seller_id=(String)session.getAttribute("seller_id"); 
%>

      <!-- page content -->
      <div class="right_col" role="main">
        <div class="">

          <div class="page-title">
            <div class="title_left">
                <h3 style="color:black;">Add MATERIALS</h3>
            </div>
          </div>
          <div class="clearfix"></div>
          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2 style="color:black;">Add MATERIALS</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    
                    <div id="successMessage" class="col-md-6 col-md-offset-3 alert alert-success" style="display:none"></div>                       
                    <div class="clearfix"></div>
                  
                    <form action="" id="Materials_add" style="max-width:500px;margin:auto">
  <!--<h2>Register Form</h2>-->
  
  <div class="input-container">
    <i class="fa fa-address-card-o icon"></i>
    <input class="input-field" type="text" placeholder="Materials name" id="name" name="name">
  </div>
  
   <div class="input-container">
    <i class="fa fa-envelope icon"></i>
    <select class="input-field select2"  placeholder="UNIT name" id="unit_select" name="unit_select">
        <%
            System.out.println("in gate page form");
            ds1= new DataService();
            rs=ds1.unit_list();
            while(rs.next()){
             %>
             <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
             <%}%>
    </select>
    <button type="button"  data-toggle="modal" data-target="#unit_model" style="background-color:#1e90ff;color:white; margin: initial">+</button>
  </div>
    
    <div class="input-container">
    <i class="fa fa-envelope icon"></i>
    <select class="input-field select2"  placeholder="SElect Material type" id="type_select" name="type_select">
        <!--<option>Select Material type</option>-->
        <%
            System.out.println("in gate page form");
            ds1= new DataService();
            rs=ds1.materials_type_list();
            while(rs.next()){
             %>
             <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
             <%}%>
    </select>
    <button type="button"  data-toggle="modal" data-target="#type_model" style="background-color:#1e90ff;color:white; margin: initial">+</button>
  </div>
  
<!--  <div class="input-container">
    <i class="fa fa-percent icon"></i>
    <input class="input-field" type="number" placeholder="Percent" id="per" name="per">
  </div>-->
  
<!--  <div class="input-container ">
    <i class="fa fa-user icon"></i>
    <div style="margin: 2%">
        <input class="" type="radio"  name="gender" value="Male" checked="">&nbsp;Male &nbsp;&nbsp;&nbsp;
        <input class="" type="radio"  name="gender" value="Female">&nbsp;Female
    </div>
  </div>-->
  


  <div class="input-container">
    <i class="fa fa-mobile-phone icon"></i>
    <input class="input-field" type="text" placeholder="Basic Rate" id="basic_rate" name="basic_rate" onkeyup="calculate()">
  </div>
  
  <div class="input-container">
    <i class="fa fa-calendar icon"></i>
    <input class="input-field" type="text" id="gst" name="gst" placeholder="GST %"  onkeyup="calculate()">
  </div>
  
  <div class="input-container">
    <i class="fa fa-address-card-o icon"></i>
    <input class="input-field" type="text" readonly="" placeholder="Total Rate" id="total_rate" name="total_rate">
  </div>
    
<!--    <div class="input-container">
    <i class="fa fa-calendar icon"></i>
    <input class="input-field" type="text" id="sell_price" name="sell_price" placeholder="Selling Price" >
  </div>-->

  <button type="submit" class="btn">ADD MATERIALS </button>
</form>
   
               
                   <!--material type Modal -->
  <div class="modal fade" id="type_model" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">add new Material Type  </h4>
        </div>
          <form>
              <div class="form-group">
       <div class="x_content">
        <div class="modal-body">
            <div class="form-group col-md-12">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name" style="color:black; ">Type:</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="type" name="type" required="" class="form-control col-md-7 col-xs-12">
                      </div>
            </div>
            
       </div>
        </div>
        </div>
        <div class="modal-footer">
            <center>
                <button type="button" class="btn btn-success" onclick="add_type();">Add</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </center>
        </div>
          </form>
      </div>
      
    </div>
  </div>
                  
     
                        <!--material Modal -->
  <div class="modal fade" id="unit_model" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">add new UNIT  </h4>
        </div>
          <form>
              <div class="form-group">
       <div class="x_content">
        <div class="modal-body">
            <div class="form-group col-md-12">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name" style="color:black; ">UNIT:</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="unit" name="unit" required="" class="form-control col-md-7 col-xs-12">
                      </div>
            </div>
            
       </div>
        </div>
        </div>
        <div class="modal-footer">
            <center>
                <button type="button" class="btn btn-success" onclick="add_unit();">Add</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </center>
        </div>
          </form>
      </div>
      
    </div>
  </div>
                       <!--supplier Modal -->
  <div class="modal fade" id="supplier_model" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">add new Supplier</h4>
        </div>
          
      <div class="form-group">
       <div class="x_content">
        <div class="form-group">
        <div class="modal-body">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name" style="color:black; ">Supplier Name:</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="suplyr_name" name="suplyr_name" required="" class="form-control col-md-7 col-xs-12">
                      </div>
       </div>
        </div>
        <div class="form-group">
        <div class="modal-body">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name" style="color:black; ">Mobile Number:</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="suplyr_no" name="suplyr_no" required=""  class="form-control col-md-7 col-xs-12">
                      </div>
        </div>
       </div>
           <div class="form-group" id="Supplier_succ">
               
           </div>
        </div>
        </div>
        <div class="modal-footer">
            <center>
                <button type="button" class="btn btn-success" onclick="add_supplier();">Add</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </center>
        </div>
      </div>
      
    </div>
  </div>
                  
                    
                </div>
              </div>
            </div>
          </div>
        </div>
          
          <script type="text/javascript">
           var loadFile = function(event,i) {
	var image = document.getElementById('output'+i);
	image.src = URL.createObjectURL(event.target.files[0]);
     };
     
            $(document).ready(function () {
                $(".select2").select2();
                    var validationArrayRewardval;
                    $('form#Materials_add').submit(function () {
                        var error_text = 0;
                        validationArrayRewardval=[];
                        $(".err-msg").hide();
                        
                        var name = $(this).find("[name='name']").val();
                        
                        if (name == '') {
                            $("#err-name").show();				
                            validationArrayRewardval.push('name');
                            error_text = 1;
                        }
                        
                        var unit_select = $(this).find("[name='unit_select']").val();   
                         
                        if (unit_select == '') {
                            $("#err-unit_select").show();				
                            validationArrayRewardval.push('unit_select');
                            error_text = 1;
                        }
                        
                        var type_select = $(this).find("[name='type_select']").val();   
                         
                        if (type_select == '') {
                            $("#err-type_select").show();				
                            validationArrayRewardval.push('type_select');
                            error_text = 1;
                        }
                      
                        var basic_rate = $(this).find("[name='basic_rate']").val();
                         
                        if (basic_rate == '') {
                            $("#err-basic_rate").show();				
                            validationArrayRewardval.push('basic_rate');
                            error_text = 1;
                        }
                        
                        var gst = $(this).find("[name='gst']").val();
                        if (gst == '') {
                            $("#err-gst").show();				
                            validationArrayRewardval.push('gst');
                            error_text = 1;
                        }
                        
                        var total_rate = $(this).find("[name='total_rate']").val();
                        if (total_rate == '') {
                            $("#err-total_rate").show();				
                            validationArrayRewardval.push('total_rate');
                            error_text = 1;
                        }
                        
                        
                        
                      
                        if(error_text == 1){
                            $("#"+validationArrayRewardval[0]).focus();
                            return false;
                        }
                        else{
                            $("#spinner").show(); 
                            $.ajax({
                                type: "POST",
                                url: "Insert_Material_Servlet",
                                data: {
                                   name:name,
                                   unit_select:unit_select,
                                   type_select:type_select,
                                   basic_rate:basic_rate,
                                   gst:gst,
                                   total_rate:total_rate
                                   
                                },
                                success: function(data){
                                    $('#successMessage').html('Stock Added Succesfully').delay(5000).fadeOut();
                                    $('#successMessage').show();
//                                       document.getElementById("admin_add").reset();
                                          $("#spinner").hide(); 
                                    location.reload();
                                }
                            });
                            return false;
                        }
                                                
                    });
                });
                
                 function add_unit(){
//              alert("inn add function");
               var unit= document.getElementById("unit").value;
//              alert("unit >>"+unit);
                
              if(unit == ""){
                  alert("enter unit Name");
              }
              else{
               $.ajax({
                    type:"POST",
                     url:"add_unit",
                           data:{ 
                             unit:unit,
                             table_name:"material_units"
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
          
              function add_type(){
//              alert("inn add function");
               var type= document.getElementById("type").value;
//              alert("unit >>"+unit);
                
              if(type == ""){
                  alert("enter type Name");
              }
              else{
               $.ajax({
                    type:"POST",
                     url:"add_type",
                           data:{ 
                             type:type,
                             table_name:"material_type"
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
          
           function add_supplier(){
//              alert("inn add function");
              var suplyr_name= $("#suplyr_name").val();
//              alert("mater >>"+mater);
                var suplyr_no= $("#suplyr_no").val();
//              alert("mater >>"+mater);
              
               if(suplyr_name!="" && suplyr_no!=""){
                   
                     $.ajax({
                    type:"POST",
                     url:"add_supplier",
                           data:{ 
                             suplyr_no:suplyr_no,
                             suplyr_name:suplyr_name
                           },
                           success:function(data)
                           {
                               //alert(data);
                               $('#successMessage').html('Data inserted successfully').delay(5000).fadeOut();
                               $('#successMessage').show();
                               $('#suplyr_name').val("");
                               $('#suplyr_no').val("");
                               $('#Supplier_succ').innerhtml="Data inserted successfully";
//                               data-dismiss="modal";
                                location.reload();
                           }
                       });
                  
              }
              else{
              alert("enter suplier Name and Mobile Number");
             
                   }
                 
          }
          
          function calculate(){
//              alert("in calculate");
              var basic=document.getElementById("basic_rate").value;
              var gst=document.getElementById("gst").value;
              
              var total_rate=(Number(basic)/100)*Number(gst);
              document.getElementById("total_rate").value=Number(total_rate)+Number(basic);
          }
          </script>
          

<jsp:include page="templates/footer.html" />