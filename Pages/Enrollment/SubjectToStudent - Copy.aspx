<%@ Page Title="Subject to Student" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="SubjectToStudent - Copy.aspx.cs" Inherits="Pages_Enrollment_SubjectToStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <link href="../../Styles/bootstrap.min.css" rel="stylesheet" />
    <script>
        Sys.Application.add_load(Load);
    </script>
    <div class="col-sm-4">
        <div class='<%= Common.SessionInfo.Panel %>'>
            <div class="panel-heading">
                Criteria
            </div>
            <div class="panel-body">
                <div class="col-lg-12 col-md-12">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">Year<span class="required">*</span></label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddlYear" runat="server" DataTextField="Year" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">Class<span class="required">*</span></label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddlClass" runat="server" DataTextField="ClassName" DataValueField="Id" CssClass="form-control dropdown"
                                    OnSelectedIndexChanged="ddlClass_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">Group<span class="required">*</span></label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddlGroup" runat="server" DataTextField="GroupName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">Shift<span class="required">*</span></label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddlShift" runat="server" DataTextField="Shift" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">Section<span class="required">*</span></label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddlSection" runat="server" DataTextField="Section" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">Roll No.<span class="required">*</span></label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="tbxRoll" runat="server" placeholder="Enter Roll No." CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-6">
                                <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" CssClass="btn btn-default" Text="Search" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:UpdatePanel ID="update" runat="server">
        <ContentTemplate>
            <div class="col-sm-4">
                <div class='<%= Common.SessionInfo.Panel %>'>
                    <div class="panel-heading">
                        Student List
                    </div>
                    <div class="panel-body">
                        <asp:Repeater ID="rptStudent" runat="server">
                            <HeaderTemplate>
                                <table id="example1" class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>
                                             <asp:CheckBox ID="chkstudentHeader" runat="server" /></th>
                                            <th>Name</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                     <asp:CheckBox ID="chkStudentRow" runat="server" /></td>
                                    <td>
                                        <%#Eval("NameEng") %>
                                        <asp:HiddenField ID="hdnStudentToClassId" Value='<%#Eval("StudentToClassId") %>' runat="server"/>
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
            <div class="col-sm-4">
                <div class='<%= Common.SessionInfo.Panel %>'>
                    <div class="panel-heading">
                        Subject 
                    </div>
                    <div class="panel-body">
                        <asp:Repeater ID="rptSubject" runat="server">
                            <HeaderTemplate>
                                <table id="example1" class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>
                                                <asp:CheckBox ID="chkSubjectHeader" runat="server" /></th>
                                            <th>Subject</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="chkSubjectRow" runat="server" /></td>
                                    <td>
                                        <%#Eval("SubjectName") %>
                                        <asp:HiddenField ID="hdnSubjectToClassId" runat="server" Value='<%#Eval("Id") %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="panel-footer">
                        <asp:Button ID="btnAssign" runat="server" CssClass="btn btn-default" Text="Assign" OnClick="btnAssign_Click" />
                    </div>
                </div>

                <asp:GridView ID="gv" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <%#Eval("NameEng") %>
                                <asp:HiddenField ID="hdnValue" runat="server" Value='<%#Eval("StudentId") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlClass"/>
            <asp:AsyncPostBackTrigger ControlID="btnAssign" />
        </Triggers>
    </asp:UpdatePanel>
    <script src="../../Scripts/jquery-2.1.3.min.js"></script>
    <script src="../../Scripts/dataTables.bootstrap.min.js"></script>
    <script src="../../Scripts/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
        function Load()
        {
            $("#example1 [id*=chkstudentHeader]").click(function () {
                if ($(this).is(":checked")) {
                    $("#example1 [id*=chkStudentRow]").prop("checked", true);
                } else {
                    $("#example1 [id*=chkStudentRow]").prop("checked", false);
                }
            });

            $("#example1 [id*=chkStudentRow]").click(function () {
                if ($("#example1 [id*=chkStudentRow]").length == $("#example1 [id*=chkStudentRow]:checked").length) {
                    $("#example1 [id*=chkstudentHeader]").prop("checked", true);
                } else {
                    $("#example1 [id*=chkstudentHeader]").prop("checked", false);
                }
            });
            /*******************************************************************************/

            $("#example1 [id*=chkSubjectHeader]").click(function () {
                if ($(this).is(":checked")) {
                    $("#example1 [id*=chkSubjectRow]").prop("checked", true);
                } else {
                    $("#example1 [id*=chkSubjectRow]").prop("checked", false);
                }
            });

            $("#example1 [id*=chkSubjectRow]").click(function () {
                if ($("#example1 [id*=chkSubjectRow]").length == $("#example1 [id*=chkSubjectRow]:checked").length) {
                    $("#example1 [id*=chkSubjectHeader]").prop("checked", true);
                } else {
                    $("#example1 [id*=chkSubjectHeader]").prop("checked", false);
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

