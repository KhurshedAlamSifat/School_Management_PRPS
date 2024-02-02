<%@ Page Title="<%$ Resources:Application,StudentAttendence %>" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="StudentAttendence.aspx.cs" Inherits="Pages_Administration_StudentAttendence" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="padding-bottom-15">
        <asp:RadioButtonList ID="rdList" runat="server" ClientIDMode="Static" RepeatColumns="2" CssClass="form-control FormatRadioButtonList">
            <asp:ListItem Value="1" Text="<%$ Resources:Application,DailyAttendence %>" Selected="True"></asp:ListItem>
            <asp:ListItem Value="2" Text="<%$ Resources:Application,ExamAttendence %>"></asp:ListItem>
        </asp:RadioButtonList>
    </div>
    <div class='<%= Common.SessionInfo.Panel %>'>
        <div class="panel-heading">
            <asp:Label ID="Label65" runat="server" Text="<%$ Resources:Application,Criteria %>"></asp:Label>
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
                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,Section %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlSection" runat="server" DataTextField="Section" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Application,Roll%>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="tbxRoll" runat="server" placeholder="Enter Roll No." CssClass="form-control"></asp:TextBox>

                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="panel-footer">
            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" CssClass="btn btn-success btn-flat" Text="<%$ Resources:Application,Search %>" />
        </div>
    </div>
    <%--<asp:UpdatePanel ID="updatePanel" runat="server">
        <ContentTemplate>--%>
    <asp:Panel ClientIDMode="Static" ID="pnlAssignStudent" runat="server">
        <div class='<%= Common.SessionInfo.Panel %>'>
            <div class="panel-heading">
                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Application,StudentList %>"></asp:Label>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-1">
                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Application,Date %>"></asp:Label></label>
                        <div class="col-sm-3">
                            <asp:TextBox ID="tbxDate" runat="server" CssClass="form-control" OnTextChanged="tbxDate_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxDate" ValidationGroup="save"
                                ErrorMessage="Please Select Date"></asp:RequiredFieldValidator>
                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy/MM/dd" PopupButtonID="tbxDate"
                                TargetControlID="tbxDate">
                            </cc1:CalendarExtender>
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div class="box-body">
                        <asp:Repeater ID="rptStudent" runat="server">
                            <HeaderTemplate>
                                <table id="example11" class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>
                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Application,Roll %>"></asp:Label></th>
                                            <th>
                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Application,Name %>"></asp:Label></th>
                                            <th>
                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label></th>
                                            <th>
                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:Application,Group %>"></asp:Label></th>
                                            <th>
                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Application,Shift %>"></asp:Label></th>
                                            <th>
                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:Application,Section %>"></asp:Label></th>
                                            <th>
                                                <asp:CheckBox ID="chkHeader" runat="server" /></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("RollNo") %>
                                        <asp:HiddenField ID="hdnStudentId" Value='<%#Eval("StudentToClassId") %>' runat="server" />
                                        <asp:HiddenField ID="hdnMobile" Value='<%#Eval("Mobile") %>' runat="server" />
                                        <asp:HiddenField ID="hdnEmail" Value='<%#Eval("Email") %>' runat="server" />
                                    </td>
                                    <td>
                                        <%#Eval("NameEng") %>
                                        <asp:HiddenField ID="hdnNameEng" Value='<%#Eval("NameEng") %>' runat="server" />
                                    </td>
                                    <td>
                                        <%#Eval("ClassName") %>
                                        <asp:HiddenField ID="hdnClassName" Value='<%#Eval("ClassName") %>' runat="server" />
                                    </td>
                                    <td>
                                        <%#Eval("GroupName") %>
                                        <asp:HiddenField ID="hdnGroupName" Value='<%#Eval("GroupName") %>' runat="server" />
                                    </td>
                                    <td>
                                        <%#Eval("Shift") %>
                                        <asp:HiddenField ID="hdnShift" Value='<%#Eval("Shift") %>' runat="server" />
                                    </td>
                                    <td>
                                        <%#Eval("Section") %>
                                        <asp:HiddenField ID="hdnSection" Value='<%#Eval("Section") %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chkrow" runat="server" />
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
            <div class="panel-footer">
                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" Text="Submit" ValidationGroup="save" />
            </div>
        </div>
    </asp:Panel>
    <%--  </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSearch" />
            <asp:AsyncPostBackTrigger ControlID="tbxDate" />
        </Triggers>
    </asp:UpdatePanel>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        $(document).ready(function () {
            $("#example11 [id*=chkHeader]").click(function () {
                if ($(this).is(":checked")) {
                    $("#example11 [id*=chkrow]").prop("checked", true);
                } else {
                    $("#example11 [id*=chkrow]").prop("checked", false);
                }
            });

            $("#example11 [id*=chkrow]").click(function () {
                if ($("#example11 [id*=chkrow]").length == $("#example11 [id*=chkrow]:checked").length) {
                    $("#example11 [id*=chkHeader]").prop("checked", true);
                } else {
                    $("#example11 [id*=chkHeader]").prop("checked", false);
                }
            });
        });
    </script>
</asp:Content>

