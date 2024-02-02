<%@ Page Title="Exam Routine" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="CreateExamRoutine.aspx.cs" Inherits="Pages_Teacher_CreateExamRoutine" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
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
                            <asp:DropDownList ID="ddlClass" runat="server" DataTextField="ClassName" DataValueField="Id" CssClass="form-control dropdown"
                                AutoPostBack="true" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Application,ExamType %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlExamType" runat="server" DataTextField="ExamType" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-6 col-md-6">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,Group %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlGroup" runat="server" DataTextField="GroupName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Application,Shift %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlShift" runat="server" DataTextField="Shift" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="panel panel-success">
        <div class="panel-body">
            <asp:UpdatePanel ID="update" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="Gridview1" runat="server" CssClass="table"
                        AutoGenerateColumns="false"
                        OnRowCreated="Gridview1_RowCreated">
                        <Columns>
                            <asp:BoundField DataField="PeriodNo" HeaderText="SL#" />
                            <asp:TemplateField HeaderText="Subject">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control" DataTextField="SubjectName" DataValueField="Id"
                                        AppendDataBoundItems="true">
                                        <asp:ListItem Value="-1">Select</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Start Time">
                                <ItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="save"
                                        ErrorMessage="Enter Join Date" ControlToValidate="TextBox1">Enter Start Time</asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="End Time">
                                <ItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Exam Date">
                                <ItemTemplate>
                                    <asp:TextBox ID="tbxDate" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="save"
                                        ErrorMessage="Enter Join Date" ControlToValidate="tbxDate">Enter Date</asp:RequiredFieldValidator>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="tbxDate" Format="dd/MM/yyyy"
                                        TargetControlID="tbxDate">
                                    </cc1:CalendarExtender>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="fa fa-2x fa-trash-o"
                                        OnClick="LinkButton1_Click"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ButtonAdd" />
                </Triggers>
            </asp:UpdatePanel>

        </div>
        <div class="panel-footer">
            <asp:Button ID="ButtonAdd" runat="server" CssClass="btn btn-flat btn-success" ValidationGroup="save"
                Text="Add New Row"
                OnClick="ButtonAdd_Click" />

            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-flat btn-primary pull-right"
                Text="Submit"
                OnClick="btnSave_Click" />
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

