<%@ Page Title="Home Page Setup" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="HomePageSetup.aspx.cs" Inherits="Pages_Admin_HomePageSetup" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <contenttemplate>
        <div class="row">
            <div class="col-md-12">
                <div class="form-horizontal">
                    <div class="form-group">
                        <div class="col-md-10 col-sm-10 col-xs-10">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="save" />
                            <asp:Label ID="lblError" runat="server" Font-Bold="True" SkinID="message"></asp:Label>
                            <asp:HiddenField ID="hdnID" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label8" runat="server" Text="Category"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-4">
                            <asp:DropDownList ID="ddlCategory" DataTextField="Value" DataValueField="Key" runat="server" CssClass="form-control dropdown"></asp:DropDownList>
                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator16" runat="server" ValidationGroup="save"
                                ErrorMessage="Select Category" ControlToValidate="ddlCategory">*</asp:RequiredFieldValidator>
                        </div>
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label4" runat="server" Text="Title"></asp:Label></label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="tbxTitle" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label10" runat="server" Text="Content"></asp:Label></label>
                        <div class="col-sm-10">
                            <cc1:Editor ID="edtrContent" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label13" runat="server" Text="Image"></asp:Label></label>
                        <div class="col-sm-4">
                            <asp:FileUpload ID="flImage" runat="server" />
                        </div>
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label19" runat="server" Text="Youtube ID"></asp:Label></label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="tbxYoutubeLink" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <asp:Panel ID="pnlCurrentImage" CssClass="form-group" runat="server">
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label2" runat="server" Text="Image"></asp:Label></label>
                        <div class="col-sm-4">
                            <asp:Image runat="server" ID="imgCurrent" ImageUrl="../../Images/Common/avatar5.png" class="img-thumbnail img-responsive" />
                        </div>
                    </asp:Panel>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label20" runat="server" Text="Sequence"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="tbxSequence" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator8" runat="server" ValidationGroup="save"
                                ErrorMessage="Enter Sequence" ControlToValidate="tbxSequence">*</asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="tbxSequence" ValidChars=".0123456789"></cc1:FilteredTextBoxExtender>
                        </div>
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label9" runat="server" Text="Status"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-4">
                            <asp:DropDownList ID="ddlStatus" DataTextField="Value" DataValueField="Key" runat="server" CssClass="form-control dropdown"></asp:DropDownList>
                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator17" runat="server" ValidationGroup="save"
                                ErrorMessage="Select Status" ControlToValidate="ddlStatus">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-6 text-right">
                            <asp:Button ID="btnSave" runat="server" ClientIDMode="Static" Text="<%$ Resources:Application,Save %>" CssClass="btn btn-primary" ValidationGroup="save"
                                OnClick="btnSave_Click" />
                            <asp:Button ID="btnEdit" runat="server" ClientIDMode="Static" Text="<%$ Resources:Application,Edit %>" CssClass="btn btn-primary" ValidationGroup="save" Visible="false"
                                OnClick="btnEdit_Click" />
                            <asp:Button ID="btnReset" runat="server" Text="<%$ Resources:Application,Refresh %>" CssClass="btn btn-primary" CausesValidation="false"
                                OnClick="btnReset_Click" />
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-12">
                            <div class="box">
                                <div class="box-body">
                                    <asp:Repeater ID="rptDataList" runat="server">
                                        <HeaderTemplate>
                                            <table id="example1" class="table table-bordered table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>
                                                            <asp:Label ID="Label5" runat="server" Text="Category"></asp:Label>
                                                        </th>
                                                        <th>
                                                            <asp:Label ID="Label6" runat="server" Text="Title"></asp:Label>
                                                        </th>
                                                        <th>
                                                            <asp:Label ID="Label7" runat="server" Text="Content"></asp:Label>
                                                        </th>
                                                        <th>
                                                            <asp:Label ID="Label17" runat="server" Text="Youtube ID"></asp:Label>
                                                        </th>
                                                        <th>
                                                            <asp:Label ID="Label11" runat="server" Text="Sequence"></asp:Label>
                                                        </th>
                                                        <th>
                                                            <asp:Label ID="Label12" runat="server" Text="Status"></asp:Label>
                                                        </th>
                                                        <th>
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Application,Action %>"></asp:Label>
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td><%#Eval("Category") %></td>
                                                <td><%#Eval("Title") %></td>
                                                <td><%#Eval("Content") %></td>
                                                <td><%#Eval("YoutubeLink") %></td>
                                                <td><%#Eval("Sequence") %></td>
                                                <td><%#Eval("Status") %></td>
                                                <td>
                                                    <asp:ImageButton ID="btnEdit" runat="server" OnCommand="btnEdit_Command" CommandArgument='<%# Eval("Id")%>' ImageUrl="~/Images/Common/edit.png" ToolTip="Edit" />
                                                    <asp:ImageButton ID="btnDelete" runat="server" OnCommand="btnDelete_Command" CommandArgument='<%# Eval("Id")%>' ImageUrl="~/Images/Common/delete.png" ToolTip="Delete" OnClientClick="return confirm('Are you sure?')" /></td>
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

                </div>
            </div>
        </div>
    </contenttemplate>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

