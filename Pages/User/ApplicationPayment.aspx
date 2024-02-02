<%@ Page Title="Payment" Language="C#" MasterPageFile="~/MasterPage/Site.master" AutoEventWireup="true" CodeFile="ApplicationPayment.aspx.cs" Inherits="Pages_User_ApplicationPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <h1 class="panel-title text-center">Payment</h1>
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
                <asp:Label ID="Label2" runat="server" Text="Payment Method"></asp:Label>
            </label>
            <div class="col-md-6">
                <asp:DropDownList ID="ddlPaymentMethod" runat="server" CssClass="form-control" DataTextField="MethodName" DataValueField="Id"></asp:DropDownList>
            </div>
        </div>
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
                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-block btn-success" Text="Submit" />
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphRight" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

