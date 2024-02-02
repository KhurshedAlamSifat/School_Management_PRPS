<%@ Page Title="Circular Details" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="CircularDetails.aspx.cs" Inherits="Pages_Admission_CircularDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="row">
        <i class="fa fa-paperclip"></i>
        <asp:HyperLink Target="_blank" ID="hlAttachment" runat="server" Text="Attachment"></asp:HyperLink>
        <a class="pull-right" href="JavaScript:PrintPanel();">
            <asp:Image ID="ImgPdf" runat="server"
                ImageUrl="~/Images/Common/printer_icon.png" ToolTip="Print" /></a>
        <asp:Panel ID="pnPrint" runat="server">
            <table class="table table-bordered table-responsive">
                <tbody>
                    <tr>
                        <td class="text-center" colspan="4">
                            <center>
                            <img src="../../Images/Common/Logo of PRPS.jpg" height="60" width="120" /><br />
                            <h1 class="panel-title">PRAN-RFL PUBLIC SCHOOL</h1>
                            <h3 class="panel-title">Admission Circular</h3></center>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Application,Title %>"></asp:Label></td>
                        <td>
                            <asp:Label ID="lbTitle" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Application,Year %>"></asp:Label></td>
                        <td>
                            <asp:Label ID="lbYear" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label></td>
                        <td>
                            <asp:Label ID="lbClass" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,ApplicationStartDate %>"></asp:Label></td>
                        <td>
                            <asp:Label ID="lbStartDate" runat="server"></asp:Label></td>


                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,ApplicationFee %>"></asp:Label></td>
                        <td>
                            <asp:Label ID="lbApplicationFee" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Application,ApplicationEndDate %>"></asp:Label></td>
                        <td>
                            <asp:Label ID="lbEndDate" runat="server"></asp:Label></td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:Application,Details %>"></asp:Label></td>
                        <td colspan="3">
                            <asp:Literal ID="ltDetails" runat="server"></asp:Literal>
                        </td>
                    </tr>
                </tbody>
            </table>
        </asp:Panel>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
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

