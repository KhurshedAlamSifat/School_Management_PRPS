<%@ Page Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="PrintInvoice.aspx.cs" Inherits="Pages_FeePaymentModule_PrintInvoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="col-md-12">
        <button name="btnPrint" class="btn btn-flat btn-info pull-left" onclick="PrintPanelManual()">Print</button>
        <asp:Panel ID="pnPrint" Width="180mm" runat="server">
            <div style="width: 180mm; margin-right: 100px; margin-right: 100px;">
                <br />
                <br />
                <table style="width: 100%;">
                    <tr>
                        <td style="text-align: center; font-size: 20px; font-weight: bold;" colspan="2">
                            <asp:Label ID="lblSchoolName" runat="server" Text="[#SchoolName]"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center; font-size: 15px;" colspan="2">
                            <asp:Label ID="lblSchoolAddress" runat="server" Text="[#Address]"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center; font-size: 15px; font-weight: bold;" colspan="2">Invoice (Student Copy)</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; font-size: 15px;"><span style="font-size: 15px; font-weight: bold;">Tracking Id:</span>
                            <asp:Label ID="lblTrackingId" runat="server" Text="[#TrackingId]" Font-Size="Large"></asp:Label>
                        </td>
                        <td style="text-align: right; font-size: 15px;"><span style="font-size: 15px; font-weight: bold;">Date:</span>
                            <asp:Label ID="lblInvoiceDate" runat="server" Text="[#InvoiceDate]" Font-Size="Large"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table style="width: 100%;">
                    <tr>
                        <td style="text-align: left;" colspan="4"><span style="font-size: 15px; font-weight: bold;">Student’s Name:</span>
                            <asp:Label ID="lblStudent_Name" runat="server" Text="X" Font-Size="Medium"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left; font-size: 15px;" colspan="3"><span style="font-size: 15px; font-weight: bold;">Reg.No:</span>
                            <asp:Label ID="lblStudent_RegistrationNumber" runat="server" Text="X" Font-Size="Medium"></asp:Label>
                        </td>
                        <td style="text-align: left; font-size: 15px;" colspan="1"><span style="font-size: 15px; font-weight: bold;">Class:</span>
                            <asp:Label ID="lblStudent_Class" runat="server" Text="X" Font-Size="Medium"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left; font-size: 15px;" colspan="1"><span style="font-size: 15px; font-weight: bold;">Group:</span>
                            <asp:Label ID="lblStudent_Group" runat="server" Text="X" Font-Size="Medium"></asp:Label>
                        </td>
                        <td style="text-align: left; font-size: 15px;" colspan="1"><span style="font-size: 15px; font-weight: bold;">Shift:</span>
                            <asp:Label ID="lblStudent_Shift" runat="server" Text="X" Font-Size="Medium"></asp:Label>
                        </td>
                        <td style="text-align: left; font-size: 15px;" colspan="1"><span style="font-size: 15px; font-weight: bold;">Section:</span>
                            <asp:Label ID="lblStudent_Section" runat="server" Text="X" Font-Size="Medium"></asp:Label>
                        </td>
                        <td style="text-align: left; font-size: 15px;" colspan="1"><span style="font-size: 15px; font-weight: bold;">Roll:</span>
                            <asp:Label ID="lblStudentToClass_RollNo" runat="server" Text="X" Font-Size="Medium"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table style="width: 150mm; border: 0px solid black; border-collapse: collapse; margin-left: 0mm;">
                    <tr>
                        <th style="border: 0px solid black; font-size: 15px; font-weight: bold; width: 30%;">Old Bal:
                            <asp:Label ID="lblStudentInvoice_OldBalance" runat="server"></asp:Label></th>
                        <th style="border: 0px solid black; font-size: 15px; font-weight: bold; width: 30%;">Deposite:
                            <asp:Label ID="lblStudentInvoice_DepositedAmount" runat="server"></asp:Label></th>
                        <th style="border: 0px solid black; font-size: 15px; font-weight: bold; width: 40%;">New Bal:
                            <asp:Label ID="lblStudentInvoice_NewBalance" runat="server"></asp:Label></th>
                    </tr>
                </table>
                <br />
                <table style="width: 150mm; border: 0px solid black; border-collapse: collapse; margin-left: 0mm;">
                    <tr>
                        <th style="border: 0px solid black; padding: 2px; text-align: center; font-size: 15px; font-weight: bold; width: 5%; text-decoration-line: underline;">SL</th>
                        <th style="border: 0px solid black; padding: 2px; text-align: center; font-size: 15px; font-weight: bold; width: 10%; text-decoration-line: underline;">St.Bal</th>
                        <th style="border: 0px solid black; padding: 2px; text-align: center; font-size: 15px; font-weight: bold; width: 45%; text-decoration-line: underline;">Description</th>
                        <th style="border: 0px solid black; padding: 2px; text-align: center; font-size: 15px; font-weight: bold; width: 10%; text-decoration-line: underline;">Amount</th>
                        <th style="border: 0px solid black; padding: 2px; text-align: center; font-size: 15px; font-weight: bold; width: 10%; text-decoration-line: underline;">Status</th>
                        <th style="border: 0px solid black; padding: 2px; text-align: center; font-size: 15px; font-weight: bold; width: 10%; text-decoration-line: underline;">End.Bal</th>

                    </tr>
                    <!--loop-start-->
                    <asp:Repeater ID="rptDue" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td style="border: 0px solid black; text-align: right; font-size: 15px; width: 5%;">
                                    <itemtemplate><%#Container.ItemIndex+1 %>.</itemtemplate>
                                </td>
                                <td style="border: 0px solid black; padding: 2px; text-align: right; font-size: 15px;"><%#Eval("StudentDue_StudentOldBalance") %></td>
                                <td style="border: 0px solid black; padding: 2px; text-align: left; font-size: 15px; width: 75%;"><%#Eval("Fee_DisplayName") %> <%#Eval("StudentDue_WaiverPercentage") == DBNull.Value ? "":"["+Eval("StudentDue_WaiverPercentage")+"% Waiver]" %>-<%#Eval("StudentDue_EffectiveMonthName") %>, <%#Eval("StudentDue_EffectiveYear") %> </td>
                                <td style="border: 0px solid black; padding: 2px; text-align: right; font-size: 15px;"><%#Eval("StudentDue_AppliedAmount") %></td>
                                <td style="border: 0px solid black; padding: 2px; text-align: left; font-size: 15px;"><%#Eval("StudentDue_ShortStatus") %></td>
                                <td style="border: 0px solid black; padding: 2px; text-align: right; font-size: 15px;"><%#Eval("StudentDue_StudentNewBalance") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <!--loop-end-->
                </table>
                <br />
                <table style="width: 150mm; border: 0px solid black; border-collapse: collapse; margin-left: 0mm;">
                    <tr>
                        <th style="border: 0px solid black; font-size: 15px; font-weight: bold; width: 100%;">
                            <asp:Label ID="lblFinalBalance" runat="server"></asp:Label></th>
                    </tr>
                </table>
                <br />
                <br />
                <table style="width: 100%;">
                    <tr>
                        <td></td>
                        <td style="text-align: right; font-size: 15px;" colspan="1"><span style="font-size: 15px; font-weight: bold;">- - - - - - - - - - - - - - - - - - - - - - - - -</span></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td style="text-align: right; font-size: 15px;" colspan="1"><span style="font-size: 15px; font-weight: bold;">Received By:</span>
                            <asp:Label ID="lblReceivedBy" runat="server" Text="lblReceivedBy"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: 10px; text-align: right" colspan="2">Reff: 
                            <asp:Label ID="lblTransectionIdentifier" runat="server" Text="TransectionIdentifier"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
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
            //myWindow.document.write("body{width:100%;height:100%;margin:0;padding:0;background-color:#fafafa;font:12pt Tahoma}*{box-sizing:border-box;-moz-box-sizing:border-box}.page{width:210mm;min-height:297mm;padding:0;margin:0 auto;border:1px #d3d3d3 solid;border-radius:5px;background:#fff;box-shadow:0 0 5px rgba(0,0,0,.1)}.subpage{width:210mm;padding:0;border:0 red solid;height:297mm;outline:0 #FFEAEA solid}@page{size:A4;margin:0}@media print{body,html{width:210mm;height:297mm}.page{margin:0;border:initial;border-radius:initial;width:initial;min-height:initial;box-shadow:initial;background:initial;page-break-after:always}}");
            myWindow.document.write("body{width:100%;height:100%;margin:0;padding:0;background-color:#fafafa;font:12pt Tahoma}*{box-sizing:border-box;-moz-box-sizing:border-box}.page{width:180mm;min-height:297mm;padding:0;margin:0 auto;border:1px #d3d3d3 solid;border-radius:5px;background:#fff;box-shadow:0 0 5px rgba(0,0,0,.1)}.subpage{width:180mm;padding:0;border:0 red solid;height:297mm;outline:0 #FFEAEA solid}@page{size:A4;margin:0}@media print{body,html{width:180mm;height:297mm}.page{margin:0;border:initial;border-radius:initial;width:initial;min-height:initial;box-shadow:initial;background:initial;page-break-after:always}}");
            myWindow.document.write("</style></head><body class='book'><div class='page'><div class='subpage'>");
            myWindow.document.write(panel.innerHTML);
            myWindow.document.write("</div></div></body></html>");
            myWindow.print();
        }
    </script>
</asp:Content>
