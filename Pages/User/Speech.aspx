<%@ Page Title="Speech" Language="C#" MasterPageFile="~/MasterPage/Site.master" AutoEventWireup="true" CodeFile="Speech.aspx.cs" Inherits="Pages_User_Speech" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
    <h1 class="panel-title"><asp:Label ID="lbHeading" runat="server"></asp:Label></h1>
    <hr />
    <p class="text-justify"><asp:Literal ID="ltSpeech"  runat="server"></asp:Literal></p>
    <hr />
    <h2 class="panel-title"><asp:Literal ID="lblName" runat="server"></asp:Literal></h2>
    <h4 class="panel-title">PRAN-RFL Public School(PRPS)</h4>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphRight" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" Runat="Server">
</asp:Content>

