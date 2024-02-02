<%@ Page Title="Download Application" Language="C#" MasterPageFile="~/MasterPage/Site.master" AutoEventWireup="true" CodeFile="ApplicationDownload.aspx.cs" Inherits="Pages_User_ApplicationDownload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
   <%-- <div class="form-group">
        <div style="margin-bottom: 25px" class="input-group">
            <span class="input-group-addon">Branch</span>
            <asp:DropDownList ID="ddlBranch" runat="server" CssClass="form-control">
                <asp:ListItem Text="Narsingdi" Value="1"></asp:ListItem>
                <asp:ListItem Text="Habiganj" Value="2"></asp:ListItem>
                <asp:ListItem Text="Danga" Value="3"></asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>--%>
    <hr />
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-md-3">
                <asp:Label ID="Label1" runat="server" Text="Application ID"></asp:Label>
            </label>
            <div class="col-md-6">
                <asp:TextBox ID="tbxApplicationId" required="required" placeholder="Enter Application ID" runat="server" CssClass="form-control"></asp:TextBox>
                <ajaxToolkit:FilteredTextBoxExtender ID="fteApplicationId" runat="server" TargetControlID="tbxApplicationId" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
            </div>
        </div>
        <%-- <div class="form-group">
            <label class="col-md-3">
                <asp:Label ID="lbTransId" runat="server" Text="Transaction ID"></asp:Label>
            </label>
            <div class="col-md-6">
                <asp:TextBox ID="tbxTransactionId" runat="server" placeholder="Payment Transaction ID" CssClass="form-control"></asp:TextBox>
            </div>
        </div>--%>
        <div class="form-group">
            <label class="col-md-3">
            </label>
            <div class="col-md-6">
                <asp:Button ID="btnSave" OnClick="btnSave_Click" runat="server" CssClass="btn btn-block btn-success" Text="Submit" />
            </div>
        </div>
    </div>
    <asp:Panel ID="pnContent" runat="server" Visible="false">
        <hr />
        <a href="JavaScript:PrintPanel();" class="pull-right">
            <asp:Image ID="ImgPdf" runat="server"
                ImageUrl="~/Images/Common/printer_icon.png" ToolTip="Print" /></a><br />
        <hr />
        <asp:Panel ID="pnPrint" runat="server">
            <table class="table table-bordered table-responsive">
                <tbody>
                    <tr>
                        <td class="col-md-2">
                            <label>
                                <asp:Label ID="lbAppid" runat="server" Text="ID"></asp:Label></label>
                            <span>:
                                <asp:Label ID="lbApplicationID" runat="server"></asp:Label></span>

                            <br />
                            <label>
                                <asp:Label ID="Label11" runat="server" Text="Year"></asp:Label></label>
                            <span>:
                                <asp:Label ID="lbYear" runat="server"></asp:Label></span>
                            <br />
                            <label>
                                <asp:Label ID="Label13" runat="server" Text="Class"></asp:Label></label>
                            <span>:
                                <asp:Label ID="lbClass" runat="server"></asp:Label></span>
                            <br />
                            <label>
                                <asp:Label ID="Label15" runat="server" Text="Group"></asp:Label></label>
                            <span>:
                                <asp:Label ID="lbGroup" runat="server"></asp:Label></span>

                        </td>
                        <td class="text-center" colspan="3">
                            <center>
                                <img src="../../Images/Common/Logo of PRPS.jpg" height="60" width="120" /><br />
                                <h1 class="panel-title">PRAN-RFL PUBLIC SCHOOL</h1>
                                <h3 class="panel-title">
                                    <asp:Label ID="lblAddress" Text="Ghorashal, Narsingdi" runat="server"> </asp:Label></h3>
                            </center>
                        </td>
                        <td class="col-md-2 text-right">
                            <asp:Image runat="server" ID="imgPhoto" CssClass="img-responsive img-thumbnail" ImageUrl="~/Images/Common/student.png" Height="140" Width="140" AlternateText="StudentPhoto" />
                        </td>
                    </tr>
                    <tr>
                        <th>Name</th>
                        <td>
                            <asp:Label ID="lbName" runat="server"></asp:Label></td>
                        <th>Application Date </th>
                        <td colspan="2">
                            <asp:Label ID="lbApplicationDate" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th class="col-md-3">Father's Name</th>
                        <td class="col-md-4">
                            <asp:Label ID="lbFatherName" runat="server"></asp:Label></td>
                        <th class="col-md-3">Date of Birth </th>
                        <td colspan="2" class="text-left">
                            <asp:Label ID="lbDateofBirth" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>Mother's Name</th>
                        <td>
                            <asp:Label ID="lbMotherName" runat="server"></asp:Label></td>
                        <th>Religion </th>
                        <td colspan="2">
                            <asp:Label ID="lbReligion" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>Mobile(SMS)</th>
                        <td>
                            <asp:Label ID="lbMobile" runat="server"></asp:Label></td>
                        <th>Mobile(Home)</th>
                        <td colspan="2">
                            <asp:Label ID="lbMobileHome" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>E-mail</th>
                        <td>
                            <asp:Label ID="lbEmail" runat="server"></asp:Label></td>
                        <th>Nationality</th>
                        <td colspan="2">
                            <asp:Label ID="lbNationality" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>Division</th>
                        <td>
                            <asp:Label ID="lbDivision" runat="server"></asp:Label></td>
                        <th>District</th>
                        <td colspan="2">
                            <asp:Label ID="lbDistrict" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>Thana</th>
                        <td>
                            <asp:Label ID="lbThana" runat="server"></asp:Label></td>
                        <th>Post Office</th>
                        <td colspan="2">
                            <asp:Label ID="lbPostOffice" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>Address</th>
                        <td>
                            <asp:Label ID="lbAddress" runat="server"></asp:Label></td>
                        <th>Post Code</th>
                        <td colspan="2">
                            <asp:Label ID="lbPostCode" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>Quota</th>
                        <td colspan="4">
                            <asp:DataList ID="dlQuota" CssClass="table" RepeatColumns="4" runat="server">
                                <ItemTemplate>
                                    <%# Eval("QuotaName") %>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                </tbody>
            </table>
            <br />
            <br />
            <br />
            <table class="table table-responsive table-bordered">
                <tbody>
                    <tr>
                        <td>Student's Signature</td>
                        <td class="text-right">Guardian's Signature</td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <br />
                            <br />
                        </td>
                        <td class="text-right">
                            <br />
                            <br />
                            <br />
                        </td>
                    </tr>
                </tbody>
            </table>
        </asp:Panel>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphRight" runat="Server">
    <script type="text/javascript">
        function PrintPanel() {
            var panel = document.getElementById("<%=pnPrint.ClientID %>");
            var windowHeight = window.innerHeight;
            var windowWidth = window.innerWidth;
            var printWindow = window.open('', '', 'letf=0,top=0,height=' + windowHeight + ',width=' + windowWidth + ',toolbar=0,scrollbars=1,status=0');
            printWindow.document.write("<html><head><title>DIV Contents</title>");
            printWindow.document.write('<style>.text-left {text-align: left;} .text-right {text-align: right;} .text-center {text-align: center;}.text-justify {text-align: justify;}.text-nowrap {white-space: nowrap;}.text-lowercase {text-transform: lowercase;}.text-uppercase {text-transform: uppercase;}.text-capitalize {text-transform: capitalize;}.img-thumbnail {display: inline-block;max-width: 100%;height: auto;padding: 4px;line-height: 1.42857143;background-color: #fff;border: 1px solid #ddd;border-radius: 4px;-webkit-transition: all .2s ease-in-out;-o-transition: all .2s ease-in-out;transition: all .2s ease-in-out;}.panel-title {margin-top: 0;margin-bottom: 0;font-size: 16px;color: inherit;}.table {width: 100%;max-width: 100%;margin-bottom: 20px;} .table {border-collapse: collapse !important;}.table td, .table th {background-color: #fff !important;}.table-bordered th, .table-bordered td {border: 1px solid #ddd !important;}.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {padding: 8px;line-height: 1.42857143; vertical-align: top;border-top: 1px solid #ddd; text-align:left }.table > thead > tr > th {vertical-align: bottom;border-bottom: 2px solid #ddd;}.table > caption + thead > tr:first-child > th, .table > colgroup + thead > tr:first-child > th, .table > thead:first-child > tr:first-child > th, .table > caption + thead > tr:first-child > td, .table > colgroup + thead > tr:first-child > td, .table > thead:first-child > tr:first-child > td {border-top: 0;}.table > tbody + tbody {border-top: 2px solid #ddd;}.table .table {background-color: #fff;}.table-bordered {border: 1px solid #ddd;}.table-bordered > thead > tr > th, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td {border: 1px solid #ddd;}.table-bordered > thead > tr > th, .table-bordered > thead > tr > td {border-bottom-width: 2px;}</style></head><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.focus();
            printWindow.print();
            printWindow.close();

        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

