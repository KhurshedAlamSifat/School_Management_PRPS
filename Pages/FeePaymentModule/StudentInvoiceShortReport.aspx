<%@ Page Title="Student Invoice Short Report" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="StudentInvoiceShortReport.aspx.cs" Inherits="Pages_FeePaymentModule_StudentInvoiceShortReport" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="panel panel-success">
        <div class="panel-body">
            <div class="col-lg-6 col-md-6">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label2" runat="server" Text="Class"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlClass" runat="server" AutoPostBack="true" DataTextField="ClassName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,Shift %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlShift" runat="server" DataTextField="Shift" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Application,Section %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlSection" runat="server" DataTextField="Section" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label23" runat="server" Text="Paid Date From"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="tbx_PaidDateFrom" runat="server" CssClass="form-control" placeholder="dd/MM/yyyy"></asp:TextBox>
                            <cc1:CalendarExtender ID="CalendarExtender3" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbx_PaidDateFrom"
                                TargetControlID="tbx_PaidDateFrom">
                            </cc1:CalendarExtender>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,Group %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlGroup" runat="server" DataTextField="GroupName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label7" runat="server" Text="RegNo"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="tbxRegNo" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label4" runat="server" Text="Paid Date To"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="tbx_PaidDateTo" runat="server" CssClass="form-control" placeholder="dd/MM/yyyy"></asp:TextBox>
                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbx_PaidDateTo"
                                TargetControlID="tbx_PaidDateTo">
                            </cc1:CalendarExtender>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="panel-footer">
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-success" />
            <asp:Button ID="btnExportToExcel" runat="server" Text="Export To Excell" OnClick="btnExportToExcel_Click" CssClass="btn btn-success" />
        </div>
    </div>
    <div class="panel panel-success">
        <div class="panel-body">
            <asp:GridView ID="gvList" runat="server" CssClass="table table-striped dt-responsive display" AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField HeaderText="RegistrationNumber">
                        <ItemTemplate>
                            <asp:Label ID="lbl_12" runat="server" Text='<%#Eval("Student_RegistrationNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="lbl_NameEng" runat="server" Text='<%#Eval("Student_Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Class">
                        <ItemTemplate>
                            <asp:Label ID="lbl_ClassName" runat="server" Text='<%#Eval("Student_Class") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Group">
                        <ItemTemplate>
                            <asp:Label ID="lbl_GroupName" runat="server" Text='<%#Eval("Student_Group") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Shift">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Shift" runat="server" Text='<%#Eval("Student_Shift") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Section">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Section" runat="server" Text='<%#Eval("Student_Section") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
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
                    <asp:TemplateField HeaderText="Dues">
                        <ItemTemplate>
                            <asp:Button ID="btn_LoadDueDetail" runat="server" Text="Select" CommandArgument='<%#Eval("StudentInvoice_TransectionIdentifier") %>' OnClick="btn_LoadDueDetail_Click" />
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

