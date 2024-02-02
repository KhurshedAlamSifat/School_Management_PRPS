<%@ Page Title="Global Notice List" Language="C#" MasterPageFile="~/MasterPage/PublicMaster.master" AutoEventWireup="true" CodeFile="JobApplicationView.aspx.cs" Inherits="Pages_JobApllication_JobApplicationView" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        td {
            padding:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <contenttemplate>
        <div class="row">
            <div class="col-md-12">
                <div class="form-horizontal">
                    <div class="form-group">
                        <div class="col-md-10 col-sm-10 col-xs-10">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="save" />
                            <asp:Label ID="lblError" runat="server" Font-Bold="True" SkinID="message"></asp:Label>
                            <asp:HiddenField ID="hdnID" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label15" runat="server" Text="Application ID:" Font-Size="Large"></asp:Label></label>
                        <div class="col-sm-4">
                            <asp:Label ID="lblApplicationId" runat="server"  Font-Size="Large"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label1" runat="server" Text="Full Name"></asp:Label></label>
                        <div class="col-sm-4">
                            <asp:Label ID="lblFullName" runat="server" ></asp:Label>
                        </div>
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label3" runat="server" Text="Father's Name"></asp:Label></label>
                        <div class="col-sm-4">
                            <asp:Label ID="lblFatherName" runat="server" ></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label2" runat="server" Text="Mother's Name"></asp:Label></label>
                        <div class="col-sm-4">
                            <asp:Label ID="lblMotherName" runat="server" ></asp:Label>
                        </div>
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label4" runat="server" Text="Date Of Birth"></asp:Label></label>
                        <div class="col-sm-4">
                            <asp:Label ID="lblDateOfBirth" runat="server"  placeholder="Enter Date of Birth"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label5" runat="server" Text="Religion"></asp:Label></label>
                        <div class="col-sm-4">
                            <asp:Label ID="lblReligion" runat="server" ></asp:Label>
                        </div>
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:Application,Gender %>"></asp:Label></label>
                        <div class="col-sm-4">
                            <asp:Label ID="lblGender" runat="server" ></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label7" runat="server" Text="Mobile Number"></asp:Label></label>
                        <div class="col-sm-4">
                            <asp:Label ID="lblMobileNumber" runat="server" ></asp:Label>
                        </div>
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label8" runat="server" Text="Email"></asp:Label></label>
                        <div class="col-sm-4">
                            <asp:Label ID="lblEmail" runat="server" ></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label9" runat="server" Text="MPO/NTRCA"></asp:Label></label>
                        <div class="col-sm-4">
                            <asp:Label ID="lblMPO_NTRCA" runat="server" ></asp:Label>
                        </div>
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label10" runat="server" Text="Nationality"></asp:Label></label>
                        <div class="col-sm-4">
                            <asp:Label ID="lblNationality" runat="server" ></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label11" runat="server" Text="Present Address"></asp:Label></label>
                        <div class="col-sm-4">
                            <asp:Label ID="lblPresentAddress" runat="server" TextMode="MultiLine" ></asp:Label>
                        </div>
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label12" runat="server" Text="Permanent Address"></asp:Label></label>
                        <div class="col-sm-4">
                            <asp:Label ID="lblPermanentAddress" runat="server" TextMode="MultiLine" ></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label13" runat="server" Text="Photo"></asp:Label></label>
                        <div class="col-sm-4">
                            <asp:Image runat="server" ID="imgFaceImage" ImageUrl="../../Images/Common/avatar5.png" class="img-thumbnail img-responsive" />
                        </div>
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label14" runat="server" Text="Signature"></asp:Label></label>
                        <div class="col-sm-4">
                            <asp:Image runat="server" ID="imgSignatureImage" ImageUrl="../../Images/Common/avatar5.png" class="img-thumbnail img-responsive" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label6" runat="server" Text="NID Number"></asp:Label></label>
                        <div class="col-sm-4">
                            <asp:Label ID="lblNID" runat="server" ></asp:Label>
                        </div>
                    </div>
                    <h3>Educational Qualification</h3>
                    <table style="width: 100%;">
                        <tr>
                            <th style="text-align: center;">Exam Name</th>
                            <th style="text-align: center;">Board / University</th>
                            <th style="text-align: center;">Hall / College / Institute</th>
                            <th style="text-align: center;">Group / Subject</th>
                            <th style="text-align: center;">GPA / Division /CGPA / Class</th>
                            <th style="text-align: center;">Passing Year</th>
                        </tr>
                        <tr>
                            <th style="text-align: center;">Master /Equivalent</th>
                            <td>
                                <asp:Label runat="server" ID="lblEducationMasterBoard" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblEducationMasterCollege" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblEducationMasterGroup" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblEducationMasterCgpa" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblEducationMasterPassingYear" Style="width: 50%; margin-left: 25%;"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align: center;">Honors /Equivalent</th>
                            <td>
                                <asp:Label runat="server" ID="lblEducationHonorsBoard" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblEducationHonorsCollege" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblEducationHonorsGroup" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblEducationHonorsCgpa" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblEducationHonorsPassingYear" Style="width: 50%; margin-left: 25%;"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align: center;">HSC /Equivalent</th>
                            <td>
                                <asp:Label runat="server" ID="lblEducationHscBoard" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblEducationHscCollege" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblEducationHscGroup" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblEducationHscCgpa" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblEducationHscPassingYear" Style="width: 50%; margin-left: 25%;"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align: center;">SSC /Equivalent</th>
                            <td>
                                <asp:Label runat="server" ID="lblEducationSscBoard" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblEducationSscCollege" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblEducationSscGroup" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblEducationSscCgpa" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblEducationSscPassingYear" Style="width: 50%; margin-left: 25%;"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align: center;">JSC /Equivalent</th>
                            <td>
                                <asp:Label runat="server" ID="lblEducationJscBoard" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblEducationJscCollege" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblEducationJscGroup" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblEducationJscCgpa" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblEducationJscPassingYear" Style="width: 50%; margin-left: 25%;"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <h3>Professional Tranning / Other Qualification</h3>
                    <table style="width: 100%;">
                        <tr>
                            <th style="text-align: center;">SL</th>
                            <th style="text-align: center;">Course Name</th>
                            <th style="text-align: center;">Institute Name</th>
                            <th style="text-align: center;">Institute Address</th>
                            <th style="text-align: center;">Result</th>
                            <th style="text-align: center;">From</th>
                            <th style="text-align: center;">To</th>
                        </tr>
                        <tr>
                            <th style="text-align: center;">1</th>
                            <td>
                                <asp:Label runat="server" ID="lblTrainingCourseName_1" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblTrainingInstituteName_1" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblTrainingInstituteAddress_1" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblTrainingResult_1" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblTrainingStartDate_1" Style="width: 50%; margin-left: 25%;"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblTrainingRunning_1" runat="server" ></asp:Label>
                                <asp:Label runat="server" ID="lblTrainingEndDate_1" Style="width: 50%;"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align: center;">2</th>
                            <td>
                                <asp:Label runat="server" ID="lblTrainingCourseName_2" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblTrainingInstituteName_2" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblTrainingInstituteAddress_2" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblTrainingResult_2" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblTrainingStartDate_2" Style="width: 50%; margin-left: 25%;"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblTrainingRunning_2" runat="server" ></asp:Label>
                                <asp:Label runat="server" ID="lblTrainingEndDate_2" Style="width: 50%;"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align: center;">3</th>
                            <td>
                                <asp:Label runat="server" ID="lblTrainingCourseName_3" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblTrainingInstituteName_3" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblTrainingInstituteAddress_3" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblTrainingResult_3" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblTrainingStartDate_3" Style="width: 50%; margin-left: 25%;"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblTrainingRunning_3" runat="server" ></asp:Label>
                                <asp:Label runat="server" ID="lblTrainingEndDate_3" Style="width: 50%;"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <h3>Work Experience</h3>
                    <table style="width: 100%;">
                        <tr>
                            <th style="text-align: center;">SL</th>
                            <th style="text-align: center;">Institute / Company</th>
                            <th style="text-align: center;">Department /Subject</th>
                            <th style="text-align: center;">Designaiton</th>
                            <th style="text-align: center;">Address</th>
                            <th style="text-align: center;">From</th>
                            <th style="text-align: center;">To</th>
                        </tr>
                        <tr>
                            <th style="text-align: center;">1</th>
                            <td>
                                <asp:Label runat="server" ID="lblExperienceInstitute_1" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblExperienceDepartment_1" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblExperienceDesignation_1" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblExperienceAddress_1" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblExperienceStartDate_1" Style="width: 50%; margin-left: 25%;"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblExperienceRunning_1" runat="server" ></asp:Label>
                                <asp:Label runat="server" ID="lblExperienceEndDate_1" Style="width: 50%;"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align: center;">2</th>
                            <td>
                                <asp:Label runat="server" ID="lblExperienceInstitute_2" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblExperienceDepartment_2" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblExperienceDesignation_2" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblExperienceAddress_2" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblExperienceStartDate_2" Style="width: 50%; margin-left: 25%;"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblExperienceRunning_2" runat="server" ></asp:Label>
                                <asp:Label runat="server" ID="lblExperienceEndDate_2" Style="width: 50%;"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align: center;">3</th>
                            <td>
                                <asp:Label runat="server" ID="lblExperienceInstitute_3" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblExperienceDepartment_3" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblExperienceDesignation_3" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblExperienceAddress_3" TextMode="MultiLine" ></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblExperienceStartDate_3" Style="width: 50%; margin-left: 25%;"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblExperienceRunning_3" runat="server" ></asp:Label>
                                <asp:Label runat="server" ID="lblExperienceEndDate_3" Style="width: 50%;"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <div class="form-group">
                        <div class="col-md-6 text-right">
                            <asp:Button ID="btnDelete" runat="server" ClientIDMode="Static" Text="Delete" CssClass="btn btn-danger"
                                OnClick="btnDelete_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </contenttemplate>
    <script type="text/javascript" language="javascript">
        //There's a bug in Microsoft's Ajax script that stops the modal popups from working
        //This overrides the the code that causes the error
        Sys.UI.Point = function Sys$UI$Point(x, y) {

            x = Math.round(x);
            y = Math.round(y);

            var e = Function._validateParams(arguments, [
                { name: "x", type: Number, integer: true },
                { name: "y", type: Number, integer: true }
            ]);
            if (e) throw e;
            this.x = x;
            this.y = y;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

