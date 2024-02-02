<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="SendSMS.aspx.cs" Inherits="Pages_Admission_SendSMS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel ID="Updatepanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-md-10 col-sm-10 col-xs-10">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="sms" />
                                <asp:Label ID="lblError" runat="server" Font-Bold="True" SkinID="message"></asp:Label>
                                <asp:HiddenField ID="hdnID" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2">
                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Application,Year %>"></asp:Label></label>
                            <div class="col-sm-4">
                                <asp:DropDownList ID="ddlYear" runat="server" DataTextField="Year" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                            </div>
                            <label for="inputEmail3" class="col-sm-2">
                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label></label>
                            <div class="col-sm-4">
                                <asp:DropDownList ID="ddlClass" runat="server" DataTextField="ClassName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>

                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2">
                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,PaymentStatus %>"></asp:Label></label>
                            <div class="col-sm-4">
                                <asp:DropDownList ID="ddlPaymentStatus" runat="server" CssClass="form-control dropdown">
                                    <asp:ListItem Value="">Select</asp:ListItem>
                                    <asp:ListItem Value="0">Pending</asp:ListItem>
                                    <asp:ListItem Value="1">Paid</asp:ListItem>
                                </asp:DropDownList>

                            </div>
                            <label for="inputEmail3" class="col-sm-2">
                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,ApplicationId %>"></asp:Label></label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="tbxApplicatoinID" runat="server" placeholder="Application ID" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2">
                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Application,Mobile %>"></asp:Label></label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="tbxMobile" runat="server" placeholder="Mobile" CssClass="form-control"></asp:TextBox>
                            </div>
                            </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2">
                                <asp:Label ID="Label1" runat="server" Text="SMS"></asp:Label></label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="tbxSMS" runat="server" TextMode="MultiLine" placeholder="SMS" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator2" runat="server" ValidationGroup="sms"
                            ErrorMessage="Enter Message" ControlToValidate="tbxSMS">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-9 text-right">
                                <asp:Button ID="btnSearch" runat="server" Text="<%$ Resources:Application,Search %>" CssClass="btn btn-primary"
                                    OnClick="btnSearch_Click" />
                                <asp:Button ID="btnSend" runat="server" Text="Send SMS" ValidationGroup="sms" CssClass="btn btn-primary"
                                    OnClick="btnSend_Click" />
                                <asp:Button ID="btnTransID" runat="server" Text="Send Admit(SMS)" CssClass="btn btn-primary"
                                    OnClick="btnTransID_Click" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <div class="box">
                                    <div class="box-body" style="max-height: 700px; overflow: auto;">
                                        <asp:Repeater ID="rptApplicationList" runat="server">
                                            <HeaderTemplate>
                                                <table id="example1" class="table table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>
                                                                <asp:CheckBox ID="chkstudentHeader" runat="server" /></th>
                                                            <th>
                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,ID %>"></asp:Label></th>
                                                            <th>
                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label></th>
                                                            <th>
                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:Application,Name %>"></asp:Label></th>
                                                            <th>
                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Application,Mobile %>"></asp:Label></th>

                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:CheckBox ID="chkStudentRow" runat="server" /></td>
                                                    <td>
                                                        <asp:HyperLink ID="HyperLink2" Target="_blank" runat="server" Text='<%#Eval("Id") %>' NavigateUrl='<%# String.Concat("~/Pages/Admission/ApplicationDetails.aspx?ID=", Eval("Id")) %>'></asp:HyperLink></td>
                                                    <td><%#Eval("ClassName") %></td>
                                                    <td><%#Eval("Name") %></td>
                                                    <td><%#Eval("Mobile") %>
                                                        <asp:HiddenField ID="hdnMobile" runat="server" Value='<%#Eval("Mobile") %>' />
                                                        <asp:HiddenField ID="hdnApplicationID" runat="server" Value='<%#Eval("Id") %>' />
                                                        <asp:HiddenField ID="hdnTransactionId" runat="server" Value='<%#Eval("PaymentCode") %>' />
                                                    </td>

                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </tbody>
                                            </table>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
    <script type="text/javascript">

        function Load() {

            $("#example1 [id*=chkstudentHeader]").click(function () {
                if ($(this).is(":checked")) {
                    $("#example1 [id*=chkStudentRow]").prop("checked", true);
                } else {
                    $("#example1 [id*=chkStudentRow]").prop("checked", false);
                }
            });

            $("#example1 [id*=chkStudentRow]").click(function () {
                if ($("#example1 [id*=chkStudentRow]").length == $("#example1 [id*=chkStudentRow]:checked").length) {
                    $("#example1 [id*=chkstudentHeader]").prop("checked", true);
                } else {
                    $("#example1 [id*=chkstudentHeader]").prop("checked", false);
                }
            });

        }
        $(function () {
            Load();
        });
        //On UpdatePanel Refresh
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (prm != null) {
            prm.add_endRequest(function (sender, e) {
                Load();
            });
        };
    </script>
</asp:Content>

