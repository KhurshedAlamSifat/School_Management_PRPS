<%@ Page Title="<%$ Resources:Application,AdmissionCircular %>" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="Circular.aspx.cs" Inherits="Pages_Admission_Circular" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel ID="Updatepanel1" runat="server">
        <ContentTemplate>
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
                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Application,Year %>"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-4">
                                <asp:DropDownList ID="ddlYear" runat="server" DataTextField="Year" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator16" runat="server" ValidationGroup="save"
                                    ErrorMessage="Select year" ControlToValidate="ddlYear">*</asp:RequiredFieldValidator>
                            </div>
                            <label for="inputEmail3" class="col-sm-2">
                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-4">
                                <asp:DropDownList ID="ddlClass" runat="server" DataTextField="ClassName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator17" runat="server" ValidationGroup="save"
                                    ErrorMessage="Select class" ControlToValidate="ddlClass">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2">
                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,ApplicationStartDate %>"></asp:Label></label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="tbxStartDate" runat="server" placeholder="Enter Start Date" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator2" runat="server" ValidationGroup="save"
                                    ErrorMessage="Enter Start Date" ControlToValidate="tbxStartDate">*</asp:RequiredFieldValidator>
                                <cc1:CalendarExtender ID="calStartDate" TargetControlID="tbxStartDate" Format="yyyy/MM/dd" runat="server"></cc1:CalendarExtender>
                            </div>
                            <label for="inputEmail3" class="col-sm-2">
                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Application,ApplicationEndDate %>"></asp:Label></label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="tbxEndDate" runat="server" placeholder="Enter End Date" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator1" runat="server" ValidationGroup="save"
                                    ErrorMessage="Enter End Date" ControlToValidate="tbxEndDate">*</asp:RequiredFieldValidator>
                                <cc1:CalendarExtender ID="CalendarExtender1" TargetControlID="tbxEndDate" Format="yyyy/MM/dd" runat="server"></cc1:CalendarExtender>
                                <asp:CompareValidator ID="cvValidateDate" ControlToValidate="tbxEndDate" ControlToCompare="tbxStartDate"
                                    Type="Date" Operator="GreaterThanEqual" Display="None" runat="server" ValidationGroup="save" ErrorMessage="End date must be greater then start date."></asp:CompareValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2">
                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,ApplicationFee %>"></asp:Label></label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="tbxApplicationFee" runat="server" placeholder="Enter Application Fee" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator3" runat="server" ValidationGroup="save"
                                    ErrorMessage="Enter Application Fee" ControlToValidate="tbxApplicationFee">*</asp:RequiredFieldValidator>
                                <cc1:FilteredTextBoxExtender ID="CalendarExtender2" TargetControlID="tbxApplicationFee" ValidChars="0123456789." runat="server"></cc1:FilteredTextBoxExtender>
                            </div>
                            <label for="inputEmail3" class="col-sm-2">
                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Application,Title %>"></asp:Label></label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="tbxApplicationTitle" runat="server" placeholder="Enter Application Title" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator4" runat="server" ValidationGroup="save"
                                    ErrorMessage="Enter Application Title" ControlToValidate="tbxApplicationTitle">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2">
                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:Application,Vacancy %>"></asp:Label></label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="tbxVacancy" runat="server" placeholder="Enter Vacancy" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator5" runat="server" ValidationGroup="save"
                                    ErrorMessage="Enter Vacancy" ControlToValidate="tbxVacancy">*</asp:RequiredFieldValidator>
                                <cc1:FilteredTextBoxExtender ID="fteVacancyNumber" runat="server" TargetControlID="tbxVacancy" ValidChars="0123456789"></cc1:FilteredTextBoxExtender>
                            </div>
                            <label for="inputEmail3" class="col-sm-2">
                                <asp:Label ID="Label18" runat="server" Text="Admission Fee"></asp:Label></label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="tbxAdmissionFee" runat="server" placeholder="Enter Admission Fee" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator6" runat="server" ValidationGroup="save"
                                    ErrorMessage="Enter Admission Fee" ControlToValidate="tbxAdmissionFee">*</asp:RequiredFieldValidator>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="tbxAdmissionFee" ValidChars="0123456789"></cc1:FilteredTextBoxExtender>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2">
                                <asp:Label ID="Label20" runat="server" Text="Minimum Marks"></asp:Label></label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="tbxMinMarks" runat="server" placeholder="Enter Minimum Marks" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator8" runat="server" ValidationGroup="save"
                                    ErrorMessage="Enter Minimum Marks" ControlToValidate="tbxMinMarks">*</asp:RequiredFieldValidator>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="tbxMinMarks" ValidChars=".0123456789"></cc1:FilteredTextBoxExtender>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2">
                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:Application,Details %>"></asp:Label></label>
                            <div class="col-sm-10">
                                <cc1:Editor ID="tbxDetails" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2">
                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:Application,NoticeAttachment %>"></asp:Label></label>
                            <div class="col-sm-10">
                                <asp:FileUpload ID="flAttachment" runat="server" />
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
                                        <asp:Repeater ID="rptYear" runat="server">
                                            <HeaderTemplate>
                                                <table id="example1" class="table table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>
                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,Title %>"></asp:Label></th>
                                                            <th>
                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Application,Year %>"></asp:Label></th>
                                                            <th>
                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label></th>
                                                            <th>
                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:Application,Vacancy %>"></asp:Label></th>
                                                            <th>
                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:Application,ApplicationStartDate %>"></asp:Label></th>
                                                            <th>
                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Application,ApplicationEndDate %>"></asp:Label></th>
                                                            <th>
                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:Application,ApplicationFee %>"></asp:Label></th>
                                                            <th>
                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:Application,NoticeAttachment %>"></asp:Label></th>
                                                            <th>
                                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Application,Action %>"></asp:Label></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:HyperLink ID="HyperLink2" runat="server" Text='<%#Eval("Title") %>' NavigateUrl='<%# String.Concat("~/Pages/Admission/CircularDetails.aspx?ID=", Eval("Id")) %>'></asp:HyperLink></td>
                                                    <td><%#Eval("cYear") %></td>
                                                    <td><%#Eval("ClassName") %></td>
                                                    <td><%#Eval("Vacancy") %></td>
                                                    <td><%# Convert.ToDateTime(Eval("StartDate")).ToString("dd/MM/yyyy") %></td>
                                                    <td><%# Convert.ToDateTime(Eval("EndDate")).ToString("dd/MM/yyyy") %></td>
                                                    <td><%#Eval("ApplicationFee") %></td>
                                                    <td><a href='/VariableContent/AdmissionCircular/<%# Eval("Attachment") %>' target="_blank"><%# String.IsNullOrEmpty(Eval("Attachment").ToString())?"N/A":"Download" %></a></td>
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
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSave" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

