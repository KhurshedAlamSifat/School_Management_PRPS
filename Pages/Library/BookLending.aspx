<%@ Page Title="Book Lending" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="BookLending.aspx.cs" Inherits="Pages_Library_BookLending" %>

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
                                <asp:Label ID="Label22" runat="server" Text="Book Tr Id"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="tbxAdd_BookTrId" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator3" runat="server" ValidationGroup="add"
                                    ErrorMessage="Write Book Tr Id" ControlToValidate="tbxAdd_BookTrId">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label23" runat="server" Text="Issue Date"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="tbxAdd_IssueDate" runat="server" CssClass="form-control" placeholder="dd/MM/yyyy"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator4" runat="server" ValidationGroup="add"
                                    ErrorMessage="Enter Issue Date" ControlToValidate="tbxAdd_IssueDate">*</asp:RequiredFieldValidator>
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxAdd_IssueDate"
                                    TargetControlID="tbxAdd_IssueDate">
                                </cc1:CalendarExtender>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label24" runat="server" Text="Note"></asp:Label></label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="tbxAdd_Note" runat="server" placeholder="Note" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label27" runat="server" Text="User Name"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="tbxAdd_UserName" runat="server" placeholder="Enter Application ID" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator7" runat="server" ValidationGroup="add"
                                    ErrorMessage="Write User Name" ControlToValidate="tbxAdd_UserName">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label28" runat="server" Text="Return Date"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="tbxAdd_TargatedReturnDate" runat="server" CssClass="form-control" placeholder="dd/MM/yyyy"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator8" runat="server" ValidationGroup="add"
                                    ErrorMessage="Enter Target Return Date" ControlToValidate="tbxAdd_TargatedReturnDate">*</asp:RequiredFieldValidator>
                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxAdd_TargatedReturnDate"
                                    TargetControlID="tbxAdd_TargatedReturnDate">
                                </cc1:CalendarExtender>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <asp:Button ID="btnSave" runat="server" ClientIDMode="Static" Text="Save" CssClass="btn btn-primary" ValidationGroup="add"
                    OnClick="btnAdd_Click" />
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlEdit" runat="server">
        <div class="panel panel-success">
            <div class="panel-body">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="edit" />
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" SkinID="message"></asp:Label>
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label1" runat="server" Text="Book Tr Id"></asp:Label></label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="tbxEdit_BookTrId" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label3" runat="server" Text="Note"></asp:Label></label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="tbxEdit_Note" runat="server" placeholder="Note" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label4" runat="server" Text="User Name"></asp:Label></label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="tbxEdit_UserName" runat="server" placeholder="Enter Application ID" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label5" runat="server" Text="Return Date"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="tbxEdit_StatusUpdationDate" runat="server" CssClass="form-control" placeholder="dd/MM/yyyy"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator1" runat="server" ValidationGroup="edit"
                                    ErrorMessage="Enter Return Date" ControlToValidate="tbxEdit_StatusUpdationDate">*</asp:RequiredFieldValidator>
                                <cc1:CalendarExtender ID="CalendarExtender3" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxEdit_StatusUpdationDate"
                                    TargetControlID="tbxEdit_StatusUpdationDate">
                                </cc1:CalendarExtender>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <asp:Button ID="btnEdit_Receive" runat="server" Text="Receive Book" OnClick="btnEdit_Click" CssClass="btn btn-success" CommandArgument="Returned" ValidationGroup="edit" />
                <asp:Button ID="btnShowAddPanel" runat="server" Text="Show Book Lend Panel" OnClick="btnShowAddPanel_Click" CssClass="btn btn-info" />
                <asp:Button ID="btnEdit_Lost" runat="server" Text="Lost Book" OnClick="btnEdit_Click" CssClass="btn btn-danger pull-right" CommandArgument="Lost" ValidationGroup="edit" />
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
                                <asp:Label ID="Label8" runat="server" Text="Book Tr Id"></asp:Label></label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="tbxSearch_BookTrId" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 col-md-5">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label9" runat="server" Text="User Name"></asp:Label></label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="tbxSearch_UserName" runat="server" placeholder="Enter Application ID" CssClass="form-control"></asp:TextBox>
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
                <asp:Repeater ID="rpt" runat="server">
                    <HeaderTemplate>
                        <table id="example1" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>
                                        <asp:Label ID="Label17" runat="server" Text="Book"></asp:Label></th>
                                    <th>
                                        <asp:Label ID="Label18" runat="server" Text="Taken By"></asp:Label></th>
                                    <th>
                                        <asp:Label ID="Label19" runat="server" Text="IssueDate"></asp:Label></th>
                                    <th>
                                        <asp:Label ID="Label20" runat="server" Text="TargatedReturnDate"></asp:Label></th>
                                    <th>
                                        <asp:Label ID="Label21" runat="server" Text="Status"></asp:Label></th>
                                    <th>
                                        <asp:Label ID="Label22" runat="server" Text="Note"></asp:Label></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%#Eval("TrackingId") %>
                                <br />
                                <%#Eval("TitleEng") %></td>
                            <td><%#Eval("UserName") %><br />
                                <%#Eval("NameEng") %></td>
                            <td><%#Eval("IssueDate") %></td>
                            <td><%#Eval("TargatedReturnDate") %></td>
                            <td><%#Eval("Status") %></td>
                            <td><%#Eval("Note") %></td>
                            <td>
                                <asp:ImageButton ID="btnEdit" runat="server" OnCommand="btnEdit_Command" CommandArgument='<%# Eval("Id")%>' ImageUrl="~/Images/Common/edit.png" ToolTip="Edit" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody>
                                </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
    </asp:Panel>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

