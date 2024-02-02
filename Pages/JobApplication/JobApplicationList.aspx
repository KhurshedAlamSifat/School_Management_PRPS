<%@ Page Title="Job Application List" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="JobApplicationList.aspx.cs" Inherits="Pages_JobApplication_JobApplicationList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .deleteButton {
            float: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="panel panel-success">
        <div class="panel-body">
            <div class="col-lg-6 col-md-6">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label21" runat="server" Text="ApplicationId"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="tbxApplicationId" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label8" runat="server" Text="Mobile Number"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="tbxMobileNumber" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:Application,Religion %>"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlReligion" runat="server" DataTextField="Religion" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label13" runat="server" Text="Name"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="tbxFullName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label9" runat="server" Text="Email"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="tbxEmail" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:Application,Gender %>"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlGender" runat="server" DataTextField="Gender" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-success" />
            <asp:Button ID="btnDownloadExcell" runat="server" Text="Download Excell" OnClick="btnDownloadExcell_Click" CssClass="btn btn-facebook" />
            <asp:Button ID="btnDeleteMulti" runat="server" Text="Delete" OnClick="btnDeleteMulti_Click" CssClass="btn btn-danger deleteButton" />
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
                                    <asp:Label ID="Label7" runat="server" Text="Applicaiton Id"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label2" runat="server" Text="Full Name"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label3" runat="server" Text="Father Name"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label4" runat="server" Text="Mother Name"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label5" runat="server" Text="DateOfBirth"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label11" runat="server" Text="NID"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label12" runat="server" Text="Mobile Number"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label14" runat="server" Text="Email"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label15" runat="server" Text="MPO/NTRCA"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label19" runat="server" Text="Religion"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label20" runat="server" Text="Gender"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label22" runat="server" Text="Nationality"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Application,Action %>"></asp:Label></th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("Id") %></td>
                        <td><%#Eval("FullName") %></td>
                        <td><%#Eval("FatherName") %></td>
                        <td><%#Eval("MotherName") %></td>
                        <td><%#Eval("DateOfBirth") %></td>
                        <td><%#Eval("NID") %></td>
                        <td><%#Eval("MobileNumber") %></td>
                        <td><%#Eval("Email") %></td>
                        <td><%#Eval("MPO_NTRCA") %></td>
                        <td><%#Eval("Religion") %></td>
                        <td><%#Eval("Gender") %></td>
                        <td><%#Eval("Nationality") %></td>
                        <td>
                            <a target="_blank" href='<%#string.Concat("/Pages/JobApplication/JobApplicationView.aspx?Id=",Eval("Id")) %>'><i class="fa fa-2x fa-eye"></i></a>
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

