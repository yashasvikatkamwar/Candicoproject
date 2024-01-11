<%@page contentType="text/html" pageEncoding="UTF-8"
	errorPage="eror.jsp"%>
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


<style>
    .err-msg{display:none; color:#ff0000;}
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
</style>

<div id="spinner" class="spinner" style="display: none">
    <img id="img-spinner"  class="gif" src="images/spiner.gif" alt="Loading"/>
</div>
      <!-- page content -->
      <div class="right_col" role="main">
        <div class="">

          <div class="page-title">
            <div class="title_left">
              <h3 style="color:black;">Add Admin Users</h3>
            </div>
          </div>
          <div class="clearfix"></div>
          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2 style="color:black;">Add Admin Users</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    
                    <div id="successMessage" class="col-md-6 col-md-offset-3 alert alert-success" style="display:none"></div>                       
                    <div class="clearfix"></div>
                  <br />
                  <form id="admin_add" method="post" action="" data-parsley-validate class="form-horizontal form-label-left">
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" style="color:black;">Username <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="username" name="username" required="required" class="form-control col-md-7 col-xs-12">
                        <div id="err-uname" class="err-msg">Please enter username</div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" style="color:black;">Password <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="password" id="password" name="password" required="required" class="form-control col-md-7 col-xs-12">
                        <div id="err-pass" class="err-msg">Please enter password</div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="a" style="color:black;">Admin Full Name<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="admin_name" name="admin_name" required="required" class="form-control col-md-7 col-xs-12">
                        <div id="err-fname" class="err-msg">Please enter Full Name</div>
                      </div>
                    </div>
                      
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" style="color:black;">Admin Roles</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                          <select id="roles" required="required" name="roles" class="form-control">
                            <option value="" style="color:black;">Select Roles</option>
                            <option value="admin" style="color:black;">Super Admin</option>
                            <option value="PO" style="color:black;">PO User</option>
                            <option value="GRN" style="color:black;">GRN User</option>
                          </select>
                        <div id="err-roles" class="err-msg" style="color:black;">Please select roles</div>
                      </div>
                    </div>
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button type="submit" class="btn btn-success">Add Admin</button>
                          <button type="button" class="btn btn-default" data-dismiss="modal" style="margin-bottom: 0;"><a href="index.jsp"> Close</a></button>
                      </div>
                    </div>

                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
          
          <script type="text/javascript">
              $(document).ready(function () {
                    var validationArrayRewardval;
                    $('form#admin_add').submit(function () {
                        var error_text = 0;
                        validationArrayRewardval=[];
                        $(".err-msg").hide();
                        var username = $(this).find("[name='username']").val();
                        
                        if (username == '') {
                            $("#err-uname").show();				
                            validationArrayRewardval.push('username');
                            error_text = 1;
                        }
                        
                        var password = $(this).find("[name='password']").val();   
                         
                        if (password == '') {
                            $("#err-pass").show();				
                            validationArrayRewardval.push('password');
                            error_text = 1;
                        }
                        
                        var admin_name = $(this).find("[name='admin_name']").val();
                         
                        if (admin_name == '') {
                            $("#err-fname").show();				
                            validationArrayRewardval.push('admin_name');
                            error_text = 1;
                        }
                        var roles = $(this).find("[name='roles']").val();
                        
                        if (roles == '') {
                            $("#err-roles").show();				
                            validationArrayRewardval.push('roles');
                            error_text = 1;
                        }
                        
                        if(error_text == 1){
                            $("#"+validationArrayRewardval[0]).focus();
                            return false;
                        }else{
                            $("#spinner").show();
                            $.ajax({
                                type: "POST",
                                url: "Insert_Admin_Servlet",
                                data: {
                                    username:username,
                                    password:password,
                                   admin_name:admin_name,
                                    roles:roles
                                },
                                success: function(data){
                                    $("#spinner").hide();
                                    $('#successMessage').html('Admin Added Succesfully').delay(5000).fadeOut();
                                    $('#successMessage').show();
                                       document.getElementById("admin_add").reset();
                                          
//                                    location.reload();
                                }
                            });
                            return false;
                        }
                                                
                    });
                });
          </script>
          
<jsp:include page="templates/footer.html" />
