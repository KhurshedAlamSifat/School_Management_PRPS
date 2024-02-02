<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="Attendence.aspx.cs" Inherits="Pages_Student_Attendence" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="panel panel-success">
        <div class="panel-body">
            <div class="padding-bottom-15">
                <asp:RadioButtonList ID="rdList" runat="server" ClientIDMode="Static" RepeatColumns="2" CssClass="FormatRadioButtonList">
                    <asp:ListItem Value="1" Text="<%$ Resources:Application,DailyAttendence %>" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="2" Text="<%$ Resources:Application,ExamAttendence %>"></asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="padding-bottom-15">
                        <asp:RadioButtonList ID="rdAttendence" runat="server" ClientIDMode="Static" RepeatColumns="2" CssClass="FormatRadioButtonList">
                            <asp:ListItem Value="1" Text="Monthly"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Date"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div class="row" id="date">
                        <div class="col-sm-6">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-4">
                                        <asp:Label ID="Label4" runat="server" Text="From Date"></asp:Label></label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="tbxFromDate" runat="server" CssClass="form-control"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" PopupButtonID="tbxFromDate" SelectedDate='<%# DateTime.Now %>'
                                            TargetControlID="tbxFromDate">
                                        </cc1:CalendarExtender>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-4">
                                        <asp:Label ID="Label1" runat="server" Text="To Date"></asp:Label></label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="tbxToDate" runat="server" CssClass="form-control"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="tbxToDate" SelectedDate='<%# DateTime.Now %>'
                                            TargetControlID="tbxToDate">
                                        </cc1:CalendarExtender>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="month">
                        <div class="col-sm-12">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-2">
                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,Year %>"></asp:Label></label>
                                    <div class="col-sm-10">
                                        <asp:DropDownList ID="ddlYear" runat="server" DataTextField="Year" DataValueField="Year" CssClass="form-control dropdown"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-2">
                                        <asp:Label ID="Label2" runat="server" Text="Month"></asp:Label></label>
                                    <div class="col-sm-10">
                                        <asp:DropDownList ID="ddlMonth" runat="server" CssClass="form-control dropdown">
                                            <asp:ListItem Text="January" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="February" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="March" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="April" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="May" Value="5"></asp:ListItem>
                                            <asp:ListItem Text="June" Value="6"></asp:ListItem>
                                            <asp:ListItem Text="July" Value="7"></asp:ListItem>
                                            <asp:ListItem Text="August" Value="8"></asp:ListItem>
                                            <asp:ListItem Text="September" Value="9"></asp:ListItem>
                                            <asp:ListItem Text="October" Value="10"></asp:ListItem>
                                            <asp:ListItem Text="November" Value="11"></asp:ListItem>
                                            <asp:ListItem Text="December" Value="12"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <asp:Button ID="btnShow" runat="server" OnClick="btnShow_Click" CssClass="btn btn-flat btn-success" Text="Show Attendence" />
        </div>
    </div>
    <asp:UpdatePanel ID="updateAttendence" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-sm-12">
                    <div class="panel panel-success">
                        <div class="panel-body">
                            <asp:Repeater ID="rptStudent" runat="server">
                                <HeaderTemplate>
                                    <table id="example11" class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Application,Date %>"></asp:Label></th>
                                                <th>
                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Application,Name %>"></asp:Label></th>
                                                <th>Status
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Convert.ToDateTime(Eval("Date")).ToString("dd-MMM-yyyy") %></td>
                                        <td><%#Eval("NameEng") %>
                                            <asp:HiddenField ID="hdnStudentId" Value='<%#Eval("StudentToClassId") %>' runat="server" />
                                        </td>
                                        <td><%#Eval("IsPresent").ToString()=="True"?"Present":"Absent" %>
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
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnShow" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
    <script type="text/javascript">
        $("#month").hide();
        $("#date").hide();
        $("#rdAttendence").change(function () {
            var checked_radio = $("[id*=rdAttendence] input:checked");
            if (checked_radio.val() == "1") {
                $("#month").slideDown();
                $("#date").hide();
            }
            else {
                $("#date").slideDown();
                $("#month").hide();
            }
        });
    </script>
</asp:Content>

