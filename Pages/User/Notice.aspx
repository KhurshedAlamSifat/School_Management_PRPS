<%@ Page Title="Notice" Language="C#" MasterPageFile="~/MasterPage/Site.master" AutoEventWireup="true" CodeFile="Notice.aspx.cs" Inherits="Pages_User_Notice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <h1>Notice</h1>
    <asp:Repeater ID="rptNews" runat="server">
        <HeaderTemplate>
            <table id="example13" class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Date</th>
                        <th>Description</th>
                        <th>Attachment</th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:HyperLink ID="HyperLink2" runat="server" Text='<%#Eval("Title") %>' NavigateUrl='<%# String.Concat("~/Pages/User/NoticeDetails.aspx?ID=", Eval("Id")) %>'></asp:HyperLink></td>
                <td><%#Convert.ToDateTime(Eval("Date")).ToString("dd-MMM-yyyy") %></td>
                <td><%#Eval("ShortDescription") %></td>
                <td class="text-center"><a href='<%# String.IsNullOrEmpty(Eval("Files").ToString())?"":"/VariableContent/NoticeAttachment/"+ Eval("Files") %>' target="_blank"><%# String.IsNullOrEmpty(Eval("Files").ToString())?"N/A":"Download" %></a></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </tbody>
           </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphRight" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

