<%@ Page Title="Content List" Language="C#" MasterPageFile="~/MasterPage/PublicMaster.master" AutoEventWireup="true" CodeFile="ContentList.aspx.cs" Inherits="Pages_Public_ContentList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="panel panel-success">
        <div class="panel-body">
            <div class="col-lg-6 col-md-6">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlClass" runat="server" DataTextField="ClassName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:Application,Group %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlGroup" runat="server" DataTextField="GroupName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:Application,Shift %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlShift" runat="server" DataTextField="Shift" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Application,Section %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlSection" runat="server" DataTextField="Section" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
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
            <asp:Repeater ID="rptData" runat="server">
                <HeaderTemplate>
                    <table id="example1" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>
                                    <asp:Label ID="Label12" runat="server" Text="Title"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label11" runat="server" Text="ClassName"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label5" runat="server" Text="Section"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label6" runat="server" Text="GroupName"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label7" runat="server" Text="Shift"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label16" runat="server" Text="VisibleFileName"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label17" runat="server" Text="YoutubeId"></asp:Label></th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("Title") %></td>
                        <td><%#Eval("ClassName") %></td>
                        <td><%#Eval("Section") %></td>
                        <td><%#Eval("GroupName") %></td>
                        <td><%#Eval("Shift") %></td>
                        <td>
                            <%# (Eval("FileName") != null) ? "<a href='../Pages/Admin/ContentFileDownload.aspx?FileName="+ Eval("FileName") + "&VisibleFileName="+Eval("VisibleFileName")+"'>"+Eval("VisibleFileName")+"</a>"  : "" %>
                        </td>
                        <td>
                            <%# (Eval("YoutubeId").ToString() != "") ? "<a target='_blank'  href='https://www.youtube.com/watch?v="+ Eval("YoutubeId") + "'>Youtbe</a>"  : "" %>
                        </td>
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

