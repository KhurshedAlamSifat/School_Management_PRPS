<%@ Page Title="Add Teacher" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="AddNew.aspx.cs" Inherits="Pages_Teacher_AddNew" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../Styles/Multipart.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <script>
        Sys.Application.add_load(Load);
    </script>
    <div class="row">
        <div class="col-md-12">
            <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="...">
                <div class="btn-group" role="group">
                    <button type="button" id="basic" class="btn btn-primary" href="#tab1" data-toggle="tab">
                        <i class="fa fa-user"></i>
                        <div class="hidden-xs">
                            <asp:Label ID="Label55" runat="server" Text="Basic Information"></asp:Label>
                        </div>
                    </button>
                </div>
                <div class="btn-group" role="group">
                    <button type="button" id="parent" class="btn btn-default" href="#tab2" data-toggle="tab">
                        <i class="fa fa-users"></i>
                        <div class="hidden-xs">
                            <asp:Label ID="Label57" runat="server" Text="Parent Information"></asp:Label>
                        </div>
                    </button>
                </div>
                <div class="btn-group" role="group">
                    <button type="button" id="address" class="btn btn-default" href="#tab3" data-toggle="tab">
                        <i class="fa fa-map-marker"></i>
                        <div class="hidden-xs">
                            <asp:Label ID="Label58" runat="server" Text="Address Details"></asp:Label>
                        </div>
                    </button>
                </div>
                <div class="btn-group" role="group">
                    <button type="button" id="education" class="btn btn-default" href="#tab4" data-toggle="tab">
                        <i class="fa fa-graduation-cap"></i>
                        <div class="hidden-xs">
                            <asp:Label ID="Label56" runat="server" Text="Education/Training"></asp:Label>
                        </div>
                    </button>
                </div>
                <div class="btn-group" role="group">
                    <button type="button" id="photo" class="btn btn-default" href="#tab5" data-toggle="tab">
                        <i class="fa fa-photo"></i>
                        <div class="hidden-xs">
                            <asp:Label ID="Label59" runat="server" Text="Photograph"></asp:Label>
                        </div>
                    </button>
                </div>
            </div>
            <div class="pt-10"></div>
            <div class="panel panel-default ">
                <div class="panel-heading">
                    <asp:Label ID="Label29" CssClass="required" runat="server" Text="Note: (*) Marks filled are required."></asp:Label>
                </div>
                <div class="panel-body tab-content panel-body-padding-none">
                    <div class="tab-pane fade in active" id="tab1">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:ValidationSummary ID="vsBasic" runat="server" ValidationGroup="basic" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,TeacherPersonalInformation %>"></asp:Label>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-lg-6 col-md-6">
                                            <div class="form-horizontal">
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Application,TeacherPINNo %>"></asp:Label><span class="required">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="tbxTeacherPIN" runat="server" placeholder="Enter Teacher Staff ID" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator4" runat="server" ValidationGroup="basic"
                                                            ErrorMessage="Enter Teacher Staff ID" ControlToValidate="tbxTeacherPIN">*</asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Application,NameEng %>"></asp:Label><span class="required">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="tbxNameEng" runat="server" placeholder="Enter Name(English)" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator2" runat="server" ValidationGroup="basic"
                                                            ErrorMessage="Enter Name(English)" ControlToValidate="tbxNameEng">*</asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,NameBan %>"></asp:Label><span class="required">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="tbxNameBan" runat="server" placeholder="Enter Name(Bangla)" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator1" runat="server" ValidationGroup="basic"
                                                            ErrorMessage="Enter Name(Bangla)" ControlToValidate="tbxNameBan">*</asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:Application,Designation %>"></asp:Label><span class="required">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:DropDownList ID="ddlDesignation" runat="server" DataTextField="Designation" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator28" runat="server" ValidationGroup="basic"
                                                            ErrorMessage="Select teacher's designation" ControlToValidate="ddlDesignation">*</asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:Application,Gender %>"></asp:Label><span class="required">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:DropDownList ID="ddlGender" runat="server" DataTextField="Gender" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator31" runat="server" ValidationGroup="basic"
                                                            ErrorMessage="Select gender" ControlToValidate="ddlGender">*</asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:Application,Religion %>"></asp:Label><span class="required">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:DropDownList ID="ddlReligion" runat="server" DataTextField="Religion" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator32" runat="server" ValidationGroup="basic"
                                                            ErrorMessage="Select religion" ControlToValidate="ddlReligion">*</asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:Application,BloodGroup %>"></asp:Label><span class="required">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:DropDownList ID="ddlBlood" runat="server" CssClass="form-control dropdown" DataTextField="BloodGroup" DataValueField="Id">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator33" runat="server" ValidationGroup="basic"
                                                            ErrorMessage="Select teacher's blood group" ControlToValidate="ddlBlood">*</asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:Application,NationalIdNo %>"></asp:Label><span class="required">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="tbxNID" runat="server" placeholder="Enter National Id No." CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator34" runat="server" ValidationGroup="basic"
                                                            ErrorMessage="National ID no is required" ControlToValidate="tbxNID">*</asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:Application,BirthCertificateNo %>"></asp:Label></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="tbxBirthCertificate" runat="server" placeholder="Enter Birth Certificate No." CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="col-lg-6 col-md-6">
                                            <div class="form-horizontal">

                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:Application,DateofBirth %>"></asp:Label><span class="required">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="tbxDateOfBirth" runat="server" CssClass="form-control" placeholder="Enter Date of Birth"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator7" runat="server" ValidationGroup="basic"
                                                            ErrorMessage="Enter Date of Birth" ControlToValidate="tbxDateOfBirth">*</asp:RequiredFieldValidator>
                                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxDateOfBirth"
                                                            TargetControlID="tbxDateOfBirth">
                                                        </cc1:CalendarExtender>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:Application,PhoneHome %>"></asp:Label><span style="color: green">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="tbxPhnHome" runat="server" placeholder="Enter Phone(Home)" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:Application,MobileHome %>"></asp:Label><span style="color: green">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="tbxMobHome" runat="server" placeholder="Enter Mobile(Home)" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:Application,Phone %>"></asp:Label><span style="color: green">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="tbxPhone" runat="server" placeholder="Enter Phone No." CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:Application,Mobile %>"></asp:Label><span class="required">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="tbxMobile" runat="server" placeholder="Enter Mobile No." CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator25" runat="server" ValidationGroup="basic"
                                                            ErrorMessage="Enter mobile number" ControlToValidate="tbxMobile">*</asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:Application,Email %>"></asp:Label></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="tbxEmail" runat="server" placeholder="Enter Email Address" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label38" runat="server" Text="<%$ Resources:Application,Fax %>"></asp:Label><span style="color: green">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="tbxFax" runat="server" placeholder="Enter Fax No." CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label52" runat="server" Text="<%$ Resources:Application,JoinDate %>"></asp:Label><span class="required">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="tbxJoinDate" runat="server" placeholder="Enter Joining Date" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator6" runat="server" ValidationGroup="save"
                                                            ErrorMessage="Enter Join Date" ControlToValidate="tbxJoinDate">*</asp:RequiredFieldValidator>
                                                        <cc1:CalendarExtender ID="CalendarExtender4" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxJoinDate"
                                                            TargetControlID="tbxJoinDate">
                                                        </cc1:CalendarExtender>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-success hidden">
                                    <div class="panel-heading">
                                        <asp:Label ID="Label92" runat="server" Text="Salary Information"></asp:Label>
                                    </div>
                                    <div class="panel-body">
                                        <asp:UpdatePanel ID="UpdateSalary" runat="server">
                                            <ContentTemplate>
                                                <div class="col-lg-6 col-md-6">
                                                    <div class="form-horizontal">
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-4">
                                                                <asp:Label ID="Label89" runat="server" Text="Grade"></asp:Label><span class="required">*</span></label>
                                                            <div class="col-sm-6">
                                                                <asp:DropDownList ID="ddlPayScaleGrade" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlPayScaleGrade_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                                <%--<asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator22" runat="server" ValidationGroup="basic"
                                                                    ErrorMessage="Select teacher's payscale grade" ControlToValidate="ddlPayScaleGrade">*</asp:RequiredFieldValidator>--%>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-4">
                                                                <asp:Label ID="Label90" runat="server" Text="Pay Scale"></asp:Label><span class="required">*</span></label>
                                                            <div class="col-sm-6">
                                                                <asp:Label ID="lblPayScale" runat="server"></asp:Label>

                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-4">
                                                                <asp:Label ID="Label91" runat="server" Text="Basic Salary"></asp:Label><span class="required">*</span></label>
                                                            <div class="col-sm-6">
                                                                <asp:Label ID="lblBasicSalary" runat="server"></asp:Label>

                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="ddlPayScaleGrade" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>

                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        <asp:Label ID="Label66" runat="server" Text="<%$ Resources:Application,TeacherAccountInformation %>"></asp:Label>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-lg-6 col-md-6">
                                            <div class="form-horizontal">
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label69" runat="server" Text="<%$ Resources:Application,UserName %>"></asp:Label><span class="required">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="tbxUserName" runat="server" ClientIDMode="Static" placeholder="Enter User Name" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator12" runat="server" ValidationGroup="basic"
                                                            ErrorMessage="Enter User Name" ControlToValidate="tbxUserName">*</asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label72" runat="server" Text="<%$ Resources:Application,Password %>"></asp:Label><span class="required">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="tbxPassword" runat="server" ClientIDMode="Static" TextMode="Password" placeholder="Enter Password" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator14" runat="server" ValidationGroup="basic"
                                                            ErrorMessage="Enter Password" ControlToValidate="tbxPassword">*</asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label73" runat="server" Text="<%$ Resources:Application,ConfirmPassword %>"></asp:Label><span class="required">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="tbxConfirmPassword" runat="server" ClientIDMode="Static" TextMode="Password" placeholder="Enter Confirm Password" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator15" runat="server" ValidationGroup="basic"
                                                            ErrorMessage="Enter Confirm Password" ControlToValidate="tbxConfirmPassword">*</asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tbxPassword"
                                                            ValidationGroup="basic" ControlToValidate="tbxConfirmPassword" Display="Dynamic"
                                                            ErrorMessage="Password and Confirm Password are not same." Operator="Equal">
                                                            <asp:Label ID="Label74" runat="server" Text="<%$ Resources:Application,PasswordandConfirmPasswordarenotsame %>"></asp:Label>
                                                        </asp:CompareValidator>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <asp:Button ID="btnBasic" runat="server" CssClass="btn btn-primary btn-flat" Text="Save and Continue" ValidationGroup="basic" OnClick="btnBasic_Click" />
                                        <button type="button" id="nextParent" onclick="buttonclick('#parent')" class="btn btn-primary btn-flat next">
                                            <asp:Label ID="Label88" runat="server" Text="<%$ Resources:Application,Next %>"></asp:Label></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%-- """""""""""""""""""""""""""""""""""""""""""""""""""""""--%>
                    <div class="tab-pane fade in" id="tab2">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary ID="ValidationSummary3" runat="server" ValidationGroup="parent" />
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        <asp:Label ID="Label61" runat="server" Text="<%$ Resources:Application,StudentFatherInformation %>"></asp:Label>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-lg-6 col-md-6">
                                            <div class="form-horizontal">
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:Application,FatherName %>"></asp:Label><span class="required">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="tbxFathername" runat="server" placeholder="Enter Father Name" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator8" runat="server" ValidationGroup="parent"
                                                            ErrorMessage="Enter Father Name" ControlToValidate="tbxFathername">*</asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:Application,FatherEduQualification %>"></asp:Label><span class="required">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:DropDownList ID="ddlFatherEdu" runat="server" DataTextField="Qualification" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator35" runat="server" ValidationGroup="parent"
                                                            ErrorMessage="Select father's education" ControlToValidate="ddlFatherEdu">*</asp:RequiredFieldValidator>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label34" runat="server" Text="<%$ Resources:Application,FatherProfession %>"></asp:Label><span class="required">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:DropDownList ID="ddlFatherPro" runat="server" DataTextField="Profession" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator5" runat="server" ValidationGroup="parent"
                                                            ErrorMessage="Select father's profession" ControlToValidate="ddlFatherPro">*</asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="col-lg-6 col-md-6">
                                            <div class="form-horizontal">
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label35" runat="server" Text="<%$ Resources:Application,FatherPhoneNo %>"></asp:Label></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="tbxFatherPhn" runat="server" placeholder="Enter Father Phone No." CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:Application,FatherNationalID %>"></asp:Label></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="tbxFatherNID" runat="server" placeholder="Enter Father National ID" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:Application,FatherYearlyIncome %>"></asp:Label></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="tbxFatherIncome" runat="server" placeholder="Enter Father Yearly Income" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        <asp:Label ID="Label62" runat="server" Text="<%$ Resources:Application,StudentMotherInformation %>"></asp:Label>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-lg-6 col-md-6">
                                            <div class="form-horizontal">
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label39" runat="server" Text="<%$ Resources:Application,MotherName %>"></asp:Label><span class="required">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="tbxMotherName" runat="server" placeholder="Enter Mother Name" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator11" runat="server" ValidationGroup="parent"
                                                            ErrorMessage="Enter Mother Name" ControlToValidate="tbxMotherName">*</asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label40" runat="server" Text="<%$ Resources:Application,MotherEduQualification %>"></asp:Label><span class="required">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:DropDownList ID="ddlMotherEdu" runat="server" DataTextField="Qualification" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator13" runat="server" ValidationGroup="parent"
                                                            ErrorMessage="Select mother's education" ControlToValidate="ddlMotherEdu">*</asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label41" runat="server" Text="<%$ Resources:Application,MotherProfession %>"></asp:Label><span class="required">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:DropDownList ID="ddlMotherPro" runat="server" DataTextField="Profession" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator21" runat="server" ValidationGroup="parent"
                                                            ErrorMessage="Select mother's profession" ControlToValidate="ddlMotherPro">*</asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="col-lg-6 col-md-6">
                                            <div class="form-horizontal">
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label42" runat="server" Text="<%$ Resources:Application,MotherPhoneNo %>"></asp:Label></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="tbxMotherPhn" runat="server" placeholder="Enter Mother Phone No." CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:Application,MotherNationalID %>"></asp:Label></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="tbxMotherNID" runat="server" placeholder="Enter Mother National ID" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-4">
                                                        <asp:Label ID="Label44" runat="server" Text="<%$ Resources:Application,MotherYearlyIncome %>"></asp:Label></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="tbxMotherIncome" runat="server" placeholder="Enter Mother Yearly Income" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel-footer">
                                    <asp:Button ID="btnParent" runat="server" CssClass="btn btn-primary btn-flat" Text="Save and Continue" ValidationGroup="parent" OnClick="btnParent_Click" />
                                    <button type="button" id="NextAddress" onclick="buttonclick('#address')" class="btn btn-primary btn-flat next">
                                        <asp:Label ID="Label70" runat="server" Text="<%$ Resources:Application,Next %>"></asp:Label></button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%-- """""""""""""""""""""""""""""""""""""""""""""""""""""""--%>
                    <div class="tab-pane fade in" id="tab3">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <asp:ValidationSummary ID="ValidationSummary4" runat="server" ValidationGroup="address" />
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="panel panel-success">
                                            <div class="panel-heading">
                                                <asp:Label ID="Label45" runat="server" Text="<%$ Resources:Application,PresentAddress %>"></asp:Label>
                                            </div>
                                            <div class="panel-body">
                                                <div class="col-lg-6 col-md-6">
                                                    <div class="form-horizontal">
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-4">
                                                                <asp:Label ID="Label46" runat="server" Text="<%$ Resources:Application,Division %>"></asp:Label><span class="required">*</span></label>
                                                            <div class="col-sm-6">
                                                                <asp:DropDownList ID="ddlPresentDiv" ClientIDMode="Static" runat="server" CssClass="form-control dropdown" OnSelectedIndexChanged="ddlPresentDiv_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator27" runat="server" ValidationGroup="address"
                                                                    ErrorMessage="Select Present Division" ControlToValidate="ddlPresentDiv">*</asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-4">
                                                                <asp:Label ID="Label47" runat="server" Text="<%$ Resources:Application,District %>"></asp:Label><span class="required">*</span></label>
                                                            <div class="col-sm-6">
                                                                <asp:DropDownList ID="ddlPresentDis" ClientIDMode="Static" runat="server" CssClass="form-control dropdown" OnSelectedIndexChanged="ddlPresentDis_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator29" runat="server" ValidationGroup="address"
                                                                    ErrorMessage="Select Present District" ControlToValidate="ddlPresentDis">*</asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-4">
                                                                <asp:Label ID="Label48" runat="server" Text="<%$ Resources:Application,Thana %>"></asp:Label><span class="required">*</span></label>
                                                            <div class="col-sm-6">
                                                                <asp:DropDownList ID="ddlPresentThana" ClientIDMode="Static" runat="server" CssClass="form-control dropdown"></asp:DropDownList>
                                                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator30" runat="server" ValidationGroup="address"
                                                                    ErrorMessage="Select Present Thana" ControlToValidate="ddlPresentThana">*</asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="col-lg-6 col-md-6">
                                                    <div class="form-horizontal">

                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-4">
                                                                <asp:Label ID="Label49" runat="server" Text="<%$ Resources:Application,PostOffice %>"></asp:Label></label>
                                                            <div class="col-sm-6">
                                                                <asp:TextBox ID="tbxPostOffice" runat="server" ClientIDMode="Static" placeholder="Enter Post Office" CssClass="form-control"></asp:TextBox>

                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-4">
                                                                <asp:Label ID="Label50" runat="server" Text="<%$ Resources:Application,PostalCode %>"></asp:Label></label>
                                                            <div class="col-sm-6">
                                                                <asp:TextBox ID="tbxPostalCode" runat="server" ClientIDMode="Static" placeholder="Enter Postal Code" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-4">
                                                                <asp:Label ID="Label51" runat="server" Text="<%$ Resources:Application,Address %>"></asp:Label></label>
                                                            <div class="col-sm-6">
                                                                <asp:TextBox ID="tbxPresentAddress" runat="server" ClientIDMode="Static" placeholder="Enter Address" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-success">
                                            <div class="panel-heading">
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Application,PermanentAddressSame %>"></asp:Label>
                                                <div class="pull-right">
                                                    <asp:CheckBox ID="chkPresent" ClientIDMode="Static" runat="server" OnCheckedChanged="chkPresent_CheckedChanged" AutoPostBack="true" />
                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Application,PermanentAddressSame %>"></asp:Label>
                                                </div>


                                            </div>
                                            <div class="panel-body">
                                                <div class="col-lg-6 col-md-6">
                                                    <div class="form-horizontal">
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-4">
                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Application,Division %>"></asp:Label><span class="required">*</span></label>
                                                            <div class="col-sm-6">
                                                                <asp:DropDownList ID="ddlPermanentDiv" ClientIDMode="Static" runat="server" CssClass="form-control dropdown" OnSelectedIndexChanged="ddlPermanentDiv_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator3" runat="server" ValidationGroup="address"
                                                                    ErrorMessage="Select Permanent Division" ControlToValidate="ddlPermanentDiv">*</asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-4">
                                                                <asp:Label ID="Label53" runat="server" Text="<%$ Resources:Application,District %>"></asp:Label><span class="required">*</span></label>
                                                            <div class="col-sm-6">
                                                                <asp:DropDownList ID="ddlPermanentDis" ClientIDMode="Static" runat="server" CssClass="form-control dropdown" OnSelectedIndexChanged="ddlPermanentDis_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator9" runat="server" ValidationGroup="address"
                                                                    ErrorMessage="Select Permanent District" ControlToValidate="ddlPermanentDis">*</asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-4">
                                                                <asp:Label ID="Label54" runat="server" Text="<%$ Resources:Application,Thana %>"></asp:Label><span class="required">*</span></label>
                                                            <div class="col-sm-6">
                                                                <asp:DropDownList ID="ddlPermanentThana" ClientIDMode="Static" runat="server" CssClass="form-control dropdown"></asp:DropDownList>
                                                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator10" runat="server" ValidationGroup="address"
                                                                    ErrorMessage="Select Permanent Thana" ControlToValidate="ddlPermanentThana">*</asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="col-lg-6 col-md-6">
                                                    <div class="form-horizontal">

                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-4">
                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:Application,PostOffice %>"></asp:Label></label>
                                                            <div class="col-sm-6">
                                                                <asp:TextBox ID="tbxPermanentPost" runat="server" ClientIDMode="Static" placeholder="Enter Post Office" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-4">
                                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:Application,PostalCode %>"></asp:Label></label>
                                                            <div class="col-sm-6">
                                                                <asp:TextBox ID="tbxPermanentPostCode" runat="server" ClientIDMode="Static" placeholder="Enter Postal Code" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-4">
                                                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:Application,Address %>"></asp:Label></label>
                                                            <div class="col-sm-6">
                                                                <asp:TextBox ID="tbxPermanentAddress" runat="server" ClientIDMode="Static" placeholder="Enter Address" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="panel-footer">
                                            <asp:Button ID="btnAddress" runat="server" CssClass="btn btn-primary btn-flat" Text="Save and Continue" ValidationGroup="address" OnClick="btnAddress_Click" />
                                            <button type="button" id="NextPhoto" onclick="buttonclick('#education')" class="btn btn-primary btn-flat next">
                                                <asp:Label ID="Label68" runat="server" Text="<%$ Resources:Application,Next %>"></asp:Label></button>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlPresentDiv" />
                                <asp:AsyncPostBackTrigger ControlID="ddlPresentDis" />
                                <asp:AsyncPostBackTrigger ControlID="ddlPermanentDiv" />
                                <asp:AsyncPostBackTrigger ControlID="ddlPermanentDis" />
                                <asp:AsyncPostBackTrigger ControlID="chkPresent" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                    <%-- """""""""""""""""""""""""""""""""""""""""""""""""""""""--%>
                    <div class="tab-pane fade in" id="tab4">
                        <asp:UpdatePanel ID="update" runat="server">
                            <ContentTemplate>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="classInfo" />
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="panel panel-success">
                                            <div class="panel-heading">
                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Application,TeacherEducation %>"></asp:Label>

                                            </div>
                                            <div class="panel-body">
                                                <div class="col-lg-12 col-md-12">
                                                    <div class="form-horizontal">
                                                        <%--This is test----------------------------------------------------------%>
                                                        <asp:GridView ID="gvEducation" CssClass="table" runat="server" AutoGenerateColumns="false">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="<%$ Resources:Application,Degree %>" ItemStyle-Width="150px" ItemStyle-CssClass="Name">
                                                                    <ItemTemplate>
                                                                        <%# Eval("DegreeName") %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="<%$ Resources:Application,Board %>" ItemStyle-Width="150px" ItemStyle-CssClass="Name">
                                                                    <ItemTemplate>
                                                                        <%# Eval("Board") %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="<%$ Resources:Application,Subject %>" ItemStyle-Width="150px" ItemStyle-CssClass="Name">
                                                                    <ItemTemplate>
                                                                        <%# Eval("Subject") %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="<%$ Resources:Application,Year %>" ItemStyle-Width="150px" ItemStyle-CssClass="Name">
                                                                    <ItemTemplate>
                                                                        <%# Eval("PassingYear") %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="<%$ Resources:Application,Grade %>" ItemStyle-Width="150px" ItemStyle-CssClass="Name">
                                                                    <ItemTemplate>
                                                                        <%# Eval("Grade") %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="<%$ Resources:Application,GPAScale %>" ItemStyle-Width="150px" ItemStyle-CssClass="Name">
                                                                    <ItemTemplate>
                                                                        <%# Eval("GPAScale")%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="<%$ Resources:Application,Division %>" ItemStyle-Width="150px" ItemStyle-CssClass="Country">
                                                                    <ItemTemplate>
                                                                        <%# Eval("ResultDivision")%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="<%$ Resources:Application,Action %>" ItemStyle-Width="150px" ItemStyle-CssClass="Country">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnkDelete" runat="server" CssClass="fa fa-trash-o" OnCommand="lnkDelete_Command"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <%--This is test----------------------------------------------------------%>
                                                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">
                                                            <i class="fa fa-plus"></i>
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Application,Addnew %>"></asp:Label></button>
                                                        <!-- Modal -->
                                                        <div class="modal fade" id="myModal" role="dialog">
                                                            <div class="modal-dialog">
                                                                <!-- Modal content-->
                                                                <div class="modal-content">
                                                                    <div class="modal-header bg-danger">
                                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                        <h4 class="modal-title">
                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:Application,TeacherEducationInformation %>"></asp:Label></h4>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <div class="col-md-12">
                                                                            <asp:ValidationSummary ID="vsEducation" runat="server" ValidationGroup="education" />
                                                                        </div>
                                                                        <div class="col-md-12">
                                                                            <div class="form-horizontal">
                                                                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Add" />
                                                                                <div class="form-group">
                                                                                    <label for="inputEmail3" class="col-sm-4">
                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:Application,DegreeName %>"></asp:Label></label>
                                                                                    <div class="col-sm-6">
                                                                                        <asp:DropDownList ID="ddlDegree" ClientIDMode="Static" runat="server" CssClass="form-control dropdown">
                                                                                            <asp:ListItem Value="" Text="---Select---"></asp:ListItem>
                                                                                            <asp:ListItem Value="1" Text="SSC"></asp:ListItem>
                                                                                            <asp:ListItem Value="2" Text="HSC"></asp:ListItem>
                                                                                            <asp:ListItem Value="3" Text="A Level"></asp:ListItem>
                                                                                            <asp:ListItem Value="4" Text="O Level"></asp:ListItem>
                                                                                            <asp:ListItem Value="5" Text="Alim"></asp:ListItem>
                                                                                            <asp:ListItem Value="6" Text="Dakhil"></asp:ListItem>
                                                                                            <asp:ListItem Value="7" Text="Honours"></asp:ListItem>
                                                                                            <asp:ListItem Value="8" Text="Master"></asp:ListItem>
                                                                                            <asp:ListItem Value="9" Text="Diploma"></asp:ListItem>
                                                                                            <asp:ListItem Value="10" Text="BA(Pass)"></asp:ListItem>
                                                                                            <asp:ListItem Value="11" Text="B.Ed"></asp:ListItem>
                                                                                            <asp:ListItem Value="12" Text="M.Ed"></asp:ListItem>
                                                                                            <asp:ListItem Value="13" Text="NTRCA"></asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator16" runat="server" ValidationGroup="education"
                                                                                            ErrorMessage="Select Degree Name" ControlToValidate="ddlDegree">*</asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="form-group" id="dvSubject">
                                                                                    <label for="inputEmail3" class="col-sm-4">
                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Application,Subject %>"></asp:Label></label>
                                                                                    <div class="col-sm-6">
                                                                                        <asp:TextBox runat="server" ID="tbxSubject" CssClass="form-control" placeholder="Enter Subject Name"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="inputEmail3" class="col-sm-4">
                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:Application,BordUniversity %>"></asp:Label></label>
                                                                                    <div class="col-sm-6">
                                                                                        <asp:TextBox runat="server" ID="tbxBoard" CssClass="form-control" placeholder="Board or University Name"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="inputEmail3" class="col-sm-4">
                                                                                        <asp:Label ID="Label76" runat="server" Text="<%$ Resources:Application,PassingYear %>"></asp:Label></label>
                                                                                    <div class="col-sm-6">
                                                                                        <asp:TextBox runat="server" ID="tbxYear" CssClass="form-control" placeholder="Enter Passing Year"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="inputEmail3" class="col-sm-4">
                                                                                        <asp:Label ID="Label77" runat="server" Text="<%$ Resources:Application,Result %>"></asp:Label></label>
                                                                                    <div class="col-sm-6">
                                                                                        <asp:DropDownList ID="ddlResult" ClientIDMode="Static" runat="server" CssClass="form-control dropdown">
                                                                                            <asp:ListItem Value="" Text="---Select---"></asp:ListItem>
                                                                                            <asp:ListItem Value="1" Text="First"></asp:ListItem>
                                                                                            <asp:ListItem Value="2" Text="Second"></asp:ListItem>
                                                                                            <asp:ListItem Value="3" Text="Third"></asp:ListItem>
                                                                                            <asp:ListItem Value="4" Text="Grade"></asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator17" runat="server" ValidationGroup="education"
                                                                                            ErrorMessage="Select Result" ControlToValidate="ddlResult">*</asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="form-group" id="dvGrade">
                                                                                    <label for="inputEmail3" class="col-sm-4"></label>
                                                                                    <div class="col-sm-3">
                                                                                        <asp:TextBox runat="server" ID="tbxGrade" CssClass="form-control" placeholder="Grade Point"></asp:TextBox>
                                                                                    </div>
                                                                                    <div class="col-sm-3">
                                                                                        <asp:TextBox runat="server" ID="tbxScale" CssClass="form-control" placeholder="Out of"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <asp:Button class="btn btn-default" ID="btnEducationAdd" runat="server" Text="<%$ Resources:Application,Add %>" OnClick="btnEducationAdd_Click" ValidationGroup="education"></asp:Button>
                                                                        <button type="button" class="btn btn-default" data-dismiss="modal">
                                                                            <asp:Label ID="Label78" runat="server" Text="<%$ Resources:Application,Close %>"></asp:Label></button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-success">
                                            <div class="panel-heading">
                                                <asp:Label ID="Label79" runat="server" Text="<%$ Resources:Application,TeacherTraining %>"></asp:Label>
                                            </div>
                                            <div class="panel-body">
                                                <div class="col-lg-12 col-md-12">
                                                    <div class="form-horizontal">
                                                        <asp:GridView ID="gvTraining" ClientIDMode="Static" CssClass="table" runat="server" AutoGenerateColumns="false">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="<%$ Resources:Application,TrainingName %>" ItemStyle-Width="150px" ItemStyle-CssClass="Name">
                                                                    <ItemTemplate>
                                                                        <%# Eval("TrainingName") %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="<%$ Resources:Application,InstituteName %>" ItemStyle-Width="150px" ItemStyle-CssClass="Name">
                                                                    <ItemTemplate>
                                                                        <%# Eval("InstituteName") %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="<%$ Resources:Application,StartDate %>" ItemStyle-Width="150px" ItemStyle-CssClass="Name">
                                                                    <ItemTemplate>
                                                                        <%# Convert.ToDateTime(Eval("StartDate")).ToString("dd/MM/yyyy") %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="<%$ Resources:Application,EndDate %>" ItemStyle-Width="150px" ItemStyle-CssClass="Name">
                                                                    <ItemTemplate>
                                                                        <%# Convert.ToDateTime(Eval("EndDate")).ToString("dd/MM/yyyy") %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="<%$ Resources:Application,Topics %>" ItemStyle-Width="150px" ItemStyle-CssClass="Name">
                                                                    <ItemTemplate>
                                                                        <%# Eval("Topics") %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="<%$ Resources:Application,Duration %>" ItemStyle-Width="150px" ItemStyle-CssClass="Name">
                                                                    <ItemTemplate>
                                                                        <%# Eval("Duration")%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="<%$ Resources:Application,Action %>" ItemStyle-Width="150px" ItemStyle-CssClass="Country">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnkTrainDelete" runat="server" CssClass="fa fa-trash-o" OnCommand="lnkTrainDelete_Command"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#Training">
                                                            <i class="fa fa-plus"></i>
                                                            <asp:Label ID="Label80" runat="server" Text="<%$ Resources:Application,AddNew %>"></asp:Label></button>

                                                        <!-- Modal -->
                                                        <div class="modal fade" id="Training" role="dialog">
                                                            <div class="modal-dialog">

                                                                <!-- Modal content-->
                                                                <div class="modal-content">
                                                                    <div class="modal-header bg-danger">
                                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                        <h4 class="modal-title">
                                                                            <asp:Label ID="Label81" runat="server" Text="<%$ Resources:Application,TeacherTrainingInformation %>"></asp:Label></h4>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <div class="col-md-12">
                                                                            <asp:ValidationSummary ID="vsTraining" runat="server" ValidationGroup="training" />
                                                                        </div>
                                                                        <div class="col-md-12">
                                                                            <div class="form-horizontal">
                                                                                <div class="form-group">
                                                                                    <label for="inputEmail3" class="col-sm-4">
                                                                                        <asp:Label ID="Label82" runat="server" Text="<%$ Resources:Application,TrainingName %>"></asp:Label></label>
                                                                                    <div class="col-sm-6">
                                                                                        <asp:TextBox ID="tbxTrainingName" runat="server" CssClass="form-control" placeholder="Enter Training Name"></asp:TextBox>
                                                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator18" runat="server" ValidationGroup="training"
                                                                                            ErrorMessage="Enter Training Name" ControlToValidate="tbxTrainingName">*</asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="form-group">
                                                                                    <label for="inputEmail3" class="col-sm-4">
                                                                                        <asp:Label ID="Label83" runat="server" Text="<%$ Resources:Application,InstituteName %>"></asp:Label></label>
                                                                                    <div class="col-sm-6">
                                                                                        <asp:TextBox ID="tbxInstitute" runat="server" CssClass="form-control" placeholder="Enter Institute Name"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="inputEmail3" class="col-sm-4">
                                                                                        <asp:Label ID="Label84" runat="server" Text="<%$ Resources:Application,StartDate %>"></asp:Label></label>
                                                                                    <div class="col-sm-6">
                                                                                        <asp:TextBox ID="tbxStartDate" runat="server" CssClass="form-control" placeholder="Enter Start Date"></asp:TextBox>
                                                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator19" runat="server" ValidationGroup="training"
                                                                                            ErrorMessage="Enter Start Date" ControlToValidate="tbxStartDate">*</asp:RequiredFieldValidator>
                                                                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" PopupButtonID="tbxStartDate" Format="dd/MM/yyyy"
                                                                                            TargetControlID="tbxStartDate">
                                                                                        </cc1:CalendarExtender>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="inputEmail3" class="col-sm-4">
                                                                                        <asp:Label ID="Label85" runat="server" Text="<%$ Resources:Application,EndDate %>"></asp:Label></label>
                                                                                    <div class="col-sm-6">
                                                                                        <asp:TextBox ID="tbxEndDate" runat="server" CssClass="form-control" placeholder="Enter End Date"></asp:TextBox>
                                                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator20" runat="server" ValidationGroup="training"
                                                                                            ErrorMessage="Enter End Date" ControlToValidate="tbxEndDate">*</asp:RequiredFieldValidator>
                                                                                        <cc1:CalendarExtender ID="CalendarExtender3" runat="server" PopupButtonID="tbxEndDate" Format="dd/MM/yyyy"
                                                                                            TargetControlID="tbxEndDate">
                                                                                        </cc1:CalendarExtender>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="inputEmail3" class="col-sm-4">
                                                                                        <asp:Label ID="Label86" runat="server" Text="<%$ Resources:Application,Topics %>"></asp:Label>
                                                                                    </label>
                                                                                    <div class="col-sm-6">
                                                                                        <asp:TextBox ID="tbxTopics" runat="server" CssClass="form-control" placeholder="Enter Topics" TextMode="MultiLine"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <asp:Button ID="btnTraining" runat="server" CssClass="btn btn-default" Text="<%$ Resources:Application,Add %>" OnClick="btnTraining_Click" ValidationGroup="training" />
                                                                        <button type="button" class="btn btn-default" data-dismiss="modal">
                                                                            <asp:Label ID="Label87" runat="server" Text="<%$ Resources:Application,Close %>"></asp:Label></button>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="panel-footer">
                                            <asp:Button ID="btnEducation" runat="server" CssClass="btn btn-primary btn-flat" Text="Save and Continue" OnClick="btnEducation_Click" ValidationGroup="classInfo" />
                                            <button type="button" id="NextClass" onclick="buttonclick('#photo')" class="btn btn-primary btn-flat next">
                                                <asp:Label ID="Label67" runat="server" Text="<%$ Resources:Application,Next %>"></asp:Label></button>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnEducationAdd" />
                                <asp:AsyncPostBackTrigger ControlID="btnTraining" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                    <%-- """""""""""""""""""""""""""""""""""""""""""""""""""""""--%>
                    <div class="tab-pane fade in" id="tab5">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <asp:ValidationSummary ID="ValidationSummary6" runat="server" ValidationGroup="pay" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 text-center">
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:Application,TeacherPhoto %>"></asp:Label></h3>
                                    </div>
                                    <div class="panel-body center-block">
                                        <asp:Image ID="imgSutdent" runat="server" ClientIDMode="Static" class="img-thumbnail" ImageUrl="~/Images/Common/no-photo.jpg" Width="150" Height="150" />
                                        <asp:Label ID="Label60" runat="server" Visible="false"></asp:Label>
                                    </div>
                                    <div class="panel-footer">
                                        <span class="btn btn-info btn-file">
                                            <asp:Label ID="lblBrowse" runat="server" Text="Browse"></asp:Label>
                                            <asp:FileUpload ID="uploderStudent" runat="server" onchange="StudentImage(this)" />
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 text-center">
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            <asp:Label ID="Label64" runat="server" Text="<%$ Resources:Application,FatherPhoto %>"></asp:Label></h3>
                                    </div>
                                    <div class="panel-body center-block">
                                        <asp:Image ID="imgFather" runat="server" ClientIDMode="Static" class="img-thumbnail" ImageUrl="~/Images/Common/no-photo.jpg" Width="150" Height="150" />
                                        <asp:Label ID="lblFather" runat="server" Visible="false"></asp:Label>
                                    </div>
                                    <div class="panel-footer">
                                        <span class="btn btn-info btn-file">
                                            <asp:Label ID="Label30" runat="server" Text="Browse"></asp:Label>
                                            <asp:FileUpload ID="uploadFather" runat="server" onchange="FatherImage(this)" />
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 text-center">
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            <asp:Label ID="Label65" runat="server" Text="<%$ Resources:Application,MotherPhoto %>"></asp:Label></h3>
                                    </div>
                                    <div class="panel-body center-block">
                                        <asp:Image ID="imgMother" runat="server" ClientIDMode="Static" class="img-thumbnail" ImageUrl="~/Images/Common/no-photo.jpg" Width="150" Height="150" />
                                        <asp:Label ID="lblMother" runat="server" Visible="false"></asp:Label>
                                    </div>
                                    <div class="panel-footer">
                                        <span class="btn btn-info btn-file">
                                            <asp:Label ID="Label31" runat="server" Text="Browse"></asp:Label>
                                            <asp:FileUpload ID="uploadMother" runat="server" onchange="MotherImage(this)" />
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel-footer">
                                    <asp:Button ID="btnUpload" runat="server" CssClass="btn btn-primary btn-flat" Text="Finish" OnClick="btnUpload_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- """""""""""""""""""""""""""""""""""""""""""""""""""""""--%>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
    <%--<script src="../../JS/Student.js"></script>--%>
    <script type="text/javascript">
        $(document).ready(function () {
            Load();
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
            function EndRequestHandler(sender, args) {
                Load();
            }
        });
        function Load() {
            $("#dvSubject").hide();
            $("#dvGrade").hide();
            $(".btn-pref .btn").click(function () {
                $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
                $(this).removeClass("btn-default").addClass("btn-primary");
            });

            $("#ddlDegree").change(function () {
                var id = $("#ddlDegree").val();
                if (id == 7 || id == 8 || id == 9) {
                    $("#dvSubject").slideDown('slow');
                }
                else {
                    $("#dvSubject").slideUp('slow');
                }
            });

            $("#ddlResult").change(function () {
                if ($(this).val() == "4") {
                    $("#dvGrade").show();
                } else {
                    $("#dvGrade").hide();
                }
            });
        }

        function buttonclick(btnTab) {
            $(btnTab).trigger('click');
            $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
            $(btnTab).removeClass("btn-default").addClass("btn-primary");
        }

        function StudentImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgSutdent').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        function FatherImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgFather').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        function MotherImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgMother').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>

