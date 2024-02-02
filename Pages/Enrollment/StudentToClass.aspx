<%@ Page Title="<%$ Resources:Application,AssignStudentClass %>" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master"  EnableEventValidation="false" AutoEventWireup="true" CodeFile="StudentToClass.aspx.cs" Inherits="Pages_Enrollment_StudentToClass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="col-sm-4">
        <div class='<%= Common.SessionInfo.Panel %>'>
            <div class="panel-heading">
                <asp:Label ID="Label65" runat="server" Text="<%$ Resources:Application,Criteria %>"></asp:Label>
            </div>
            <div class="panel-body">
                <div class="col-lg-12 col-md-12">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4"><asp:Label ID="Label1" runat="server" Text="<%$ Resources:Application,Year %>"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddlYear" runat="server" DataTextField="Year" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4"><asp:Label ID="Label2" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddlClass" runat="server" DataTextField="ClassName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4"><asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,Group %>"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddlGroup" runat="server" DataTextField="GroupName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4"><asp:Label ID="Label4" runat="server" Text="<%$ Resources:Application,Shift %>"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddlShift" runat="server" DataTextField="Shift" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4"><asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,Section %>"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddlSection" runat="server" DataTextField="Section" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4"><asp:Label ID="Label6" runat="server" Text="<%$ Resources:Application,Roll %>"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="tbxRoll" runat="server" placeholder="Enter Roll No." CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-6">
                                <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" CssClass="btn btn-default" Text="<%$ Resources:Application,Search %>" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-4">
        <div class='<%= Common.SessionInfo.Panel %>'>
            <div class="panel-heading">
                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Application,AssignStudent %>"></asp:Label>
            </div>
            <div class="panel-body">
                <asp:Repeater ID="rptCurrent" runat="server">
                    <HeaderTemplate>
                        <table id="example1" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th><asp:Label ID="Label65" runat="server" Text="<%$ Resources:Application,Name %>"></asp:Label></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%#Eval("NameEng") %></td>
                            <td align="right" width="15px">
                                <asp:ImageButton ID="btnDelete" runat="server" OnCommand="btnDelete_Command" CommandArgument='<%# Eval("Id")%>' ImageUrl="~/Images/Common/minus.png" ToolTip="Remove" OnClientClick="return confirm('Are you sure?')" /></td>
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
                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Application,UnassignStudent %>"></asp:Label>
            </div>
            <div class="panel-body">
                <asp:Repeater ID="rptUnassign" runat="server">
                    <HeaderTemplate>
                        <table id="example1" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>
                                        <asp:CheckBox ID="chkHeader" runat="server" /></th>
                                    <th><asp:Label ID="Label65" runat="server" Text="<%$ Resources:Application,Name %>"></asp:Label></th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:CheckBox ID="chkrow" runat="server" /></td>
                            <td>
                                <%#Eval("NameEng") %>
                                <asp:HiddenField ID="hdnStudentId" runat="server" Value='<%#Eval("StudentId") %>'/>
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
                <asp:Button ID="btnAssign" runat="server" CssClass="btn btn-default" Text="<%$ Resources:Application,Assign %>" OnClick="btnAssign_Click"/>
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
    <script src="../../Scripts/jquery-2.1.3.min.js"></script>
    <script src="../../Scripts/dataTables.bootstrap.min.js"></script>
    <script src="../../Scripts/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
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
        });
    </script>
</asp:Content>

