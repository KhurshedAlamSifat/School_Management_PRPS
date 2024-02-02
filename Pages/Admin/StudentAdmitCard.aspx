<%@ Page Title="Admit Card" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="StudentAdmitCard.aspx.cs" Inherits="Pages_Admin_StudentAdmitCard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <div class='<%= Common.SessionInfo.Panel %>  d-print-none'>
        <div class="panel-heading">
            <h4>
                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Application,Criteria %>"></asp:Label></h4>
        </div>
        <div class="panel-body">
            <div class="col-lg-6 col-md-6">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Application,Year %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlYear" runat="server" DataTextField="Year" DataValueField="Year" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlClass" runat="server" DataTextField="ClassName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,Group %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlGroup" runat="server" DataTextField="GroupName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label4" runat="server" Text="Exam Name"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="tbExamName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-6 col-md-6">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,Shift %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlShift" runat="server" DataTextField="Shift" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Application,Section %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlSection" runat="server" DataTextField="Section" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label7" runat="server" Text="RegNo"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="tbxRegNo" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="panel-footer">
            <asp:Button ID="btnReport" CssClass="btn btn-flat btn-success" OnClick="btnReport_Click" runat="server" Text="Show Admit Card" ValidationGroup="save" />
            <button name="btnPrint" class="btn btn-flat btn-info pull-right" onclick="PrintPanelManual()">Print</button>
        </div>
    </div>
    <div class="col-md-12">
        <asp:Panel ID="pnPrint" Width="210mm" runat="server">
            <asp:Repeater ID="rptReport" runat="server">
                <ItemTemplate>
                    <%--card template start--%>
                    <div style="width: 105mm; height: 74.26mm; float: left; border-right: 1px dotted; border-bottom: 1px dotted;">
                        <div style="width: 100%">
                            <div style="width: 20%">
                                <img src="../../Images/Common/Logo of PRPS.jpg" style="float: left; position: relative; left: 30px; top: 5px" height="40" width="50" />
                            </div>
                            <div style="width: 80%; text-align: center; font-size: 20px; position: relative; left: 30px; font-weight: 700; padding-top: 10px; text-align: center;">
                                PRAN RFL Public School
                            </div>
                        </div>
                        <div style="width: 100%; margin-top: 10px;">
                            <div style="font-size: 13px; font-weight: 700; text-align: center;"><% =ExamName %></div>
                        </div>
                        <div style="width: 100%; margin-top: 5px;">
                            <div style="font-size: 15px; font-weight: 700; text-align: center; background-color: lightgray; color: black;">ADMIT CARD</div>
                        </div>
                        <div style="margin-left: 10px; margin-right: 5px; margin-top: 10px;">
                            <table style="width: 100%;">
                                <tr style="width: 100%;">
                                    <td style="font-size: 14px; font-weight: 600; text-align: left; font-family: 'Times New Roman', Times, serif; color: black; width: 10%;">Name:</td>
                                    <td style="font-size: 14px; font-weight: 600; text-align: left; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; width: 80%;"><%#Eval("NameEng") %></td>
                                    <td style="font-size: 14px; font-weight: 600; text-align: left; font-family: 'Times New Roman', Times, serif; color: black; width: 5%;">Roll:</td>
                                    <td style="font-size: 14px; font-weight: 600; text-align: left; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; width: 5%;"><%#Eval("RollNo") %></td>
                                </tr>
                            </table>
                            <table style="width: 100%;">
                                <tr style="width: 100%;">
                                    <td style="font-size: 14px; font-weight: 600; text-align: left; font-family: 'Times New Roman', Times, serif; color: black; width: 10%;">Class:</td>
                                    <td style="font-size: 14px; font-weight: 600; text-align: left; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; width: 10%;"><%#Eval("Class") %></td>
                                    <td style="width: 10%;"></td>
                                    <td style="font-size: 14px; font-weight: 600; text-align: left; font-family: 'Times New Roman', Times, serif; color: black; width: 10%;">Shift:</td>
                                    <td style="font-size: 14px; font-weight: 600; text-align: left; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; width: 10%;"><%#Eval("Shift") %></td>
                                    <td style="width: 10%;"></td>
                                    <td style="font-size: 14px; font-weight: 600; text-align: left; font-family: 'Times New Roman', Times, serif; color: black; width: 10%;">Section:</td>
                                    <td style="font-size: 14px; font-weight: 600; text-align: left; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; width: 10%;"><%#Eval("Section") %></td>
                                </tr>
                            </table>
                            <table style="width: 100%;">
                                <tr style="width: 100%;">
                                    <td style="font-size: 14px; font-weight: 600; text-align: left; font-family: 'Times New Roman', Times, serif; color: black; width: 10%;">Group:</td>
                                    <td style="font-size: 14px; font-weight: 600; text-align: left; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; width: 20%;"><%#Eval("GroupName") %></td>
                                    <td style="width: 10%;"></td>
                                    <td style="font-size: 14px; font-weight: 600; text-align: right; font-family: 'Times New Roman', Times, serif; color: black; width: 10%;">Reg.No:</td>
                                    <td style="font-size: 14px; font-weight: 600; text-align: left; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; width: 40%;"><%#Eval("RegistrationNo") %></td>
                                </tr>
                            </table>
                            <table style="width: 100%; margin-top: 30px;">
                                <tr style="width: 100%;">
                                    <td style="font-size: 14px; font-weight: 600; text-align: left; font-family: 'Times New Roman', Times, serif; color: black; width: 30%; text-align: center;">_______________</td>
                                    <td style="width: 40%;"></td>
                                    <td style="font-size: 14px; font-weight: 600; text-align: left; font-family: 'Times New Roman', Times, serif; color: black; width: 30%; text-align: center;">___________</td>
                                </tr>
                                <tr style="width: 100%;">
                                    <td style="font-size: 14px; font-weight: 600; text-align: left; text-align: center;">Form Teacher</td>
                                    <td></td>
                                    <td style="font-size: 14px; font-weight: 600; text-align: left; text-align: center;">Principal</td>
                                </tr>
                            </table>
                            <table style="width: 100%;">
                                <tr style="width: 100%;">
                                    <td style="width: 100%; color: black; font-size: 11.5px; font-weight: 500; text-align: center; text-decoration: underline;">NB: No examinee is allowed to enter into exam hall without admit card.</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <%--card template end--%>
                </ItemTemplate>
            </asp:Repeater>

        </asp:Panel>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
    <script type="text/javascript">
        function PrintPanelManual() {
            var panel = document.getElementById("<%=pnPrint.ClientID %>");
            console.log(panel.innerHTML);
            var myWindow = window.open('', '', 'width=2000,height=1000');
            myWindow.document.write("<html><head><style>");
            myWindow.document.write("body{width:100%;height:100%;margin:0;padding:0;background-color:#fafafa;font:12pt Tahoma}*{box-sizing:border-box;-moz-box-sizing:border-box}.page{width:210mm;min-height:297mm;padding:0;margin:0 auto;border:1px #d3d3d3 solid;border-radius:5px;background:#fff;box-shadow:0 0 5px rgba(0,0,0,.1)}.subpage{width:210mm;padding:0;border:0 red solid;height:297mm;outline:0 #FFEAEA solid}@page{size:A4;margin:0}@media print{body,html{width:210mm;height:297mm}.page{margin:0;border:initial;border-radius:initial;width:initial;min-height:initial;box-shadow:initial;background:initial;page-break-after:always}}");
            myWindow.document.write("</style></head><body class='book'><div class='page'><div class='subpage'>");
            myWindow.document.write(panel.innerHTML);
            myWindow.document.write("</div></div></body></html>");
            myWindow.print();
        }
    </script>
</asp:Content>
