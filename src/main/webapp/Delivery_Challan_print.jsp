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
ResultSet rs,rs2, data, data1, data2;
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
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title></title>
</head>

<body>

  <div style="border: 1px solid black; ">

    <style>
      table {
        border-collapse: collapse;
        border: 1px solid black;
        width: 100%;
        height: 100%;
        font-size: 12px;
      }

      th,
      td {
        border: none;
        padding: 6px;
        text-align: center;
        border-top: none;
      }

      .seven-column {
        border-left: 2px solid black;
        border-bottom: 2px solid black;
        border-top: 2px solid black;
      }
    </style>
    

  </div>
  <%
String delivery_challan_no = request.getParameter("delivery_challan_no");

sr1 = new DataService();
rs = sr1.viewdeliverybyno(delivery_challan_no);

if (rs.next()) {
%>
<div>
 
    <form action="hello1">

      <h3 style="text-align: center;">Delivery Challan</h3>

      <table>
        <tr>
          <thead>
            <th>State code</th>
            <th> <input type="text "  value ="<%=rs.getString("state_code")%>"/></th>
            <th>State code</th>
            <th> <input type="text"  value ="<%=rs.getString("state_code")%>"/></th>

          </thead>
        </tr>

        <tr>
          <th>State Name</th>
          <th><input type="text" placeholder="state Name"  value ="<%=rs.getString("state_name")%>"/></th>
          <th>State Name</th>
          <th><input type="text" placeholder="state Name" value ="<%=rs.getString("state_name")%>"></th>
        </tr>

        <tr>
          <th>GSTIn/Unique ID</th>
          <td><input type="text" ></td>
          <th>GSTIn/Unique ID</th>
          <th> <input type="text"></th>
        </tr>

        <tr>
          <th>D.L.No</th>
          <td><input type="text" placeholder="No"  value ="<%=rs.getString("d_l_no")%>"></td>
          <th>D.L.No.</th>
          <td><input type="text" placeholder="No" value ="<%=rs.getString("d_l_no")%>"></td>
        </tr>

        <tr>
          <th>D.L.State</th>
          <td><input type="text" placeholder="State" value ="<%=rs.getString("d_l_state")%>"></td>
          <th>D.L.State</th>
          <td><input type="text" placeholder="State" value ="<%=rs.getString("d_l_state")%>"></td>
        </tr>

        <tr>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>

        <tr>
          <th>Ship to</th>
          <th></th>
          <th>Ship form</th>
          <th></th>
        </tr>

        <tr>
          <th>value ="<%=rs.getString("Cname")%>"</th>
          <th></th>
          <th>Candico (I) Limited</th>
          <th></th>
        </tr>

        <tr>
          <th>value ="<%=rs.getString("com_address")%>"</th>
          <td></td>
          <th>On A/c cipla healthcare Itd</th>
          <td></td>
        </tr>

        <tr>
          <th>A/c cipla health Itd</th>
          <td></td>
          <th>M 32-38, M.I.D.C,HINGNA ROAD, NAGPUR-440016</th>
          <td></td>
        </tr>

        <tr>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>

        <tr>
          <th>State Code</th>
          <td><input type="text" value ="<%=rs.getString("state_code")%>"></td>
          <th>State Code</th>
          <td><input type="text" value ="<%=rs.getString("state_code")%>"></td>
        </tr>

        <tr>
          <th>State Name</th>
          <th><input type="text" placeholder="State Name " ></th>
          <th>State Name</th>
          <th><input type="text" placeholder="State Name"></th>
        </tr>

        <tr>
          <th>GSTin/Unique ID</th>
          <td><input type="text" placeholder="ID"></td>
          <th>GSTin/Unique</th>
          <th><input type="text" placeholder="ID"> </th>
        </tr>

        <tr>
          <th>D.D.L.No.</th>
          <th><input type="text"></th>
          <th>D.L.No.</th>
          <td><input type="text"></td>
        </tr>

        <tr>
          <th>D.L.State</th>
          <th><input type="text"></td>
            <th>D.L.No.< /th>
          <td></td>
        </tr>

        <tr>
          <th>Delivery Challan No.</th>
          <th><input type="text" placeholder="Challan No"  value ="<%=rs.getString("delivery_challan_no")%>"></th>
          <td></td>
          <td></td>
        </tr>

        <tr>
          <th>Delivery Challan Date.</th>
          <td><input type="date"  value ="<%=rs.getString("delivery_challan_date")%>"></td>
          <th>E.Way Bill</th>
          <td><input type="text"></td>
        </tr>

        <tr>
          <th>Outbound Delivery No.</th>
          <td></td>
          <th>E.Way Bill Date</th>
          <td><input type="date"></td>
        </tr>

        <tr>
          <th>Outbound Delivery Date</th>
          <td><input type="date"></td>
          <th>Mode of Transport</th>
          <th>By Road</th>
        </tr>

        <tr>
          <th>L.R No'</th>
          <td><input type="text" placeholder="No" value ="<%=rs.getString("l_r_no")%>"></td>
          <td></td>
          <td></td>
        </tr>

        <tr>
          <th>L.R. Date:</th>
          <td><input type="date" value ="<%=rs.getString("l_r_date")%>"></td>
          <td></td>
          <td></td>
        </tr>

        <tr>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>

        <tr>
          <th>Vehicle No.</th>
          <td> <input type="text" placeholder="No" value ="<%=rs.getString("vehicle_no")%>"></td>
          <td></td>
          <td></td>
        </tr>

        <tr>
          <th>Transporter Name</th>
          
          <td><%=rs.getString("transporter_name")%></td>
          <td></td>
        </tr>

        <tr>
          <th class="six_column">Remark :</th>
          <td class="six_column"> <input type="text"></td>
          <td class="six_column"></td>
          <td class="six_column"></td>
        </tr>

      </table>


      <div class="table-container" style="margin-top: 50px;">
        <table class="po6table">
          <%
                              try{
                              sr1=new DataService();
                              
                              rs2=sr1.delivery_itemlistbyno(delivery_challan_no);
                             
                              
                              
                              rsmd=rs2.getMetaData();
                              x=rsmd.getColumnCount();
                            %>
          <thead>
          
            <tr>
            
               <th class="seven-column">Itemcode</th>
              <th class="seven-column">ItemName</th>
              <th class="seven-column">HSN Code/SAC Code</th>
              <th class="seven-column">CIMS Batch No</th>
              <th class="seven-column">Quantity</th>
              <th class="seven-column">Unit</th>
              <th class="seven-column">Unit Price in INR</th>
              <th class="seven-column">Taxable Value in INR</th>
            </tr>
          </thead>
          <%
								int i = 0;
									
									while (rs2.next()) {
							%>
          <tbody>
            <tr>
              <td class="seven-column"><input type="text" style="width: 60px;"  <%=rs2.getString("delivery_challan_itemcol")%>></td>
              <td class="seven-column"><input type="text" style="width: 20px;" <%=rs2.getString("item_name")%>></td>
              <td class="seven-column"><input type="text" style="width: 40px;" <%=rs2.getString("hsn_code")%>></td>
              <td class="seven-column"><input type="text" style="width: 20px;" <%=rs2.getString("batch_no")%>></td>
              <td class="seven-column"><input type="text" style="width: 20px;" <%=rs2.getString("quantity")%>></td>
              <td class="seven-column"><input type="text" style="width: 40px;" <%=rs2.getString("unit")%>></td>
                <td class="seven-column"><input type="text" style="width: 40px;" <%=rs2.getString("price_per_unit")%>></td>
                  <td class="seven-column"><input type="text" style="width: 40px;" <%=rs2.getString("tax_value")%>></td>
                 
            </tr>
            	 <%
								i++;
									}
							%>
							<%
				} catch (Exception y) {
				} 
			%>
							
            <tr>
            
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <th>TOTAL</th>
              <td class="seven-column"><input type="text"></td>
            </tr>

            <tr>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <th>IGST</th>
              <th>18.0%</th>
              <td class="seven-column"><input type="text"></td>
            </tr>

            <tr>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <th>CGST</th>
              <th>9.0%</th>
              <td class="seven-column"><input type="text"></td>
            </tr>

            <tr>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <th>SGST</th>
              <th>9.0%</th>
              <td class="seven-column"><input type="text"></td>
            </tr>

            <tr>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <th>CGST</th>
              <th>2.5%</th>
              <td class="seven-column"><input type="text"></td>

            </tr>

            <tr>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <th>Comp.Cess</th>
              <th>0%</th>
              <td class="seven-column"><input type="text">
              </td>

            </tr>

            <tr>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <th>Total Amount</th>
              <td></td>
              <td class="seven-column"> <input type="text">
              </td>

            </tr>

            <tr>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>


            </tr>

            <tr>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <th>For, Candico(I) Pvt Ltd</th>

            </tr>

            <tr>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>

            </tr>

            <tr>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>

            </tr>

            <tr>
              <td></td>
              <td></td>
              <td></td>
              <td><button onclick="printPage()" value="" class="info btn btn-info btn_info">Print
                </button></td>
              <td></td>
              <td></td>
              <td>Authorized Signatory</td>

            </tr>

            <tr>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
          </tbody>
         
         
        </table>
        

      </div>
       


    </form>
    
  </div>

      <%
}
%>

</body>

<script>


  function printPage() {
    window.print();
  }
</script>

</html>