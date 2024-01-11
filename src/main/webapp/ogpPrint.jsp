<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"
	errorPage="eror.jsp"%>
<%@page import="org.joda.time.LocalDate"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.DataService"%>
<!DOCTYPE html>
<html lang="en">

<%
Boolean sesname = (Boolean) session.getAttribute("session_name");
String uname = (String) session.getAttribute("uname");
if (!sesname) {
	System.out.println("" + uname);

} else {
	response.sendRedirect("/login.jsp");
}
%>
<%
ResultSet rs, rs2, data1, data2;
DataService ds1;
ArrayList ar;
Iterator ity;
Object o1 = null;
%>
<%
DataService sr1;
int x;
Object aval, bval;
ResultSetMetaData rsmd;
String Vname, Vadrs, Vgst;
%>
<head>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Poppins', sans-serif;
        }

        .pocontainer {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

        .podetailscont {
            width: 100%;
        }

        .table-wrapper,
        tr,
        td {
            border: 1px solid black;
            border-collapse: collapse;
            border-style: dashed;
        }

        .table-wrapper {
            width: 100%;
        }


        .table-wrapper1 {
            width: 100%;
            border: none;
        }

        .secondtable {
            align-items: center;
        }

        .opg {
            width: 5%;
        }
    </style>
   

    <script>
        function printPage() {
            window.print();
        }
    </script>

</head>

<body>
 <%
String ogpno = request.getParameter("ogpno");

sr1 = new DataService();
rs = sr1.viewogpByogpno(ogpno);

if (rs.next()) {
%>
    <form>
        <div class="pocontainer">
            <div class="podetailscont">
                <div>
                    <table class="table-wrapper1">
                        <thead>
                            <tr style="width: 100%;">
                                <div style="margin-top: 20px;">
                                <th style="text-align: start; width: 35%; padding-top: 80px;">
                                    <p style="margin-left: 15px; margin-bottom: 20px; margin-top: 30px;">OPG.NO :
                                        <label style="display: inline-block; width: 24px;" id="opg"></label>
                                        	<input name="ogpno" required type="text"
												value="<%=rs.getString("OgpNo")%>" class="form-control"
												id="ogpno" readonly>
												
                                    </p>
                                    <p style="margin-left: 15px; font-size: 15px; margin-bottom: 10px;">Please pass out the following issue to :
                                        <label style="width: 100px; text-align:left;" id="issue" ></label>
                                        <%=rs.getObject("Cname")%>
                                    </p>
                                     
                                    <p style="margin-left: 15px;">
                                  Mode of Transport :   
                               
                                 <%=rs.getObject("modeOfTransport")%>
                                   </label>
                               <%-- <input type="text" class="form-control" style="display: inline-block; width: calc(100% - 240px);" value="<%=rs.getObject("modeOfTransport")%>"> --%>
                                 </p>

                                </th>
                            </div>
                                
                                <th style="text-align: center; align-items: center; width: 40%;">
                                    <h1>Candico ( I ) Limted</h1>
                                    <h1>OUTWARD GATE PASS</h1>
                                    <p style="margin-top: 25px;"><%=rs.getObject("Cname")%></p>
                                    <p style="margin-top: 25px;">NON RETURNABLE</p>
                                </th>
                                <th style="text-align: end; width: 30%;">
                                    Date: <input type="date-text" class="form-control" placeholder="dd/mm/yyyy" value = "<%=rs.getObject("ogpdate")%>"  >
                                </th>
                            </tr>
                        </thead>
                    </table>
                </div>
               
                
                <div class="secondtable" style="margin-top: 50px;">
                    <table class="table-wrapper">
                    <%
                              try{
                              sr1=new DataService();
                              
                              rs2=sr1.ogp_itemlist(ogpno);
                             
                              
                              
                              rsmd=rs2.getMetaData();
                              x=rsmd.getColumnCount();
                            %>
                        <thead>
                            <tr style="height: 50px;">
                                    <td style="font-weight: bold;">Item Code</td>
                                    <td style="font-weight: bold;">Item Name</td>
                                    <td style="font-weight: bold;">UOM</td>
                                    <td style="font-weight: bold;">Sent Qty</td>
                                    <td style="font-weight: bold;">Remarks</td>
                                    <td style="font-weight: bold;">Receiver's Signature</td>
                            </tr>
                        </thead>
                        <%
								int i = 0;
									
									while (rs2.next()) {
							%>
                        <tr id="<%=i%>" style="height: 50px;">
							     <td><%=rs2.getObject("itemId")%></td>
							    <td><%=rs2.getObject("iName")%></td>
								<td><%=rs2.getObject("unit")%></td>
								<td><%=rs2.getObject("itemQty")%></td>
								<td><%=rs.getObject("Remark")%></td>
								
								<td> </td>
									
									<tr>
									<%
								i++;
									}
							%>
                    </table>
                </div>
                     
            </div>
            
        </div>
        <%
				} catch (Exception y) {
				} finally {
					try {
						
					} catch (Exception y3) {
					}
				}
			%>
        <p style="padding: 10px;">Purpose: <%=rs.getObject("Purpose")%></p>
        <div style="display: flex; justify-content: space-between; padding: 10px;">
            <p>Store Incharge</p>
            <p>Authorised Incharge</p>
        </div>
        <div style="display: flex; justify-content: center;">
            <button onclick="printPage()" value="" class="info btn btn-info btn_info">Print</button>
        </div>
        
    </form>
   
            <%
   }         
%>
</body>


</html>
