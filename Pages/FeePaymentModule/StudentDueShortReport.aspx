<%@ Page Title="Student Due Short Report" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="StudentDueShortReport.aspx.cs" Inherits="Pages_FeePaymentModule_StudentDueShortReport" %>

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
                            <asp:DropDownList ID="ddlClass" runat="server" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged" AutoPostBack="true" DataTextField="ClassName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
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
                            <asp:Label ID="Label23" runat="server" Text="Effective Year From"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlEffectiveYearFrom" runat="server" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label28" runat="server" Text="Effective Month From"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlEffectiveMonthFrom" runat="server" DataTextField="Value" DataValueField="Key" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label9" runat="server" Text="Due S.Status"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlShortStatus" runat="server" DataTextField="Value" DataValueField="Key" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label13" runat="server" Text="Inv.Tracking Id"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="tbxInvoiceTrackingId" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label1" runat="server" Text="Fee Head"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlFeeHead" runat="server" DataTextField="FullName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
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
                            <asp:Label ID="Label4" runat="server" Text="Effective Year To"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlEffectiveYearTo" runat="server" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label8" runat="server" Text="Effective Month To"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlEffectiveMonthTo" runat="server" DataTextField="Value" DataValueField="Key" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label22" runat="server" Text="Paid Date From"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="tbxPaidDateFrom" runat="server" CssClass="form-control" placeholder="dd/MM/yyyy"></asp:TextBox>
                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxDateOfBirth"
                                TargetControlID="tbxPaidDateFrom">
                            </cc1:CalendarExtender>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label12" runat="server" Text="Paid Date T0"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="tbxPaidDateTo" runat="server" CssClass="form-control" placeholder="dd/MM/yyyy"></asp:TextBox>
                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxDateOfBirth"
                                TargetControlID="tbxPaidDateTo">
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
                    <asp:TemplateField HeaderText="Year">
                        <ItemTemplate>
                            <asp:Label ID="lbl_StudentDue_EffectiveYear" runat="server" Text='<%#Eval("StudentDue_EffectiveYear") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Month">
                        <ItemTemplate>
                            <asp:Label ID="lbl_StudentDue_EffectiveMonthName" runat="server" Text='<%#Eval("StudentDue_EffectiveMonthName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fee">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Fee_FullName" runat="server" Text='<%#Eval("Fee_FullName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ConsumptionUnit">
                        <ItemTemplate>
                            <asp:Label ID="lbl_StudentDue_ConsumptionUnit" runat="server" Text='<%#Eval("StudentDue_ConsumptionUnit") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Waiver%">
                        <ItemTemplate>
                            <asp:Label ID="lbl_StudentDue_WaiverPercentage" runat="server" Text='<%#Eval("StudentDue_WaiverPercentage") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FullAmount">
                        <ItemTemplate>
                            <asp:Label ID="lbl_StudentDue_FullAmount" runat="server" Text='<%#Eval("StudentDue_FullAmount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="AppliedAmount">
                        <ItemTemplate>
                            <asp:Label ID="lbl_StudentDue_AppliedAmount" runat="server" Text='<%#Eval("StudentDue_AppliedAmount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="lbl_StudentDue_ShortStatus" runat="server" Text='<%#Eval("StudentDue_ShortStatus") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Inv.Tracking Id">
                        <ItemTemplate>
                            <asp:Label ID="lbl_StudentDue_ShortStatus" runat="server" Text='<%#Eval("StudentInvoice_TrackingId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="panel-footer" style="text-align: right;">
            <asp:Label ID="Label10" runat="server" Font-Bold="true">Total Paid Amount: </asp:Label>
            <asp:Label ID="lblTotalPaidAmount" runat="server" Font-Bold="true"></asp:Label>
            &nbsp;
            &nbsp;
            <asp:Label ID="Label11" runat="server" Font-Bold="true">Total Unpaid Amount: </asp:Label>
            <asp:Label ID="lblTotalUnpaidAmount" runat="server" Font-Bold="true"></asp:Label>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

