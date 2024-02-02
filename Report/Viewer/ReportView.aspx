<%@ Page Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="ReportView.aspx.cs" Inherits="Report_Designer_ReportView" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="row">
        <CR:CrystalReportViewer ID="CRV" runat="server" Width="100%" HasCrystalLogo="False"
            CssClass="LeftAlign" EnableParameterPrompt="False" HasGotoPageButton="False"
            BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" HasSearchButton="False"
            HasDrillUpButton="False" />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
