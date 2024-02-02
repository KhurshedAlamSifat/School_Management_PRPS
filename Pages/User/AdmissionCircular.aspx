<%@ Page Title="Admission Circular" Language="C#" MasterPageFile="~/MasterPage/Site.master" AutoEventWireup="true" CodeFile="AdmissionCircular.aspx.cs" Inherits="Pages_User_AdmissionCircular" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">

    <div style="overflow: auto;">
        <asp:Repeater ID="rptYear" runat="server">
            <HeaderTemplate>
                <table id="example11" class="table table-responsive table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>
                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Application,Action %>"></asp:Label></th>
                            <th>
                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,Title %>"></asp:Label></th>
                            <th>
                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Application,Year %>"></asp:Label></th>
                            <th>
                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label></th>
                            <th>
                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:Application,ApplicationStartDate %>"></asp:Label></th>
                            <th>
                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Application,ApplicationEndDate %>"></asp:Label></th>
                            <th>
                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:Application,Fees %>"></asp:Label></th>
                            <th>
                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:Application,NoticeAttachment %>"></asp:Label></th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" Text="Apply" NavigateUrl='<%# String.Concat("~/Pages/User/NewApplication.aspx?CircularId=", Eval("Id")) %>'></asp:HyperLink></td>
                    <td>
                        <asp:HyperLink ID="HyperLink2" runat="server" Text='<%#Eval("Title") %>' NavigateUrl='<%# String.Concat("~/Pages/User/CircularDetails.aspx?ID=", Eval("Id")) %>'></asp:HyperLink></td>
                    <td><%#Eval("cYear") %></td>
                    <td><%#Eval("ClassName") %></td>
                    <td><%# Convert.ToDateTime(Eval("StartDate")).ToString("dd/MM/yyyy") %></td>
                    <td><%# Convert.ToDateTime(Eval("EndDate")).ToString("dd/MM/yyyy") %></td>
                    <td><%#Eval("ApplicationFee") %></td>
                    <td><a href='<%# String.IsNullOrEmpty(Eval("Attachment").ToString())?"":"/VariableContent/AdmissionCircular/"+Eval("Attachment") %>' target="_blank"><%# String.IsNullOrEmpty(Eval("Attachment").ToString())?"N/A":"Download" %></a></td>

                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
          </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphRight" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

