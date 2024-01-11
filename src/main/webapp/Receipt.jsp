<!DOCTYPE html>
<html lang="en">

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
                                        <label style="display: inline-block; width: 240px;" id="opg"></label>
                                    </p>
                                    <p style="margin-left: 15px; margin-bottom: 10px;">Please pass out the following issue to
                                        <label style="display: inline-block; width: 240px;" id="issue"></label>
                                    </p>
                                    <p style="margin-left: 15px;">Mode of Transport
                                        <label style="display: inline-block; width: 240px;" id="mode"></label>
                                    </p>
                                </th>
                            </div>
                                <th style="text-align: center; align-items: center; width: 40%;">
                                    <h1>Candico ( I ) Limted</h1>
                                    <h1>OUTWARD GATE PASS</h1>
                                    <p style="margin-top: 25px;"> CIPLA HEALTH LTD RAW MATERIAL</p>
                                    <p style="margin-top: 25px;">NON RETURNABLE</p>
                                </th>
                                <th style="text-align: end; width: 30%;">
                                    Date: <input type="date" />
                                </th>
                            </tr>
                        </thead>
                    </table>
                </div>
                <div class="secondtable" style="margin-top: 50px;">
                    <table class="table-wrapper">
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
                        <tbody>
                            <tr style="height: 50px;">
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

            </div>
        </div>
        <p style="padding: 10px;">Purpose: Stock Transfer for R&D</p>
        <div style="display: flex; justify-content: space-between; padding: 10px;">
            <p>Store Incharge</p>
            <p>Authorised Incharge</p>
        </div>
        <div style="display: flex; justify-content: center;">
            <button onclick="printPage()" value="" class="info btn btn-info btn_info">Print</button>
        </div>
    </form>
</body>

</html>