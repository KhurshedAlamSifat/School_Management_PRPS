<%@ Page Title="Pay Student Due By Internal User" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="PayStudentDueByInternalUser.aspx.cs" Inherits="Pages_FeePaymentModule_PayStudentDueByInternalUser" %>

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
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label8" runat="server" Text="Deposited Amount"></asp:Label></label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="tbxDepositedAmount" runat="server" oninput="tbxDepositedAmountOnInput()" Text="" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label9" runat="server" Text="Next Balance"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="tbxNextBalance" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
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
                        <asp:TemplateField HeaderText="Fee Full Name">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Fee_FullName" runat="server" Text='<%#Eval("Fee_FullName") %>'></asp:Label>
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
                        <asp:TemplateField HeaderText="Comment">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Comment" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="panel-footer">
                <asp:Button ID="btnSave" runat="server" ClientIDMode="Static" Text="Save" CssClass="btn btn-primary" ValidationGroup="add"
                    OnClick="btnSave_Click" Visible="false" />
                <asp:Button ID="btnPrint" runat="server" ClientIDMode="Static" CommandArgument="" Text="Print" CssClass="btn btn-success"
                    OnClick="btnPrint_Click" Visible="false" />
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlSearch" runat="server">
        <div class="panel panel-success">
            <div class="panel-body">
                <div class="col-lg-5 col-md-5">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label6" runat="server" Text="Class"></asp:Label></label>
                            <div class="col-sm-6">
                                <asp:DropDownList ID="ddlClass" runat="server" DataTextField="ClassName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 col-md-5">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label7" runat="server" Text="RegNo"></asp:Label></label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="tbxRegNo" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2">
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-success" />
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="test" runat="server">
        <div class="panel panel-success">
            <div class="panel-body">
                <asp:GridView ID="gvList" runat="server" CssClass="table table-striped dt-responsive display" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="RegistrationNumber">
                            <ItemTemplate>
                                <asp:Label ID="lbl_StudentId" runat="server" Text='<%#Eval("Student_Id") %>' Visible="false"></asp:Label>
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
                        <asp:TemplateField HeaderText="Section">
                            <ItemTemplate>
                                <asp:Button ID="btnLoadStudent" runat="server" Text="Select" CommandArgument='<%#Eval("Student_Id") %>' OnClick="btnLoadStudent_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </asp:Panel>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
    <script type="text/javascript">
        document.getElementById('cphMain_tbxDepositedAmount').value = '';
        function tbxDepositedAmountOnInput() {
            let _DepositedAmount = document.getElementById('cphMain_tbxDepositedAmount').value;
            let DepositedAmount = Number(_DepositedAmount);

            let _NetPayable = document.getElementById('cphMain_tbxNetPayable').value;
            let NetPayable = Number(_NetPayable);

            let NextBalance = DepositedAmount - NetPayable;
            if (NextBalance > 0) {
                document.getElementById('cphMain_tbxNextBalance').value = NextBalance;
            } else {
                document.getElementById('cphMain_tbxNextBalance').value = '';
            }
        }
    </script>
</asp:Content>

