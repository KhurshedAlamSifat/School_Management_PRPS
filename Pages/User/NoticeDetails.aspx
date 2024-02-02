<%@ Page Title="Notice Details" Language="C#" MasterPageFile="~/MasterPage/Site.master" AutoEventWireup="true" CodeFile="NoticeDetails.aspx.cs" Inherits="Pages_User_NoticeDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <h1>
        <asp:Label ID="lblTitle" runat="server"></asp:Label></h1>
    <h4>
        <asp:Label ID="lbDate" runat="server"></asp:Label></h4>
    <p><i class="fa fa-paperclip"></i> <asp:HyperLink Target="_blank" ID="hlAttachment" runat="server" Text="Attachment"></asp:HyperLink></p>
    <p>
        <asp:Literal ID="litDetails" runat="server"></asp:Literal>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphRight" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

