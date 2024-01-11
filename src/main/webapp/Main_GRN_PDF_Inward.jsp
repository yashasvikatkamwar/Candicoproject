<%@page import="java.util.Locale"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
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
<%!ResultSet data, rs, rss, data1;
	DataService ds1;
	ArrayList ar;
	Iterator ity;
	Object o1 = null;
	DataService sr1;
	int x;
	Object aval, bval;
	ResultSetMetaData rsmd;
	String Vname, Vadrs, Vgst;
	Object Cid, Fdate, Tdate;%>
<%
	NumberFormat nf = NumberFormat.getNumberInstance(Locale.ENGLISH);
	DecimalFormat df = (DecimalFormat) nf;

	df.applyPattern("#0.00");
%>
<!DOCTYPE html>
<style>
h1, .h1, h2, .h2, h3, .h3 {
	margin-top: 1px;
	margin-bottom: 1px;
}

td {
	padding-left: 5px;
}

body {
	font-family: sans-serif;
	font-size: 10pt;
}

p {
	margin: 0pt;
}

table.items {
	border: 0.1mm solid #e7e7e7;
}

td {
	vertical-align: top;
}

.items td {
	border-left: 0.1mm solid #e7e7e7;
	border-right: 0.1mm solid #e7e7e7;
}

table thead td {
	text-align: center;
	border: 0.1mm solid #e7e7e7;
}

.items td.blanktotal {
	background-color: #EEEEEE;
	border: 0.1mm solid #e7e7e7;
	background-color: #FFFFFF;
	border: 0mm none #e7e7e7;
	border-top: 0.1mm solid #e7e7e7;
	border-right: 0.1mm solid #e7e7e7;
}

.items td.totals {
	text-align: right;
	border: 0.1mm solid #e7e7e7;
}

.items td.cost {
	text-align: "." center;
}

.grid-container {
	display: grid;
	grid-template-columns: auto auto auto auto;
	padding: 10px;
	font-size: 12px;
	font-weight: bold;
	color: black;
}
</style>
<html>
<div class="right_col" role="main">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3></h3>
			</div>
		</div>
		<div class="clearfix"></div>

		<div class="text-right">
			<input type="button" class="DTTT_button" onclick="createPDF()"
				id="btnExport" value="Export to PDF">

		</div>
		<div id="tab">

			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="x_panel">
						<div class="x_title">
							<h2></h2>
							<div class="clearfix"></div>
						</div>
						<div class="x_content" style="height: 1000px;">
							<br />

							<%
								String Gid = request.getParameter("Gid");
								System.out.println("Gid >" + Gid);

								String Cname = "";
								try {
									sr1 = new DataService();
									data = sr1.GRN_Details(Gid);
									if (data.next()) {
							%>

							<div
								style="padding: 0px; text-align: center; font-size: 24px; font-weight: bold;">Candico
								(I) Limited</div>
							<div
								style="padding: 0px; text-align: center; font-size: 12px; font-weight: bold;"><%=data.getString("com_name")%></div>
							<div
								style="padding: 0px; text-align: center; font-size: 13px; font-weight: bold;">Inward
								Gate Pass</div>

							<div class="grid-container">
								<div class="grid-item">From : Security</div>
								<div class="grid-item" style="text-align: center">To :
									Main Store</div>
								<div class="grid-item" style="text-align: center"></div>
								<div class="grid-item"></div>

								<div class="grid-item">
									IGP/GEN No :
									<%=data.getString("Gid")%></div>
								<%
									String date[] = data.getString("posting_date").split("-");
								%>
								<div class="grid-item">
									Date :
									<%=date[2] + "." + date[1] + "." + date[0]%></div>
								<div class="grid-item" style="text-align: center"></div>
								<div class="grid-item"></div>

								<div class="grid-item">TRANSFER : TRANSFER CODE</div>
								<div class="grid-item">
									Vehicle No :
									<%=data.getString("vehicle_no")%></div>
								<div class="grid-item">
									LR No :
									<%=data.getString("LR_no")%></div>
								<div class="grid-item">
									DATE :<%=data.getString("LR_date")%>
								</div>

								<div class="grid-item">
									SUPPLIER :
									<%=data.getString("Vname")%></div>
								<div class="grid-item"></div>
								<div class="grid-item">
									PO No :
									<%=data.getString("Pid")%></div>
								<div class="grid-item">DATE : / /</div>

								<div class="grid-item">
									CHALLAN NO :
									<%=data.getString("delevery_challan_no")%></div>
								<%-- String date[]=data.getString("posting_date").split("-");--%>
								<div class="grid-item">
									Date :
									<%=data.getString("challan_date")%></div>
								<div class="grid-item">
									INVOICE No :
									<%=data.getString("bill_no")%></div>
								<div class="grid-item">
									DATE :
									<%=data.getString("Bill_date")%></div>

							</div>
							<!--<div style="padding-top: 10px; font-size: 12px; font-weight: bold; color: black">The Material and Quantity as mentioned below has been received. please advice about its acceptability</div>-->
							<!--    <table width="100%" style="font-family: sans-serif;" cellpadding="10">
        <tr>
            <td width="49%" style="border: 0.1mm solid #eee;">Name<br>Company Name<br>Area<br>Area 2<br>Kent<br>0123 6NN</td>
            <td width="2%">&nbsp;</td>
            <td width="49%" style="border: 0.1mm solid #eee; text-align: right;"><strong>Company Name Ltd</strong><br>00-00 ABC Aare<br>Country Name<br>123 456<br><br><strong>Telephone:</strong> +00 000 000 0000<br><a href="#" target="_blank" style="color: #000; text-decoration: none;">companyname.com</a><br><a href="#" target="_blank" style="color: #000; text-decoration: none;">companyname.com</a><br><a href="#" target="_blank" style="color: #000; text-decoration: none;">companyname.com</a><br><a href="#" target="_blank" style="color: #000; text-decoration: none;">companyname.com</a><br></td>
        </tr>
    </table>-->
							<br>
							<table class="items table-bordered " width="100%"
								style="border-collapse: collapse;" cellpadding="23">
								<thead>
									<tr>
										<td><strong>SR.</strong></td>
										<td><strong>ITEM CODE</strong></td>
										<td><strong>Nomenclature</strong></td>
										<td><strong>UMO </strong></td>
										<td><strong>CHALLAN. QTY</strong></td>
										<td><strong>Recd. QTY</strong></td>
										<td><strong>ACCEPTED. QTY</strong></td>
										<td><strong>REJECTED. QTY</strong></td>
										<td><strong>ACCP U/P QTY</strong></td>
										<td><strong>Remark</strong></td>

									</tr>
								</thead>
								<tbody>
									<%
										int i = 0;
												sr1 = new DataService();
												rs = sr1.GRN_item_list(Gid);
												rs.last();
												System.out.println("rows no>>" + rs.getRow());
												int row_count = rs.getRow();
												rs.beforeFirst();
												while (rs.next()) {
									%>
									<tr>
										<td style="padding: 0px 7px; line-height: 20px;"><%=++i%></td>
										<td style="padding: 0px 7px; line-height: 20px;"><%=rs.getString("Iid")%></td>
										<td style="padding: 0px 7px; line-height: 20px;"><%=rs.getString("Iname")%></td>
										<td style="padding: 0px 7px; line-height: 20px;"><%=rs.getString("QTY_in_unit_of_Entry1")%></td>
										<td style="padding: 0px 7px; line-height: 20px;"><%=rs.getString("QTY_in_unit_of_Entry")%></td>
										<td style="padding: 0px 7px; line-height: 20px;"></td>
										<td style="padding: 0px 7px; line-height: 20px;"></td>
										<td style="padding: 0px 7px; line-height: 20px;"></td>
										<td style="padding: 0px 7px; line-height: 20px;"></td>
										<td style="padding: 0px 7px; line-height: 20px;"></td>
									</tr>
									<%
										}
									%>
									<%
										int n = 10;
												while (row_count < n) {
									%>
									<tr style="color: #ffffff00">
										<td
											style="text-align: center; color: #fff0; padding: 0px 7px; line-height: 20px;"><%=row_count + 1%></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<%
										row_count++;
												}
									%>
									<tr>
										<td style="padding: 0px 7px; line-height: 20px;" colspan="3">Security
											Office</td>
										<td colspan="4" style="text-align: center;">Date</td>
										<td colspan="3" style="text-align: center;">Store
											(Manager)</td>
									</tr>
									<tr
										style="text-align: center; padding: 0px 7px; line-height: 20px;">
										<td colspan="10">.</td>
									</tr>

								</tbody>
							</table>
							<br>
							<!--    <div class="grid-container" style="position: absolute;bottom: 0px;width: -webkit-fill-available;">
        <div class="grid-item" style="border-top: 1px solid black;padding: 6px;">Remedial action in case of devlation </div>
        <div class="grid-item"style="border-top: 1px solid black;"></div>
        <div class="grid-item"style="border-top: 1px solid black;"></div>
        
        <div class="grid-item"style="border-top: 1px solid black;padding: 6px;">Final Advice</div>
        <div class="grid-item"style="border-top: 1px solid black;"></div>
        <div class="grid-item"style="border-top: 1px solid black;"></div>
        
        <div class="grid-item"style="border-top: 1px solid black;padding: 6px;">Analyst :<br>Date :</div>
        <div class="grid-item"style="border-top: 1px solid black;"></div>
        <div class="grid-item"style="border-top: 1px solid black;">H.O.D.(Q.A.D.)</div>
        
        <div class="grid-item"style="border-top: 1px solid black;padding: 6px;border-bottom: 1px solid black;">Remark of Store Regarding consumption</div>
        <div class="grid-item"style="border-top: 1px solid black;border-bottom: 1px solid black;"></div>
        <div class="grid-item"style="border-top: 1px solid black; border-bottom: 1px solid black;"></div>
    </div>-->





							<%
								}
								} catch (Exception y) {
									out.println("exception" + y);
									System.out.println("error =" + y);
								}
							%>

						</div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>

		<!--color vala view ke liye-->






	</div>
	<!-- /.modal -->

</div>


<%
	// } catch(Exception u1){ System.out.println("=====>"+u1);  } finally{try
	//{ds1.c.close();}catch(Exception y3){}}
%>
</form>
</div>
</div>
</div>
</div>
</div>
<div class="clearfix"></div>
<script src="http://code.jquery.com/jquery-
latest.min.js"></script>
<meta charset="utf-8" />

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

<script>
	function createPDF() {
		var sTable = document.getElementById('tab').innerHTML;
		//        var sTable2 = document.getElementById('tab2').innerHTML;

		var style = "<style>";

		style = style
				+ ".copy{position: relative;  height:1005px; margin: 10mm 6mm 10mm 6mm;} ";
		style = style
				+ "div.box {position: absolute;text-align: center;box-sizing: border-box;width:20%;height:50px;"
		style = style
				+ "border: 1px solid #ddd;top:5%;font-size: 80%;padding:6px;} ";

		style = style
				+ "div.box2 {position: absolute;text-align: center;box-sizing: border-box;width:19%;height:50px;"
		style = style + "top:6%;font-size: 80%;padding:2px;right: 3%;} ";

		//        style = style + "body{ margin: 0mm;} ";
		style = style + "body{ margin: -9mm 0mm 0mm 0mm;} ";
		style = style + "table { width: 100%; font:12px Calibri;}";
		style = style
				+ ".table, th, td {border: solid 1px #00000070; border-collapse: collapse; text-align: center; padding: 0px 7px; line-height: 20px;}";

		//        style = style + "padding: 4px 4px;}"; 
		//        style = style +"@page {size: 7in 9.25in;margin: 10mm 6mm 10mm 6mm;} ";
		style = style
				+ "h1, .h1, h2, .h2, h3, .h3 {margin-top: 1px;margin-bottom: 1px;}";
		style = style + "td{padding-left: 5px;}";
		style = style
				+ ".grid-container{display: grid;grid-template-columns: auto auto auto auto;padding: 10px;font-size: 12px; font-weight: bold;color: black; }";
		style = style + "</style>";

		// CREATE A WINDOW OBJECT.
		//        var win = window.open('', '', 'height=700,width=700');
		var win = window.open('', '', 'size: 7in 9.25in;');
		win.document.write('<html><head>');
		//        win.document.write('<title>Profile</title>');   // <title> FOR PDF HEADER.
		win.document.write(style); // ADD STYLE INSIDE THE HEAD TAG.
		win.document.write('</head>');
		win.document.write('<body>');

		win.document.write('<div class="copy">');
		//         win.document.write('<div class="box"> "Subject to Nagpur Jurisdiction"</div>');
		//         win.document.write('<div class="box2">"ORIGINAL FOR BUYER"</div>');
		win.document.write(sTable);
		win.document.write('</div>');

		//        win.document.write('<div class="copy">');
		//         win.document.write('<div class="box"> "Subject to Nagpur Jurisdiction"</div>');
		//         win.document.write('<div class="box2">"DUPLICATE FOR TRANSPORTER"</div>');
		//        win.document.write(sTable);
		//        win.document.write('</div>');
		//        
		//        win.document.write('<div class="copy">');
		//         win.document.write('<div class="box"> "Subject to Nagpur Jurisdiction"</div>');
		//         win.document.write('<div class="box2">"TRIPLICATE FOR ASSESSEE"</div>');
		//        win.document.write(sTable);
		//        win.document.write('</div>');
		//        
		//        win.document.write('<div class="copy">');
		//         win.document.write('<div class="box"> "Subject to Nagpur Jurisdiction"</div>');
		//         win.document.write('<div class="box2">"QUORDUPLICATE FOR EXTRA COPY"</div>');
		//        win.document.write(sTable);
		//        win.document.write('</div>');

		win.document.write('</body></html>');

		win.document.close(); // CLOSE THE CURRENT WINDOW.

		win.print();

		//// PRINT THE CONTENTS.
		//        win.save('fileNameOfGeneretedPdf.pdf');

	}

	var a1 = [ '', 'one ', 'two ', 'three ', 'four ', 'five ', 'six ',
			'seven ', 'eight ', 'nine ', 'ten ', 'eleven ', 'twelve ',
			'thirteen ', 'fourteen ', 'fifteen ', 'sixteen ', 'seventeen ',
			'eighteen ', 'nineteen ' ];
	var b1 = [ '', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty',
			'seventy', 'eighty', 'ninety' ];

	function inWords(num) {
		if ((num = num.toString()).length > 9)
			return 'overflow';
		var n = ('000000000' + num).substr(-9).match(
				/^(\d{2})(\d{2})(\d{2})(\d{1})(\d{2})$/);
		if (!n)
			return;
		var str = '';
		str += (n[1] != 0) ? (a1[Number(n[1])] || b1[n[1][0]] + ' '
				+ a1[n[1][1]])
				+ 'crore ' : '';
		str += (n[2] != 0) ? (a1[Number(n[2])] || b1[n[2][0]] + ' '
				+ a1[n[2][1]])
				+ 'lakh ' : '';
		str += (n[3] != 0) ? (a1[Number(n[3])] || b1[n[3][0]] + ' '
				+ a1[n[3][1]])
				+ 'thousand ' : '';
		str += (n[4] != 0) ? (a1[Number(n[4])] || b1[n[4][0]] + ' '
				+ a1[n[4][1]])
				+ 'hundred ' : '';
		str += (n[5] != 0) ? ((str != '') ? 'and ' : '')
				+ (a1[Number(n[5])] || b1[n[5][0]] + ' ' + a1[n[5][1]])
				+ 'only ' : '';
		return str.toUpperCase();
	}

	function amt_convert(no) {
		//       alert("in amt_convert"+no);
		document.getElementById('word_amt').innerHTML = "RUPEES "
				+ inWords(no.toString());
	};
</script>
</html>
<jsp:include page="templates/footer.html" />