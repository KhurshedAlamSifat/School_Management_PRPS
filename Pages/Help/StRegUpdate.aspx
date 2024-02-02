<%@ Page Title="Students Registration Number Update" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="StRegUpdate.aspx.cs" Inherits="Pages_Help_StRegUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel ID="upnl" runat="server">
        <ContentTemplate>
            <div class="panel panel-success">
                <div class="panel-body">
                    <div class="col-lg-6 col-md-6">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4">
                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Application,Year %>"></asp:Label><span class="required">*</span></label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="ddlYear" runat="server" DataTextField="Year" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator16" runat="server" ValidationGroup="classInfo"
                                        ErrorMessage="Select year" ControlToValidate="ddlYear">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4">
                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label><span class="required">*</span></label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="ddlClass" runat="server" DataTextField="ClassName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator17" runat="server" ValidationGroup="classInfo"
                                        ErrorMessage="Select class" ControlToValidate="ddlClass">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4">
                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:Application,Group %>"></asp:Label><span class="required">*</span></label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="ddlGroup" runat="server" DataTextField="GroupName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator18" runat="server" ValidationGroup="classInfo"
                                        ErrorMessage="Select group" ControlToValidate="ddlGroup">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4">
                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:Application,Shift %>"></asp:Label><span class="required">*</span></label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="ddlShift" runat="server" DataTextField="Shift" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator19" runat="server" ValidationGroup="classInfo"
                                        ErrorMessage="Select shift" ControlToValidate="ddlShift">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4">
                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Application,Section %>"></asp:Label><span class="required">*</span></label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="ddlSection" runat="server" DataTextField="Section" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator20" runat="server" ValidationGroup="classInfo"
                                        ErrorMessage="Select section" ControlToValidate="ddlSection">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4">
                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:Application,RegistratinNo %>"></asp:Label></label>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="tbxRegNo" runat="server" placeholder="Enter Registration No." CssClass="form-control"></asp:TextBox>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-success" />
                </div>
            </div>
            <div class="panel panel-success">
                <div class="panel-body">
                    <asp:GridView ID="gvStudent" ClientIDMode="Static" runat="server" CssClass="table"
                        AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="ID" />
                            <asp:BoundField DataField="NameEng" HeaderText="Name" />
                            <asp:TemplateField HeaderText="RegNo">
                                <ItemTemplate>
                                    <asp:TextBox ID="tbxReg" Text='<%#Eval("RegistrationNo") %>' runat="server" CssClass="form-control"></asp:TextBox>
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
                    <asp:Button ID="btnSave" runat="server" CssClass="btn btn-flat btn-primary pull-right" Text="Submit" OnClick="btnSave_Click" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
    <script type="text/javascript">
        function load() {
            $("#gvStudent [id*=chkHeader]").click(function () {
                if ($(this).is(":checked")) {
                    $("#gvStudent [id*=chkrow]").prop("checked", true);
                } else {
                    $("#gvStudent [id*=chkrow]").prop("checked", false);
                }
            });

            $("#gvStudent [id*=chkrow]").click(function () {
                if ($("#gvStudent [id*=chkrow]").length == $("#gvStudent [id*=chkrow]:checked").length) {
                    $("#gvStudent [id*=chkHeader]").prop("checked", true);
                } else {
                    $("#gvStudent [id*=chkHeader]").prop("checked", false);
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

