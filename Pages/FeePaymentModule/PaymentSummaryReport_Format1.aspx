<%@ Page Title="Payment Summary Report Format1" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="PaymentSummaryReport_Format1.aspx.cs" Inherits="Pages_FeePaymentModule_PaymentSummaryReport_Format1" %>

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
                            <asp:Label ID="Label8" runat="server" Text="Effective Year"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlEffectiveYear" runat="server" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label9" runat="server" Text="Effective Month"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlEffectiveMonth" runat="server" DataValueField="Key" DataTextField="Value" CssClass="form-control dropdown"></asp:DropDownList>
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
                    <asp:TemplateField HeaderText="OldBalance">
                        <ItemTemplate>
                            <asp:Label ID="lbl_OldBalance" runat="server" Text='<%#Eval("OldBalance") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DepositedAmount">
                        <ItemTemplate>
                            <asp:Label ID="lbl_DepositedAmount" runat="server" Text='<%#Eval("DepositedAmount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PaidAmount">
                        <ItemTemplate>
                            <asp:Label ID="lbl_PaidAmount" runat="server" Text='<%#Eval("PaidAmount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="UnpaidAmount">
                        <ItemTemplate>
                            <asp:Label ID="UnpaidAmount" runat="server" Text='<%#Eval("UnpaidAmount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="RemainingBalance">
                        <ItemTemplate>
                            <asp:Label ID="lbl_RemainingBalance" runat="server" Text='<%#Eval("RemainingBalance") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="AdmissionFee">
                        <ItemTemplate>
                            <asp:Label ID="lbl_AdmissionFee" runat="server" Text='<%#Eval("AdmissionFee") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SessionFee">
                        <ItemTemplate>
                            <asp:Label ID="lbl_SessionFee" runat="server" Text='<%#Eval("SessionFee") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DevelopmentFee">
                        <ItemTemplate>
                            <asp:Label ID="lbl_DevelopmentFee" runat="server" Text='<%#Eval("DevelopmentFee") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="TuitionFee">
                        <ItemTemplate>
                            <asp:Label ID="lbl_TuitionFee" runat="server" Text='<%#Eval("TuitionFee") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="LateFeeTuition">
                        <ItemTemplate>
                            <asp:Label ID="lbl_LateFeeTuition" runat="server" Text='<%#Eval("LateFeeTuition") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ExaminationFee">
                        <ItemTemplate>
                            <asp:Label ID="lbl_ExaminationFee" runat="server" Text='<%#Eval("ExaminationFee") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ClassTestFee">
                        <ItemTemplate>
                            <asp:Label ID="lbl_ClassTestFee" runat="server" Text='<%#Eval("ClassTestFee") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CourseFee">
                        <ItemTemplate>
                            <asp:Label ID="lbl_CourseFee" runat="server" Text='<%#Eval("CourseFee") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ServicesFee">
                        <ItemTemplate>
                            <asp:Label ID="lbl_ServicesFee" runat="server" Text='<%#Eval("ServicesFee") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="TransportFee">
                        <ItemTemplate>
                            <asp:Label ID="lbl_TransportFee" runat="server" Text='<%#Eval("TransportFee") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SportsFee">
                        <ItemTemplate>
                            <asp:Label ID="lbl_SportsFee" runat="server" Text='<%#Eval("SportsFee") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DrawingFee">
                        <ItemTemplate>
                            <asp:Label ID="lbl_DrawingFee" runat="server" Text='<%#Eval("DrawingFee") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="MarshallArtFee">
                        <ItemTemplate>
                            <asp:Label ID="lbl_MarshallArtFee" runat="server" Text='<%#Eval("MarshallArtFee") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="MusicFee">
                        <ItemTemplate>
                            <asp:Label ID="lbl_MusicFee" runat="server" Text='<%#Eval("MusicFee") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="TestimonialFee">
                        <ItemTemplate>
                            <asp:Label ID="lbl_TestimonialFee" runat="server" Text='<%#Eval("TestimonialFee") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="TCFee">
                        <ItemTemplate>
                            <asp:Label ID="lbl_TCFee" runat="server" Text='<%#Eval("TCFee") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="InitialDue">
                        <ItemTemplate>
                            <asp:Label ID="lbl_InitialDue" runat="server" Text='<%#Eval("InitialDue") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="panel-footer" style="text-align: right;">
            <asp:Label ID="Label1" runat="server" Font-Bold="true">Total Old Amount: </asp:Label>
            <asp:Label ID="lblTotalOldBalance" runat="server" Font-Bold="true"></asp:Label>
            &nbsp;&nbsp;
            <asp:Label ID="Label10" runat="server" Font-Bold="true">Total Deposited Amount: </asp:Label>
            <asp:Label ID="lblTotalDepositedAmount" runat="server" Font-Bold="true"></asp:Label>
            &nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Font-Bold="true">Total Paid Amount: </asp:Label>
            <asp:Label ID="lblTotalPaidAmount" runat="server" Font-Bold="true"></asp:Label>
            &nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Font-Bold="true">Total Remaining Balance: </asp:Label>
            <asp:Label ID="lblTotalRemainingBalance" runat="server" Font-Bold="true"></asp:Label>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

