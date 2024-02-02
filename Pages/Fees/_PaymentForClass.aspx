<%@ Page Title="<%$ Resources:Application,FeesforClass %>" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="_PaymentForClass.aspx.cs" Inherits="Pages_Fees_PaymentForClass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="row">
        <div class="col-sm-3">
            <div class="form-horizontal">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2">
                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,Year %>"></asp:Label></label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="ddlYear" runat="server" DataTextField="Year" DataValueField="Year" CssClass="form-control dropdown"></asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="form-horizontal">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-3">
                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Application,Month %>"></asp:Label></label>
                    <div class="col-sm-9">
                        <asp:DropDownList ID="ddlMonth" runat="server" CssClass="form-control dropdown" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Text="January" Value="1"></asp:ListItem>
                            <asp:ListItem Text="February" Value="2"></asp:ListItem>
                            <asp:ListItem Text="March" Value="3"></asp:ListItem>
                            <asp:ListItem Text="April" Value="4"></asp:ListItem>
                            <asp:ListItem Text="May" Value="5"></asp:ListItem>
                            <asp:ListItem Text="June" Value="6"></asp:ListItem>
                            <asp:ListItem Text="July" Value="7"></asp:ListItem>
                            <asp:ListItem Text="August" Value="8"></asp:ListItem>
                            <asp:ListItem Text="September" Value="9"></asp:ListItem>
                            <asp:ListItem Text="October" Value="10"></asp:ListItem>
                            <asp:ListItem Text="November" Value="11"></asp:ListItem>
                            <asp:ListItem Text="December" Value="12"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="form-horizontal">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2">
                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label></label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="ddlClass" runat="server" DataTextField="ClassName" DataValueField="Id" CssClass="form-control dropdown" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="form-horizontal">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2">
                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Application,Group %>"></asp:Label></label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="ddlGroup" runat="server" DataTextField="GroupName" DataValueField="Id" CssClass="form-control dropdown" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-5">
            <div class='<%= Common.SessionInfo.Panel %>'>
                <div class="panel-heading">
                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,FeesforClass %>"></asp:Label>
                    <a href="#" title="Add new Type" id="newItem" data-toggle="modal" data-target="#Item" class="pull-right"><i class="fa fa-plus"></i></a>
                </div>
                <div class="panel-body">
                    <asp:Panel ID="pnlEdit" runat="server">
                        <asp:Repeater ID="rptEdit" runat="server">
                            <HeaderTemplate>
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>
                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,PaymentType %>"></asp:Label></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("PaymentType") %>
                                        <asp:HiddenField ID="hdnId" runat="server" Value='<%#Eval("Id") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbxPaymentType" runat="server" paleholder="Enter Payment Amount" CssClass="form-control" Text='<%#Eval("Amount")==""?"0":Eval("Amount") %>'></asp:TextBox>
                                        <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer"
                                            ControlToValidate="tbxPaymentType" ErrorMessage="Value must be a whole number" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                    <asp:Panel ID="pnlNew" runat="server">
                        <asp:Repeater ID="rptPaymentType" runat="server">
                            <HeaderTemplate>
                                <table  class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>
                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,PaymentType %>"></asp:Label></th>
                                            <th>Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("PaymentType") %>
                                        <asp:HiddenField ID="hdnId" runat="server" Value='<%#Eval("Id") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbxPaymentType" runat="server" paleholder="Enter Payment Amount" CssClass="form-control"></asp:TextBox>
                                        <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer"
                                            ControlToValidate="tbxPaymentType" ErrorMessage="Value must be a whole number" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                </div>
                <div class="panel-footer" align="right">
                    <asp:Button ID="btnPayment" runat="server" OnClick="btnPayment_Click" CssClass="btn btn-default" Text="<%$ Resources:Application,Submit %>" />
                </div>
            </div>
        </div>
        <div class="col-sm-2">
            <div class='<%= Common.SessionInfo.Panel %>'>
                <div class="panel-heading">
                    <asp:Label ID="Label25" runat="server" Text="Month"></asp:Label>
                </div>
                <div class="panel-body">
                    <asp:CheckBoxList ID="chkMonth" runat="server">
                        <asp:ListItem Text="January" Value="1"></asp:ListItem>
                        <asp:ListItem Text="February" Value="2"></asp:ListItem>
                        <asp:ListItem Text="March" Value="3"></asp:ListItem>
                        <asp:ListItem Text="April" Value="4"></asp:ListItem>
                        <asp:ListItem Text="May" Value="5"></asp:ListItem>
                        <asp:ListItem Text="June" Value="6"></asp:ListItem>
                        <asp:ListItem Text="July" Value="7"></asp:ListItem>
                        <asp:ListItem Text="August" Value="8"></asp:ListItem>
                        <asp:ListItem Text="September" Value="9"></asp:ListItem>
                        <asp:ListItem Text="October" Value="10"></asp:ListItem>
                        <asp:ListItem Text="November" Value="11"></asp:ListItem>
                        <asp:ListItem Text="December" Value="12"></asp:ListItem>
                    </asp:CheckBoxList>
                </div>
            </div>

        </div>
        <div class="col-sm-5">
            <div class='<%= Common.SessionInfo.Panel %>'>
                <div class="panel-heading">
                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Application,Fees %>"></asp:Label>
                </div>
                <div class="panel-body">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Repeater ID="rptPaymentByClass" runat="server">
                                <HeaderTemplate>
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,PaymentType %>"></asp:Label></th>
                                                <th>Amount</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("PaymentType") %></td>
                                        <td><%#Eval("Amount") %></td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </tbody>
                                </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlClass" />
                            <asp:AsyncPostBackTrigger ControlID="ddlMonth" />
                            <asp:AsyncPostBackTrigger ControlID="ddlGroup" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div class="panel-footer">
                    <asp:Button ID="btnEdit" runat="server" CssClass="btn btn-default" Text="Edit" OnClick="btnEdit_Click" />
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="modal fade" tabindex="-1" id="Item" role="dialog">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-header bg-danger">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Add New Payment Type</h4>
                    </div>
                    <div class="modal-body text-center">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-md-10 col-sm-10 col-xs-10">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="save" />
                                    <asp:Label ID="lblError" runat="server" Font-Bold="True" SkinID="message"></asp:Label>
                                    <asp:HiddenField ID="hdnID" runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-3">
                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Application,PaymentType %>"></asp:Label></label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="tbxName" runat="server" placeholder="Enter Payment Type" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator2" runat="server" ValidationGroup="save"
                                        ErrorMessage="Enter Payment Type" ControlToValidate="tbxName">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnSave" ClientIDMode="Static" runat="server" Text="Save" CssClass="btn btn-success" ValidationGroup="save"
                            OnClick="btnSave_Click" />
                        <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

