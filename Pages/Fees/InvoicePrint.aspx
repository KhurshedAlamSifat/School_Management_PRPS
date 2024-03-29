﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InvoicePrint.aspx.cs" Inherits="Pages_Fees_InvoicePrint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Payment | Invoice</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link href="../../Styles/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
    <link href="../../Styles/AdminLTE.min.css" rel="stylesheet" />
</head>
<body onload="window.print();">
    <form id="form1" runat="server">
        <div class="wrapper">
            <!-- Main content -->
            <section class="invoice">
                <!-- title row -->
                <div class="row">
                    <div class="col-xs-12">
                        <h2 class="page-header">
                            <i class="fa fa-globe"></i>
                            <asp:Label ID="lblSchoolName" runat="server" Text="School Name"></asp:Label>

                            <small class="pull-right">Date: 2/10/2014</small>
                        </h2>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- info row -->
                <div class="row invoice-info">
                    <div class="col-sm-4 invoice-col">
                        From
           
                        <address>
                            <strong>Admin, Inc.</strong><br>
                            795 Folsom Ave, Suite 600<br>
                            San Francisco, CA 94107<br>
                            Phone: (804) 123-5432<br>
                            Email: info@almasaeedstudio.com
           
                        </address>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-4 invoice-col">
                        To
           
                        <address>
                            <strong>John Doe</strong><br>
                            795 Folsom Ave, Suite 600<br>
                            San Francisco, CA 94107<br>
                            Phone: (555) 539-1037<br>
                            Email: john.doe@example.com
           
                        </address>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-4 invoice-col">
                        <b>Invoice #007612</b><br>
                        <br>
                        <b>Order ID:</b> 4F3S8J<br>
                        <b>Payment Due:</b> 2/22/2014<br>
                        <b>Account:</b> 968-34567
         
                    </div>
                    <!-- /.col -->
                </div>
                <div class="row">
                    <div class="col-xs-12 table-responsive">
                        <table class="table table-striped">
                            <tbody>
                                <tr>
                                    <th>Name</th>
                                    <td><asp:Label runat="server" ID="lblName"></asp:Label></td>
                                    <th>Class</th>
                                    <td><asp:Label runat="server" ID="Label1"></asp:Label></td>
                                </tr>
                                <tr>
                                    <th>Section</th>
                                    <td><asp:Label runat="server" ID="Label2"></asp:Label></td>
                                    <th>Shift</th>
                                    <td><asp:Label runat="server" ID="Label3"></asp:Label></td>
                                </tr>
                                <tr>
                                    <th>Name</th>
                                    <td><asp:Label runat="server" ID="Label4"></asp:Label></td>
                                    <th>Class</th>
                                    <td><asp:Label runat="server" ID="Label5"></asp:Label></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->

                <div class="row">
                    <!-- accepted payments column -->
                    <div class="col-xs-6">
                        <p class="lead">Payment Methods:</p>
                        <img src="../../dist/img/credit/visa.png" alt="Visa">
                        <img src="../../dist/img/credit/mastercard.png" alt="Mastercard">
                        <img src="../../dist/img/credit/american-express.png" alt="American Express">
                        <img src="../../dist/img/credit/paypal2.png" alt="Paypal">
                        <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
                            Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra.
           
                        </p>
                    </div>
                    <!-- /.col -->
                    <div class="col-xs-6">
                        <p class="lead">Amount Due 2/22/2014</p>
                        <div class="table-responsive">
                            <table class="table">
                                <tr>
                                    <th style="width: 50%">Subtotal:</th>
                                    <td>$250.30</td>
                                </tr>
                                <tr>
                                    <th>Tax (9.3%)</th>
                                    <td>$10.34</td>
                                </tr>
                                <tr>
                                    <th>Shipping:</th>
                                    <td>$5.80</td>
                                </tr>
                                <tr>
                                    <th>Total:</th>
                                    <td>$265.24</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </section>
            <!-- /.content -->
        </div>
        <script src="../../Scripts/app.min.js"></script>
    </form>
</body>
</html>
