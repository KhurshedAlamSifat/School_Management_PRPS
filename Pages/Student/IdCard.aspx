<%@ Page Title="Students ID Card" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="IdCard.aspx.cs" Inherits="Pages_Student_IdCard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel ID="updateStuedentPanel" runat="server">
        <ContentTemplate>
            <div class="col-md-10 col-sm-10 col-xs-10">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="save" />
                <asp:Label ID="lblError" runat="server" Font-Bold="True" SkinID="message"></asp:Label>
                <asp:HiddenField ID="hdnID" runat="server" />
            </div>
            <div class="row">
                <div class="col-sm-8">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-4">
                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Application,RegNo %>"></asp:Label></label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="tbxRegNo" runat="server" CssClass="form-control" OnTextChanged="tbxRegNo_TextChanged" AutoPostBack="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">

                            <div class='<%= Common.SessionInfo.Panel %>'>
                                <div class="panel-heading">
                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Application,StudentInformation %>"></asp:Label>
                                </div>
                                <div class="panel-body">
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                    <asp:Panel ID="pnlStudentInfo" runat="server">
                                        <div class="row">
                                            <div class="col-sm-2">
                                                <asp:Image ID="imgPerson" runat="server" Height="80" Width="80" />
                                            </div>
                                            <div class="col-sm-10">
                                                <div class="form-horizontal">
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-4">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Application,NameEng %>"></asp:Label></label>
                                                        <div class="col-sm-8">
                                                            <asp:Label ID="lblNameEng" runat="server"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-4">
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Application,NameBan %>"></asp:Label></label>
                                                        <div class="col-sm-8">
                                                            <asp:Label ID="lblNameBan" runat="server"></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="padding-top: 10px;">
                                            <div class="col-sm-5">
                                                <div class="form-horizontal">
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-4">
                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label>:</label>
                                                        <div class="col-sm-8">
                                                            <asp:Label ID="lblClass" runat="server"></asp:Label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-4">
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:Application,Group %>"></asp:Label>:</label>
                                                        <div class="col-sm-8">
                                                            <asp:Label ID="lblGroup" runat="server"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-4">
                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Application,Shift %>"></asp:Label>:</label>
                                                        <div class="col-sm-8">
                                                            <asp:Label ID="lblShift" runat="server"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-4">
                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:Application,Section %>"></asp:Label>:</label>
                                                        <div class="col-sm-8">
                                                            <asp:Label ID="lblSection" runat="server"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-4">
                                                            CardNo:</label>
                                                        <div class="col-sm-8">
                                                            <asp:Label ID="lblRoll" runat="server"></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-7">
                                                <div class="form-horizontal">
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-5">
                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:Application,FatherName %>"></asp:Label></label>
                                                        <div class="col-sm-7">
                                                            <asp:Label ID="lblFName" runat="server"></asp:Label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-5">
                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:Application,MotherName %>"></asp:Label></label>
                                                        <div class="col-sm-7">
                                                            <asp:Label ID="lblMName" runat="server"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-5">
                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:Application,Address %>"></asp:Label>:</label>
                                                        <div class="col-sm-7">
                                                            <asp:Label ID="lblPresent" runat="server"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-5">
                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:Application,Mobile %>"></asp:Label>:</label>
                                                        <div class="col-sm-7">
                                                            <asp:Label ID="Label1" runat="server"></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 form">
                    <div class='<%= Common.SessionInfo.Panel %>'>
                        <div class="panel-heading" id="hideheading">
                            Card Details
                        </div>
                        <div class="panel-body">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-md-10">Card Number</label>
                                    <div class="col-md-12">
                                        <asp:TextBox ID="tbxCardNo" MaxLength="8" runat="server" placeholder="Enter Card Number" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator2" runat="server" ValidationGroup="save"
                                            ErrorMessage="Enter Card Number" ControlToValidate="tbxCardNo">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator Display = "None" ControlToValidate = "tbxCardNo" ID="RegularExpressionValidator3" ValidationGroup="save" 
                                            ValidationExpression = "^[\s\S]{8,8}$" runat="server" ErrorMessage="8 characters required."></asp:RegularExpressionValidator>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="flv" runat="server" TargetControlID="tbxCardNo" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-footer">
                            <div class="row" style="padding-top: 5px;">
                                <div class="col-sm-6">
                                    <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="save" class="btn btn-block btn-flat btn-primary" OnClick="btnSave_Click" />
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="tbxRegNo" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

