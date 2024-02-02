<%@ Page Title="Manage Fee Head" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="ManageFeeHead.aspx.cs" Inherits="Pages_FeePaymentModule_ManageFeeHead" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">

    <asp:UpdatePanel ID="Updatepanel1" runat="server">
        <ContentTemplate>
            <div class="form-horizontal">
                <div class="form-group">
                    <div class="col-md-10 col-sm-10 col-xs-10">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="save" />
                        <asp:Label ID="lblError" runat="server" Font-Bold="True" SkinID="message"></asp:Label>
                        <asp:HiddenField ID="hdnID" runat="server" />
                    </div>
                </div>

                <%--
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2"><asp:Label ID="Label5" runat="server" Text="XXX"></asp:Label></label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="tbxXXX" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator2" runat="server" ValidationGroup="save"
                            ErrorMessage="Enter XXX" ControlToValidate="tbxXXX">*</asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2"><asp:Label ID="Label5" runat="server" Text="XXX"></asp:Label></label>
                    <div class="col-sm-3">
                        <asp:DropDownList ID="ddlXXX"  runat="server" DataTextField="Title" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator2" runat="server" ValidationGroup="save"
                            ErrorMessage="Enter XXX" ControlToValidate="ddlXXX">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                --%>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2">
                        <asp:Label ID="Label5" runat="server" Text="FC Code"></asp:Label></label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="tbxFcCode" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator2" runat="server" ValidationGroup="save"
                            ErrorMessage="Enter FcCode" ControlToValidate="tbxFcCode">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2">
                        <asp:Label ID="Label4" runat="server" Text="Full Name"></asp:Label></label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="tbxFullName" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator1" runat="server" ValidationGroup="save"
                            ErrorMessage="Enter Full Name" ControlToValidate="tbxFullName">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2">
                        <asp:Label ID="Label2" runat="server" Text="Display Name"></asp:Label></label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="tbxDisplayName" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator6" runat="server" ValidationGroup="save"
                            ErrorMessage="Enter Display Nmae" ControlToValidate="tbxDisplayName">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2">
                        <asp:Label ID="Label7" runat="server" Text="Class"></asp:Label></label>
                    <div class="col-sm-3">
                        <asp:DropDownList ID="ddlClassId" runat="server" DataTextField="ClassName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        <%--<asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator4" runat="server" ValidationGroup="save"
                            ErrorMessage="Enter ClassId" ControlToValidate="ddlClassId">*</asp:RequiredFieldValidator>--%>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2">
                        <asp:Label ID="Label8" runat="server" Text="Charge By"></asp:Label></label>
                    <div class="col-sm-3">
                        <asp:DropDownList ID="ddlChargeBy" runat="server" CssClass="form-control dropdown"></asp:DropDownList>
                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator5" runat="server" ValidationGroup="save"
                            ErrorMessage="Enter ChargeBy" ControlToValidate="ddlChargeBy">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2">
                        <asp:Label ID="Label17" runat="server" Text="Waiverable"></asp:Label></label>
                    <div class="col-sm-10">
                        <asp:CheckBox ID="chkIsActive_ForWaiver" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2">
                        <asp:Label ID="Label6" runat="server" Text="Default Amount"></asp:Label></label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="tbxDefaultAmount" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator3" runat="server" ValidationGroup="save"
                            ErrorMessage="Enter DefaultAmount" ControlToValidate="tbxDefaultAmount">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2">
                        <asp:Label ID="Label14" runat="server" Text="Priority Order"></asp:Label></label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="tbxPriorityOrder" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator4" runat="server" ValidationGroup="save"
                            ErrorMessage="Enter PriorityOrder" ControlToValidate="tbxPriorityOrder">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2">
                        <asp:Label ID="Labe21" runat="server" Text="Is Active"></asp:Label></label>
                    <div class="col-sm-10">
                        <asp:CheckBox ID="chkIsActive" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2">
                        <asp:Label ID="Label1" runat="server" Text="Due Generation"></asp:Label></label>
                    <div class="col-sm-10">
                        <asp:CheckBox ID="chkIsActive_ForDueGenerationBySytem" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-11">
                        <asp:Button ID="btnSave" ClientIDMode="Static" runat="server" Text="<%$ Resources:Application,Save %>" CssClass="btn btn-primary" ValidationGroup="save"
                            OnClick="btnSave_Click" />
                        <asp:Button ID="btnEdit" runat="server" ClientIDMode="Static" Text="<%$ Resources:Application,Edit %>" CssClass="btn btn-primary" ValidationGroup="save" Visible="false"
                            OnClick="btnEdit_Click" />
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
                                                        <asp:Label ID="Label9" runat="server" Text="Id"></asp:Label></th>
                                                    <th>
                                                        <asp:Label ID="Label15" runat="server" Text="Fc Code"></asp:Label></th>
                                                    <th>
                                                        <asp:Label ID="Label10" runat="server" Text="Full Name"></asp:Label></th>
                                                    <th>
                                                        <asp:Label ID="Label3" runat="server" Text="Display Name"></asp:Label></th>
                                                    <th>
                                                        <asp:Label ID="Label11" runat="server" Text="Charge By"></asp:Label></th>
                                                    <th>
                                                        <asp:Label ID="Label19" runat="server" Text="Waiverable"></asp:Label></th>
                                                    <th>
                                                        <asp:Label ID="Label6" runat="server" Text="Class"></asp:Label></th>
                                                    <th>
                                                        <asp:Label ID="Label18" runat="server" Text="Default Amount"></asp:Label></th>
                                                    <th>
                                                        <asp:Label ID="Label13" runat="server" Text="Priority Order"></asp:Label></th>
                                                    <th>
                                                        <asp:Label ID="Label12" runat="server" Text="Is Active"></asp:Label></th>
                                                    <th>
                                                        <asp:Label ID="Label16" runat="server" Text="Due Generation"></asp:Label></th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <%--<td><%#Eval("") %></td>--%>
                                            <td><%#Eval("Id") %></td>
                                            <td><%#Eval("FcCode") %></td>
                                            <td><%#Eval("FullName") %></td>
                                            <td><%#Eval("DisplayName") %></td>
                                            <td><%#Eval("ChargeBy") %></td>
                                            <td><%#Eval("IsActive_ForWaiver") %></td>
                                            <td><%#Eval("ClassName") %></td>
                                            <td><%#Eval("DefaultAmount") %></td>
                                            <td><%#Eval("PriorityOrder") %></td>
                                            <td><%#Eval("IsActive") %></td>
                                            <td><%#Eval("IsActive_ForDueGenerationBySytem") %></td>
                                            <td>
                                                <asp:ImageButton ID="btnEdit" runat="server" OnCommand="btnEdit_Command" CommandArgument='<%# Eval("Id")%>' ImageUrl="~/Images/Common/edit.png" ToolTip="Edit" />
                                                <%--<asp:ImageButton ID="btnDelete" runat="server" OnCommand="btnDelete_Command" CommandArgument='<%# Eval("Id")%>' ImageUrl="~/Images/Common/delete.png" ToolTip="Delete" OnClientClick="return confirm('Are you sure?')" />--%>
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
                    </div>
                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
