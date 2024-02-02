<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="UserSetup.aspx.cs" Inherits="Pages_UserManagement_UserSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel ID="upUserSEtup" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-md-5">
                    <div class="panel panel-success">
                        <div class="panel-body">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-md-12 col-sm-12">
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="save" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3">
                                        <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label><span class="red">*</span></label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="tbxName" runat="server" placeholder="Enter your name" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator3" runat="server" ValidationGroup="save"
                                            ErrorMessage="Enter your name" ControlToValidate="tbxName">*</asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3">
                                        <asp:Label ID="Label3" runat="server" Text="Mobile"></asp:Label><span class="red">*</span></label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="tbxMobile" runat="server" placeholder="Enter your mobile number" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator4" runat="server" ValidationGroup="save"
                                            ErrorMessage="Enter your mobile number" ControlToValidate="tbxMobile">*</asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3">
                                        <asp:Label ID="Label6" runat="server" Text="Email"></asp:Label></label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="tbxEmail" runat="server" placeholder="Enter your email address" CssClass="form-control"></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator5" runat="server" ValidationGroup="save"
                                    ErrorMessage="Enter your email address" ControlToValidate="tbxEmail">*</asp:RequiredFieldValidator>--%>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3">
                                        <asp:Label ID="Label4" runat="server" Text="Role"></asp:Label><span class="red">*</span></label>
                                    <div class="col-sm-9">
                                        <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control"></asp:DropDownList>
                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator1" runat="server" ValidationGroup="save"
                                            ErrorMessage="Select Role Name" ControlToValidate="ddlRole">*</asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3">
                                        <asp:Label ID="Label7" runat="server" Text="User Name"></asp:Label><span class="red">*</span></label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="tbxUserName" runat="server" placeholder="Enter user name" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator6" runat="server" ValidationGroup="save"
                                            ErrorMessage="Enter users name" ControlToValidate="tbxUserName">*</asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3">
                                        <asp:Label ID="Label8" runat="server" Text="Password"></asp:Label><span class="red">*</span></label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="tbxpassword" runat="server" placeholder="Enter password" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator7" runat="server" ValidationGroup="save"
                                            ErrorMessage="Enter password" ControlToValidate="tbxpassword">*</asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3">
                                        <asp:Label ID="Label5" runat="server" Text="Confirm Password"></asp:Label><span class="red">*</span></label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="tbxConfirmPass" runat="server" placeholder="Enter confirm password" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator2" runat="server" ValidationGroup="save"
                                            ErrorMessage="Enter confirm password" ControlToValidate="tbxConfirmPass">*</asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="comparePassword" ControlToCompare="tbxpassword" ControlToValidate="tbxConfirmPass" runat="server" ErrorMessage="Password does not match" ValidationGroup="save"></asp:CompareValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-3 col-sm-9">
                                        <asp:Button ID="btnSave" runat="server" Text="<%$ Resources:Application,Save %>" CssClass="btn btn-primary" ValidationGroup="save"
                                            OnClick="btnSave_Click" />
                                        <asp:Button ID="btnEdit" runat="server" Text="<%$ Resources:Application,Edit %>" Visible="false" CssClass="btn btn-primary"
                                            OnClick="btnEdit_Click" />
                                        <asp:Button ID="btnReset" runat="server" Text="<%$ Resources:Application,Refresh %>" CssClass="btn btn-primary" CausesValidation="false"
                                            OnClick="btnReset_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="panel panel-success">
                        <div class="panel-body">
                            <asp:Repeater ID="rpt" runat="server">
                                <HeaderTemplate>
                                    <table id="example1" class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label></th>
                                                <th>
                                                    <asp:Label ID="Label5" runat="server" Text="User Name"></asp:Label></th>
                                                <th>
                                                    <asp:Label ID="Label1" runat="server" Text="Role Name"></asp:Label></th>
                                                <th>
                                                    <asp:Label ID="Label9" runat="server" Text="Create By"></asp:Label></th>
                                                <th>
                                                    <asp:Label ID="Label10" runat="server" Text="Create Date"></asp:Label></th>
                                                <th>
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,Action %>"></asp:Label></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("NameEng") %></td>
                                        <td><%#Eval("UserName") %></td>
                                        <td><%#Eval("RoleName") %></td>
                                        <td><%#Eval("CreateBy") %></td>
                                        <td><%# Convert.ToDateTime(Eval("CreateDate")).ToString("dd/MM/yyyy") %></td>
                                        <td>
                                            <asp:LinkButton ID="btnEdit" runat="server" OnCommand="btnEdit_Command" CommandArgument='<%# Eval("Id")%>' CssClass="fa fa-2x fa-edit" />
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
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

