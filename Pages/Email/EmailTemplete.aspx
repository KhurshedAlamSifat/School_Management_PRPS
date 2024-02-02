<%@ Page Title="<%$ Resources:Application,EmailTempleteSetup %>" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="EmailTemplete.aspx.cs" Inherits="Pages_Email_EmailTemplete" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../Styles/dataTables.bootstrap.css" rel="stylesheet" />
    <link href="../../Styles/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../../Styles/jquery.dataTables_themeroller.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel ID="Updatepanel1" runat="server">
        <ContentTemplate>
            <div class="form-horizontal">
                <div class="form-group">
                    <div class="col-md-10 col-sm-10 col-xs-10">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="save" />
                        <asp:Label ID="lblError" runat="server" Font-Bold="True" SkinID="message"></asp:Label>
                        <asp:HiddenField ID="hdnID" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-md-2">
                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Application,TemplateName %>"></asp:Label></label>
                    <div class="col-md-5">
                        <asp:TextBox ID="txtTemplateName" runat="server" TextMode="SingleLine" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTemplateName" ValidationGroup="save"
                            ErrorMessage="Input Templte Name"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-md-2">
                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Application,Subject %>"></asp:Label></label>
                    <div class="col-md-5">
                        <asp:TextBox ID="txtSubject" runat="server" TextMode="SingleLine" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSubject" ValidationGroup="save"
                            ErrorMessage="Input Subject"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-md-2">
                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,Variables %>"></asp:Label></label>
                    <div class="col-md-5">
                        <asp:TextBox ID="tbxVariables" runat="server" TextMode="SingleLine" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbxVariables" ValidationGroup="save"
                            ErrorMessage="Input Variables"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-md-2">
                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Application,Description %>"></asp:Label></label>
                    <div class="col-sm-7">
                        <cc1:Editor ID="tbxDetails" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-2 col-sm-10">
                        <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="<%$ Resources:Application,Save %>" OnClick="btnSave_Click" ValidationGroup="save"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <div class="box">
                            <div class="box-body">
                                <asp:Repeater ID="rptYear" runat="server">
                                    <HeaderTemplate>
                                        <table id="example1" class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th><asp:Label ID="Label2" runat="server" Text="<%$ Resources:Application,TemplateName %>"></asp:Label></th>
                                                    <th><asp:Label ID="Label6" runat="server" Text="<%$ Resources:Application,Subject %>"></asp:Label></th>
                                                    <th><asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,Variables %>"></asp:Label></th>
                                                    <th><asp:Label ID="Label4" runat="server" Text="<%$ Resources:Application,Action %>"></asp:Label></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><%#Eval("TemplateName") %></td>
                                            <td><%#Eval("Subject") %></td>
                                            <td><%#Eval("Variables") %></td>
                                            <td>
                                                <asp:ImageButton ID="btnEdit" runat="server" OnCommand="btnEdit_Command" CommandArgument='<%# Eval("Id")%>' ImageUrl="~/Images/Common/edit.png" ToolTip="Edit" />
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
        </ContentTemplate>
    </asp:UpdatePanel>

    <script src="../../Scripts/jquery-2.1.3.min.js"></script>
    <script src="../../Scripts/dataTables.bootstrap.min.js"></script>
    <script src="../../Scripts/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#example1").DataTable();
            $('#example2').DataTable({
                "paging": true,
                "lengthChange": false,
                "searching": false,
                "ordering": true,
                "info": true,
                "autoWidth": false
            });
            //$(".treeview").removeClass("active");
            $(".aa").first().closest(".treeview").addClass("active");
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
            function EndRequestHandler(sender, args) {
                $("#example1").DataTable();
                $('#example2').DataTable({
                    "paging": true,
                    "lengthChange": false,
                    "searching": false,
                    "ordering": true,
                    "info": true,
                    "autoWidth": false
                });
                //$(".treeview").removeClass("active");
                $(".aa").first().closest(".treeview").addClass("active");
            }
        });
    </script>
</asp:Content>

