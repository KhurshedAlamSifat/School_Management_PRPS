<%@ Page Title="Student Current Dues" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="CurrentPaymentStatus.aspx.cs" Inherits="Pages_Student_CurrentPaymentStatus" %>

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
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label4" runat="server" Text="Total Payable"></asp:Label></label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="tbxTotalPayable" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label5" runat="server" Text="Net Payable"></asp:Label></label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="tbxNetPayable" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <asp:GridView ID="gvStudentDue" runat="server" CssClass="table table-striped dt-responsive display" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="StudentDue_Id" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lbl_StudentDue_TransectionIdentifier" runat="server" Text='<%#Eval("StudentDue_TransectionIdentifier") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tracking Id">
                            <ItemTemplate>
                                <asp:Label ID="lbl_StudentDue_TrackingId" runat="server" Text='<%#Eval("StudentDue_TrackingId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fee Display Name">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Fee_DisplayName" runat="server" Text='<%#Eval("Fee_DisplayName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Effective On">
                            <ItemTemplate>
                                <asp:Label ID="lbl_StudentDue_EffectiveMonthName" runat="server" Text='<%#Eval("StudentDue_EffectiveMonthName") %>'></asp:Label>
                                <asp:Label ID="lbl_StudentDue_EffectiveYear" runat="server" Text='<%#Eval("StudentDue_EffectiveYear") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Waiver %">
                            <ItemTemplate>
                                <asp:Label ID="lbl_StudentDue_WaiverPercentage" runat="server" Text='<%#Eval("StudentDue_WaiverPercentage") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Applied Amount">
                            <ItemTemplate>
                                <asp:Label ID="lbl_StudentDue_AppliedAmount" runat="server" Text='<%#Eval("StudentDue_AppliedAmount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </asp:Panel>
</asp:Content>

