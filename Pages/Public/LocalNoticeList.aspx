<%@ Page Title="Campus Notice List" Language="C#" MasterPageFile="~/MasterPage/PublicMaster.master" AutoEventWireup="true" CodeFile="LocalNoticeList.aspx.cs" Inherits="Pages_Public_LocalNoticeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="panel panel-success">
        <div class="panel-body">
            <asp:Repeater ID="rptNotice" runat="server">
                <HeaderTemplate>
                    <table id="example1" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>
                                    <asp:Label ID="Label12" runat="server" Text="Title"></asp:Label></th>

                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("Title") %></td>
                        <td>
                            <a href="../Public/ViewLocalNotice.aspx?id=<%#Eval("Id") %>">View</td>
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

