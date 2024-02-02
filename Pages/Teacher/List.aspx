<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="List.aspx.cs" Inherits="Pages_Teacher_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">

    <div class="panel panel-success">
        <div class="panel-body">
            <asp:Repeater ID="rpt" runat="server">
                <HeaderTemplate>
                    <table id="example1" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>
                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Application,TeacherPINNo %>"></asp:Label></th>

                                <th>
                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,NameEng %>"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Application,Gender %>"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Application,JoinDate %>"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,Mobile %>"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Application,Action %>"></asp:Label></th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("TeacherPin") %></td>
                        <td><%#Eval("NameEng") %></td>
                        <td><%#Eval("Gender") %></td>
                        <td><%#Convert.ToDateTime(Eval("Joindate")).ToString("dd/MM/yyyy") %></td>
                        <td><%#Eval("Mobile") %></td>
                        <td>
                            <asp:HyperLink ID="lnkView" runat="server" CssClass="fa fa-2x fa-eye" NavigateUrl='<%#string.Concat("~/Pages/Teacher/View.aspx?Id=",Eval("TeacherId")) %>'></asp:HyperLink>
                            <asp:ImageButton ID="btnEdit" runat="server" OnCommand="btnEdit_Command" CommandArgument='<%# Eval("Id")%>' ImageUrl="~/Images/Common/edit.png" ToolTip="Edit" />
                            <asp:LinkButton ID="btnDelete" runat="server" OnCommand="btnDelete_Command" CommandArgument='<%# Eval("Id")%>' CssClass="fa fa-2x fa-trash-o" OnClientClick="return confirm('Are you sure?')" /></td>
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

