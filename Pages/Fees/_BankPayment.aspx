<%@ Page Title="Bank Payment" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="_BankPayment.aspx.cs" Inherits="Pages_Fees_BankPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel ID="updateStuedentPanel" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-sm-8">
                    <div class="row">
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
                        <div class="col-sm-12">

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
                        <div class="col-sm-12">
                            <div class='<%= Common.SessionInfo.Panel %>'>
                                <div class="panel-heading">
                                    <asp:Label ID="Label2" runat="server" Text="Dues"></asp:Label>
                                </div>
                                <div class="panel-body">
                                    <asp:Repeater ID="rptDues" runat="server">
                                        <HeaderTemplate>
                                            <table class="table table-bordered table-hover">
                                                <thead>
                                                    <tr>
                                                        <th class="text-center">Fee Type</th>
                                                        <th class="text-center">Payment Month</th>
                                                        <th class="text-center">Amount</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td><%#Eval("PaymentType") %></td>
                                                <td><%# System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(Convert.ToInt32(Eval("Month")))+"-"+Eval("Year") %></td>
                                                <td><%#Eval("Amount") %></td>
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
                </div>
                <div class="col-sm-4 form">
                    <div class='<%= Common.SessionInfo.Panel %>'>
                        <div class="panel-heading" id="hideheading">
                            <asp:Label ID="Label7" runat="server" Text="Scholarship info"></asp:Label>
                        </div>
                        <div class="panel-body">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-md-10">Year</label>
                                    <div class="col-md-12">
                                        <asp:DropDownList ID="ddlYear" runat="server" DataTextField="Year" DataValueField="Year" CssClass="form-control dropdown"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-10">Month</label>
                                    <div class="col-md-12">
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
                                <div class="form-group">
                                    <label class="col-md-10">Paid</label>
                                    <div class="col-md-12">
                                        <asp:TextBox ID="tbxPaid" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-10">TxnID</label>
                                    <div class="col-md-12">
                                        <asp:TextBox ID="tbxTxnId" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-10">Mobile</label>
                                    <div class="col-md-12">
                                        <asp:TextBox ID="tbxMobile" runat="server" CssClass="form-control"></asp:TextBox>
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
                            <asp:Label ID="Label19" runat="server" Text="Payment Details"></asp:Label>
                        </div>
                        <div class="panel-body">
                            <label>Total : </label>
                            <asp:Label ID="lblTotal" runat="server"></asp:Label>
                            <asp:Repeater ID="rptHistory" runat="server">
                                <HeaderTemplate>
                                    <table id="example1" class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th class="text-center">PaymentType</th>
                                                <th class="text-center">Month</th>
                                                <th class="text-center">Amount</th>
                                                <th class="text-center">Paid</th>
                                                <th class="text-center">Due</th>
                                                <th class="text-center">TransactionId</th>
                                                <th class="text-center">RefMobile</th>
                                                <%--<th class="text-center">Action</th>--%>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("PaymentType") %></td>
                                        <td><%# System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(Convert.ToInt32(Eval("Month")))+"-"+Eval("Year") %></td>
                                        <td><%#Eval("Amount") %></td>
                                        <td><%#Eval("TotalGiven") %></td>
                                        <td><%#Eval("DueAmount") %></td>
                                        <td><%#Eval("TxnID") %></td>
                                        <td><%#Eval("PayerMobile") %></td>
                                        <%--<td>
                                            <asp:ImageButton ID="btnEdit" runat="server" OnCommand="btnEdit_Command" CommandArgument='<%# Eval("Id")%>' ImageUrl="~/Images/Common/edit.png" ToolTip="Edit" />
                                            <asp:ImageButton ID="btnDelete" runat="server" OnCommand="btnDelete_Command" CommandArgument='<%# Eval("Id")%>' ImageUrl="~/Images/Common/delete.png" ToolTip="Delete" OnClientClick="return confirm('Are you sure?')" />
                                        </td>--%>
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
            <asp:AsyncPostBackTrigger ControlID="tbxRegNo" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" Runat="Server">
</asp:Content>

