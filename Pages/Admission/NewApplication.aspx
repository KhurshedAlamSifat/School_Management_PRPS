<%@ Page Title="New Applications" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="NewApplication.aspx.cs" Inherits="Pages_Admission_NewApplication" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .modalBackground {
            background-color: black;
            filter: alpha(opacity=80);
            opacity: 0.8;
        }

        .modalPoup {
            background-color: #fff;
            text-align: center;
            min-height: 200px;
            color: green;
        }

        .modalPoupf {
            background-color: #fff;
            min-height: 70px;
        }
    </style>
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
                            <label for="inputEmail3" class="col-sm-3">
                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Application,Year %>"></asp:Label></label>
                            <div class="col-sm-6">
                                <asp:DropDownList ID="ddlYear" runat="server" DataTextField="Year" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3">
                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label></label>
                            <div class="col-sm-6">
                                <asp:DropDownList ID="ddlClass" runat="server" DataTextField="ClassName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>

                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3">
                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,PaymentStatus %>"></asp:Label></label>
                            <div class="col-sm-6">
                                <asp:DropDownList ID="ddlPaymentStatus" runat="server" CssClass="form-control dropdown">
                                    <asp:ListItem Value="0">Pending</asp:ListItem>
                                    <asp:ListItem Value="1">Paid</asp:ListItem>
                                </asp:DropDownList>

                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3">
                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Application,IsSelected %>"></asp:Label></label>
                            <div class="col-sm-6">
                                <asp:DropDownList ID="ddlSelected" runat="server" CssClass="form-control dropdown">
                                    <asp:ListItem Value="0">No</asp:ListItem>
                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                </asp:DropDownList>

                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3">
                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:Application,IsAdmitted %>"></asp:Label></label>
                            <div class="col-sm-6">
                                <asp:DropDownList ID="ddlAdmitted" runat="server" CssClass="form-control dropdown">
                                    <asp:ListItem Value="0">No</asp:ListItem>
                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                </asp:DropDownList>

                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3">
                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,ApplicationId %>"></asp:Label></label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="tbxApplicatoinID" runat="server" placeholder="Application ID" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3">
                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Application,Mobile %>"></asp:Label></label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="tbxMobile" runat="server" placeholder="Mobile" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-9 text-right">
                                <asp:Button ID="btnSearch" runat="server" Text="<%$ Resources:Application,Search %>" CssClass="btn btn-primary"
                                    OnClick="btnSearch_Click" />
                                <asp:Button ID="btnAdmit" runat="server" Text="Admit Student" CssClass="btn btn-primary" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-12">
                                <div class="box">
                                    <div class="box-body">
                                        <asp:Repeater ID="rptApplicationList" runat="server">
                                            <HeaderTemplate>
                                                <table id="example1" class="table table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>
                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,ID %>"></asp:Label></th>
                                                            <th>
                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label></th>
                                                            <th>
                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:Application,Name %>"></asp:Label></th>
                                                            <th>
                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Application,Mobile %>"></asp:Label></th>
                                                            <th>
                                                                <asp:Label ID="Label4" runat="server" Text="Selected"></asp:Label></th>
                                                            <th>
                                                                <asp:Label ID="Label10" runat="server" Text="Admit"></asp:Label>
                                                                <asp:CheckBox ID="chkstudentHeader" runat="server" />
                                                            </th>
                                                            <th>
                                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Application,Action %>"></asp:Label></th>
                                                            <th>
                                                                <asp:Label ID="Label22" runat="server" Text="Admission Form Fee"></asp:Label></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:HyperLink ID="HyperLink2" Target="_blank" runat="server" Text='<%#Eval("Id") %>' NavigateUrl='<%# String.Concat("~/Pages/Admission/ApplicationDetails.aspx?ID=", Eval("Id")) %>'></asp:HyperLink>
                                                        <asp:HiddenField ID="hdnAppId" runat="server" Value='<%#Eval("Id") %>' />
                                                    </td>
                                                    <td><%#Eval("ClassName") %></td>
                                                    <td><%#Eval("Name") %></td>
                                                    <td><%#Eval("Mobile") %></td>
                                                    <td>
                                                        <asp:CheckBox ID="chkIsSelected" Enabled="false" runat="server" Checked='<%#Eval("IsSelected") %>' /></td>
                                                    <td>
                                                        <asp:CheckBox ID="chkIsAdmitted" Enabled='<%# (Convert.ToInt32(Eval("IsSelected"))) == 1 ? true : false %>' runat="server" Checked='<%#Eval("IsAdmitted") %>' /></td>
                                                    <td class="col-md-2">
                                                        <asp:ImageButton ID="btnPayment" runat="server" OnCommand="btnPayment_Command" CommandArgument='<%# Eval("Id")%>' ImageUrl="~/Images/Common/paynow.png" AlternateText="Payment" ToolTip="Payment" />

                                                        <asp:ImageButton ID="btnReference" runat="server" OnCommand="btnReference_Command" CommandArgument='<%# Eval("Id")%>' ImageUrl="~/Images/Common/reference.png" AlternateText="Ref." ToolTip="Reference" />
                                                        <%--<asp:ImageButton ID="btnDelete" runat="server" OnCommand="btnDelete_Command" CommandArgument='<%# Eval("Id")%>' ImageUrl="~/Images/Common/delete.png" ToolTip="Delete" OnClientClick="return confirm('Are you sure?')" />--%></td>
                                                    <td><%#Eval("AdmissionFormFee") %></td>
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
            <asp:Label ID="lbPopup" runat="server"></asp:Label>

            <cc1:ModalPopupExtender ID="mpPayment" PopupControlID="pnlPayment" BackgroundCssClass="modalBackground" runat="server" CancelControlID="btnCancel" TargetControlID="lbPopup"></cc1:ModalPopupExtender>
            <asp:Panel ID="pnlPayment" runat="server">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h1 class="panel-title">Payment</h1>
                        </div>
                        <div class="panel-body modalPoup">
                            <div class="col-md-12">
                                <hr />
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-md-5">
                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:Application,ApplicationID %>"></asp:Label>
                                        </label>
                                        <div class="col-md-7 text-left">
                                            <asp:TextBox ID="tbxPaymentApplicationID" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-5">
                                            <asp:Label ID="Label21" runat="server" Text="Amount (BDT)"></asp:Label>
                                        </label>
                                        <div class="col-md-7 text-left">
                                            <asp:TextBox ID="tbxAdmissionFormFee" value="300" runat="server" placeholder="Enter Admission Test Fee Amount" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-5">
                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:Application,PaymentMethod %>"></asp:Label>
                                        </label>
                                        <div class="col-md-7 text-left">
                                            <asp:DropDownList ID="ddlPaymentMethod" runat="server" CssClass="form-control" DataTextField="MethodName" DataValueField="Id"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-5">
                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:Application,TransactionID %>"></asp:Label>
                                        </label>
                                        <div class="col-md-7 text-left">
                                            <asp:TextBox ID="tbxTransactionID" runat="server" placeholder="Enter Transaction ID" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <asp:Button ID="btnSave" OnClick="btnSave_Click" runat="server" CssClass="btn btn-success" Text="Submit" />
                            </div>
                        </div>
                        <div class="panel-footer modalPoupf">
                            <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning pull-right" Text="Cancel" />
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <asp:Label ID="Label16" runat="server"></asp:Label>

            <cc1:ModalPopupExtender ID="mpRef" PopupControlID="Panel1" BackgroundCssClass="modalBackground" runat="server" CancelControlID="btnCancelref" TargetControlID="Label16"></cc1:ModalPopupExtender>
            <asp:Panel ID="Panel1" runat="server">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h1 class="panel-title">Reference</h1>
                        </div>
                        <div class="panel-body modalPoup">
                            <div class="col-md-12">
                                <hr />
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-md-5">
                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:Application,ApplicationID %>"></asp:Label>
                                        </label>
                                        <div class="col-md-7 text-left">
                                            <asp:TextBox ID="tbxmpRefApplicationID" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-5">
                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:Application,Reference %>"></asp:Label>
                                        </label>
                                        <div class="col-md-7 text-left">
                                            <asp:TextBox ID="tbxReference" runat="server" placeholder="Enter Reference Name" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <asp:Button ID="btnReference" OnClick="btnReference_Click" runat="server" CssClass="btn btn-success" Text="Submit" />
                            </div>
                        </div>
                        <div class="panel-footer modalPoupf">
                            <asp:Button ID="btnCancelref" runat="server" CssClass="btn btn-warning pull-right" Text="Cancel" />
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <cc1:ModalPopupExtender ID="mpSection" PopupControlID="Panel2" BackgroundCssClass="modalBackground" runat="server" CancelControlID="btnCancelref" TargetControlID="btnAdmit"></cc1:ModalPopupExtender>
            <asp:Panel ID="Panel2" runat="server">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h1 class="panel-title">Section</h1>
                        </div>
                        <div class="panel-body modalPoup">
                            <div class="col-md-12">
                                <hr />
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-4">
                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Application,Section %>"></asp:Label><span class="required">*</span></label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlSection" runat="server" DataTextField="Section" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-4">
                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:Application,Shift %>"></asp:Label><span class="required">*</span></label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlShift" runat="server" DataTextField="Shift" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <asp:Button ID="btnSectionAdmit" OnClick="btnSectionAdmit_Click" runat="server" CssClass="btn btn-success" Text="Submit" />
                            </div>
                        </div>
                        <div class="panel-footer modalPoupf">
                            <asp:Button ID="btnCancelSection" runat="server" CssClass="btn btn-warning pull-right" Text="Cancel" />
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
    <script type="text/javascript">
        function Load() {
            $("#example1 [id*=chkstudentHeader]").click(function () {
                if ($(this).is(":checked")) {
                    $("#example1 [id*=chkIsAdmitted]").prop("checked", true);
                } else {
                    $("#example1 [id*=chkIsAdmitted]").prop("checked", false);
                }
            });

            $("#example1 [id*=chkIsAdmitted]").click(function () {
                if ($("#example1 [id*=chkIsAdmitted]").length == $("#example1 [id*=chkIsAdmitted]:checked").length) {
                    $("#example1 [id*=chkstudentHeader]").prop("checked", true);
                } else {
                    $("#example1 [id*=chkstudentHeader]").prop("checked", false);
                }
            });

        }
        $(function () {
            Load();
        });
        //On UpdatePanel Refresh
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (prm != null) {
            prm.add_endRequest(function (sender, e) {
                Load();
            });
        };
    </script>
</asp:Content>

