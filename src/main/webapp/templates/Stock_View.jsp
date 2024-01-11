<%-- 
    Document   : color_view
    Created on : Oct 4, 2019, 12:23:10 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" import="SecurityBean.*" errorPage="eror.jsp"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.DataService"%>
<%!ResultSet rq,data,data2,data3,data4,data5,re,selectData,rs2;
ResultSetMetaData rsmd;
Object ob;
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
        
<!-- page content -->
      <div class="right_col" role="main">
          
        <div class="">
          <div class="page-title">
            <div class="title_left">
              <h3 style="color:black;">
                  Stocks
                </h3>
            </div>
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
                  <h2 style="color:black;">Product Stock Details</h2>
                  
                  <div class="clearfix"></div>
                </div>
                  <button type="button" class="btn  btn-lg btn-xs fix_back_color" data-toggle="modal" data-target="#myModal" >add new Product</button>
                <div class="x_content">
                    <div class="text-right">
                           
                           <%
                try{
                sr1=new DataService();
               // rs2=sr1.stock_view(seller_id);
                //ArrayList rsa=new ArrayList();
                //data=sr1.viewUnitDetails(); 

                rsmd=rs2.getMetaData();
                x=rsmd.getColumnCount();
            %>    
                             
                        <input type="button" class="DTTT_button" onclick="tableToExcel('example', 'W3C Example Table')" value="Export to Excel">
                    </div>
                    <table id="example" class="table table-striped table-bordered responsive-utilities jambo_table " >
                    <thead>
                      <tr class="headings fix_back_color" >
                       
                        <th >Sr NO</th>
                        <th >Name</th>
                        <th >Quantity</th>
                         <th >Unit</th>  
                         <th >Selling Price</th> 
                         <th >Employee Percent</th> 
                      
                        <th  ><span class="nobr">Action</span></th>
                      </tr>
                    </thead>
                    <%int i=0;
                      //boolean t=data.next();
                      // out.println(" t====================>"+t);
                       while(rs2.next()){%>
                       <tr id="<%=i%>">
                           <td><%=i+1%></td>
                       <input type="hidden" id="sr<%=i+1%>"  value="<%=rs2.getObject(1)%>">
                            <td><%=rs2.getObject(2)%></td>
                            <td><%=rs2.getObject(4)%></td>
                            <td><%=rs2.getObject(3)%></td>
                            <td>Rs. <%=rs2.getObject(6)%></td>
                            <td><%=rs2.getObject(7)%> %</td>
                            
                           <%-- <td><%=data.getObject(65)%></td>--%>
                            
                           <td class=" last" style="display:inline-block; width:100%; box-sizing: border-box;">
                                   <button class="btn btn-primary btn-xs btn_edit" data-toggle="modal" data-target="#unit_guard_details" id="<%=i++%>" href="#">Edit</button>

                                <!--<button class="btn btn-warning btn-xs" name="id_name" onclick="getId(this.id);" value="row_a<%=i-1%>" id="row_a<%=i-1%>">View Sub Units</button>-->
                               <%-- <a class="btn btn-warning btn-xs" href="view_subunit_details.jsp?unitid=<%=aval%>&unitname=<%=bval%>">View Sub Units</a>
                               --%>                 <button value="<%=rs2.getObject(1)%>" class="deleteUnit btn btn-danger btn-xs btn_delete" >Delete</button>
          
                            </td>
                        </tr>
                    <%}%>

                    

                  </table>
                </div>
              </div>
            </div>
                    
                    <script>
                        function getId(element) {
                           var id_value = document.getElementById(element).value;
                           
                           return(id_value);
                        }
                    </script>        
            
            <br />
            <br />
            <br />
 </form>
                    <div class="ln_solid"></div>
<%--!    <div class="form-group">
                      <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <button type="submit" class="btn btn-primary">Cancel</button>
                        <button type="submit" class="btn btn-success">Submit</button>
                      </div>
                    </div>  --%>

          <div id="successMessage" class="col-md-6 col-md-offset-3 alert alert-success" style="display:none">      
                    
          </div>
          <%} catch(Exception y){} finally{try{sr1.c.close();}catch(Exception y3){}}%>
        </div>

        
   <div class="modal fade edit_recruit_modal" id="unit_guard_details" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close sub_unit_details_add_close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title">Edit Details</h4>
            </div>

                  <form id="unit_details_add"  action="" class="form-horizontal form-label-left">
            <div class="modal-body">
                <div id="successMessage2" class="col-md-12 alert alert-success successMessage2" style="display:none">
                    <span> Updated successfully</span>
                </div>              
                        
                <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">Sr No<span class="required">*</span></label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="sr_no" name="sr_no" required="required" class="form-control col-md-7 col-xs-12" readonly="">
                        <div id="err_sr_no" class="err-msg">Please enter Sr No</div>
                      </div>
                   </div>
                
                
                <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">Name</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="Name" name="Name"  class="form-control col-md-7 col-xs-12" >
                        <div id="err_Name" class="err-msg">Please enter  Name</div>
                      </div>
                   </div>
                
             
                      <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">Unit:</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="unit" name="unit" readonly=""  class="form-control col-md-7 col-xs-12" >
                        <div id="err_Code" class="err-msg">Please enter unit</div>
                      </div>
                   </div>   
                      
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">Qty:</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="number" id="qty" name="qty"   class="form-control col-md-7 col-xs-12" >
                        <div id="err_Code" class="err-msg">Please enter Code</div>
                      </div>
                   </div>  
                
                <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">Selling Price:</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="number" id="sell_price" name="sell_price"   class="form-control col-md-7 col-xs-12" >
                        <div id="err_Code" class="err-msg">Please enter sell_price</div>
                      </div>
                   </div>  
                    
                <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">Employee Percent:</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="number" id="emp_per_update" name="emp_per_update"   class="form-control col-md-7 col-xs-12" >
                        <div id="err_Code" class="err-msg">Please enter emp_per_update</div>
                      </div>
                   </div>  
                    
            <div class="modal-footer">
                <button type="submit" class="btn btn-success ad_dtl_sbmt">Update</button>
              <button type="button" class="btn btn-default sub_unit_details_add_close" data-dismiss="modal" style="margin-bottom: 0;">Close</button>
              

            </div>
            </div>
            </form>
          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    
    <!--add material model-->

<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">add new Product</h4>
        </div>
          <form>
              <div class="form-group">
       <div class="x_content">
        <div class="modal-body">
            <div class="form-group col-md-12">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name" style="color:black; ">Product Name:</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="add_material" name="add_material" required="" class="form-control col-md-7 col-xs-12">
                      </div>
            </div>
            <div class="form-group col-md-12">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name" style="color:black; ">Unit:</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                          <select name="unit_select" id="unit_select" class=" form-control col-md-7 col-xs-12" required >
                             <optgroup label="Unit">
                             <option value="Piece">Piece</option>
                             <option value="Grams">Grams</option>
                             <option value="KG">KG</option>
                             <option value="Liter">Liter</option>
                                </optgroup>
                            </select>
                      </div>
            </div>
            <div class="form-group col-md-12">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name" style="color:black; ">Selling Price:</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="sell_price_add" name="sell_price_add" required="" class="form-control col-md-7 col-xs-12">
                      </div>
            </div>
              <div class="form-group col-md-12">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name" style="color:black; ">Employee percent:</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="emp_per" name="emp_per" required="" class="form-control col-md-7 col-xs-12">
                      </div>
               </div>
       </div>
        </div>
        </div>
        <div class="modal-footer">
            <center>
                <button type="button" class="btn btn-success" onclick="add();">Add</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </center>
        </div>
          </form>
      </div>
      
    </div>
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