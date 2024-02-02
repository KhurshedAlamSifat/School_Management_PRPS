<%@ Page Title="Admission Result" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="AdmissionResult.aspx.cs" Inherits="Pages_Admission_AdmissionResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel ID="updnl" runat="server">
        <ContentTemplate>
            <div class='<%= Common.SessionInfo.Panel %>' id="criteria">
                <div class="panel-heading">
                    <asp:Label ID="Label5" runat="server" Text="Admission Circular"></asp:Label>
                </div>
                <div class="panel-body">
                    <div class="col-md-10">
                        <div class="form-horizontal">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="search" />
                                <asp:Label ID="lblError" runat="server" Font-Bold="True" SkinID="message"></asp:Label>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2">
                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Application,Year %>"></asp:Label></label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" DataTextField="Year" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2">
                                    <asp:Label ID="Label2" runat="server" Text="Circular"></asp:Label>
                                    <span class="required">*</span></label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="ddlCircular" runat="server" DataTextField="Title" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator4" runat="server" ValidationGroup="search"
                                        ErrorMessage="Circular Is Required." ControlToValidate="ddlCircular">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-8">
                                    <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" ValidationGroup="search" CssClass="btn btn-primary pull-right" Text="Show" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel panel-success">
                <div class="panel-body">
                    <hr />
                    <a href="JavaScript:PrintPanel();" class="pull-right">
                        <asp:Image ID="ImgPdf" runat="server"
                            ImageUrl="~/Images/Common/printer_icon.png" ToolTip="Print" /></a><br />
                    <hr />
                    <asp:Panel ID="pnPrint" runat="server">

                        <table class="table table-bordered table-responsive">
                            <tbody>
                                <tr>
                                    <td class="text-center">
                                        <center>
                            <img src="../../Images/Common/logo.jpg" height="60" width="120" /><br />
                            <h1 class="panel-title">PRAN-RFL PUBLIC SCHOOL</h1>
                            <h3 class="panel-title">Ghorashal, Palash, Narsingdi</h3>
                            <h3>Admission Result</h3>
                                            <h3><asp:Label ID="lblResultTitle" runat="server"></asp:Label></h3>
                                        </center>
                                    </td>
                                </tr>

                            </tbody>
                        </table>

                        <asp:DataList ID="dlResult" DataKeyField="Id" OnItemCreated="dlResult_ItemCreated" FooterStyle-HorizontalAlign="Center" runat="server" RepeatColumns="3">
                            <HeaderTemplate>
                                <div class="row">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class="col-md-12">
                                    <div class="panel-heading">
                                        
                                        <h1 class="panel-title text-center"><u><%# Eval("QuotaName") %></u></h1>
                                        <asp:HiddenField ID="hdnQuotaId" runat="server" Value='<%# Eval("Id") %>' />
                                        <asp:HiddenField ID="hdnvacancy" runat="server" Value='<%# Eval("Percentage") %>' />
                                        <div class="panel-body">
                                            <asp:GridView ID="gvQuotaResult" runat="server" AutoGenerateColumns="false" ForeColor="Black" CssClass="table table-responsive">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Position">
                                                        <ItemTemplate>
                                                            <%# Container.DataItemIndex+1 %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="Id" HeaderText="Application Id" />
                                                    <asp:BoundField DataField="Name" HeaderText="Name" />
                                                    <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                   
                                </div>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" />
                            <FooterTemplate>
                                </div>
                            </FooterTemplate>
                        </asp:DataList>
                        <br />

                        <img src="../../Images/Common/principal_sign_pip.jpeg" height="50" width="140" /><br />
                        <b>Principal's Signature</b>
                    </asp:Panel>
                </div>
                <div class="panel-footer">
                    <asp:Button ID="btnSave" runat="server" CssClass="btn btn-flat btn-primary pull-right"
                        Text="Publish"
                        OnClick="btnSave_Click" />
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
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
