<%@ Page Title="Student Invoices History" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="InvoiceHistory.aspx.cs" Inherits="Pages_Student_InvoiceHistory" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:Panel ID="pnlAdd" runat="server">
        <div class="panel panel-success">
            <div class="panel-body">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="add" />
                    <asp:Label ID="lblError" runat="server" Font-Bold="True" SkinID="message"></asp:Label>
                    <asp:HiddenField ID="hdnID" runat="server" />
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label22" runat="server" Text="Registration No."></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="tbxStudent_Id" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
                                <asp:TextBox ID="tbxStudent_RegistrationNumber" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator3" runat="server" ValidationGroup="add"
                                    ErrorMessage="Select Student" ControlToValidate="tbxStudent_RegistrationNumber">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label2" runat="server" Text="Class"></asp:Label></label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="tbxStudent_Class" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label24" runat="server" Text="Name"></asp:Label></label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="tbxStudent_Name" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label1" runat="server" Text="Section"></asp:Label></label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="tbxStudent_Section" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label3" runat="server" Text="Advance Balance"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="tbxCurrentBalance" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <asp:GridView ID="gvStudentDue" runat="server" CssClass="table table-striped dt-responsive display" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="TrackingId">
                            <ItemTemplate>
                                <asp:Label ID="lbl_StudentInvoice_TrackingId" runat="server" Text='<%#Eval("StudentInvoice_TrackingId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="EffectiveYear">
                            <ItemTemplate>
                                <asp:Label ID="lbl_StudentInvoice_EffectiveYear" runat="server" Text='<%#Eval("StudentInvoice_EffectiveYear") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="OldBalance">
                            <ItemTemplate>
                                <asp:Label ID="lbl_StudentInvoice_OldBalance" runat="server" Text='<%#Eval("StudentInvoice_OldBalance") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DepositedAmount">
                            <ItemTemplate>
                                <asp:Label ID="lbl_StudentInvoice_DepositedAmount" runat="server" Text='<%#Eval("StudentInvoice_DepositedAmount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="NewBalance">
                            <ItemTemplate>
                                <asp:Label ID="lbl_StudentInvoice_NewBalance" runat="server" Text='<%#Eval("StudentInvoice_NewBalance") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PaidAmount">
                            <ItemTemplate>
                                <asp:Label ID="lbl_StudentInvoice_PaidAmount" runat="server" Text='<%#Eval("StudentInvoice_PaidAmount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="RemainingBalance">
                            <ItemTemplate>
                                <asp:Label ID="lbl_StudentInvoice_RemainingBalance" runat="server" Text='<%#Eval("StudentInvoice_RemainingBalance") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CreatedBy">
                            <ItemTemplate>
                                <asp:Label ID="lbl_StudentInvoice_CreatedBy" runat="server" Text='<%#Eval("StudentInvoice_CreatedBy") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CreatedDate">
                            <ItemTemplate>
                                <asp:Label ID="lbl_StudentInvoice_CreatedDate" runat="server" Text='<%#Eval("StudentInvoice_CreatedDate") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="panel-footer" style="text-align: right;">
                <asp:Label ID="Label10" runat="server" Font-Bold="true">Total Deposited Amount: </asp:Label>
                <asp:Label ID="lblTotalDepositedAmount" runat="server" Font-Bold="true"></asp:Label>
            </div>
        </div>
    </asp:Panel>
</asp:Content>

