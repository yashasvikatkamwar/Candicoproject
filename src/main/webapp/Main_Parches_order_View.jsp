<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"
	errorPage="eror.jsp"%>
<%@page import="java.text.DecimalFormat"%>

<%@page import="org.joda.time.LocalDate"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.DataService"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
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
<%! ResultSet data,rs,rss,data1;DataService ds1;ArrayList ar;Iterator ity;Object o1=null; 
DataService sr1;int x;Object aval,bval;ResultSetMetaData rsmd;
String Vname,Vadrs,Vgst;
%>
<%
        NumberFormat nf = NumberFormat.getNumberInstance(Locale.ENGLISH);
        DecimalFormat df = (DecimalFormat)nf;
        
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
						<div class="x_content">
							<br />

							<%
//                        String a= request.getParameter("a");
                        String Pid= request.getParameter("Pid");
                       System.out.println("Pid >"+Pid);
    try{
    sr1=new DataService();
 // String cid=request.getParameter("cid");
    //int year=Integer.parseInt(request.getParameter("year".trim()));
    //int month=Integer.parseInt(request.getParameter("month".trim()));
 
   data=sr1.PO_details(Pid); 
    rsmd=data.getMetaData();
    x=rsmd.getColumnCount();
%>


							<form id="demo-form3" data-parsley-validate
								class="form-horizontal form-label-left">
								<%
int i=0;
if(data.next()){
    String Vid=data.getString("vid");
    System.out.println("Vid >"+Vid);
           sr1=new DataService();
           rss=sr1.Vender_details(Vid); 
           if(rss.next()){
               Vname=rss.getString("name");
               Vadrs=rss.getString("adrs");
               Vgst=rss.getString("GST_no");
           }
           %>

								<table border="2" colspan="7">



									<tr>
										<th colspan="7" align="center" style="text-align: center;">
											<div class="container-fluid">
												<h1>
													CANDICO (I) LIMITED <img src="images/logo.jpeg"
														alt="Girl in a jacket" width="100" height="50"
														style="float: right">
												</h1>
											</div>
										</th>

									</tr>

									<tr>
										<th colspan="2" align="center" style="text-align: center;"><b
											style="font-size: 13px;">PURCHASE ORDER</b> <th align="center"
											style="text-align: center;"><b style="font-size: 13px;"><%=data.getObject("Com_short_name")%></b><th alig n="center" style="text-align:center;"><b
											style="font-size:13px;"><%=data.getObject(2)%></b>
       
										<th colspan="2" align="center" style="text-align:center;"><b
											style="font-size:13px;">Purchase Order Date</b>
           <%String date[]=data.getString("datee").split("-");%>
       
										<th align="center" style="text-align:center;"><b
											style="font-size:13px;"><%=date[2]+"."+date[1]+"."+date[0]%></b>
    
									</tr>
    
    
   
                <tr>
                    <td rowspan="3" colspan="4">
                        Candico (I) Ltd.<br>
                        M-32-,MIDC<br>
                        Hingna Road<br>
                        Nagpur-440016<br>
                        Ph No-07104-237771<br>
                        GST No:27AAACC4180E1ZZ<br>
                        PAN No: AAACC4180E
                        
                    </td>
                    
                   <td colspan="3"><%=Vname%><br>
                   <%=Vadrs%><br>
                   </td>
               </tr>
               
               <tr>
                   <td rowspan="1" colspan="3">GST No: <%=Vgst%></td>
               </tr>
                <tr>
                   <td rowspan="1" colspan="3">.</td>
               </tr>
               
              
    
    
    
    
    
   
    
        <tr style=" height: 20%">
        <td colspan="9">
            <table id="example"
												class="table-bordered  table  table-responsive"
												style="width:100%;">
        <tr>
            <th style="text-align: center;padding: 1px; ">Sr.<br> No</th>
            <th style="text-align: center;padding: 1px; ">Code</th>
            <th style="text-align: center;padding: 1px; ">NOMENCLATURE</th>
            <th style="text-align: center;padding: 1px; ">HSN</th>
            <th style="text-align: center;padding: 1px; ">QTY</th>
            <th style="text-align: center;padding: 1px; ">UNIT</th>
            <th style="text-align: center;padding: 3px; "> RATE </th>
            <th style="text-align: center;padding: 3px; ">AMT. IN RS.</th>
        </tr>
        <%
           
         sr1=new DataService();
 
   data1=sr1.PO_items(Pid); 
    rsmd=data1.getMetaData();
    x=rsmd.getColumnCount();
  data1.last();
    System.out.println("rows no>>"+data1.getRow());
    int row_count=data1.getRow();
    data1.beforeFirst();
        %>
        
           <%
 int j=1;

while(data1.next()){%>
        
         <tr>
               <td style="text-align: center; "><%=j%></td>
               <td style="text-align: center"><%=data1.getString("Iid")%></td> 
               <td style="text-align: center"><%=data1.getString("Item_name")%></td> 
               <td style="text-align: center"><%=data1.getString("HSN")%></td> 
               <td style="text-align: center"><%=data1.getString("qty")%></td>
               <td style="text-align: center"><%=data1.getString("unit")%></td>
               <td style="text-align: center"><%=data1.getString("rate")%></td>
               <td style="text-align: right"><%=data1.getString("amt")%></td> 
               
             
<!--               <td style="text-align: right; padding-left: 5px;"><%=""%></td>
               <td style="text-align: right; padding-left: 5px;"><%=Math.round(Double.parseDouble("0"))%>.00</td>-->
         </tr>
         <% j++;
         }
         %>
         <%
             int n=8;
             while(row_count < n){
         %>
         <tr style="color: #ffffff00">
         <td style="text-align: center; "><%=row_count+1%></td>
         <td> </td>
         <td> </td>
         <td> </td>
         <td> </td>
         <td> </td>
         <td> </td>
         <td> </td>
         </tr> 
         
         <%row_count++;}%>
         
         <tr>
         <td rowspan="1" colspan="7" style="padding: 0;"> <center>
															<label style="float: right;">Total</label>
														</center></td>
         <td colspan="1" style="text-align: right; padding: 0;"><%=data.getString("total_amt")%></td>
        </tr>
        <tr>
         <td rowspan="1" colspan="7" style="padding: 0;"> <center>
															<label style="float: right;">Freight/Packing Charges</label>
														</center></td>
         <td colspan="1" style="text-align: right; padding: 0;"><%=data.getString("packing_charg")%></td>
        </tr>
        <tr hidden="">
         <td rowspan="1" colspan="6" style="padding: 0;"> <center>
															<label style="float: right;">GST/IGST</label>
														</center></td>
         <td colspan="1" style="text-align: right; padding: 0;"><%=data.getString("gst_per")%>%</td>
         <td colspan="1" style="text-align: right; padding: 0;"><%=data.getString("gst_amt")%></td>
        </tr>
        
        <%
            String state=data.getString("state");
                String s_gst ;
                String c_gst;
                String i_gst ;
                String total_tax_amt;

                Double s_gst_per = 0.0;
                Double c_gst_per = 0.0;
                int i_gst_per=0;
                Double gst=data.getDouble("gst_per");
                Double gst_amt=data.getDouble("gst_amt");
                
                if(state.equals("MS")){
                     System.out.println("in MS");
                    s_gst_per = gst/2;
                    c_gst_per = s_gst_per;
                    i_gst_per=0;
                    Double gst_amt1=gst_amt/2;
                          s_gst=df.format(Math.round(gst_amt1));  
                        System.out.println("s_gst>>"+s_gst);
                          c_gst=s_gst;
                          i_gst="0.0";
                     total_tax_amt=df.format(Math.round(gst_amt));
                    
                    }
                else{
                    System.out.println("in OMS");
                    s_gst_per = 0.0;
                    c_gst_per = s_gst_per;
                    i_gst_per = gst.intValue();
                    s_gst="0.0"; 
                    c_gst="0.0";
                    i_gst=df.format(Math.round(gst_amt));
                     total_tax_amt=df.format(gst_amt);
                }
         %>
        
        <tr>
         <td rowspan="1" colspan="6" style="padding: 0;"> <center>
															<label style="float: right;">CGST</label>
														</center></td>
         <td colspan="1" style="text-align: right; padding: 0;"><%=c_gst_per%>%</td>
         <td colspan="1" style="text-align: right; padding: 0;"><%=c_gst%></td>
        </tr>
        <tr>
         <td rowspan="1" colspan="6" style="padding: 0;"> <center>
															<label style="float: right;">SGST</label>
														</center></td>
         <td colspan="1" style="text-align: right; padding: 0;"><%=s_gst_per%>%</td>
         <td colspan="1" style="text-align: right; padding: 0;"><%=s_gst%></td>
        </tr>
        <tr>
         <td rowspan="1" colspan="6" style="padding: 0;"> <center>
															<label style="float: right;">IGST</label>
														</center></td>
         <td colspan="1" style="text-align: right; padding: 0;"><%=i_gst_per%>%</td>
         <td colspan="1" style="text-align: right; padding: 0;"><%=i_gst%></td>
        </tr>
        
        
         <tr>
         <td rowspan="1" colspan="7" style="padding: 0;"> <center>
															<label style="float: right;">TCS (0.10%)</label>
														</center></td>
         <td colspan="1" style="text-align: right; padding: 0;"><%=data.getString("tcs_amt")%></td>
        </tr>
         
         <tr>
         <td rowspan="1" colspan="7" style="padding: 0;"> <center>
															<label style="margin-left:400px;float: right;">Total</label>
														</center></td>
         <td colspan="1" style="text-align: right; padding: 0;"><%=data.getString("final_total")%></td>
        </tr>
        
    </table>
        </td>
									</tr>
<!--         <tr>
      <td  rowspan="1" colspan="4" style="width:20px;  margin-right:200px; margin-top:200px;"> <center><label style="margin-left:400px;">Total</label></center></td>
        <td colspan="1" ></td>
         <td colspan="1"></td>
          <td colspan="1"></td>
           <td colspan="1"></td>
    </tr>                -->
     <tr>
         <td colspan="7" style="padding-left: 5px"><b>Details Arrival of Material At Nagpur Plant</b></td>
<!--        <td colspan="2"style="padding-left: 5px;">TOTAL AMOUNT BEFORE TAX:</td>
         <td colspan="2" style="padding-right: 5px;text-align: right"><%=""%></td>-->
    </tr>

    
    <tr style=" height: 20%">
        <td colspan="9">
            <table id="example"
												class="table-bordered  table  table-responsive"
												style="width:100%;">
        <tr>
            <th style="text-align: center;padding: 1px; ">Sr.<br> No</th>
            <th style="text-align: center;padding: 1px; ">NOMENCLATURE</th>
            <th style="text-align: center;padding: 1px; ">QTY(Nos/Kgs.)</th>
            <th style="text-align: center;padding: 1px; ">Arrival Date</th>
            <!--<th   style="text-align: center;padding: 3px; ">  </th>-->
            <th style="text-align: center;padding: 3px; ">Remarks</th>
        </tr>
        <%
           
         sr1=new DataService();
 
   data1=sr1.PO_items_Arraival(Pid); 
    rsmd=data1.getMetaData();
    x=rsmd.getColumnCount();
  data1.last();
    System.out.println("rows no>>"+data1.getRow());
    int row_count2=data1.getRow();
    data1.beforeFirst();
        %>
        
           <%
 int jj=1;

while(data1.next()){%>
        
         <tr>
               <td style="text-align: center; "><%=jj%></td>
               <td style="text-align: center"><%=data1.getString("item_name")%></td> 
               <td style="text-align: center"><%=data1.getString("qty")%></td>
               <%String ab=data1.getString("Arrival_date");
               String date1[]=ab.split("-");
               %>
               <td style="text-align: center"><%=date1[2]+"."+date1[1]+"."+date1[0]%></td>
               <!--<td></td>-->
               <td style="text-align: right"><%=data1.getString("remark")%></td> 
               
             
<!--               <td style="text-align: right; padding-left: 5px;"><%=""%></td>
               <td style="text-align: right; padding-left: 5px;"><%=Math.round(Double.parseDouble("0"))%>.00</td>-->
         </tr>
         <%
         	jj++;
         			}
         %>
         <%
         	int n1 = 5;
         			while (row_count2 < n1) {
         %>
         <tr style="color: #ffffff00">
         <td style="text-align: center; "><%=row_count2 + 1%></td>
         <td> </td>
         <td> </td>
         <td> </td>
         <td> </td>
         <!--<td> </td>-->
         </tr> 
         
         <%
                   	row_count2++;
                   			}
                   %>
    </table>
        </td>
									</tr>
    
    
          
          
     <tr>
      <td colspan="7" style="padding-left: 5px;font-weight: bold;">
          1) We Will Not Accepted Excess Quantity Against Purchase Order
         </td>
       </tr>
       <tr>
      <td colspan="7" style="padding-left: 5px;font-weight: bold;">
          2) Please Attach COA Report With Every Consignment.
         </td>
       </tr>
    
               
               <tr>
                    <td colspan="7"><center>Special Instruction</center></td>
                 </tr>                   
             
                   
             <tr>
                 <td colspan="1" style="width: 1%;"><center>1</center></td>
                   <td colspan="6" style="padding-left: 5px;">Supplier to be sent to WORK ADDRESS</td>
               </tr>  
                 <tr>
                 <td colspan="1"><center>2</center></td>
          <td colspan="6" style="padding-left: 5px;">Invoice to be sent in Triplicate:<br>
              1st Copy, Along with goods<br>
              2nd Copy,To Transporter
                   </td>
               </tr>     
                
                <tr>
                 <td colspan="1"><center>3</center></td>
                   <td colspan="6" style="padding-left: 5px;">If unable to supply goods on dates specified, inform immediately on receipt of order</td>
               </tr>  
                <tr>
                 <td colspan="1"><center>4</center></td>
                   <td colspan="6" style="padding-left: 5px;">Goods will not be accepted if order Number is not mentioned on Delivery challan & Bill</td>
               </tr>  
                <tr>
                 <td colspan="1"><center>5</center></td>
                   <td colspan="6" style="padding-left: 5px;">Supplier must deliver goods between 9:30am-6:00pm on working day's</td>
               </tr>  
                <tr>
                 <td colspan="1"><center>6</center></td>
                   <td colspan="6" style="padding-left: 5px;">Dispute will be subject to Delhi jurisdiction only</td>
               </tr>  
               
        <tr>
            <td colspan="4" style="padding-left: 5px;font-weight: bold;"><center>
             Delivery At</center>
            </td>
            <td rowspan="2" colspan="3"
											style="padding-left: 5px;font-weight: bold;text-align: right">
             For Candico(I) Limited  <br><br><br><br>
             Authorised Signatory
            </td>
        </tr>          
           <tr>
            <td colspan="4" style="padding-left: 5px;font-weight: bold;">
             WORKS ADDRESS <BR>
             Candico(I) Limited<br>
             M-32,MIDC,HINGNA ROAD<br>
             NAGPUR-440016<br>
             PHONE NO-07104-237771
            </td>
        </tr>             
  
          </table>        
               
        
          <%
                                         	}
                                         %>  
 <%
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
						style = style
								+ "top:6%;font-size: 80%;padding:2px;right: 3%;} ";

						//        style = style + "body{ margin: 0mm;} ";
						style = style + "body{ margin: -9mm 0mm 0mm 0mm;} ";
						style = style
								+ "table { width: 100%; font:12px Calibri;}";
						style = style
								+ "table, th, td {border: solid 1px #00000070; border-collapse: collapse ;}";
						//        style = style + "padding: 4px 4px;}"; 
						//        style = style +"@page {size: 7in 9.25in;margin: 10mm 6mm 10mm 6mm;} ";
						style = style
								+ "h1, .h1, h2, .h2, h3, .h3 {margin-top: 1px;margin-bottom: 1px;}";
						style = style + "td{padding-left: 5px;}";
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

					var a1 = [ '', 'one ', 'two ', 'three ', 'four ', 'five ',
							'six ', 'seven ', 'eight ', 'nine ', 'ten ',
							'eleven ', 'twelve ', 'thirteen ', 'fourteen ',
							'fifteen ', 'sixteen ', 'seventeen ', 'eighteen ',
							'nineteen ' ];
					var b1 = [ '', '', 'twenty', 'thirty', 'forty', 'fifty',
							'sixty', 'seventy', 'eighty', 'ninety' ];

					function inWords(num) {
						if ((num = num.toString()).length > 9)
							return 'overflow';
						var n = ('000000000' + num).substr(-9).match(
								/^(\d{2})(\d{2})(\d{2})(\d{1})(\d{2})$/);
						if (!n)
							return;
						var str = '';
						str += (n[1] != 0) ? (a1[Number(n[1])] || b1[n[1][0]]
								+ ' ' + a1[n[1][1]])
								+ 'crore ' : '';
						str += (n[2] != 0) ? (a1[Number(n[2])] || b1[n[2][0]]
								+ ' ' + a1[n[2][1]])
								+ 'lakh ' : '';
						str += (n[3] != 0) ? (a1[Number(n[3])] || b1[n[3][0]]
								+ ' ' + a1[n[3][1]])
								+ 'thousand ' : '';
						str += (n[4] != 0) ? (a1[Number(n[4])] || b1[n[4][0]]
								+ ' ' + a1[n[4][1]])
								+ 'hundred ' : '';
						str += (n[5] != 0) ? ((str != '') ? 'and ' : '')
								+ (a1[Number(n[5])] || b1[n[5][0]] + ' '
										+ a1[n[5][1]]) + 'only ' : '';
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