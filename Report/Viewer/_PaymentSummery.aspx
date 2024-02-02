<%@ Page Title="Payment Summery" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="_PaymentSummery.aspx.cs" Inherits="Report_Viewer_PaymentSummery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
    <asp:UpdatePanel ID="upnl" runat="server">
        <ContentTemplate>
            <div class="panel panel-success">
                <div class="panel-body">
                    <div class="col-lg-6 col-md-6">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4">
                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Application,Year %>"></asp:Label><span class="required">*</span></label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="ddlYear" runat="server" DataTextField="Year" DataValueField="Year" CssClass="form-control dropdown"></asp:DropDownList>
                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator16" runat="server" ValidationGroup="classInfo"
                                        ErrorMessage="Select year" ControlToValidate="ddlYear">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4">
                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:Application,Month %>"></asp:Label><span class="required">*</span></label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="ddlMonth" runat="server" CssClass="form-control dropdown">
                                        <asp:ListItem Text="All" Value="0"></asp:ListItem>
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
                                <label for="inputEmail3" class="col-sm-4">
                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label><span class="required">*</span></label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="ddlClass" runat="server" DataTextField="ClassName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator17" runat="server" ValidationGroup="classInfo"
                                        ErrorMessage="Select class" ControlToValidate="ddlClass">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4">
                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:Application,Group %>"></asp:Label><span class="required">*</span></label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="ddlGroup" runat="server" DataTextField="GroupName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator18" runat="server" ValidationGroup="classInfo"
                                        ErrorMessage="Select group" ControlToValidate="ddlGroup">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4">
                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:Application,Gender %>"></asp:Label><span class="required">*</span></label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="ddlGender" runat="server" DataTextField="Gender" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator1" runat="server" ValidationGroup="classInfo"
                                        ErrorMessage="Select Gender" ControlToValidate="ddlGender">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4">
                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:Application,Shift %>"></asp:Label><span class="required">*</span></label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="ddlShift" runat="server" DataTextField="Shift" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator19" runat="server" ValidationGroup="classInfo"
                                        ErrorMessage="Select shift" ControlToValidate="ddlShift">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4">
                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Application,Section %>"></asp:Label><span class="required">*</span></label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="ddlSection" runat="server" DataTextField="Section" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator20" runat="server" ValidationGroup="classInfo"
                                        ErrorMessage="Select section" ControlToValidate="ddlSection">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4">
                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:Application,Religion %>"></asp:Label><span class="required">*</span></label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="ddlReligion" runat="server" DataTextField="Religion" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator2" runat="server" ValidationGroup="classInfo"
                                        ErrorMessage="Select Religion" ControlToValidate="ddlReligion">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4">
                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:Application,RegistratinNo %>"></asp:Label></label>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="tbxRegNo" runat="server" placeholder="Enter Registration No." CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-success" />
                </div>
            </div>
            <div class="panel panel-success">
                <div class="panel-body">
                    <asp:Repeater ID="rpt" runat="server">
                        <HeaderTemplate>
                            <table id="dtPaymentSummery" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>
                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label></th>
                                        <th>
                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Application,RegistratinNo %>"></asp:Label></th>

                                        <th>
                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,NameEng %>"></asp:Label></th>
                                        <th>
                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:Application,Mobile %>"></asp:Label></th>
                                        <th>
                                            <asp:Label ID="Label6" runat="server" Text="Month"></asp:Label></th>
                                        <th>
                                            <asp:Label ID="Label2" runat="server" Text="Amount"></asp:Label></th>
                                        <th>
                                            <asp:Label ID="Label5" runat="server" Text="Paid"></asp:Label></th>
                                        <th>
                                            <asp:Label ID="Label7" runat="server" Text="Due"></asp:Label></th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("ClassName") %></td>
                                <td><%#Eval("RegNo") %></td>
                                <td><%#Eval("NameEng") %></td>
                                <td><%#Eval("Mobile") %></td>
                                <td><%#System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(Convert.ToInt32(Eval("Month")))+"-"+Eval("Year") %></td>
                                <td><%#Eval("Amount") %></td>
                                <td><%#Eval("TotalGiven") %></td>
                                <td><%#Eval("DueAmount") %></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="6" style="text-align: right">Total: </th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </tfoot>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" Runat="Server">
</asp:Content>

