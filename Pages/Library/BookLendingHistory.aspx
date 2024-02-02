<%@ Page Title="Book Lending History" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="BookLendingHistory.aspx.cs" Inherits="Pages_Library_BookLendingHistory" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="panel panel-success">
        <div class="panel-body">
            <div class="col-lg-6 col-md-6">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label22" runat="server" Text="Book Tr Id"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="tbxBookTrId" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label23" runat="server" Text="Issue Date"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="tbxIssueDate" runat="server" CssClass="form-control" placeholder="dd/MM/yyyy"></asp:TextBox>
                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxIssueDate"
                                TargetControlID="tbxIssueDate">
                            </cc1:CalendarExtender>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label11" runat="server" Text="Status"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlStatus" runat="server" DataTextField="Value" DataValueField="Key" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label27" runat="server" Text="User Name"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="tbxUserName" runat="server" placeholder="Enter Application ID" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label28" runat="server" Text="Return Date"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="tbxTargatedReturnDate" runat="server" CssClass="form-control" placeholder="dd/MM/yyyy"></asp:TextBox>
                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxTargatedReturnDate"
                                TargetControlID="tbxTargatedReturnDate">
                            </cc1:CalendarExtender>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-success" />
        </div>
    </div>
    <div class="panel panel-success">
        <div class="panel-body">
            <asp:Repeater ID="rpt" runat="server">
                <HeaderTemplate>
                    <table id="example1" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>
                                    <asp:Label ID="Label7" runat="server" Text="Book"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label4" runat="server" Text="Taken By"></asp:Label></th>

                                <th>
                                    <asp:Label ID="Label3" runat="server" Text="IssueDate"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label16" runat="server" Text="TargatedReturnDate"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label6" runat="server" Text="StatusUpdationDate"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label2" runat="server" Text="Status"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label5" runat="server" Text="Note"></asp:Label></th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("TrackingId") %><br />
                            <%#Eval("TitleEng") %></td>
                        <td><%#Eval("UserName") %><br />
                            <%#Eval("NameEng") %></td>
                        <td><%#Eval("IssueDate") %></td>
                        <td><%#Eval("TargatedReturnDate") %></td>
                        <td><%#Eval("StatusUpdationDate") %></td>
                        <td><%#Eval("Status") %></td>
                        <td><%#Eval("Note") %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
                                </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

