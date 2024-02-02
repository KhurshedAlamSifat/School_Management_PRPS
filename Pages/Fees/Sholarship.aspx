<%@ Page Title="Sholarship" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="Sholarship.aspx.cs" Inherits="Pages_Fees_Sholarship" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <%--<link href="../../Styles/bootstrap.min.css" rel="stylesheet" />--%>
    <asp:UpdatePanel ID="updateStuedentPanel" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-sm-8">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-2">
                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,Year %>"></asp:Label></label>
                                    <div class="col-sm-10">
                                        <asp:DropDownList ID="ddlYear" runat="server" DataTextField="Year" DataValueField="Year" CssClass="form-control dropdown"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-4">
                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Application,RegNo %>"></asp:Label></label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="tbxRegNo" runat="server" CssClass="form-control" OnTextChanged="tbxRegNo_TextChanged" AutoPostBack="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-9">

                            <div class='<%= Common.SessionInfo.Panel %>'>
                                <div class="panel-heading">
                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Application,StudentInformation %>"></asp:Label>
                                </div>
                                <div class="panel-body">
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                    <asp:Panel ID="pnlStudentInfo" runat="server">
                                        <div class="row">
                                            <div class="col-sm-2">
                                                <asp:Image ID="imgPerson" runat="server" Height="80" Width="80" />
                                            </div>
                                            <div class="col-sm-10">
                                                <div class="form-horizontal">
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-4">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Application,NameEng %>"></asp:Label></label>
                                                        <div class="col-sm-8">
                                                            <asp:Label ID="lblNameEng" runat="server"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-4">
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Application,NameBan %>"></asp:Label></label>
                                                        <div class="col-sm-8">
                                                            <asp:Label ID="lblNameBan" runat="server"></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="padding-top: 10px;">
                                            <div class="col-sm-5">
                                                <div class="form-horizontal">
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-4">
                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label>:</label>
                                                        <div class="col-sm-8">
                                                            <asp:Label ID="lblClass" runat="server"></asp:Label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-4">
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:Application,Group %>"></asp:Label>:</label>
                                                        <div class="col-sm-8">
                                                            <asp:Label ID="lblGroup" runat="server"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-4">
                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Application,Shift %>"></asp:Label>:</label>
                                                        <div class="col-sm-8">
                                                            <asp:Label ID="lblShift" runat="server"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-4">
                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:Application,Section %>"></asp:Label>:</label>
                                                        <div class="col-sm-8">
                                                            <asp:Label ID="lblSection" runat="server"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-4">
                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:Application,Roll %>"></asp:Label>:</label>
                                                        <div class="col-sm-8">
                                                            <asp:Label ID="lblRoll" runat="server"></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-7">
                                                <div class="form-horizontal">
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-5">
                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:Application,FatherName %>"></asp:Label></label>
                                                        <div class="col-sm-7">
                                                            <asp:Label ID="lblFName" runat="server"></asp:Label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-5">
                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:Application,MotherName %>"></asp:Label></label>
                                                        <div class="col-sm-7">
                                                            <asp:Label ID="lblMName" runat="server"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-5">
                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:Application,Address %>"></asp:Label>:</label>
                                                        <div class="col-sm-7">
                                                            <asp:Label ID="lblPresent" runat="server"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-5">
                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:Application,Mobile %>"></asp:Label>:</label>
                                                        <div class="col-sm-7">
                                                            <asp:Label ID="Label1" runat="server"></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class='<%= Common.SessionInfo.Panel %>'>
                                <div class="panel-heading">
                                    <asp:Label ID="Label25" runat="server" Text="Month"></asp:Label>
                                </div>
                                <div class="panel-body">
                                    <asp:CheckBoxList ID="chkMonth" runat="server">
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
                                    </asp:CheckBoxList>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 form">
                    <div class='<%= Common.SessionInfo.Panel %>'>
                        <div class="panel-heading" id="hideheading">
                            <asp:Label ID="Label7" runat="server" Text="Scholarship info"></asp:Label>
                        </div>
                        <div class="panel-body">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-md-10">Amount</label>
                                    <div class="col-md-12">
                                        <asp:TextBox ID="tbxAmount" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-10">Remarks</label>
                                    <div class="col-md-12">
                                        <asp:TextBox ID="tbxRemarks" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-footer">
                            <div class="row" style="padding-top: 5px;">
                                <div class="col-sm-6">
                                    <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-block btn-flat btn-primary" OnClick="btnSave_Click" />
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class='<%= Common.SessionInfo.Panel %>'>
                        <div class="panel-heading">
                            <asp:Label ID="Label19" runat="server" Text="Scholarship Details"></asp:Label>
                        </div>
                        <div class="panel-body">
                            <asp:Repeater ID="rptHistory" runat="server">
                                <HeaderTemplate>
                                    <table id="example1" class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th class="text-center">Year</th>
                                                <th class="text-center">Month</th>
                                                <th class="text-center">Amount</th>
                                                <th class="text-center">Remarks</th>
                                                <th class="text-center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("Years") %></td>
                                        <td><%#Eval("month") %></td>
                                        <td><%#Eval("Amount") %></td>
                                        <td><%#Eval("Remarks") %></td>
                                        <td>
                                            <asp:ImageButton ID="btnDelete" runat="server" OnCommand="btnDelete_Command" CommandArgument='<%# Eval("Id")%>' ImageUrl="~/Images/Common/delete.png" ToolTip="Delete" OnClientClick="return confirm('Are you sure?')" /></td>
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
            <asp:AsyncPostBackTrigger ControlID="chkMonth" />
            <asp:AsyncPostBackTrigger ControlID="tbxRegNo" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

