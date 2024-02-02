<%@ Page Title="Global Notice List" Language="C#" MasterPageFile="~/MasterPage/PublicMaster.master" AutoEventWireup="true" CodeFile="JobApplicationEntry.aspx.cs" Inherits="Pages_JobApllication_JobApplicationEntry" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
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
                            <asp:Label ID="Label1" runat="server" Text="Full Name"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="tbxFullName" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator2" runat="server" ValidationGroup="save"
                                ErrorMessage="please enter Full Name" ControlToValidate="tbxFullName">*</asp:RequiredFieldValidator>
                        </div>
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label3" runat="server" Text="Father's Name"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="tbxFatherName" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator3" runat="server" ValidationGroup="save"
                                ErrorMessage="please enter Father's Name" ControlToValidate="tbxFatherName">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label2" runat="server" Text="Mother's Name"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="tbxMotherName" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator1" runat="server" ValidationGroup="save"
                                ErrorMessage="please enter Mother's Name" ControlToValidate="tbxMotherName">*</asp:RequiredFieldValidator>
                        </div>
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label4" runat="server" Text="Date Of Birth"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="tbxDateOfBirth" runat="server" CssClass="form-control" placeholder="Enter Date of Birth"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator4" runat="server" ValidationGroup="save"
                                ErrorMessage="Enter Date of Birth" ControlToValidate="tbxDateOfBirth">*</asp:RequiredFieldValidator>
                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxDateOfBirth"
                                TargetControlID="tbxDateOfBirth">
                            </cc1:CalendarExtender>

                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label5" runat="server" Text="Religion"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-4">
                            <asp:DropDownList ID="ddlReligion" runat="server" DataTextField="Religion" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator32" runat="server" ValidationGroup="basic"
                                ErrorMessage="Select religion" ControlToValidate="ddlReligion">*</asp:RequiredFieldValidator>
                        </div>
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:Application,Gender %>"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-4">
                            <asp:DropDownList ID="ddlGender" runat="server" DataTextField="Gender" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator31" runat="server" ValidationGroup="basic"
                                ErrorMessage="Select gender" ControlToValidate="ddlGender">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label7" runat="server" Text="Mobile Number"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="tbxMobileNumber" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator7" runat="server" ValidationGroup="save"
                                ErrorMessage="please enter Mobile Number" ControlToValidate="tbxMobileNumber">*</asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" TargetControlID="tbxMobileNumber" ValidChars="0123456789"></cc1:FilteredTextBoxExtender>
                        </div>
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label8" runat="server" Text="Email"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="tbxEmail" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator8" runat="server" ValidationGroup="save"
                                ErrorMessage="please enter Email" ControlToValidate="tbxEmail">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label9" runat="server" Text="MPO/NTRCA"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="tbxMPO_NTRCA" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator9" runat="server" ValidationGroup="save"
                                ErrorMessage="please enter MPO/NTRCA" ControlToValidate="tbxMPO_NTRCA">*</asp:RequiredFieldValidator>
                        </div>
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label10" runat="server" Text="Nationality"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-4">
                            <asp:DropDownList ID="ddlNationality" runat="server" DataTextField="Gender" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator5" runat="server" ValidationGroup="basic"
                                ErrorMessage="Select Nationality" ControlToValidate="ddlNationality">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label11" runat="server" Text="Present Address"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="tbxPresentAddress" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator11" runat="server" ValidationGroup="save"
                                ErrorMessage="please enter Present Address" ControlToValidate="tbxPresentAddress">*</asp:RequiredFieldValidator>
                        </div>
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label12" runat="server" Text="Permanent Address"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-4">
                            <asp:CheckBox ID="cbSameAddress" runat="server" /><label>&nbsp; Same as Present Address</label>
                            <br />
                            <asp:TextBox ID="tbxPermanentAddress" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label13" runat="server" Text="Photo"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-4">
                            <asp:FileUpload ID="fuFaceImage" runat="server" />
                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator13" runat="server" ValidationGroup="save"
                                ErrorMessage="please give Photo" ControlToValidate="fuFaceImage">*</asp:RequiredFieldValidator>
                        </div>
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label14" runat="server" Text="Signature"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-4">
                            <asp:FileUpload ID="fuSignatureImage" runat="server" />
                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator14" runat="server" ValidationGroup="save"
                                ErrorMessage="please enter Signature" ControlToValidate="fuSignatureImage">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2">
                            <asp:Label ID="Label6" runat="server" Text="NID Number"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="tbxNID" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator6" runat="server" ValidationGroup="save"
                                ErrorMessage="please enter NID Number" ControlToValidate="tbxNID">*</asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" TargetControlID="tbxNID" ValidChars="0123456789"></cc1:FilteredTextBoxExtender>
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
                                <asp:TextBox runat="server" ID="tbxEducationMasterBoard" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxEducationMasterCollege" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxEducationMasterGroup" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxEducationMasterCgpa" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxEducationMasterPassingYear" Style="width: 50%; margin-left: 25%;"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="tbxEducationMasterPassingYear" ValidChars="0123456789"></cc1:FilteredTextBoxExtender>
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align: center;">Honors /Equivalent</th>
                            <td>
                                <asp:TextBox runat="server" ID="tbxEducationHonorsBoard" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxEducationHonorsCollege" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxEducationHonorsGroup" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxEducationHonorsCgpa" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxEducationHonorsPassingYear" Style="width: 50%; margin-left: 25%;"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="tbxEducationHonorsPassingYear" ValidChars="0123456789"></cc1:FilteredTextBoxExtender>
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align: center;">HSC /Equivalent</th>
                            <td>
                                <asp:TextBox runat="server" ID="tbxEducationHscBoard" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxEducationHscCollege" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxEducationHscGroup" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxEducationHscCgpa" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxEducationHscPassingYear" Style="width: 50%; margin-left: 25%;"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="tbxEducationHscPassingYear" ValidChars="0123456789"></cc1:FilteredTextBoxExtender>
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align: center;">SSC /Equivalent</th>
                            <td>
                                <asp:TextBox runat="server" ID="tbxEducationSscBoard" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxEducationSscCollege" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxEducationSscGroup" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxEducationSscCgpa" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxEducationSscPassingYear" Style="width: 50%; margin-left: 25%;"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="tbxEducationSscPassingYear" ValidChars="0123456789"></cc1:FilteredTextBoxExtender>
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align: center;">JSC /Equivalent</th>
                            <td>
                                <asp:TextBox runat="server" ID="tbxEducationJscBoard" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxEducationJscCollege" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxEducationJscGroup" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxEducationJscCgpa" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxEducationJscPassingYear" Style="width: 50%; margin-left: 25%;"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="tbxEducationJscPassingYear" ValidChars="0123456789"></cc1:FilteredTextBoxExtender>
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
                                <asp:TextBox runat="server" ID="tbxTrainingCourseName_1" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxTrainingInstituteName_1" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxTrainingInstituteAddress_1" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxTrainingResult_1" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxTrainingStartDate_1" Style="width: 50%; margin-left: 25%;"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender_1" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxTrainingStartDate_1"
                                    TargetControlID="tbxTrainingStartDate_1">
                                </cc1:CalendarExtender>
                            </td>
                            <td>
                                <asp:CheckBox ID="cbTrainingRunning_1" runat="server" /><label> Till now / &nbsp; &nbsp;</label>
                                <asp:TextBox runat="server" ID="tbxTrainingEndDate_1" Style="width: 50%;"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender4" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxTrainingEndDate_1"
                                    TargetControlID="tbxTrainingEndDate_1">
                                </cc1:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align: center;">2</th>
                            <td>
                                <asp:TextBox runat="server" ID="tbxTrainingCourseName_2" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxTrainingInstituteName_2" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxTrainingInstituteAddress_2" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxTrainingResult_2" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxTrainingStartDate_2" Style="width: 50%; margin-left: 25%;"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxTrainingStartDate_2"
                                    TargetControlID="tbxTrainingStartDate_2">
                                </cc1:CalendarExtender>
                            </td>
                            <td>
                                <asp:CheckBox ID="cbTrainingRunning_2" runat="server" /><label>&nbsp; Till now / &nbsp; &nbsp;</label>
                                <asp:TextBox runat="server" ID="tbxTrainingEndDate_2" Style="width: 50%;"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender5" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxTrainingEndDate_2"
                                    TargetControlID="tbxTrainingEndDate_2">
                                </cc1:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align: center;">3</th>
                            <td>
                                <asp:TextBox runat="server" ID="tbxTrainingCourseName_3" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxTrainingInstituteName_3" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxTrainingInstituteAddress_3" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxTrainingResult_3" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxTrainingStartDate_3" Style="width: 50%; margin-left: 25%;"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender3" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxTrainingStartDate_3"
                                    TargetControlID="tbxTrainingStartDate_3">
                                </cc1:CalendarExtender>
                            </td>
                            <td>
                                <asp:CheckBox ID="cbTrainingRunning_3" runat="server" /><label>&nbsp; Till now / &nbsp; &nbsp;</label>
                                <asp:TextBox runat="server" ID="tbxTrainingEndDate_3" Style="width: 50%;"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender6" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxTrainingEndDate_3"
                                    TargetControlID="tbxTrainingEndDate_3">
                                </cc1:CalendarExtender>
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
                                <asp:TextBox runat="server" ID="tbxExperienceInstitute_1" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxExperienceDepartment_1" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxExperienceDesignation_1" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxExperienceAddress_1" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxExperienceStartDate_1" Style="width: 50%; margin-left: 25%;"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender7" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxExperienceStartDate_1"
                                    TargetControlID="tbxExperienceStartDate_1">
                                </cc1:CalendarExtender>
                            </td>
                            <td>
                                <asp:CheckBox ID="cbExperienceRunning_1" runat="server" /><label>&nbsp; Till now / &nbsp; &nbsp;</label>
                                <asp:TextBox runat="server" ID="tbxExperienceEndDate_1" Style="width: 50%;"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender10" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxExperienceEndDate_1"
                                    TargetControlID="tbxExperienceEndDate_1">
                                </cc1:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align: center;">2</th>
                            <td>
                                <asp:TextBox runat="server" ID="tbxExperienceInstitute_2" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxExperienceDepartment_2" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxExperienceDesignation_2" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxExperienceAddress_2" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxExperienceStartDate_2" Style="width: 50%; margin-left: 25%;"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender8" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxExperienceStartDate_2"
                                    TargetControlID="tbxExperienceStartDate_2">
                                </cc1:CalendarExtender>
                            </td>
                            <td>
                                <asp:CheckBox ID="cbExperienceRunning_2" runat="server" /><label>&nbsp; Till now / &nbsp; &nbsp;</label>
                                <asp:TextBox runat="server" ID="tbxExperienceEndDate_2" Style="width: 50%;"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender11" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxExperienceEndDate_2"
                                    TargetControlID="tbxExperienceEndDate_2">
                                </cc1:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align: center;">3</th>
                            <td>
                                <asp:TextBox runat="server" ID="tbxExperienceInstitute_3" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxExperienceDepartment_3" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxExperienceDesignation_3" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxExperienceAddress_3" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox runat="server" ID="tbxExperienceStartDate_3" Style="width: 50%; margin-left: 25%;"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender9" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxExperienceStartDate_3"
                                    TargetControlID="tbxExperienceStartDate_3">
                                </cc1:CalendarExtender>
                            </td>
                            <td>
                                <asp:CheckBox ID="cbExperienceRunning_3" runat="server" /><label>&nbsp; Till now / &nbsp; &nbsp;</label>
                                <asp:TextBox runat="server" ID="tbxExperienceEndDate_3" Style="width: 50%;"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender12" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxExperienceEndDate_3"
                                    TargetControlID="tbxExperienceEndDate_3">
                                </cc1:CalendarExtender>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <div class="form-group">
                        <div class="col-md-6 text-right">
                            <asp:Button ID="btnSave" runat="server" ClientIDMode="Static" Text="<%$ Resources:Application,Save %>" CssClass="btn btn-primary" ValidationGroup="save"
                                OnClick="btnSave_Click" />
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

