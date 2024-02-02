<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="StaticContent.aspx.cs" Inherits="Pages_Admin_StaticContent" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="form-horizontal">
        <div class="form-group">
            <div class="col-md-10 col-sm-10 col-xs-10">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="save" />
                <asp:Label ID="lblError" runat="server" Font-Bold="True" SkinID="message"></asp:Label>
                <asp:HiddenField ID="hdnID" runat="server" />
            </div>
        </div>
        <div class="form-group">
            <label for="inputEmail3" class="col-sm-2">Page Name</label>
            <div class="col-sm-3">
                <asp:DropDownList ID="ddlPage" runat="server" DataTextField="PageName" DataValueField="Id" CssClass="form-control dropdown"
                    OnSelectedIndexChanged="ddlPage_SelectedIndexChanged" AutoPostBack="true">
                </asp:DropDownList>

            </div>
        </div>
        <div class="form-group">
            <asp:UpdatePanel>
                <ContentTemplate>
                    <label for="inputEmail3" class="col-sm-2">Content</label>
                    <div class="col-sm-7">
                        <cc1:Editor ID="tbxContent" runat="server" />
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlPage" />
                </Triggers>
            </asp:UpdatePanel>
        </div>


        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-11">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" ValidationGroup="save"
                    OnClick="btnSave_Click" />
            </div>
        </div>
    </div>
</asp:Content>

