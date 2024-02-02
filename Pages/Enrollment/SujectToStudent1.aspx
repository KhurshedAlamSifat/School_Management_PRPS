<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="SujectToStudent1.aspx.cs" Inherits="Pages_Enrollment_SujectToStudent1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css/prettify.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
   
    <script>
        Sys.Application.add_load(Load);
    </script>
    <div class="row">
	<div class="col-md-3">
        <asp:ListBox ID="multi_d" runat="server" ClientIDMode="Static" CssClass="form-control" SelectionMode="Multiple">
            <asp:ListItem>Fuck</asp:ListItem>
            <asp:ListItem>You</asp:ListItem>
        </asp:ListBox>
	</div>
    
	<div class="col-sm-1">
		<button type="button" id="multi_d_rightAll" class="btn btn-success btn-block" ><i class="fa fa-angle-double-right"></i></button>
		<button type="button" id="multi_d_rightSelected" class="btn btn-success btn-block"><i class="fa fa-angle-right"></i></button>
		<button type="button" id="multi_d_leftSelected" class="btn btn-success btn-block"><i class="fa fa-angle-left"></i></button>
		<button type="button" id="multi_d_leftAll" class="btn btn-success btn-block"><i class="fa fa-angle-double-left"></i></button>
        
		<hr/>
        
		<button style="display:none" type="button" id="multi_d_rightAll_2" class="btn btn-success btn-block"><i class="fa fa-hand-o-right"></i></button>
		<button type="button" id="multi_d_rightSelected_2" class="btn btn-success btn-block"><i class="fa fa-angle-right"></i></button>
		<button type="button" id="multi_d_leftSelected_2" class="btn btn-success btn-block"><i class="fa fa-angle-left"></i></button>
		<button style="display:none" type="button" id="multi_d_leftAll_2" class="btn btn-success btn-block"><i class="glyphicon glyphicon-backward"></i></button>
	</div>
    
	<div class="col-md-3">
		
        <asp:ListBox runat="server" ID="multi_d_to" ClientIDMode="Static" CssClass="form-control" SelectionMode="Multiple"></asp:ListBox>
        <b>Compulsory</b>
		
        <asp:ListBox runat="server" ID="multi_d_to_2" ClientIDMode="Static" CssClass="form-control" SelectionMode="Multiple"></asp:ListBox>
        <b>Optional</b>
	</div>
</div>
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
    <script src="../../Scripts/prettify.min.js"></script>
    <script src="../../Scripts/multiselect.min.js"></script>

    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $('#multi_d').multiselect({
                right: '#multi_d_to, #multi_d_to_2',
                rightSelected: '#multi_d_rightSelected, #multi_d_rightSelected_2',
                leftSelected: '#multi_d_leftSelected, #multi_d_leftSelected_2',
                rightAll: '#multi_d_rightAll, #multi_d_rightAll_2',
                leftAll: '#multi_d_leftAll, #multi_d_leftAll_2',

                moveToRight: function (Multiselect, options, event, silent, skipStack) {
                    var button = $(event.currentTarget).attr('id');

                    if (button == 'multi_d_rightSelected') {
                        var left_options = Multiselect.left.find('option:selected');
                        Multiselect.right.eq(0).append(left_options);

                        if (typeof Multiselect.callbacks.sort == 'function' && !silent) {
                            Multiselect.right.eq(0).find('option').sort(Multiselect.callbacks.sort).appendTo(Multiselect.right.eq(0));
                        }
                    } else if (button == 'multi_d_rightAll') {
                        var left_options = Multiselect.left.find('option');
                        Multiselect.right.eq(0).append(left_options);

                        if (typeof Multiselect.callbacks.sort == 'function' && !silent) {
                            Multiselect.right.eq(0).find('option').sort(Multiselect.callbacks.sort).appendTo(Multiselect.right.eq(0));
                        }
                    } else if (button == 'multi_d_rightSelected_2') {
                        var left_options = Multiselect.left.find('option:selected');
                        Multiselect.right.eq(1).append(left_options);

                        if (typeof Multiselect.callbacks.sort == 'function' && !silent) {
                            Multiselect.right.eq(1).find('option').sort(Multiselect.callbacks.sort).appendTo(Multiselect.right.eq(1));
                        }
                    } else if (button == 'multi_d_rightAll_2') {
                        var left_options = Multiselect.left.find('option');
                        Multiselect.right.eq(1).append(left_options);

                        if (typeof Multiselect.callbacks.sort == 'function' && !silent) {
                            Multiselect.right.eq(1).eq(1).find('option').sort(Multiselect.callbacks.sort).appendTo(Multiselect.right.eq(1));
                        }
                    }
                },

                moveToLeft: function (Multiselect, options, event, silent, skipStack) {
                    var button = $(event.currentTarget).attr('id');

                    if (button == 'multi_d_leftSelected') {
                        var right_options = Multiselect.right.eq(0).find('option:selected');
                        Multiselect.left.append(right_options);

                        if (typeof Multiselect.callbacks.sort == 'function' && !silent) {
                            Multiselect.left.find('option').sort(Multiselect.callbacks.sort).appendTo(Multiselect.left);
                        }
                    } else if (button == 'multi_d_leftAll') {
                        var right_options = Multiselect.right.eq(0).find('option');
                        Multiselect.left.append(right_options);

                        if (typeof Multiselect.callbacks.sort == 'function' && !silent) {
                            Multiselect.left.find('option').sort(Multiselect.callbacks.sort).appendTo(Multiselect.left);
                        }
                    } else if (button == 'multi_d_leftSelected_2') {
                        var right_options = Multiselect.right.eq(1).find('option:selected');
                        Multiselect.left.append(right_options);

                        if (typeof Multiselect.callbacks.sort == 'function' && !silent) {
                            Multiselect.left.find('option').sort(Multiselect.callbacks.sort).appendTo(Multiselect.left);
                        }
                    } else if (button == 'multi_d_leftAll_2') {
                        var right_options = Multiselect.right.eq(1).find('option');
                        Multiselect.left.append(right_options);

                        if (typeof Multiselect.callbacks.sort == 'function' && !silent) {
                            Multiselect.left.find('option').sort(Multiselect.callbacks.sort).appendTo(Multiselect.left);
                        }
                    }
                }
            });
        });
        function Load() {
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

