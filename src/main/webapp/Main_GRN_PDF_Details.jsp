<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"
	errorPage="eror.jsp"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
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
	grid-template-columns: auto auto auto;
	padding: 10px;
	font-size: 12px;
	font-weight: bold;
	color: black;
}
</style>
<%!public String dateFormateChnge(String date) {
		//        convert dd/MM/yyyy to yyyy/MM/dd
		System.out.println("date >>>>" + date);
		if (date.length() == 0) {
			return "";
		}
		if (date != null && date != "") {
			String datee[] = date.split("-");
			return datee[2] + "/" + datee[1] + "/" + datee[0];
		}
		return "";
	}%>
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

								String GIid = request.getParameter("GIid");
								System.out.println("GIid >" + GIid);

								String Cname = "";
								try {
									sr1 = new DataService();
									data = sr1.GRN_PDF_Details(GIid);
									if (data.next()) {
										System.out.println("in");
							%>

							<div
								style="padding: 0px; text-align: right; font-size: 24px; font-weight: bold;">
								<img src="./images/logo.jpeg" alt="Girl in a jacket" width="150"
									height="50">
							</div>
							<div
								style="padding: 0px; text-align: right; font-size: 15px; font-weight: bold;">Candico
								(I) Limited</div>
							<div
								style="padding: 0px; text-align: center; font-size: 24px; font-weight: bold;">Candico
								(I) Limited</div>
							<div
								style="padding: 0px; text-align: center; font-size: 24px; font-weight: bold;">GOODS
								RECEIPT NOTE</div>
							<!--<div style="padding: 0px; text-align: center;font-size: 12px; font-weight: bold;"><%=data.getString("com_name")%></div>-->


							<div style="font-size: 12px; font-weight: bold; color: black">Reference
								Details</div>
							<!--    <table width="100%" style="font-family: sans-serif;" cellpadding="10">
        <tr>
            <td width="49%" style="border: 0.1mm solid #eee;">Name<br>Company Name<br>Area<br>Area 2<br>Kent<br>0123 6NN</td>
            <td width="2%">&nbsp;</td>
            <td width="49%" style="border: 0.1mm solid #eee; text-align: right;"><strong>Company Name Ltd</strong><br>00-00 ABC Aare<br>Country Name<br>123 456<br><br><strong>Telephone:</strong> +00 000 000 0000<br><a href="#" target="_blank" style="color: #000; text-decoration: none;">companyname.com</a><br><a href="#" target="_blank" style="color: #000; text-decoration: none;">companyname.com</a><br><a href="#" target="_blank" style="color: #000; text-decoration: none;">companyname.com</a><br><a href="#" target="_blank" style="color: #000; text-decoration: none;">companyname.com</a><br></td>
        </tr>
    </table>-->

							<table width="100%" style="border: 1px solid black;">
								<tbody>

									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">Comapny
											Name</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">:<%=data.getString("com_name")%></td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">GRN
											TYPE</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">:<%=data.getString("GRN_BY")%>
										</td>
									</tr>

									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">GRN
											No</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">
											:<%=data.getString("Gid")%>
										</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">GRN
											DATE</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">:<%=dateFormateChnge(data.getString("posting_date"))%>
										</td>
									</tr>

									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">PO
											NUMBER</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">:<%=data.getString("Pid")%>
										</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">PO
											DATE</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">
											:<%=dateFormateChnge(data.getString(89))%>
										</td>
									</tr>

									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">CHALLAN
											NUMBER</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">:<%=data.getString("delevery_challan_no")%>
										</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">CHALLAN
											DATE</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">:<%=dateFormateChnge(data.getString("challan_date"))%>
										</td>
									</tr>

									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">EXCISE
											INVOICE NO</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">:<%=data.getString("bill_no")%>
										</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">EX.
											INV. DATE</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">:<%=dateFormateChnge(data.getString("Bill_date"))%>
										</td>
									</tr>

									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">SUPPLIER
											NAME</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">:<%=data.getString("Vname")%>
										</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">SUPPLIER
											CODE</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">:<%=data.getString("Vid")%>
										</td>
									</tr>

									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">MFG
											NAME</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">:<%=data.getString("Manufacturer_name")%>
										</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">MFG
											BY-CODE</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">:<%=data.getString("Manufacturer_id")%>
										</td>
									</tr>

									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">MATERIAL
											CODE</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">:<%=data.getString("Iid")%>
										</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">SOURCE
										</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">
											: Domestic / Imported</td>
									</tr>

									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">MATERIAL
											NAME</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">:<%=data.getString("Iname")%>
										</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">UOM
										</td>
										<td style="padding: 2px7px; line-height: 20px; width: 25%;">:<%=data.getString("QTY_in_unit_of_Entry1")%>
										</td>
									</tr>

									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">ANALYSIS
											AS PER</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">:INH
										</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">FROM
											PLANT</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">:<%=data.getString("plant")%>
										</td>
									</tr>

									<!--        <tr >
            <td style="padding: 2px  7px; line-height: 20px; width: 25%;"  >OLD ITEM CODE(Before SAP)  </td>
            <td style="padding: 2px  7px; line-height: 20px; width: 25%;">:<%=data.getString("com_name")%>  </td>
            <td style="padding: 2px  7px; line-height: 20px; width: 25%;">OLD MATERIAL CODE(SAP)  </td>
            <td style="padding: 2px  7px; line-height: 20px; width: 25%;">:NA </td>
        </tr> -->

									<!--        <tr >
            <td style="padding: 2px  7px; line-height: 20px; width: 25%;"  >OLD MATERIAL DES.(SAP)  </td>
            <td style="padding: 2px 7px; line-height: 20px; width: 25%;">:NA </td>
            <td style="padding: 2px  7px; line-height: 20px; width: 25%;">SKIP TESTING </td>
            <td style="padding: 2px  7px; line-height: 20px; width: 25%;">:NA </td>
        </tr> -->

									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">SUPPLIER
											NUMBER</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">:REGULAR
											VENDER</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">SAMP/TESTING</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">:NA
										</td>
									</tr>

									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">
										</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;"></td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">SAMP/TESTING</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 25%;">:NA
										</td>
									</tr>


								</tbody>
							</table>

							<div style="padding: 0px; font-size: 16px; font-weight: bold;">OTHER
								DETAILS</div>
							<table width="100%" class="items table-bordered down"
								width="100%" style="border-collapse: collapse;">
								<tbody>
									<!--        <tr >
            <td style="padding: 2px 7px; line-height: 20px; width: 30%;"  >OLD A.R. NUMBER  </td>
            <td style="padding: 2px 7px; line-height: 20px; width: 70%;"></td>
        </tr> 
        <tr >
            <td style="padding: 2px 7px; line-height: 20px; width: 30%;"  >OLD BATCH NUMBER  </td>
            <td style="padding: 2px 7px; line-height: 20px; width: 70%;">NA </td>
        </tr> -->
									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 30%;">VENDER
											B.NO</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 70%;"><%=data.getString("vender_Batch")%>
										</td>
									</tr>
									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 30%;">CIMS
											BATCH NUMBER</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 70%;">
											<%=data.getString("Batch")%>
										</td>
									</tr>
									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 30%;">NO
											OF CONTAINERS/PACKS</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 70%;"><%=data.getString("No_containers")%>
											<%=data.getString("No_containers1")%></td>
									</tr>
									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 30%;">MANUFACTURING
											DATE</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 70%;">
											<%=data.getString("Date_of_manufacture")%>
										</td>
									</tr>
									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 30%;">EXPIRY
											DATE/USE BEFORE DATE</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 70%;"><%=data.getString("SLED_BBD")%>
										</td>
									</tr>
									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 30%;">RETEST
											DATE</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 70%;">
											<%=data.getString("retest_date")%>
										</td>
									</tr>
									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 30%;">RE-ANALYSIS
										</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 70%;">
											:</td>
									</tr>
									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 30%;">TOTAL
											QTY RECEIVED</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 70%;">
											<%=data.getString("QTY_in_unit_of_Entry")%> <%=data.getString("QTY_in_unit_of_Entry1")%></td>
									</tr>

									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 30%;">COA
											(Recd/not Recd)</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 70%;">
											RECEIVED</td>
									</tr>
									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 30%;">REMARK
										</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 70%;">
										</td>
									</tr>
									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 30%;">CREATE
											BY:INLCANS01/Candico Date</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 70%;"><%=dateFormateChnge(data.getString("createAt").split(" ")[0])%>
										</td>
									</tr>
									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 30%;">A.R.
											NUMBER</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 70%;">
										</td>
									</tr>
									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 30%;">SAMPLED
											BY/DATE</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 70%;">
										</td>
									</tr>
									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 30%;">SAMPLED
											QTY</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 70%;">
										</td>
									</tr>
									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 30%;">UNRESTRICTED
											QTY / RElEASED QTY</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 70%;">
										</td>
									</tr>
									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 30%;">BLOCKED
											QTY / REJECTED QTY</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 70%;">
										</td>
									</tr>
									<tr>
										<td style="padding: 2px 7px; line-height: 20px; width: 30%;">USAGE
											DECISION DETAILS</td>
										<td style="padding: 2px 7px; line-height: 20px; width: 70%;">
										</td>
									</tr>




								</tbody>
							</table>




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

		var style = "_$tag__";

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
				+ ".down th,.down td {border: solid 1px #00000070; border-collapse: collapse; padding: 0px 7px; line-height: 20px;}";

		//        style = style + "padding: 4px 4px;}"; 
		//        style = style +"@page {size: 7in 9.25in;margin: 10mm 6mm 10mm 6mm;} ";
		style = style
				+ "h1, .h1, h2, .h2, h3, .h3 {margin-top: 1px;margin-bottom: 1px;}";
		style = style + "td{padding-left: 5px;}";
		style = style
				+ ".grid-container{display: grid;grid-template-columns: auto auto auto;padding: 10px;font-size: 12px; font-weight: bold;color: black; }";
		style = style + "_$tag___";

		// CREATE A WINDOW OBJECT.
		//        var win = window.open('', '', 'height=700,width=700');
		var win = window.open('', '', 'size: 7in 9.25in;');
		win.document.write('_$tag__$tag_');
		//        win.document.write('_$tag__Profile_$tag___');   // _$tag__ FOR PDF HEADER.
		win.document.write(style); // ADD STYLE INSIDE THE HEAD TAG.
		win.document.write('_$tag__');
		win.document.write('_$tag_');

		win.document.write('_$tag_____________');
		//         win.document.write('_$tag____________ "Subject to Nagpur Jurisdiction"_$tag_');
		//         win.document.write('_$tag_____________"ORIGINAL FOR BUYER"_$tag_');
		win.document.write(sTable);
		win.document.write('_$tag_');

		//        win.document.write('_$tag_____________');
		//         win.document.write('_$tag____________ "Subject to Nagpur Jurisdiction"_$tag_');
		//         win.document.write('_$tag_____________"DUPLICATE FOR TRANSPORTER"_$tag_');
		//        win.document.write(sTable);
		//        win.document.write('_$tag_');
		//        
		//        win.document.write('_$tag_____________');
		//         win.document.write('_$tag____________ "Subject to Nagpur Jurisdiction"_$tag_');
		//         win.document.write('_$tag_____________"TRIPLICATE FOR ASSESSEE"_$tag_');
		//        win.document.write(sTable);
		//        win.document.write('_$tag_');
		//        
		//        win.document.write('_$tag_____________');
		//         win.document.write('_$tag____________ "Subject to Nagpur Jurisdiction"_$tag_');
		//         win.document.write('_$tag_____________"QUORDUPLICATE FOR EXTRA COPY"_$tag_');
		//        win.document.write(sTable);
		//        win.document.write('_$tag_');

		win.document.write('_$tag___$tag__');

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