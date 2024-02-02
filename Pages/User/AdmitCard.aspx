<%@ Page Title="Admit Card" Language="C#" MasterPageFile="~/MasterPage/Site.master" AutoEventWireup="true" CodeFile="AdmitCard.aspx.cs" Inherits="Pages_User_AdmitCard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <h1 class="panel-title text-center">Admit Card Download</h1>
    <hr />
    <div class="form-horizontal">
        <%--<div class="form-group">
            <label class="col-md-3">
                <asp:Label ID="Label3" runat="server" Text="Branch"></asp:Label>
            </label>
            <div class="col-md-6">
                <asp:DropDownList ID="ddlBranch" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Narsingdi" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Habiganj" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Danga" Value="3"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>--%>
        <div class="form-group">
            <label class="col-md-3">
                <asp:Label ID="Label1" runat="server" Text="Application ID"></asp:Label>
            </label>
            <div class="col-md-6">
                <asp:TextBox ID="tbxApplicationId" required="required" placeholder="Enter Application ID" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3">
                <asp:Label ID="lbTransId" runat="server" Text="Transaction ID"></asp:Label>
            </label>
            <div class="col-md-6">
                <asp:TextBox ID="tbxTransactionId" required="required" runat="server" placeholder="Payment Transaction ID" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3">
            </label>
            <div class="col-md-6">
                <asp:Button ID="btnSave" OnClick="btnSave_Click" runat="server" CssClass="btn btn-block btn-success" Text="Download" />
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
                                <img src="../../Images/Common/logo.jpg" height="60" width="120" /><br />
                                <h1 class="panel-title">
                                    <asp:Label ID="lblSchoolName" Text="PRAN-RFL PUBLIC SCHOOL" runat="server"> </asp:Label></h1>
                                <h3 class="panel-title">
                                    <asp:Label ID="lblAddress" Text="Ghorashal, Narsingdi" runat="server"> </asp:Label></h3>
                                <h3>ADMIT CARD-<asp:Label ID="lbYear" runat="server"></asp:Label></h3>
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
                        <th>Mobile </th>
                        <td colspan="2">
                            <asp:Label ID="lbMobile" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th class="col-md-3">Father's Name</th>
                        <td class="col-md-4">
                            <asp:Label ID="lbFatherName" runat="server"></asp:Label></td>
                        <th class="col-md-3">Mother's Name </th>
                        <td colspan="2" class="text-left">
                            <asp:Label ID="lbMotherName" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th class="col-md-3">Exam Date</th>
                        <td class="col-md-4">
                            <asp:Label ID="lblExamDate" runat="server"></asp:Label></td>
                        <th class="col-md-3">Time </th>
                        <td colspan="2" class="text-left">
                            <asp:Label ID="lblExamTime" runat="server"></asp:Label></td>
                    </tr>
                </tbody>
            </table>


            <br />


            <asp:Image runat="server" ID="imgPrincipalSignature" ImageUrl="~/Images/Common/pip.jpg" Height="50" Width="140" />
            <br />
            <b>Principal's Signature</b>
            <p><i>NB:It is mandatory to bring this Admit Card at the time of exam and admission</i></p>
        </asp:Panel>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphRight" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="Server">
    <script type="text/javascript">
        function PrintPanel() {
            var panel = document.getElementById("<%=pnPrint.ClientID %>");
            var windowHeight = window.innerHeight;
            var windowWidth = window.innerWidth;
            var printWindow = window.open('', '', 'letf=0,top=0,height=' + windowHeight + ',width=' + windowWidth + ',toolbar=0,scrollbars=1,status=0');
            printWindow.document.write("<html><head><title>Admitcard</title>");
            printWindow.document.write('<style>.text-left {text-align: left;} .text-right {text-align: right;} .text-center {text-align: center;}.text-justify {text-align: justify;}.text-nowrap {white-space: nowrap;}.text-lowercase {text-transform: lowercase;}.text-uppercase {text-transform: uppercase;}.text-capitalize {text-transform: capitalize;}.img-thumbnail {display: inline-block;max-width: 100%;height: auto;padding: 4px;line-height: 1.22857143;background-color: #fff;border: 1px solid #ddd;border-radius: 4px;-webkit-transition: all .2s ease-in-out;-o-transition: all .2s ease-in-out;transition: all .2s ease-in-out;}.panel-title {margin-top: 0;margin-bottom: 0;font-size: 16px;color: inherit;}.table {width: 100%;max-width: 100%;margin-bottom: 15px;} .table {border-collapse: collapse !important;}.table td, .table th {background-color: #fff !important;}.table-bordered th, .table-bordered td {border: 1px solid #ddd !important;}.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {padding: 5px;line-height: 1.22857143; vertical-align: top;border-top: 1px solid #ddd; text-align:left }.table > thead > tr > th {vertical-align: bottom;border-bottom: 2px solid #ddd;}.table > caption + thead > tr:first-child > th, .table > colgroup + thead > tr:first-child > th, .table > thead:first-child > tr:first-child > th, .table > caption + thead > tr:first-child > td, .table > colgroup + thead > tr:first-child > td, .table > thead:first-child > tr:first-child > td {border-top: 0;}.table > tbody + tbody {border-top: 2px solid #ddd;}.table .table {background-color: #fff;}.table-bordered {border: 1px solid #ddd;}.table-bordered > thead > tr > th, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td {border: 1px solid #ddd;}.table-bordered > thead > tr > th, .table-bordered > thead > tr > td {border-bottom-width: 2px;}</style></head><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.focus();
            printWindow.print();
            printWindow.close();

        }
    </script>
</asp:Content>

