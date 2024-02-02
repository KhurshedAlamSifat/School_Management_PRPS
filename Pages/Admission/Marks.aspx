<%@ Page Title="Admission Test Marks Entry" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="Marks.aspx.cs" Inherits="Pages_Admission_Marks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
<%--    <asp:UpdatePanel ID="update" runat="server">
        <ContentTemplate>--%>
            <div class='<%= Common.SessionInfo.Panel %>' id="criteria">
                <div class="panel-heading">
                    <asp:Label ID="Label5" runat="server" Text="Exam Schedule"></asp:Label>
                </div>
                <div class="panel-body">
                    <div class="col-md-10">
                        <div class="form-horizontal">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="search" />
                                <asp:Label ID="lblError" runat="server" Font-Bold="True" SkinID="message"></asp:Label>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2">
                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Application,Year %>"></asp:Label></label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" DataTextField="Year" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2">
                                    <asp:Label ID="Label2" runat="server" Text="Circular"></asp:Label>
                                    <span class="required">*</span></label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="ddlCircular" OnSelectedIndexChanged="ddlCircular_SelectedIndexChanged" AutoPostBack="true" runat="server" DataTextField="Title" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator4" runat="server" ValidationGroup="search"
                                        ErrorMessage="Circular Is Required." ControlToValidate="ddlCircular">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-8">
                                    <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" ValidationGroup="search" CssClass="btn btn-primary pull-right" Text="Show" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-success">
                <div class="panel-body">

                    <asp:GridView ID="gvMarks" ClientIDMode="Static" runat="server" CssClass="table"
                        AutoGenerateColumns="false">
                        <Columns>
                            <asp:TemplateField HeaderText="SL#">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Id" HeaderText="ApplicantId" />
                            <asp:BoundField DataField="Name" HeaderText="Applicant Name" />
                            <asp:TemplateField HeaderText="Marks">
                                <ItemTemplate>
                                    <asp:TextBox ID="tbxMarks" Text='<%# String.IsNullOrEmpty(Eval("Marks").ToString())?"":Eval("Marks") %>' runat="server" CssClass="form-control"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender TargetControlID="tbxMarks" ID="ftbMarks" runat="server" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="chkHeader" runat="server" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkrow" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>


                </div>
                <div class="panel-footer">
                    <asp:Button ID="btnSave" runat="server" CssClass="btn btn-flat btn-primary pull-right"
                        Text="Submit"
                        OnClick="btnSave_Click" />
                </div>
            </div>
<%--        </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
    <script type="text/javascript">
        function load() {
            $("#gvMarks [id*=chkHeader]").click(function () {
                if ($(this).is(":checked")) {
                    $("#gvMarks [id*=chkrow]").prop("checked", true);
                } else {
                    $("#gvMarks [id*=chkrow]").prop("checked", false);
                }
            });

            $("#gvMarks [id*=chkrow]").click(function () {
                if ($("#gvMarks [id*=chkrow]").length == $("#gvMarks [id*=chkrow]:checked").length) {
                    $("#gvMarks [id*=chkHeader]").prop("checked", true);
                } else {
                    $("#gvMarks [id*=chkHeader]").prop("checked", false);
                }
            });
        }
        $(document).ready(function () {
            load();
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
            function EndRequestHandler(sender, args) {
                load();
            }
        });
    </script>
</asp:Content>

