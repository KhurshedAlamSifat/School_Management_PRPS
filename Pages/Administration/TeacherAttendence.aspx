<%@ Page Title="<%$ Resources:Application,TeacherAttendence %>" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="TeacherAttendence.aspx.cs" Inherits="Pages_Administration_TeacherAttendence" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../Styles/bootstrap-timepicker.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">

    <div class="padding-bottom-15">
        <asp:RadioButtonList ID="rdList" runat="server" ClientIDMode="Static" RepeatColumns="2" CssClass="form-control FormatRadioButtonList">
            <asp:ListItem Value="1" Text="<%$ Resources:Application,ByDate %>"></asp:ListItem>
            <asp:ListItem Value="2" Text="<%$ Resources:Application,ByTeacher %>"></asp:ListItem>
        </asp:RadioButtonList>
    </div>
    <div class='<%= Common.SessionInfo.Panel %>' id="1">
        <div class="panel-heading">
            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:Application,TeacherList %>"></asp:Label>
        </div>
        <div class="panel-body">
            <div>
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Application,Date %>"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-3">
                            <asp:TextBox ID="tbxDate" runat="server" CssClass="form-control" ClientIDMode="Static" AutoPostBack="true" OnTextChanged="tbxDate_TextChanged"></asp:TextBox>
                            <asp:Label ID="lblError" Text="Selected date must be smaller than current date." runat="server" ClientIDMode="Static" ForeColor="Red"></asp:Label>
                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxDate" SelectedDate='<%# DateTime.Now %>'
                                TargetControlID="tbxDate">
                            </cc1:CalendarExtender>
                        </div>
                    </div>
                </div>
            </div>
            <div class="box">
                <div class="box-body">
                    <asp:Repeater ID="rptTeacher" runat="server">
                        <HeaderTemplate>
                            <table id="example11" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>
                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:Application,Name %>"></asp:Label></th>
                                        <th>
                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Application,Intime %>"></asp:Label></th>
                                        <th>
                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,OutTime %>"></asp:Label></th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("NameEng") %>
                                    <asp:HiddenField ID="hdnId" runat="server" Value='<%#Eval("TeacherId") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="tbxIn" runat="server" CssClass="form-control" placeholder="Ex: 10:00"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="regexStartTime" ControlToValidate="tbxIn"
                                        ValidationExpression="^([0-1][0-9]|[2][0-3]):([0-5][0-9])$" ErrorMessage="Input valid time: ex: 10:00" runat="server" />
                                </td>
                                <td>
                                    <asp:TextBox ID="tbxOut" runat="server" CssClass="form-control" placeholder="Ex: 04:00"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="tbxOut"
                                        ValidationExpression="^([0-1][0-9]|[2][0-3]):([0-5][0-9])$" ErrorMessage="Input valid time. ex: 04:00" runat="server" />
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

    <div class='<%= Common.SessionInfo.Panel %>' id="2">
        <div class="panel-heading">
            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,TeacherList %>"></asp:Label>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3">
                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Application,TeacherName %>"></asp:Label></label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="ddlTeacher" runat="server" DataTextField="NameEng" DataValueField="TeacherId" CssClass="form-control dropdown"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6" align="right">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-6">
                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,Archive %>"></asp:Label></label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="tbxArchive" runat="server" CssClass="form-control"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxArchive" SelectedDate='<%# DateTime.Now %>'
                                    TargetControlID="tbxArchive">
                                </cc1:CalendarExtender>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="box">
                <div class="box-body">
                    <asp:Repeater ID="rptDate" runat="server">
                        <HeaderTemplate>
                            <table id="example12" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>
                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,Date %>"></asp:Label></th>
                                        <th>
                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Application,InTime %>"></asp:Label></th>
                                        <th>
                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Application,OutTime %>"></asp:Label></th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%#Convert.ToDateTime(Eval("Date")).ToString("dd-MMM-yyyy") %>
                                    <asp:HiddenField ID="hdnDate" runat="server" Value='<%# Eval("Date")%>' />
                                </td>
                                <td class="bootstrap-timepicker">
                                    <asp:TextBox ID="intime" CssClass="form-control timepicker" runat="server" Text="" Enabled='<%#Convert.ToDateTime(Eval("Date"))>DateTime.Now?false:true %>'></asp:TextBox>

                                </td>
                                <td class="bootstrap-timepicker">
                                    <asp:TextBox ID="tbxOut" runat="server" CssClass="form-control timepicker" Text="" placeholder="Ex: 04:00" Enabled='<%#Convert.ToDateTime(Eval("Date"))>DateTime.Now?false:true %>'></asp:TextBox>
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

    <div id="3">
        <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" Text="<%$ Resources:Application,Submit %>" />
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="script">
    <script src="../../Scripts/bootstrap-timepicker.min.js"></script>
    <script type="text/javascript">
        $(".timepicker").timepicker({
            showInputs: false
        });
        $(document).ready(function () {
            $("#lblError").hide();
            $("#tbxDate").change(function () {
                var dt = $("#tbxDate").val();
                var cd = new Date();

                if (Date.parse(dt) > Date.parse(cd)) {
                    $("#lblError").slideDown();
                    $("#3").hide();
                }
                else {
                    $("#lblError").hide();
                    $("#3").show();
                }

            });
            $("#1").hide();
            $("#2").hide();
            $("#3").hide();
            $("#rdList").change(function () {
                var checked_radio = $("[id*=rdList] input:checked");
                if (checked_radio.val() == "1") {
                    $("#1").slideDown();
                    $("#2").hide();
                    $("#3").show();
                }
                else {
                    $("#2").slideDown();
                    $("#1").hide();
                    $("#3").show();
                }
            });
        });
    </script>
</asp:Content>

