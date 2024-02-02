<%@ Page Title="Admission Test Result" Language="C#" MasterPageFile="~/MasterPage/Site.master" AutoEventWireup="true" CodeFile="AdmissionResult.aspx.cs" Inherits="Pages_User_AdmissionResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel ID="upnl" runat="server">
        <ContentTemplate>
            <div class="form-horizontal">
                <%--<div class="form-group">
                    <label class="col-md-3">Branch <span class="required">*</span></label>
                    <div class="col-md-6">
                        <asp:DropDownList ID="ddlBranch" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Narsingdi" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Habiganj" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Danga" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>--%>
                <div class="form-group">
                    <label class="col-md-3">Application ID <span class="required">*</span></label>
                    <div class="col-md-6">
                        <asp:TextBox ID="tbxApplicationId" required="required" placeholder="Enter Application ID" runat="server" CssClass="form-control"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="ftbApplicationId" runat="server" TargetControlID="tbxApplicationId" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                    </div>
                    <div class="col-md-3">
                        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" CssClass="btn btn-primary" Text="Submit" />
                    </div>
                </div>
            </div>
            <hr />
            <div class="panel panel-success">
                <div class="panel-body text-center">
                    <h3>
                        <asp:Label ID="lbResult" Font-Bold="true" runat="server"></asp:Label>
                    </h3>
                </div>
                <div class="panel-footer">
                </div>
            </div>
            <hr />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphRight" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

