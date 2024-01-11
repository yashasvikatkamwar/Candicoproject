<!DOCTYPE html>
<html lang="en">

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
<div>
    <form action="hello1">

      <h3 style="text-align: center;">Delivery Challan</h3>

      <table>
        <tr>
          <thead>
            <th>State code</th>
            <th> <input type="text" /></th>
            <th>State code</th>
            <th> <input type="text" /></th>

          </thead>
        </tr>

        <tr>
          <th>State Name</th>
          <th><input type="text" placeholder="state Name" /></th>
          <th>State Name</th>
          <th><input type="text" placeholder="state Name"></th>
        </tr>

        <tr>
          <th>GSTIn/Unique ID</th>
          <td><input type="text"></td>
          <th>GSTIn/Unique ID</th>
          <th> <input type="text"></th>
        </tr>

        <tr>
          <th>D.L.No</th>
          <td><input type="text" placeholder="No"></td>
          <th>D.L.No.</th>
          <td><input type="text" placeholder="No"></td>
        </tr>

        <tr>
          <th>D.L.State</th>
          <td><input type="text" placeholder="State"></td>
          <th>D.L.State</th>
          <td><input type="text" placeholder="State"></td>
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
          <th>Makson Phrmaaceuticals (1) Pvt. Ltd.</th>
          <th></th>
          <th>Candico (I) Limited</th>
          <th></th>
        </tr>

        <tr>
          <th>195, Rajkot Highway,Surendranagar - 363020</th>
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
          <td><input type="text"></td>
          <th>State Code</th>
          <td><input type="text"></td>
        </tr>

        <tr>
          <th>State Name</th>
          <th><input type="text" placeholder="State Name "></th>
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
            <thD.L.No.>< /th>
          <td></td>
        </tr>

        <tr>
          <th>Delivery Challan No.</th>
          <th><input type="text" placeholder="Challan No"></th>
          <td></td>
          <td></td>
        </tr>

        <tr>
          <th>Delivery Challan Date.</th>
          <td><input type="date"></td>
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
          <td><input type="text" placeholder="No"></td>
          <td></td>
          <td></td>
        </tr>

        <tr>
          <th>L.R. Date:</th>
          <td><input type="date"></td>
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
          <td> <input type="text" placeholder="No"></td>
          <td></td>
          <td></td>
        </tr>

        <tr>
          <th>Transporter Name</th>
          <th>TO BE FIXED</th>
          <td></td>
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
          <thead>
            <tr>
              <th class="seven-column">Metal Description</th>
              <th class="seven-column">HSN Code/SAC Code</th>
              <th class="seven-column">SAP Batch No</th>
              <th class="seven-column">Quantity</th>
              <th class="seven-column">Unit</th>
              <th class="seven-column">Unit Price in INR</th>
              <th class="seven-column">Taxable Value in INR</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td class="seven-column"><input type="text" style="width: 60px;"></td>
              <td class="seven-column"><input type="text" style="width: 20px;"></td>
              <td class="seven-column"><input type="text" style="width: 40px;"></td>
              <td class="seven-column"><input type="text" style="width: 20px;"></td>
              <td class="seven-column"><input type="text" style="width: 20px;"></td>
              <td class="seven-column"><input type="text" style="width: 40px;"></td>
              <td class="seven-column"><input type="text"></td>
            </tr>
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


</body>

<script>


  function printPage() {
    window.print();
  }
</script>

</html>