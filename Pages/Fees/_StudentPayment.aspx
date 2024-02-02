<%@ Page Title="<%$ Resources:Application,StudentPayment %>" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="_StudentPayment.aspx.cs" Inherits="Pages_Fees_StudentPayment" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControl/SchoolHeader.ascx" TagPrefix="uc" TagName="SchoolHeader" %>

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
                                    <label for="inputEmail3" class="col-sm-2">
                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label></label>
                                    <div class="col-sm-10">
                                        <asp:DropDownList ID="ddlClass" runat="server" DataTextField="ClassName" DataValueField="Id" CssClass="form-control dropdown" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-2">
                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:Application,Group %>"></asp:Label></label>
                                    <div class="col-sm-10">
                                        <asp:DropDownList ID="ddlGroup" runat="server" DataTextField="GroupName" DataValueField="Id" CssClass="form-control dropdown" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
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
                                    <asp:CheckBoxList ID="chkMonth" runat="server" OnSelectedIndexChanged="chkMonth_SelectedIndexChanged" AutoPostBack="true">
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
                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Application,StudentPayment %>"></asp:Label>
                        </div>
                        <div class="panel-body">
                            <div id="dvContents" class="mainbody">
                                <asp:Panel ID="pnlPdf" runat="server">
                                    <div id="info">
                                        <uc:SchoolHeader runat="server" ID="SchoolHeader" />
                                        <table width="100%" cellspacing="10" cellpadding="10">
                                            <tr height="10px">
                                                <td>
                                                    <asp:Label ID="Label35" runat="server" Text="<%$ Resources:Application,NameEng %>"></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="printName" runat="server"></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:Application,RegNo %>"></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="printReg" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr class="pt-10">
                                                <td>
                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="PrintClass" runat="server"></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:Application,Group %>"></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="printGroup" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr class="pt-10">
                                                <td>
                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:Application,Shift %>"></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="printShift" runat="server"></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:Application,Section %>"></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="printSection" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="row">
                                        <div class="row monthly-payment">
                                            <div class="col-sm-12">
                                                <asp:Repeater ID="rptPaymentByClass" runat="server">
                                                    <HeaderTemplate>
                                                        <table id="example11" class="table table-bordered table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th class="text-center">Payment Type</th>
                                                                    <th class="text-center">Amount</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td><%#Eval("PaymentType") %></td>
                                                            <td class="text-right"><%#Eval("Amount") %></td>
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
                                    <div class="row">
                                        <div class="col-sm-4">
                                            Previous Due
                                        </div>
                                        <div class="col-sm-2 text-right">
                                            <asp:Label ID="lblPreviousDue" runat="server" ClientIDMode="Static" Text="0.00"></asp:Label>
                                        </div>
                                        <div class="col-sm-2">
                                            Total
                                        </div>
                                        <div class="col-sm-4 text-right">
                                            <asp:Label ID="lblTotal" runat="server" ClientIDMode="Static" Text="0.00"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row pt-10">
                                        <div class="col-sm-4">
                                            <a data-toggle="modal" href="#" data-target="#latefee">Late Fee</a>
                                        </div>
                                        <div class="col-sm-2 text-right">
                                            <asp:Label ID="lblFine" runat="server" Text="0.00" ClientIDMode="Static"></asp:Label>
                                        </div>
                                        <div class="col-sm-3">
                                            <a title="Add new" data-toggle="modal" href="#" data-target="#scholar">Scholar</a>
                                        </div>
                                        <div class="col-sm-3 text-right">
                                            <asp:Label ID="lblScholar" runat="server" Text="0.00" ClientIDMode="Static"></asp:Label>
                                        </div>
                                    </div>
                                    <div>
                                        <hr />
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            Grand Total
                                        </div>
                                        <div class="col-sm-6 text-right">
                                            <asp:Label ID="lblGrandTotal" runat="server" Text="0.00" ClientIDMode="Static"></asp:Label>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                        <div id="editor"></div>
                        <div class="panel panel-footer" id="btnhide">
                            <div class="row">
                                <div class="col-sm-6">
                                    <asp:Button ID="btnPdf" OnClick="btnPdf_Click" ClientIDMode="Static" runat="server" Text="Generate PDF" class="btn btn-block btn-flat btn-info" />
                                    <%-- <div class="btn btn-block btn-flat btn-info" id="btnGeneratePDF">Generate PDF</div>--%>
                                </div>
                                <div class="col-sm-6">
                                    <button type="button" class="btn btn-block btn-flat btn-success" data-toggle="modal" data-target="#payment">Payment</button>

                                </div>
                            </div>
                            <div class="row" style="padding-top: 5px;">
                                <div class="col-sm-6">
                                    <asp:Button ID="btnPrintBill" ClientIDMode="Static" runat="server" Text="Print Bill" class="btn btn-block btn-flat btn-warning" />
                                </div>
                                <div class="col-sm-6">
                                    <asp:Button ID="Button4" runat="server" Text="Cancel" class="btn btn-block btn-flat btn-danger" OnClick="btnSubmit_Click" />
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
                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:Application,StudentPaymentHistory %>"></asp:Label>
                        </div>
                        <div class="panel-body">
                            <asp:Repeater ID="rptHistory" runat="server">
                                <HeaderTemplate>
                                    <table id="example1" class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th class="text-center">Year</th>
                                                <th class="text-center">Month</th>
                                                <th class="text-center">Date</th>
                                                <th class="text-center">Name</th>
                                                <th class="text-center">Total Amount</th>
                                                <th class="text-center">Total Given</th>
                                                <th class="text-center">Total Due</th>
                                                <th class="text-center">Receive By</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("Year") %></td>
                                        <td><%#Eval("Month") %></td>
                                        <td><%#Eval("Date") %></td>
                                        <td><%#Eval("Amount") %></td>
                                        <td><%#Eval("Amount") %></td>
                                        <td><%#Eval("TotalGiven") %></td>
                                        <td><%#Eval("DueAmount") %></td>
                                        <td><%#Eval("CreatedBy") %></td>
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

            <div class="row">
                <div id="payment" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header bg-info">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Payment</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-sm-9">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <label>Previous Due</label>
                                            </div>
                                            <div class="col-sm-2 text-right">
                                                <asp:Label ID="popPreviousDue" runat="server" ClientIDMode="Static" Text="0.00"></asp:Label>
                                            </div>
                                            <div class="col-sm-2">
                                                <label>Total</label>
                                            </div>
                                            <div class="col-sm-4 text-right">
                                                <asp:Label ID="popTotal" runat="server" ClientIDMode="Static" Text="0.00"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row pt-10">
                                            <div class="col-sm-4">
                                                <label>Late Fee</label>
                                            </div>
                                            <div class="col-sm-2 text-right">
                                                <asp:Label ID="popLateFee" runat="server" Text="0.00" ClientIDMode="Static"></asp:Label>
                                            </div>
                                            <div class="col-sm-3">
                                                <label>Scholar</label>
                                            </div>
                                            <div class="col-sm-3 text-right">
                                                <asp:Label ID="popScholar" runat="server" Text="0.00" ClientIDMode="Static"></asp:Label>
                                            </div>
                                        </div>
                                        <div>
                                            <hr />
                                        </div>
                                        <div class="row height">
                                            <div class="col-sm-6">
                                                <label>Grand Total</label>
                                            </div>
                                            <div class="col-sm-6 text-right">
                                                <asp:Label ID="popGrandTotal" runat="server" Text="0.00" ClientIDMode="Static"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row height">
                                            <div class="col-sm-6">
                                                <label>Total Paying</label>
                                            </div>
                                            <div class="col-sm-6 text-right">
                                                <asp:Label ID="popPaying" runat="server" Text="0.00" ClientIDMode="Static"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="divider">
                                            <hr />
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="inputEmail3">
                                                        <asp:Label ID="Label20" runat="server" Text="Amount"></asp:Label></label>
                                                    <asp:TextBox ID="tbxAmount" runat="server" placeholder="Amount" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="inputEmail3">
                                                        <asp:Label ID="Label26" runat="server" Text="Mode of Payment"></asp:Label></label>
                                                    <asp:DropDownList ID="ddlPaymentMode" CssClass="form-control" runat="server">
                                                        <asp:ListItem Value="1" Text="Cash"></asp:ListItem>
                                                        <asp:ListItem Value="2" Text="Credit Card"></asp:ListItem>
                                                        <asp:ListItem Value="3" Text="Cheque"></asp:ListItem>
                                                    </asp:DropDownList>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <div class="col-md-10 col-sm-10 col-xs-10">
                                                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="payment" />
                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" SkinID="message"></asp:Label>
                                                    <asp:HiddenField ID="HiddenField1" runat="server" />
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="btn-group btn-group-vertical" style="width: 100%;">
                                            <button type="button" class="btn btn-info btn-block quick-cash" id="quick-payable">
                                                0.00
                                            </button>
                                            <button type="button" class="btn btn-block btn-flat btn-warning quick-cash">5</button>
                                            <button type="button" class="btn btn-block btn-flat btn-warning quick-cash">10</button>
                                            <button type="button" class="btn btn-block btn-flat btn-warning quick-cash">20</button>
                                            <button type="button" class="btn btn-block btn-flat btn-warning quick-cash">50</button>
                                            <button type="button" class="btn btn-block btn-flat btn-warning quick-cash">100</button>
                                            <button type="button" class="btn btn-block btn-flat btn-warning quick-cash">500</button>
                                            <button type="button" class="btn btn-block btn-flat btn-warning quick-cash">1000</button>
                                            <button type="button" class="btn btn-block btn-danger"
                                                id="clear-cash-notes">
                                                Clear</button>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-flat btn-info" OnClick="btnSubmit_Click" ValidationGroup="payment" />
                                <button type="button" class="btn btn-flat btn-danger" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div id="latefee" class="modal fade" role="dialog">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header bg-warning">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Fine</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <div class="col-md-10 col-sm-10 col-xs-10">
                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="add" />
                                            <asp:Label ID="Label21" runat="server" Font-Bold="True" SkinID="message"></asp:Label>
                                            <asp:HiddenField ID="HiddenField2" runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-3">
                                            <asp:Label ID="Label22" runat="server" Text="Amount"></asp:Label></label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="tbxLateFine" ClientIDMode="Static" runat="server" placeholder="Fine Amount" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <%--<button type="button" id="btnLateFine" class="btn btn-flat btn-info" data-dismiss="modal">Submit</button>--%>
                                <asp:Button ID="btnSubmitFine" runat="server" OnClick="btnSubmitFine_Click" CssClass="btn btn-flat btn-info" Text="Submit" />
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div id="scholar" class="modal fade" role="dialog">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header bg-success">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Scholar</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <div class="col-md-10 col-sm-10 col-xs-10">
                                            <asp:ValidationSummary ID="ValidationSummary3" runat="server" ValidationGroup="add" />
                                            <asp:Label ID="Label23" runat="server" Font-Bold="True" SkinID="message"></asp:Label>
                                            <asp:HiddenField ID="HiddenField3" runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-3">
                                            <asp:Label ID="Label24" runat="server" Text="Amount"></asp:Label></label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="tbxScholar" ClientIDMode="Static" runat="server" placeholder="Scholar Amount" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <%--<button type="button" id="btnScholar" class="btn btn-flat btn-info" data-dismiss="modal">Submit</button>--%>
                                <asp:Button ID="btnSubmitScholar" runat="server" OnClick="btnSubmitScholar_Click" CssClass="btn btn-flat btn-info" Text="Submit" />
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>
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
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="script">
    <script src="../../JS/print.js"></script>
    <script type="text/javascript">
        var amount = 0;
        $(document).on('click', '.quick-cash', function () {
            var $quick_cash = $(this);
            var amt = $quick_cash.contents().filter(function () {
                return this.nodeType == 3;
            }).text();
            var $pi = $("#tbxAmount");
            amount = Number(amount) + Number(amt);
            $pi.val(amount);
            $("#popPaying").text(amount);
            var note_count = $quick_cash.find('span');
            if (note_count.length == 0) {
                $quick_cash.append('<span class="badge">1</span>');
            } else {
                note_count.text(parseInt(note_count.text()) + 1);
            }
        });
        $(document).on('click', '#clear-cash-notes', function () {
            $('.quick-cash').find('.badge').remove();
            $("#tbxAmount").val('').change().focus();
            $("#popPaying").text('');
            amount = 0;
        });
    </script>
</asp:Content>

