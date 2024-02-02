<%@ Page Title="Student Details" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="Pages_Student_View" %>

<%@ Register Src="~/UserControl/SchoolHeader.ascx" TagPrefix="uc" TagName="SchoolHeader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <button id="btnPrint" type="button" class="btn btn-flat btn-success pull-right">
        <i class="fa fa-print"></i>
        <asp:Label ID="Label4" runat="server" Text="Print/Download"></asp:Label>
    </button>
    <div class="mainbody">
    <uc:SchoolHeader ID="school" runat="server" />
    <div class="panel panel-success">
        <div class="panel-body">
            <table class="table-responsive table-bordered table">
                <tr>
                    <td>
                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:Application,RegistratinNo %>"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblRegNo" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="PIN Code"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblPin" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div class="panel panel-success">
        <div class="panel-body">
            <table class="table-responsive table-bordered table">
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Application,Year %>"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblYear" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblClass" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:Application,Group %>"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblGroup" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:Application,Shift %>"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblShift" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Application,Section %>"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblSection" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:Application,Roll %>"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblRoll" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div class="panel panel-success">
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-2">
                    <asp:Image runat="server" ID="imgApplicant" ImageUrl="../../Images/Common/avatar5.png" class="img-thumbnail img-responsive" />
                    <asp:Label ID="Label49" runat="server" Text="Applicant Photo"></asp:Label>
                </div>
                <div class="col-sm-10">
                    <table class="table-responsive table-bordered table">
                        <tr>
                            <td>
                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:Application,NameEng %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblNameEng" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:Application,NameBan %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblNameBan" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:Application,Gender %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblGender" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:Application,Religion %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblReligion" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:Application,BloodGroup %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblBloodGroup" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:Application,BirthCertificateNo %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblBirthCertificate" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:Application,DateofBirth %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblDOB" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:Application,Mobile %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblMobile" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:Application,MobileHome %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblMobileHome" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:Application,Phone %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblPhone" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:Application,PhoneHome %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblPhoneHome" runat="server"></asp:Label>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </div>

        </div>
    </div>

    <div class="panel panel-success">
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <table class="table-responsive table-bordered table">
                        <tr>
                            <td>
                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Application,Division %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblPresentDiv" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:Application,District %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblPresentDis" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:Application,Thana %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblPresentThana" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:Application,PostOffice %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblPresentPostOffice" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label42" runat="server" Text="<%$ Resources:Application,PostalCode %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblPresentPostCode" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="Label47" runat="server" Text="<%$ Resources:Application,Address %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblPresentAddress" runat="server"></asp:Label></td>
                        </tr>
                    </table>
                </div>
            </div>

        </div>
    </div>

    <div class="panel panel-success">
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <table class="table-responsive table-bordered table">
                        <tr>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Application,Division %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblPermanentDiv" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label51" runat="server" Text="<%$ Resources:Application,District %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblPermanentDis" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label53" runat="server" Text="<%$ Resources:Application,Thana %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblPermanentThana" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="Label55" runat="server" Text="<%$ Resources:Application,PostOffice %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblPermanentPostOffice" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label57" runat="server" Text="<%$ Resources:Application,PostalCode %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblPermanentPostCode" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="Label59" runat="server" Text="<%$ Resources:Application,Address %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblPermanentAddress" runat="server"></asp:Label></td>
                        </tr>
                    </table>
                </div>
            </div>

        </div>
    </div>
    <div class="panel panel-success">
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-2">
                    <asp:Image runat="server" ID="imgFather" ImageUrl="../../Images/Common/avatar5.png" class="img-thumbnail img-responsive" />
                    <asp:Label ID="Label2" runat="server" Text="Father's Photo"></asp:Label>
                </div>
                <div class="col-sm-10">
                    <table class="table-responsive table-bordered table">
                        <tr>
                            <td>
                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:Application,FatherName %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblFather" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:Application,FatherProfession %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblFatherProfession" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:Application,FatherPhoneNo %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblFatherPhone" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:Application,FatherEduQualification %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblFatherEduQualification" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:Application,FatherNationalID %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblFatherNID" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:Application,FatherYearlyIncome %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblFatherIncome" runat="server"></asp:Label></td>
                        </tr>
                    </table>
                </div>
            </div>

        </div>
    </div>
    <div class="panel panel-success">
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-2">
                    <asp:Image runat="server" ID="imgMother" ImageUrl="../../Images/Common/avatar5.png" class="img-thumbnail img-responsive" />
                    <asp:Label ID="Label1" runat="server" Text="Monther's Photo"></asp:Label>
                </div>
                <div class="col-sm-10">
                    <table class="table-responsive table-bordered table">
                        <tr>
                            <td>
                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:Application,MotherName %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblMotherName" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:Application,MotherProfession %>"></asp:Label>

                            </td>
                            <td>
                                <asp:Label ID="lblMotherProfession" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,MotherPhoneNo %>"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblMotherPhone" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:Application,MotherEduQualification %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblMotherEduQualification" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label43" runat="server" Text="<%$ Resources:Application,MotherNationalID %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblMotherNId" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="Label44" runat="server" Text="<%$ Resources:Application,MotherYearlyIncome %>"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblMotherIncome" runat="server"></asp:Label></td>
                        </tr>
                    </table>
                </div>
            </div>

        </div>
    </div>

    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            loads();
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
            function EndRequestHandler(sender, args) {
                loads();
            }
        });
        function loads() {
            $("#btnPrint").click(function () {
                $(".dochide").hide();
                var contents = $(".mainbody").html();
                var frame1 = $('<iframe />');
                frame1[0].name = "frame1";
                $("body").append(frame1);
                var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;
                frameDoc.document.open();
                frameDoc.document.write('<html><head><link href="../../Styles/bootstrap.min.css" rel="stylesheet" type="text/css" /><link href="../../Styles/Print.css" rel="stylesheet" type="text/css" /><link href="../../Styles/Custom.css" rel="stylesheet" type="text/css" /> <link href="../../Styles/ApplicantsView.css" rel="stylesheet" /> <title></title>');
                frameDoc.document.write('</head><body><div class="container"><div class="row"><div class="col-sm-12">');
                frameDoc.document.write(contents);
                frameDoc.document.write('</div></div></div></body></html>');
                frameDoc.document.close();
                setTimeout(function () {
                    window.frames["frame1"].focus();
                    window.frames["frame1"].print();
                    frame1.remove();
                }, 500);
                $(".dochide").show();
            });
        }

        function openModal() {
            $('#document').modal('show');
        }
    </script>
</asp:Content>

