<%@ Page Title="Notice Details" Language="C#" MasterPageFile="~/MasterPage/PublicMaster.master" AutoEventWireup="true" CodeFile="ViewGlobalNotice.aspx.cs" Inherits="Pages_Public_ViewGlobalNotice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <h1><% =Title %></h1>
    <p>
        <% =ContentString %>
    </p>
    <p><i class="fa fa-paperclip"></i> <asp:HyperLink Target="_blank" ID="hlAttachment" runat="server" Text="Attachment"></asp:HyperLink></p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

