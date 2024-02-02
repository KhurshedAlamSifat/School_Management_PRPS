<%@ Page Title="SMS Notification" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="SMS.aspx.cs" Inherits="Pages_Notification_SMS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="padding-bottom-15">
        <asp:RadioButtonList ID="rdList" runat="server" ClientIDMode="Static" RepeatColumns="2" CssClass="form-control FormatRadioButtonList">
            <asp:ListItem Value="1" Text="<%$ Resources:Application,Student %>" Selected="True"></asp:ListItem>
            <asp:ListItem Value="2" Text="<%$ Resources:Application,Teacher %>"></asp:ListItem>
        </asp:RadioButtonList>
    </div>
    <div class='<%= Common.SessionInfo.Panel %>' id="criteria">
        <div class="panel-heading">
            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,Criteria %>"></asp:Label>
        </div>
        <div class="panel-body">
            <div class="col-lg-6 col-md-6">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Application,Year %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlYear" runat="server" DataTextField="Year" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlClass" runat="server" DataTextField="ClassName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,Group %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlGroup" runat="server" DataTextField="GroupName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" CssClass="btn btn-default" Text="<%$ Resources:Application,Search %>" />
                </div>
            </div>

            <div class="col-lg-6 col-md-6">
                <div class="form-horizontal">

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Application,Shift %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlShift" runat="server" DataTextField="Shift" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Application,Section %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlSection" runat="server" DataTextField="Section" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-6">
            <asp:Panel ClientIDMode="Static" ID="pnlAssignStudent" runat="server">
                <div class='<%= Common.SessionInfo.Panel %>'>
                    <div class="panel-heading">
                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Application,StudentList %>"></asp:Label>
                    </div>
                    <div class="panel-body">
                        <div class="box">
                            <div class="box-body" style="max-height: 700px; overflow: auto;">
                                <asp:Repeater ID="rptStudent" runat="server">
                                    <HeaderTemplate>
                                        <table id="example1" class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        <asp:CheckBox ID="chkHeader" runat="server" /></th>
                                                    <th>
                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Application,Name %>"></asp:Label></th>
                                                    <th>
                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Application,Mobile %>"></asp:Label></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:CheckBox ID="chkrow" runat="server" /></td>
                                            <td><%#Eval("NameEng") %>
                                                <asp:HiddenField ID="hdnStMobile" Value='<%#Eval("Mobile") %>' runat="server" />
                                                <asp:HiddenField ID="hdnUserName" Value='<%#Eval("UserName") %>' runat="server" />
                                                <asp:HiddenField ID="hdnName" Value='<%#Eval("NameEng") %>' runat="server" />
                                            </td>
                                            <td><%#Eval("Mobile") %></td>
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
                    <div class="panel-footer">
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ClientIDMode="Static" ID="pnlTeacher" runat="server">
                <div class='<%= Common.SessionInfo.Panel %>'>
                    <div class="panel-heading">
                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Application,TeacherList %>"></asp:Label>
                    </div>
                    <div class="panel-body">
                        <div class="box">
                            <div class="box-body">
                                <asp:Repeater ID="rptTeacher" runat="server">
                                    <HeaderTemplate>
                                        <table id="example2" class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        <asp:CheckBox ID="chkHeader" runat="server" /></th>
                                                    <th>
                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Application,TeacherPINNo %>"></asp:Label></th>
                                                    <th>
                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:Application,Name %>"></asp:Label></th>
                                                    <th>
                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Application,Mobile %>"></asp:Label></th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:CheckBox ID="chkrow" runat="server" /></td>
                                            <td><%#Eval("TeacherPin") %></td>
                                            <td><%#Eval("NameEng") %>
                                                
                                            </td>
                                            <td><%#Eval("Mobile") %></td>
                                            <asp:HiddenField ID="hdnMobile" Value='<%#Eval("Mobile") %>' runat="server" />
                                            <asp:HiddenField ID="hdnUserName" Value='<%#Eval("UserName") %>' runat="server" />
                                            <asp:HiddenField ID="hdnName" Value='<%#Eval("NameEng") %>' runat="server" />
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
                    <div class="panel-footer">
                    </div>
                </div>
            </asp:Panel>
        </div>
        <div class="col-sm-6">
            <div class='<%= Common.SessionInfo.Panel %>' id="templete">
                <div class="panel-heading">
                    Message
                </div>
                <div class="panel-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-sm-12">
                                <asp:TextBox ID="tbxBody" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12 text-right">
                                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" Text="Send" ValidationGroup="save" />
                                 <asp:Button ID="btnResetPassword" runat="server" CssClass="btn btn-primary" OnClick="btnResetPassword_Click" Text="Reset Password(SMS)" ValidationGroup="save" />
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <script src="../../Scripts/jquery-2.1.3.min.js"></script>
    <script src="../../Scripts/dataTables.bootstrap.min.js"></script>
    <script src="../../Scripts/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#example1 [id*=chkHeader]").click(function () {
                if ($(this).is(":checked")) {
                    $("#example1 [id*=chkrow]").prop("checked", true);
                } else {
                    $("#example1 [id*=chkrow]").prop("checked", false);
                }
            });

            $("#example1 [id*=chkrow]").click(function () {
                if ($("#example1 [id*=chkrow]").length == $("#example1 [id*=chkrow]:checked").length) {
                    $("#example1 [id*=chkHeader]").prop("checked", true);
                } else {
                    $("#example1 [id*=chkHeader]").prop("checked", false);
                }
            });

            $("#example2 [id*=chkHeader]").click(function () {
                if ($(this).is(":checked")) {
                    $("#example2 [id*=chkrow]").prop("checked", true);
                } else {
                    $("#example2 [id*=chkrow]").prop("checked", false);
                }
            });

            $("#example2 [id*=chkrow]").click(function () {
                if ($("#example2 [id*=chkrow]").length == $("#example2 [id*=chkrow]:checked").length) {
                    $("#example2 [id*=chkHeader]").prop("checked", true);
                } else {
                    $("#example2 [id*=chkHeader]").prop("checked", false);
                }
            });

            $("#example1").DataTable({
                "paging": false,
                "lengthChange": false,
                "searching": true,
                "ordering": true,
                "info": false,
                "autoWidth": true
            });
            $("#pnlTeacher").hide();
            $("#rdList").change(function () {
                var checked_radio = $("[id*=rdList] input:checked");
                if (checked_radio.val() == "1") {
                    $("#criteria").slideDown();
                    $("#pnlAssignStudent").slideDown();
                    $("#templete").slideDown();
                    $("#pnlTeacher").hide();
                }
                else {
                    $("#criteria").hide();
                    $("#pnlAssignStudent").hide();
                    $("#pnlTeacher").slideDown();
                    $("#templete").slideDown();
                }
            });
            var checked_radio = $("[id*=rdList] input:checked");
            if (checked_radio.val() == "1") {
                $("#criteria").slideDown();
                $("#pnlAssignStudent").slideDown();
                $("#templete").slideDown();
                $("#pnlTeacher").hide();
            }
            else {
                $("#criteria").hide();
                $("#pnlAssignStudent").hide();
                $("#pnlTeacher").slideDown();
                $("#templete").slideDown();
            }

            $(".aa").first().closest(".treeview").addClass("active");
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
            function EndRequestHandler(sender, args) {
                $("#example1").DataTable({
                    "paging": false,
                    "lengthChange": false,
                    "searching": true,
                    "ordering": true,
                    "info": false,
                    "autoWidth": true
                });
                //$(".treeview").removeClass("active");
                $(".aa").first().closest(".treeview").addClass("active");
            }
        });
    </script>
</asp:Content>

