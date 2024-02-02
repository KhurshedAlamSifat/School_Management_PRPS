<%@ Page Title="Student Promotion" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="Promotion.aspx.cs" Inherits="Pages_Enrollment_Promotion" %>

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
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="promotion" />
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4">
                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Application,Year %>"></asp:Label><span class="required">*</span></label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="ddlPYear" runat="server" DataTextField="Year" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator1" runat="server" ValidationGroup="promotion"
                                        ErrorMessage="Select year" ControlToValidate="ddlPYear">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4">
                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label><span class="required">*</span></label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="ddlpClass" runat="server" DataTextField="ClassName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator2" runat="server" ValidationGroup="promotion"
                                        ErrorMessage="Select class" ControlToValidate="ddlpClass">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4">
                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,Group %>"></asp:Label><span class="required">*</span></label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="ddlpGroup" runat="server" DataTextField="GroupName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator3" runat="server" ValidationGroup="promotion"
                                        ErrorMessage="Select group" ControlToValidate="ddlpGroup">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4">
                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Application,Shift %>"></asp:Label><span class="required">*</span></label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="ddlpShift" runat="server" DataTextField="Shift" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator4" runat="server" ValidationGroup="promotion"
                                        ErrorMessage="Select shift" ControlToValidate="ddlpShift">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4">
                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,Section %>"></asp:Label><span class="required">*</span></label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="ddlpSection" runat="server" DataTextField="Section" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator5" runat="server" ValidationGroup="promotion"
                                        ErrorMessage="Select section" ControlToValidate="ddlpSection">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <asp:Button ID="btnPromotion" runat="server" Text="Promot" ValidationGroup="promotion" OnClick="btnSave_Click" CssClass="btn btn-flat btn-success pull-right" />
                </div>
            </div>
            <div class="panel panel-success">
                <div class="panel-body">
                    <div style="overflow: auto">
                        <asp:GridView ID="gvStudent" ClientIDMode="Static" runat="server" CssClass="table"
                            AutoGenerateColumns="false">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkHeader" runat="server" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkrow" runat="server" />
                                        <asp:HiddenField runat="server" ID="hdnStId" Value='<%#Eval("StudentId") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="RollNo">
                                    <ItemTemplate>
                                        <asp:TextBox ID="tbxRoll" Text='<%#Eval("RollNo") %>' runat="server" CssClass="form-control"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="RegistrationNo" HeaderText="RegNo" />
                                <asp:BoundField DataField="NameEng" HeaderText="Name" />
                                <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                                <asp:BoundField DataField="Religion" HeaderText="Religion" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <div class="panel-footer">
                    <asp:Button ID="btnSave" runat="server" CssClass="btn btn-flat btn-success pull-right" Text="Promot" OnClick="btnSave_Click" />
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
