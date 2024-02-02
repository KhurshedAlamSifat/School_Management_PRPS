<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/MasterPage/Site.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="Pages_User_ContactUs" %>

<%@ Register TagName="Contact" TagPrefix="UC" Src="~/UserControl/ContactUs.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="page-header">
        <h2 class="panel-title">PRPS Contact Details</h2>
    </div>
    <div class="col-md-12">
        <div class="row">
            <div class="col-md-12">
                <label>Contact Address: By pass Road, Fuldirtek, Ghorashal, Palash, Narsingdi</label><br />
                <label>Contact Mobile : 01844604571</label><br />
                <label>Contact Phone : 04476351136 (Ext-103)</label><br />
                <label>Contact Email : prps@pip.prangroup.com</label>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <iframe src="https://www.google.com/maps/d/embed?mid=1kcSFpNNBunGf9fzV3w0wTLmT_tQ&z=15" width="100%" height="450" frameborder="0" style="border: 0" allowfullscreen></iframe>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphRight" runat="Server">
    <UC:Contact ID="contact" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

