<%@ Page Title="Admission Test Schedule" Language="C#" MasterPageFile="~/MasterPage/Site.master" AutoEventWireup="true" CodeFile="AdmissionTestSchedule.aspx.cs" Inherits="Pages_User_AdmissionTestSchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <label for="inputEmail3" class="col-sm-1">
        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Application,Year %>"></asp:Label></label>
    <div class="col-sm-3">
        <asp:DropDownList ID="ddlYear" AutoPostBack="true" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" runat="server" DataTextField="Year" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
    </div>
    <%--<label for="inputEmail3" class="col-sm-1">
        <asp:Label ID="Label2" runat="server" Text="Branch"></asp:Label></label>
    <div class="col-sm-3">
        <asp:DropDownList ID="ddlBranch" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged">
            <asp:ListItem Text="Narsingdi" Value="1"></asp:ListItem>
            <asp:ListItem Text="Habiganj" Value="2"></asp:ListItem>
            <asp:ListItem Text="Danga" Value="3"></asp:ListItem>
        </asp:DropDownList>
    </div>--%>
    <br />
    <br />
    <asp:GridView ID="gvRoutine" runat="server" CssClass="table table-responsive table-hover table bordered" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="Circular" />
            <asp:BoundField DataField="ExamDate" HeaderText="Exam Date" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="ExamStartTime" HeaderText="Start Time" />
            <asp:BoundField DataField="ExamEndTime" HeaderText="End Time" />
        </Columns>
    </asp:GridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphRight" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

