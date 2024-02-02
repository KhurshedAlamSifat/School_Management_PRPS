<%@ Page Title="<%$ Resources:Application,MarksEdit %>" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="MarksEdit.aspx.cs" Inherits="Pages_Result_MarksEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <script>
        Sys.Application.add_load(Load);
    </script>
    <div class="panel panel-success">
        <div class="panel-heading">
            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:Application,Criteria %>"></asp:Label>
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
                            <asp:DropDownList ID="ddlClass" runat="server" DataTextField="ClassName" DataValueField="Id" CssClass="form-control dropdown"
                                OnSelectedIndexChanged="ddlClass_SelectedIndexChanged" AutoPostBack="true">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,Group %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlGroup" runat="server" DataTextField="GroupName" DataValueField="Id" CssClass="form-control dropdown"
                                OnSelectedIndexChanged="ddlGroup_SelectedIndexChanged" AutoPostBack="true">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Application,ExamType %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlExamType" runat="server" DataTextField="ExamType" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,MarksOutof %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="tbxMarksOutOf" Text="100" runat="server" placeholder="Enter Out of Marks" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                </div>
            </div>

            <div class="col-lg-6 col-md-6">
                <div class="form-horizontal">

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Application,Shift %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlShift" runat="server" DataTextField="Shift" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Application,Section %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlSection" runat="server" DataTextField="Section" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Application,RollNo %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="tbxRoll" runat="server" placeholder="Enter Roll No." CssClass="form-control"></asp:TextBox>

                        </div>
                    </div>
                    <asp:UpdatePanel ID="updSubject" runat="server">
                        <ContentTemplate>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4">
                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Application,Subject %>"></asp:Label></label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="ddlSubject" runat="server" DataTextField="SubjectName" DataValueField="Id" CssClass="form-control dropdown"
                                        OnSelectedIndexChanged="ddlSubject_SelectedIndexChanged" AutoPostBack="true">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlClass" />
                            <asp:AsyncPostBackTrigger ControlID="ddlGroup" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label19" runat="server" Text="CT Out of"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="tbxCTOutOf" Text="10" runat="server" placeholder="Enter CT Out of Marks" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="panel panel-footer">
            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" CssClass="btn btn-success" Text="<%$ Resources:Application,Search %>" />
            <asp:Button ID="btnSaveTop" runat="server" CssClass="btn btn-primary" OnClick="btnSubmit_Click" Text="<%$ Resources:Application,Submit %>" />
        </div>
    </div>
    <asp:UpdatePanel ID="updatelist" runat="server">
        <ContentTemplate>
            <asp:Panel ClientIDMode="Static" ID="pnlAssignStudent" runat="server">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:Application,StudentList %>"></asp:Label>
                    </div>
                    <div class="panel-body">
                        <asp:Repeater ID="rptStudent" runat="server">
                            <HeaderTemplate>
                                <table id="example12" class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>
                                                <asp:CheckBox ID="chkHeader" runat="server" /></th>
                                            <th>
                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Application,RollNo %>"></asp:Label></th>
                                            <th>
                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:Application,Name %>"></asp:Label></th>
                                            <th>
                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:Application,SubjectiveMarks %>"></asp:Label></th>
                                            <th>
                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Application,ObjectiveMarks %>"></asp:Label></th>
                                            <th>
                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:Application,PracticalMarks %>"></asp:Label></th>
                                            <th>
                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:Application,SBSMarks %>"></asp:Label></th>
                                            <th>
                                                <asp:Label ID="Label16" runat="server" Text="CT1"></asp:Label></th>
                                            <th>
                                                <asp:Label ID="Label17" runat="server" Text="CT2"></asp:Label></th>
                                            <th>
                                                <asp:Label ID="Label18" runat="server" Text="CT3"></asp:Label></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="chkrow" runat="server" /></td>
                                    <td><%#Eval("RollNo") %></td>
                                    <td>
                                        <%#Eval("NameEng") %>
                                        <asp:HiddenField ID="hdnStudentId" Value='<%#Eval("StudentToClassId") %>' runat="server" />
                                        <asp:HiddenField ID="hdnObtainMarksEntry" Value='<%#Eval("Id") %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbxTheory" runat="server" CssClass="form-control" Text='<%#Eval("SubjectiveMarks") %>'></asp:TextBox>
                                        <asp:RegularExpressionValidator runat="server" ID="validateMarks" ControlToValidate="tbxTheory" ValidationExpression="^([0-9]{1,2}){1}(\.[0-9]{1,2})?$|^100.00$"
                                            ErrorMessage="Please enter valid number!" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbxObjective" runat="server" CssClass="form-control" Text='<%#Eval("ObjectiveMarks") %>'></asp:TextBox>
                                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="tbxObjective" ValidationExpression="^([0-9]{1,2}){1}(\.[0-9]{1,2})?$|^100.00$"
                                            ErrorMessage="Please enter valid number!" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbxPractical" runat="server" CssClass="form-control" Text='<%#Eval("PracticalMarks") %>'></asp:TextBox>
                                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator2" ControlToValidate="tbxPractical" ValidationExpression="^([0-9]{1,2}){1}(\.[0-9]{1,2})?$|^100.00$"
                                            ErrorMessage="Please enter valid number!" />

                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbxSBS" runat="server" CssClass="form-control" Text='<%#Eval("OtherMarks") %>'></asp:TextBox>
                                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ControlToValidate="tbxSBS" ValidationExpression="^([0-9]{1,2}){1}(\.[0-9]{1,2})?$|^100.00$"
                                            ErrorMessage="Please enter valid number!" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbxCT1" runat="server" Text='<%#Eval("CT1") %>' CssClass="form-control"></asp:TextBox>
                                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator4" ControlToValidate="tbxCT1" ValidationExpression="^([0-9]{1,2}){1}(\.[0-9]{1,2})?$|^100.00$" ValidationGroup="submit"
                                            ErrorMessage="Please enter valid number!" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbxCT2" runat="server" Text='<%#Eval("CT2") %>' CssClass="form-control"></asp:TextBox>
                                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator5" ControlToValidate="tbxCT2" ValidationExpression="^([0-9]{1,2}){1}(\.[0-9]{1,2})?$|^100.00$" ValidationGroup="submit"
                                            ErrorMessage="Please enter valid number!" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbxCT3" runat="server" Text='<%#Eval("CT3") %>' CssClass="form-control"></asp:TextBox>
                                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator6" ControlToValidate="tbxCT3" ValidationExpression="^([0-9]{1,2}){1}(\.[0-9]{1,2})?$|^100.00$" ValidationGroup="submit"
                                            ErrorMessage="Please enter valid number!" />
                                    </td>

                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="panel panel-footer">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" OnClick="btnSubmit_Click" Text="<%$ Resources:Application,Submit %>" />
                    </div>

                </div>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlSubject" />
            <asp:AsyncPostBackTrigger ControlID="btnSubmit" />
            <asp:AsyncPostBackTrigger ControlID="btnSearch" />
        </Triggers>
    </asp:UpdatePanel>

    <script src="../../Scripts/jquery-2.1.3.min.js"></script>
<%--    <script src="../../Scripts/dataTables.bootstrap.min.js"></script>
    <script src="../../Scripts/jquery.dataTables.min.js"></script>--%>
    <script>

        function Load() {
            $("#example12 [id*=chkHeader]").click(function () {
                if ($(this).is(":checked")) {
                    $("#example12 [id*=chkrow]").prop("checked", true);
                } else {
                    $("#example12 [id*=chkrow]").prop("checked", false);
                }
            });

            $("#example12 [id*=chkrow]").click(function () {
                if ($("#example12 [id*=chkrow]").length == $("#example12 [id*=chkrow]:checked").length) {
                    $("#example12 [id*=chkHeader]").prop("checked", true);
                } else {
                    $("#example12 [id*=chkHeader]").prop("checked", false);
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

