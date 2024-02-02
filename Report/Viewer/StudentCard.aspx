<%@ Page Title="Result Card" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="StudentCard.aspx.cs" Inherits="Report_Viewer_StudentCard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <div class='<%= Common.SessionInfo.Panel %>'>
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
                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Application,ExamType %>"></asp:Label></label>
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
            <asp:Button ID="btnReport" CssClass="btn btn-flat btn-success" OnClick="btnReport_Click" runat="server" Text="Show Result" ValidationGroup="save" />
        </div>
    </div>
    <div class="col-md-12">
        <a class="pull-right" href="JavaScript:PrintPanel();">
            <asp:Image ID="ImgPdf" runat="server"
                ImageUrl="~/Images/Common/printer_icon.png" ToolTip="Print" /></a>
        <asp:Panel ID="pnPrint" runat="server">
            <asp:Repeater ID="rptReport" OnItemDataBound="rptReport_ItemDataBound" runat="server">
                <ItemTemplate>
                    <div style="width: 100%; text-align: center">
                        <center>
                            <img src="../../Images/Common/Logo of PRPS.jpg" height="60" width="120" /><br />
                            <h1 class="panel-title">PRAN-RFL PUBLIC SCHOOL</h1>
                    <h3 class="panel-title"><asp:Label ID="lblExam" EnableViewState="false" runat="server"></asp:Label></h3>
                            <h3 class="panel-title"><u>Result Card</u></h3>
                </center>
                    </div>
                    <hr />
                    <div style="width: 70%; float: left">
                        <table class="table table-bordered table-responsive">
                            <tbody>
                                <tr>
                                    <td>RollNo</td>
                                    <td><%#Eval("RollNo") %></td>
                                    <td>RegNo
                                <asp:HiddenField ID="hdnStudentToClassId" Value='<%#Eval("StudentToClassId") %>' runat="server" />
                                    </td>

                                    <td><%#Eval("RegistrationNo") %></td>
                                </tr>
                                <tr>
                                    <td>Name</td>
                                    <td><%#Eval("NameEng") %>
                                        <%--<br />
                            <%#Eval("NameBan") %>--%>
                                    </td>
                                    <td>Class</td>
                                    <td><%#Eval("Class") %></td>
                                </tr>
                                <tr>
                                    <td>Section</td>
                                    <td><%#Eval("Section") %></td>
                                    <td>Shift</td>
                                    <td><%#Eval("Shift") %></td>
                                </tr>
                                <tr>

                                    <td>Group</td>
                                    <td><%#Eval("GroupName") %></td>
                                    <td>Attendance</td>
                                    <td>
                                        <asp:Label ID="lblAttendance" runat="server"></asp:Label></td>
                                </tr>
                                <tr>

                                    <td>Total Marks</td>
                                    <td>
                                        <asp:Label ID="lblTotalMarks" runat="server"></asp:Label></td>
                                    <td>Position</td>
                                    <td>
                                        <asp:Label ID="lblPosition" runat="server"></asp:Label></td>
                                </tr>
                                <tr>

                                    <td>Result</td>
                                    <td colspan="3">
                                        <asp:Label ID="lblGPA" runat="server"></asp:Label></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div style="width: 28%; float: right">
                        <table class="table table-bordered table-responsive">
                            <tbody>

                                <%--                        <asp:Repeater ID="rptGrad" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("StartMarks")+"-"+ Eval("EndMarks")%></td>
                                    <td><%#Eval("GradePoint")%></td>
                                    <td><%#Eval("GradeName")%></td>
                                </tr>
</ItemTemplate>
                        </asp:Repeater>--%>
                                <tr>
                                    <td>80-100</td>
                                    <td>5.00</td>
                                    <td>A+</td>
                                </tr>
                                <tr>
                                    <td>70-79</td>
                                    <td>4.00</td>
                                    <td>A</td>
                                </tr>
                                <tr>
                                    <td>60-69</td>
                                    <td>3.50</td>
                                    <td>A-</td>
                                </tr>
                                <tr>
                                    <td>50-59</td>
                                    <td>3.00</td>
                                    <td>B</td>
                                </tr>
                                <tr>
                                    <td>0-49</td>
                                    <td>0.00</td>
                                    <td>F</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <hr />
                    <div style="width: 100%;">
                        <asp:Repeater ID="rptMarks" runat="server">
                            <HeaderTemplate>
                                <table class="table table-bordered table-responsive">
                                    <thead>
                                        <tr>
                                            <th style="text-align:center">Subject</th>
                                            <th style="text-align:center">Marks</th>
                                            <th style="text-align:center">Letter Grade</th>
                                            <th style="text-align:center">Grade Point</th>
                                            <th style="text-align:center">Maximum</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("SubjectName")%></td>
                                    <td style="text-align:center"><%#Eval("Marks","{0:0.00}")%></td>
                                    <td style="text-align:center"><%#Eval("Grade")%></td>
                                    <td style="text-align:center"><%#Eval("GradePoint")%></td>
                                    <td style="text-align:center"><%#Eval("MaxSubMarks","{0:0.00}")%></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                       </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                    <div style="width: 100%">
                        <br />
                        <div style="width: 70%; float: left;">
                            <asp:Label ID="lblComments" runat="server" EnableViewState="false"></asp:Label>
                        </div>
                        <div style="width: 28%; float: left;">
                            <img src="../../Images/Common/PrincipalSign.png" height="60" width="140" /><br />
                            <b>Principal's Signature</b>
                        </div>
                    <div style="page-break-after: always;"></div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </asp:Panel>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
    <script type="text/javascript">
        function PrintPanel() {
            var panel = document.getElementById("<%=pnPrint.ClientID %>");
            var windowHeight = window.innerHeight;
            var windowWidth = window.innerWidth;
            var printWindow = window.open('', '', 'letf=0,top=0,height=' + windowHeight + ',width=' + windowWidth + ',toolbar=0,scrollbars=1,status=0');
            printWindow.document.write("<html><head><title>DIV Contents</title>");
            printWindow.document.write('<style>.text-left {text-align: left;} .text-right {text-align: right;} .text-center {text-align: center;}.text-justify {text-align: justify;}.text-nowrap {white-space: nowrap;}.text-lowercase {text-transform: lowercase;}.text-uppercase {text-transform: uppercase;}.text-capitalize {text-transform: capitalize;}.img-thumbnail {display: inline-block;max-width: 100%;height: auto;padding: 4px;line-height: 1.42857143;background-color: #fff;border: 1px solid #ddd;border-radius: 4px;-webkit-transition: all .2s ease-in-out;-o-transition: all .2s ease-in-out;transition: all .2s ease-in-out;}.panel-title {margin-top: 0;margin-bottom: 0;font-size: 16px;color: inherit;}.table {width: 100%;max-width: 100%;margin-bottom: 20px;} .table {border-collapse: collapse !important;}.table td, .table th {background-color: #fff !important;}.table-bordered th, .table-bordered td {border: 1px solid #ddd !important;}.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {padding: 8px;line-height: 1.42857143; vertical-align: top;border-top: 1px solid #ddd; text-align:left }.table > thead > tr > th {vertical-align: bottom;border-bottom: 2px solid #ddd;}.table > caption + thead > tr:first-child > th, .table > colgroup + thead > tr:first-child > th, .table > thead:first-child > tr:first-child > th, .table > caption + thead > tr:first-child > td, .table > colgroup + thead > tr:first-child > td, .table > thead:first-child > tr:first-child > td {border-top: 0;}.table > tbody + tbody {border-top: 2px solid #ddd;}.table .table {background-color: #fff;}.table-bordered {border: 1px solid #ddd;}.table-bordered > thead > tr > th, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td {border: 1px solid #ddd;}.table-bordered > thead > tr > th, .table-bordered > thead > tr > td {border-bottom-width: 2px;}</style></head><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.focus();
            printWindow.print();
            printWindow.close();

        }
    </script>
</asp:Content>

