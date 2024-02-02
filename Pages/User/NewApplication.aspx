<%@ Page Title="New Application" Language="C#" MasterPageFile="~/MasterPage/Site.master" AutoEventWireup="true" CodeFile="NewApplication.aspx.cs" Inherits="Pages_User_NewApplication" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="Server">
    <style type="text/css">
        .modalBackground {
            background-color: black;
            filter: alpha(opacity=80);
            opacity: 0.8;
        }

        .modalPoup {
            background-color: #fff;
            text-align: center;
            min-height: 400px;
            color: green;
        }

        .modalPoupf {
            background-color: #fff;
            min-height: 70px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="col-md-12 text-center">
        <div class="page-header">
            <span class="text-center">
                <img src="/Images/Common/Logo of PRPS.jpg" height="100" width="150" /></span>
            <h1 class="panel-title"><b>PRAN-RFL PUBLIC SCHOOL</b></h1>
            <small>Application Form</small>
        </div>
    </div>
    <div class="col-md-12 col-sm-12 col-xs-12">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="basic" />
    </div>
    <div class="row">
        <asp:UpdatePanel ID="updateBasic" runat="server">
            <ContentTemplate>
                <div class="col-md-8">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:Application,NameEng %>"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-7">
                                <asp:TextBox ID="tbxNameEng" runat="server" placeholder="Enter Name(English)" CssClass="form-control" MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="basic" Display="None"
                                    ErrorMessage="Enter Name(English)" ControlToValidate="tbxNameEng">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:Application,FatherName %>"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-7">
                                <asp:TextBox ID="tbxFathername" runat="server" placeholder="Enter Father Name" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator8" runat="server" ValidationGroup="parent"
                                    ErrorMessage="Enter Father Name" ControlToValidate="tbxFathername">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:Application,MotherName %>"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-7">
                                <asp:TextBox ID="tbxMotherName" runat="server" placeholder="Enter Mother Name" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator11" runat="server" ValidationGroup="parent"
                                    ErrorMessage="Enter Mother Name" ControlToValidate="tbxMotherName">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:Application,Gender %>"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-7">
                                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control dropdown"></asp:DropDownList>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator12" runat="server" ValidationGroup="basic"
                                    ErrorMessage="Select Gender" ControlToValidate="ddlGender">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:Application,Religion %>"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-7">
                                <asp:DropDownList ID="ddlReligion" runat="server" DataTextField="Religion" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator14" runat="server" ValidationGroup="basic"
                                    ErrorMessage="Select Religion" ControlToValidate="ddlReligion">*</asp:RequiredFieldValidator>

                            </div>
                        </div>


                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:Application,DateofBirth %>"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-7">
                                <asp:TextBox ID="tbxDateOfBirth" runat="server" CssClass="form-control" placeholder="dd/MM/yyyy"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator7" runat="server" ValidationGroup="basic"
                                    ErrorMessage="Enter Date of Birth" ControlToValidate="tbxDateOfBirth">*</asp:RequiredFieldValidator>
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" PopupButtonID="tbxDateOfBirth"
                                    TargetControlID="tbxDateOfBirth">
                                </cc1:CalendarExtender>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:Application,MobileSMS %>"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-7">
                                <asp:TextBox ID="tbxMobile" runat="server" placeholder="01*********" CssClass="form-control" MaxLength="15"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="txt_nid_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" FilterType="Numbers" TargetControlID="tbxMobile">
                                </cc1:FilteredTextBoxExtender>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator6" runat="server" ValidationGroup="basic"
                                    ErrorMessage="Enter Mobile No." ControlToValidate="tbxMobile">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:Application,MobileHome %>"></asp:Label></label>
                            <div class="col-sm-7">
                                <asp:TextBox ID="tbxMobHome" runat="server" placeholder="Enter Mobile(Home)" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:Application,Email %>"></asp:Label></label>
                            <div class="col-sm-7">
                                <asp:TextBox ID="tbxEmail" runat="server" placeholder="Enter Email Address." CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Application,Nationality %>"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-7">
                                <asp:TextBox ID="tbxNationality" runat="server" CssClass="form-control" placeholder="Enter Nationality"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator1" runat="server" ValidationGroup="basic"
                                    ErrorMessage="Enter Nationality" ControlToValidate="tbxNationality">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label46" runat="server" Text="<%$ Resources:Application,Division %>"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-7">
                                <asp:DropDownList ID="ddlPresentDiv" runat="server" CssClass="form-control dropdown" OnSelectedIndexChanged="ddlPresentDiv_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator27" runat="server" ValidationGroup="basic"
                                    ErrorMessage="Select Present Division" ControlToValidate="ddlPresentDiv">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label47" runat="server" Text="<%$ Resources:Application,District %>"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-7">
                                <asp:DropDownList ID="ddlPresentDis" runat="server" CssClass="form-control dropdown" OnSelectedIndexChanged="ddlPresentDis_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator29" runat="server" ValidationGroup="basic"
                                    ErrorMessage="Select Present District" ControlToValidate="ddlPresentDis">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label48" runat="server" Text="<%$ Resources:Application,Thana %>"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-7">
                                <asp:DropDownList ID="ddlPresentThana" runat="server" CssClass="form-control dropdown"></asp:DropDownList>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator30" runat="server" ValidationGroup="basic"
                                    ErrorMessage="Select Present Thana" ControlToValidate="ddlPresentThana">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Application,PostOffice %>"></asp:Label></label>
                            <div class="col-sm-7">
                                <asp:TextBox ID="tbxPostOffice" runat="server" ClientIDMode="Static" placeholder="Enter Post Office" CssClass="form-control"></asp:TextBox>

                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label50" runat="server" Text="<%$ Resources:Application,PostalCode %>"></asp:Label></label>
                            <div class="col-sm-7">
                                <asp:TextBox ID="tbxPostalCode" runat="server" ClientIDMode="Static" placeholder="Enter Postal Code" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label51" runat="server" Text="<%$ Resources:Application,Address %>"></asp:Label></label>
                            <div class="col-sm-7">
                                <asp:TextBox ID="tbxPresentAddress" runat="server" ClientIDMode="Static" placeholder="Enter Address" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="col-md-4 text-center">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <asp:Label ID="Label63" runat="server" Text="<%$ Resources:Application,StudentPhoto %>"></asp:Label></h3>
                </div>
                <div class="panel-body center-block">
                    <asp:Image ID="imgSutdent" runat="server" ClientIDMode="Static" class="img-thumbnail" ImageUrl="~/Images/Common/no-photo.jpg" Width="150" Height="150" />
                    <asp:Label ID="Label60" runat="server" Visible="false"></asp:Label>
                </div>
                <div class="panel-footer">
                    <span class="btn btn-info btn-file">
                        <asp:Label ID="lblBrowse" runat="server" Text="Browse"></asp:Label>
                        <asp:FileUpload ID="uploderStudent" runat="server" onchange="StudentImage(this)" />
<asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator3" runat="server" ValidationGroup="basic"
                                    ErrorMessage="Please select Photo" ControlToValidate="uploderStudent">*</asp:RequiredFieldValidator>                   
 </span>
                </div>
            </div>
            <hr />
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,ApplyTo %>"></asp:Label></h3>
                </div>
                <div class="panel-body text-left">
                    <hr />
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Application,Year %>"></asp:Label></label>
                            <div class="col-sm-8">
                                <asp:Label ID="lbApplyYear" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label></label>
                            <div class="col-sm-8">
                                <asp:Label ID="lbApplyClass" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4">
                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:Application,Group %>"></asp:Label><span class="required">*</span></label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddlGroup" runat="server" DataTextField="GroupName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                                <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator18" runat="server" ValidationGroup="basic"
                                    ErrorMessage="Select group" ControlToValidate="ddlGroup">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <hr />
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Application,Quota %>"></asp:Label></h3>
                </div>
                <div class="panel-body text-left">
                    <div class="checkbox">
                        <label>
                            <asp:RadioButtonList ID="chklQuota" runat="server" DataTextField="QuotaName" DataValueField="Id"></asp:RadioButtonList>
                        </label>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="panel-footer">
                <asp:Button ID="btnBasic" runat="server" CssClass="btn btn-primary btn-flat pull-right" Text="Send Application" ValidationGroup="basic" OnClick="btnBasic_Click" />
            </div>
        </div>
    </div>
    <asp:Label ID="lbPopup" runat="server"></asp:Label>

    <cc1:ModalPopupExtender ID="mpApplicationId" PopupControlID="pnlApplicationId" BackgroundCssClass="modalBackground" runat="server" CancelControlID="Label5" TargetControlID="lbPopup"></cc1:ModalPopupExtender>
    <asp:Panel ID="pnlApplicationId" runat="server">
        <div class="col-md-12">
            <asp:Label ID="Label5" runat="server"></asp:Label>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h1 class="panel-title">Application ID</h1>
                </div>
                <div class="panel-body modalPoup">
                    <div class="col-md-8 col-md-offset-2">
                        <h3 class="panel-heading">
                            <asp:Label ID="mplbApplicantName" runat="server"></asp:Label>!.<br />
                            Your Application has been submitted successfully.</h3>
                        <hr />
                        <h3>Your Application ID is :
                        <asp:Label ID="mplbApplicationId" runat="server"></asp:Label></h3>
                        <hr />


                        <h4>Use this number as Payment reference to download admit card.</h4>
                        <asp:Button ID="btnSave" OnClick="btnSave_Click" runat="server" CssClass="btn btn-success" Text="Download" />
                    </div>
                </div>
                <div class="panel-footer modalPoupf">
                    <asp:Button ID="btnOk" OnClick="btnOk_Click" runat="server" CssClass="btn btn-warning pull-right" Text="Download Later" />
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphRight" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="Server">
    <script type="text/javascript">
        function StudentImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgSutdent').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>
