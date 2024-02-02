<%@ Page Title="Notice" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="Notice.aspx.cs" Inherits="Pages_Student_Notice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
    <asp:Repeater ID="rptNews" runat="server">
        <HeaderTemplate>
            <table id="example1" class="table table-bordered table-hover">
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
                    <asp:HyperLink ID="HyperLink2" runat="server" Text='<%#Eval("Title") %>' NavigateUrl='<%# String.Concat("~/Pages/Student/ViewNotice.aspx?ID=", Eval("Id")) %>'></asp:HyperLink></td>
                <td><%#Convert.ToDateTime(Eval("Date")).ToString("dd-MMM-yyyy") %></td>
                <td><%#Eval("ShortDescription") %></td>
                <td class="text-center"><a href='/VariableContent/NoticeAttachment/<%# Eval("Files") %>' target="_blank"><%# String.IsNullOrEmpty(Eval("Files").ToString())?"N/A":"Download" %></a></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </tbody>
           </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" Runat="Server">
</asp:Content>

