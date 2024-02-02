<%@ Page Title="Profile" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="Pages_User_Profile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:Panel ID="pnlForStudent" runat="server" Visible="false">
        <div class="panel panel-success">
            <div class="panel-heading">Class Information</div>
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
            <div class="panel panel-footer" align="right">
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#ClassInformation"><i class="fa fa-edit"></i>Edit</button>
            </div>
            <div class="modal fade" id="ClassInformation" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header bg-danger">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Update Class Information</h4>
                        </div>
                        <div class="modal-body">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="classInfo" />
                            <div class="col-lg-6 col-md-6">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-4">
                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label><span class="required">*</span></label>
                                        <div class="col-sm-6">
                                            <asp:DropDownList ID="ddlClass" runat="server" DataTextField="ClassName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator17" runat="server" ValidationGroup="classInfo"
                                                ErrorMessage="Select class" ControlToValidate="ddlClass">*</asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-4">
                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Application,Year %>"></asp:Label><span class="required">*</span></label>
                                        <div class="col-sm-6">
                                            <asp:DropDownList ID="ddlYear" runat="server" Enabled="false" DataTextField="Year" DataValueField="Year" CssClass="form-control dropdown"></asp:DropDownList>
                                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator16" runat="server" ValidationGroup="classInfo"
                                                ErrorMessage="Select year" ControlToValidate="ddlYear">*</asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-4">
                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Application,Group %>"></asp:Label><span class="required">*</span></label>
                                        <div class="col-sm-6">
                                            <asp:DropDownList ID="ddlGroup" runat="server" DataTextField="GroupName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator18" runat="server" ValidationGroup="classInfo"
                                                ErrorMessage="Select group" ControlToValidate="ddlGroup">*</asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-4">
                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,Shift %>"></asp:Label><span class="required">*</span></label>
                                        <div class="col-sm-6">
                                            <asp:DropDownList ID="ddlShift" runat="server" DataTextField="Shift" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator19" runat="server" ValidationGroup="classInfo"
                                                ErrorMessage="Select shift" ControlToValidate="ddlShift">*</asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-4">
                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Application,Section %>"></asp:Label><span class="required">*</span></label>
                                        <div class="col-sm-6">
                                            <asp:DropDownList ID="ddlSection" runat="server" DataTextField="Section" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator20" runat="server" ValidationGroup="classInfo"
                                                ErrorMessage="Select section" ControlToValidate="ddlSection">*</asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-4">
                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,Roll %>"></asp:Label><span class="required">*</span></label>
                                        <div class="col-sm-6">
                                            <asp:TextBox ID="tbxRoll" runat="server" placeholder="Enter Roll No." CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator1" runat="server" ValidationGroup="classInfo"
                                                ErrorMessage="Enter Roll No." ControlToValidate="tbxRoll">*</asp:RequiredFieldValidator>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <%--<asp:Button ID="btnEducation" runat="server" Text="Add" CssClass="btn btn-default" />--%>
                            <asp:Button class="btn btn-default" ValidationGroup="classInfo" OnClick="btnClassInformation_Click" ID="btnClassInformation" runat="server" Text="Update"></asp:Button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </asp:Panel>
    <div class="row">
        <div class="col-sm-3">
            <div class='<%= Common.SessionInfo.Panel %>'>
                <div class="panel-heading">
                    <h3 class="panel-title">Photo</h3>
                </div>
                <div class="panel-body text-center">
                    <asp:Image runat="server" ID="imgPerson" alt="Photo" Height="140" Width="140" />
                </div>
                <div class="panel panel-footer text-center">
                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#Photo"><i class="fa fa-camera"></i>Change</button>
                </div>
                <div class="modal fade" id="Photo" role="dialog">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header bg-danger">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Photo Upload</h4>
                            </div>
                            <div class="modal-body" align="center">
                                <asp:FileUpload ID="uploderStudent" runat="server" CssClass="btn btn-default" />
                                <asp:HiddenField ID="hdnPersonImage" runat="server" />
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnPersoImage" runat="server" CssClass="btn btn-default" Text="Upload" OnClick="btnPersoImage_Click" />
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-9">
            <div class='<%= Common.SessionInfo.Panel %>'>
                <div class="panel-heading">
                    <h3 class="panel-title">Personal Information</h3>
                </div>
                <div class="panel-body">
                    <div class="col-sm-6">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">
                                    <asp:Label ID="lblReg" runat="server" Text="Registration No"></asp:Label></label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblRegNo" runat="server"></asp:Label>
                                    <asp:HiddenField ID="hdnPersonId" runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Name(English)</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblNameEng" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Name(Bangla)</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblNameBan" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Gender</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblGender" runat="server"></asp:Label>
                                </div>

                            </div>

                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Religion</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblReligion" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Blood Group</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblBlood" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">
                                    <asp:Label ID="lblNd" runat="server" Text="NID"></asp:Label></label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblNID" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">
                                    <asp:Label ID="lblJoiningDate" runat="server" Text="Join Date"></asp:Label></label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblJoindate" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Birth Certificate No</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblBirthCertificate" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Date of Birth</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblDoB" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Phone(Home)</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblPhnHome" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Mobile(Home)</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblMobHome" runat="server"></asp:Label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Phone</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblPhn" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Mobile</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblMob" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">
                                    <asp:Label runat="server" ID="lblDesig" Text="Designation"></asp:Label></label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblDesignation" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-footer text-right">
                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#PersonalInfo"><i class="fa fa-edit"></i>Edit</button>
                </div>
                <div class="modal fade" tabindex="-1" id="PersonalInfo" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header bg-danger">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Personal Information Edit</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">
                                                    <asp:Label ID="lblRegnoPop" runat="server" Text="Registratin No."></asp:Label><span class="required">*</span></label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="tbxRegNo" runat="server" placeholder="Enter Registration No." CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Name(English)<span class="required">*</span></label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="tbxNameEng" runat="server" placeholder="Enter Name(English)" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Name(Bangla)<span class="required">*</span></label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="tbxNameBan" runat="server" placeholder="Enter Name(Bangla)" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Gender<span class="required">*</span></label>
                                                <div class="col-sm-6">
                                                    <asp:DropDownList ID="ddlGender" runat="server" DataTextField="Gender" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Religion<span class="required">*</span></label>
                                                <div class="col-sm-6">
                                                    <asp:DropDownList ID="ddlReligion" runat="server" DataTextField="Religion" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Blood Group<span class="required">*</span></label>
                                                <div class="col-sm-6">
                                                    <asp:DropDownList ID="ddlBlood" runat="server" CssClass="form-control dropdown" DataTextField="BloodGroup" DataValueField="Id">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Email<span class="required">*</span></label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="tbxEmail" runat="server" placeholder="Enter Email" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-5">Birth Certificate No.</label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="tbxBirthCertificate" runat="server" placeholder="Enter Birth Certificate No." CssClass="form-control"></asp:TextBox>

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-5">Date of Birth<span class="required">*</span></label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="tbxDateOfBirth" runat="server" CssClass="form-control" placeholder="Enter Date of Birth"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxDateOfBirth"
                                                        TargetControlID="tbxDateOfBirth">
                                                    </cc1:CalendarExtender>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-5">Phone(Home)<span style="color: green">*</span></label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="tbxPhnHome" runat="server" placeholder="Enter Phone(Home)" CssClass="form-control"></asp:TextBox>

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-5">Mobile(Home)<span style="color: green">*</span></label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="tbxMobHome" runat="server" placeholder="Enter Mobile(Home)" CssClass="form-control"></asp:TextBox>

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-5">Phone<span style="color: green">*</span></label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="tbxPhone" runat="server" placeholder="Enter Phone No." CssClass="form-control"></asp:TextBox>

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-5">Mobile<span style="color: green">*</span></label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="tbxMobile" runat="server" placeholder="Enter Mobile No." CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <asp:Panel ID="pnlTeacherNID" Visible="false" runat="server">
                                        <div class="col-md-12">
                                            <div class="form-horizontal">
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-2">
                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:Application,Designation %>"></asp:Label><span class="required">*</span></label>
                                                    <div class="col-sm-4">
                                                        <asp:DropDownList ID="ddlDesignation" runat="server" DataTextField="Designation" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                                    </div>
                                                    <label for="inputEmail3" class="col-sm-2">NID<span style="color: green">*</span></label>
                                                    <div class="col-sm-4">
                                                        <asp:TextBox ID="tbxNID" runat="server" placeholder="Enter NID" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-2">Join Date<span style="color: green">*</span></label>
                                                    <div class="col-sm-4">
                                                        <asp:TextBox ID="tbxJoiningDate" runat="server" placeholder="Enter Joining Date" CssClass="form-control"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="calJoinDate" runat="server" Format="yyyy/MM/dd" TargetControlID="tbxJoiningDate"></cc1:CalendarExtender>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnPersonal" runat="server" CssClass="btn btn-default" Text="Update" OnClick="btnPersonal_Click" />
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-6">
            <div class='<%= Common.SessionInfo.Panel %>'>
                <div class="panel-heading">
                    <h3 class="panel-title">Father Information</h3>
                </div>
                <div class="panel-body">
                    <div class="col-sm-3">
                        <asp:Image runat="server" ID="imgFather" alt="Photo" CssClass="img-responsive img-thumbnail" />
                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#FatherPhoto"><i class="fa fa-camera"></i>Change</button>
                        <div class="modal fade" id="FatherPhoto" role="dialog">
                            <div class="modal-dialog modal-md">
                                <div class="modal-content">
                                    <div class="modal-header bg-danger">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Father Photo Upload</h4>
                                    </div>
                                    <div class="modal-body text-center">
                                        <asp:FileUpload ID="upFather" runat="server" CssClass="btn btn-default" />
                                        <asp:HiddenField ID="hdnFatherImage" runat="server" />
                                    </div>
                                    <div class="modal-footer">
                                        <asp:Button ID="btnFatherImage" runat="server" CssClass="btn btn-default" Text="Upload" OnClick="btnFatherImage_Click" />
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-sm-9">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Father Name</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblFatherName" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Qualification</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblFatherEdu" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Profession</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblFatherPro" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">National Id</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblFatherNId" runat="server"></asp:Label>
                                </div>

                            </div>

                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Phone No.</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblFatherPhn" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Yearly Income</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblFatherIncome" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="panel panel-footer" align="right">
                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#FatherInfo"><i class="fa fa-edit"></i>Edit</button>
                </div>
                <div class="modal fade" id="FatherInfo" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header bg-danger">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Father Information Edit</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Father Name<span class="required">*</span></label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="tbxFathername" runat="server" placeholder="Enter Father Name" CssClass="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator8" runat="server" ValidationGroup="save"
                                                        ErrorMessage="Enter Father Name" ControlToValidate="tbxFathername">*</asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Father Edu. Qualification<span class="required">*</span></label>
                                                <div class="col-sm-6">
                                                    <asp:DropDownList ID="ddlFatherEdu" runat="server" DataTextField="Qualification" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Father Profession<span class="required">*</span></label>
                                                <div class="col-sm-6">
                                                    <asp:DropDownList ID="ddlFatherPro" runat="server" DataTextField="Profession" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="col-lg-6 col-md-6">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Father Phone No.</label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="tbxFatherPhn" runat="server" placeholder="Enter Father Phone No." CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Father National ID<span class="required">*</span></label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="tbxFatherNID" runat="server" placeholder="Enter Father National ID" CssClass="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator13" runat="server" ValidationGroup="save"
                                                        ErrorMessage="Enter Father National ID" ControlToValidate="tbxFatherNID">*</asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Father Yearly Income</label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="tbxFatherIncome" runat="server" placeholder="Enter Father Yearly Income" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnFatherInfo" runat="server" CssClass="btn btn-default" Text="Update" OnClick="btnFatherInfo_Click" />
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class='<%= Common.SessionInfo.Panel %>'>
                <div class="panel-heading">
                    <h3 class="panel-title">Mother Information</h3>
                </div>
                <div class="panel-body">
                    <div class="col-sm-3">
                        <asp:Image runat="server" ID="imgMother" alt="Photo" CssClass="img-responsive img-thumbnail" />
                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#MotherPhoto"><i class="fa fa-camera"></i>Change</button>
                        <div class="modal fade" id="MotherPhoto" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">
                                    <div class="modal-header bg-danger">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Mother Photo Upload</h4>
                                    </div>
                                    <div class="modal-body" align="center">
                                        <asp:FileUpload ID="upMother" runat="server" CssClass="btn btn-warning" />
                                        <asp:HiddenField ID="hdnMotherImage" runat="server" />
                                    </div>
                                    <div class="modal-footer">
                                        <asp:Button ID="btnMother" runat="server" CssClass="btn btn-default" Text="Upload" OnClick="btnMother_Click" />
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-sm-9">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Mother Name</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblMotherName" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Qualification</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblMotherEdu" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Profession</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblMotherPro" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">National Id</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblMotherNId" runat="server"></asp:Label>
                                </div>

                            </div>

                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Phone No.</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblMotherPhn" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Yearly Income</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblMotherIncome" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="panel panel-footer" align="right">
                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#MotherInfo"><i class="fa fa-edit"></i>Edit</button>
                </div>
                <div class="modal fade" id="MotherInfo" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header bg-danger">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Mother Information Edit</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Mother Name<span class="required">*</span></label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="tbxMotherName" runat="server" placeholder="Enter Mother Name" CssClass="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator11" runat="server" ValidationGroup="save"
                                                        ErrorMessage="Enter Mother Name" ControlToValidate="tbxMotherName">*</asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Mother Edu. Qualification<span class="required">*</span></label>
                                                <div class="col-sm-6">
                                                    <asp:DropDownList ID="ddlMotherEdu" runat="server" DataTextField="Qualification" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Mother Profession<span class="required">*</span></label>
                                                <div class="col-sm-6">
                                                    <asp:DropDownList ID="ddlMotherPro" runat="server" DataTextField="Profession" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="col-lg-6 col-md-6">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Mother Phone No.</label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="tbxMotherPhn" runat="server" placeholder="Enter Mother Phone No." CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Mother National ID<span class="required">*</span></label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="tbxMotherNID" runat="server" placeholder="Enter Mother National ID" CssClass="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator5" runat="server" ValidationGroup="save"
                                                        ErrorMessage="Enter Mother National ID" ControlToValidate="tbxMotherNID">*</asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Mother Yearly Income</label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="tbxMotherIncome" runat="server" placeholder="Enter Mother Yearly Income" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnMotherInfo" runat="server" CssClass="btn btn-default" Text="Update" OnClick="btnMotherInfo_Click" />
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-6">
            <div class='<%= Common.SessionInfo.Panel %>'>
                <div class="panel-heading">
                    <h3 class="panel-title">Present Address</h3>
                </div>
                <div class="panel-body">
                    <div class="col-sm-12">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Division</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblPresentDiv" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">District</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblPresentDis" ClientIDMode="Static" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Thana</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblPresentThana" ClientIDMode="Static" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Post Office</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblPresentPO" runat="server"></asp:Label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Postal Code</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblPresentPC" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Address</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblPresentAddress" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="panel panel-footer text-right">
                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#PresentAdd"><i class="fa fa-edit"></i>Edit</button>
                </div>
                <div class="modal fade" id="PresentAdd" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header bg-danger">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Present Address</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Division</label>
                                                <div class="col-sm-6">
                                                    <asp:DropDownList ID="ddlPresentDiv" ClientIDMode="Static" runat="server" DataTextField="Division" DataValueField="Id"
                                                        CssClass="form-control dropdown">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">District</label>
                                                <div class="col-sm-6">
                                                    <asp:DropDownList ID="ddlPresentDis" ClientIDMode="Static" runat="server" DataTextField="District" DataValueField="Id"
                                                        CssClass="form-control dropdown">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Thana</label>
                                                <div class="col-sm-6">
                                                    <asp:DropDownList ID="ddlPresentThana" ClientIDMode="Static" runat="server" DataTextField="Thana" DataValueField="Id"
                                                        CssClass="form-control dropdown">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="col-lg-6 col-md-6">
                                        <div class="form-horizontal">

                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Post Office</label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="tbxPostOffice" runat="server" ClientIDMode="Static" placeholder="Enter Post Office" CssClass="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator25" runat="server" ValidationGroup="save"
                                                        ErrorMessage="Enter Post Office" ControlToValidate="tbxPostOffice">*</asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Postal Code</label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="tbxPostalCode" runat="server" ClientIDMode="Static" placeholder="Enter Postal Code" CssClass="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator22" runat="server" ValidationGroup="save"
                                                        ErrorMessage="Enter Postal Code" ControlToValidate="tbxPostalCode">*</asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Address</label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="tbxPresentAddress" runat="server" ClientIDMode="Static" placeholder="Enter Address" CssClass="form-control"
                                                        TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnPresentAddress" runat="server" CssClass="btn btn-default" Text="Update" OnClick="btnPresentAddress_Click" />
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class='<%= Common.SessionInfo.Panel %>'>
                <div class="panel-heading">
                    <h3 class="panel-title">Permanent Address</h3>
                </div>
                <div class="panel-body">
                    <div class="col-sm-12">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Division</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblPermanentDiv" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">District</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblPermanentDis" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Thana</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblPermanentThana" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Post Office</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblPermanentPO" runat="server"></asp:Label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Postal Code</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblPermanentPC" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-6">Address</label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblPermanentAddress" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="panel panel-footer" align="right">
                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#PermanentAdd"><i class="fa fa-edit"></i>Edit</button>
                </div>
                <div class="modal fade" id="PermanentAdd" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header bg-danger">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Permanent Address</h4>
                            </div>
                            <div class="modal-body" align="center">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Division</label>
                                                <div class="col-sm-6">
                                                    <asp:DropDownList ID="ddlPermanentDiv" ClientIDMode="Static" runat="server" DataTextField="Division" DataValueField="Id"
                                                        CssClass="form-control dropdown">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">District</label>
                                                <div class="col-sm-6">
                                                    <asp:DropDownList ID="ddlPermanentDis" ClientIDMode="Static" runat="server" DataTextField="District"
                                                        DataValueField="Id" CssClass="form-control dropdown">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Thana</label>
                                                <div class="col-sm-6">
                                                    <asp:DropDownList ID="ddlPermanentThana" ClientIDMode="Static" runat="server" DataTextField="Thana" DataValueField="Id"
                                                        CssClass="form-control dropdown">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <div class="form-horizontal">

                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Post Office</label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="tbxPermanentPost" runat="server" ClientIDMode="Static" placeholder="Enter Post Office" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Postal Code</label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="tbxPermanentPostCode" runat="server" ClientIDMode="Static" placeholder="Enter Postal Code" CssClass="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator28" runat="server" ValidationGroup="save"
                                                        ErrorMessage="Enter Postal Code" ControlToValidate="tbxPermanentPostCode">*</asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4">Address</label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="tbxPermanentAddress" runat="server" ClientIDMode="Static" placeholder="Enter Address" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnPermanentAddress" runat="server" CssClass="btn btn-default" Text="Update" OnClick="btnPermanentAddress_Click" />
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <asp:Panel ID="pnlForTeacher" runat="server">
        <div class="row">
            <div class="col-sm-12">
                <div class='<%= Common.SessionInfo.Panel %>'>
                    <div class="panel-heading">
                        <h3 class="panel-title">Education</h3>
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
                                                <asp:ImageButton ID="btnDelete" runat="server" OnCommand="btnDelete_Command" CommandArgument='<%# Eval("Id")%>' ImageUrl="~/Images/Common/delete.png" ToolTip="Delete" OnClientClick="return confirm('Are you sure?')" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-footer" align="right">
                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#Education"><i class="fa fa-edit"></i>Edit</button>
                    </div>
                    <div class="modal fade" id="Education" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header bg-danger">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Teacher Education Information</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="form-horizontal">
                                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="Add" />
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-4">Degree Name</label>
                                            <div class="col-sm-6">
                                                <asp:DropDownList ID="ddlDegree" ClientIDMode="Static" runat="server" CssClass="form-control dropdown">
                                                    <asp:ListItem Value="1" Text="SSC"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="HSC"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="A Level"></asp:ListItem>
                                                    <asp:ListItem Value="4" Text="O Level"></asp:ListItem>
                                                    <asp:ListItem Value="5" Text="Alim"></asp:ListItem>
                                                    <asp:ListItem Value="6" Text="Dakhil"></asp:ListItem>
                                                    <asp:ListItem Value="7" Text="Honours"></asp:ListItem>
                                                    <asp:ListItem Value="8" Text="Master"></asp:ListItem>
                                                    <asp:ListItem Value="9" Text="Diploma"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <div class="form-group" id="dvSubject">
                                            <label for="inputEmail3" class="col-sm-4">Subject</label>
                                            <div class="col-sm-6">
                                                <asp:TextBox runat="server" ID="tbxSubject" CssClass="form-control" placeholder="Enter Subject Name"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-4">Bord/University</label>
                                            <div class="col-sm-6">
                                                <asp:TextBox runat="server" ID="tbxBoard" CssClass="form-control"
                                                    placeholder="Board or University Name"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-4">Passing Year</label>
                                            <div class="col-sm-6">
                                                <asp:TextBox runat="server" ID="tbxYear" CssClass="form-control" placeholder="Enter Passing Year"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-4">Result</label>
                                            <div class="col-sm-6">
                                                <asp:DropDownList ID="ddlResult" ClientIDMode="Static" runat="server" CssClass="form-control dropdown">
                                                    <asp:ListItem Value="1" Text="First"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="Second"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="Third"></asp:ListItem>
                                                    <asp:ListItem Value="4" Text="Grade"></asp:ListItem>
                                                </asp:DropDownList>
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
                                <div class="modal-footer">
                                    <%--<asp:Button ID="btnEducation" runat="server" Text="Add" CssClass="btn btn-default" />--%>
                                    <asp:Button class="btn btn-default" OnClick="btnEducation_Click" ID="btnEducation" runat="server" Text="Add"></asp:Button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
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
                        <h3 class="panel-title">Training</h3>
                    </div>
                    <div class="panel-body">
                        Training
                    </div>
                    <div class="panel panel-footer" align="right">
                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#Training"><i class="fa fa-edit"></i>Edit</button>
                    </div>
                    <div class="modal fade" id="Training" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header bg-danger">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Teacher Training Information</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-4">Training Name</label>
                                            <div class="col-sm-6">
                                                <asp:TextBox ID="tbxTrainingName" runat="server" CssClass="form-control" placeholder="Enter Training Name"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-4">Institute</label>
                                            <div class="col-sm-6">
                                                <asp:TextBox ID="tbxInstitute" runat="server" CssClass="form-control" placeholder="Enter Institute Name"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-4">Start Date</label>
                                            <div class="col-sm-6">
                                                <asp:TextBox ID="tbxStartDate" runat="server" CssClass="form-control" placeholder="Enter Start Date"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" PopupButtonID="tbxStartDate"
                                                    TargetControlID="tbxStartDate">
                                                </cc1:CalendarExtender>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-4">End Date</label>
                                            <div class="col-sm-6">
                                                <asp:TextBox ID="tbxEndDate" runat="server" CssClass="form-control" placeholder="Enter End Date"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender3" runat="server" PopupButtonID="tbxEndDate"
                                                    TargetControlID="tbxEndDate">
                                                </cc1:CalendarExtender>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-4">Topics Cover</label>
                                            <div class="col-sm-6">
                                                <asp:TextBox ID="tbxTopics" runat="server" CssClass="form-control" placeholder="Enter Topics" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <div class="row">
        <div class="col-sm-12">
            <div class='<%= Common.SessionInfo.Panel %>'>
                <div class="panel-heading">
                    <h3 class="panel-title">Other Information</h3>
                </div>
                <div class="panel-body">
                    Other Information
                </div>
                <div class="panel panel-footer" align="right">
                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#Training"><i class="fa fa-edit"></i>Edit</button>
                </div>
            </div>
        </div>
    </div>
    <script src="../../jquery/jquery-2.1.1.min.js"></script>
    <script src="../../JS/LoadAddress.js"></script>

</asp:Content>

