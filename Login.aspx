<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <link rel="shortcut icon" href="../Images/Common/logo.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="College Education Responsive Template" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="author" content="Esmet" />
    <link href="/Content/font-awesome-4.6.3/css/font-awesome.min.css" rel="stylesheet"
        type="text/css" />
    <link href="/Content/ionicons-2.0.1/css/ionicons.min.css" rel="stylesheet"
        type="text/css" />
    <!-- Theme style -->
    <link href="Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="Styles/AdminLTE.min.css" rel="stylesheet" />
</head>
<body>
    <div class="login-box">
        <!-- /.login-logo -->
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Admin Login Panel</h3>
            </div>
            <div class="panel-body">
                <form id="formLogin" runat="server">
                    <asp:Panel runat="server" ID="pnlLogin" DefaultButton="LoginButton">
                        <div class="form-login">
                            <div class="col-md-12 pb-10px ">
                                <asp:ValidationSummary ID="validationSummary" runat="server" ValidationGroup="Login" />
                                <span class="LogIn" style="color: red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal></span>
                            </div>
                            <div class="form-group">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Branch</label>
                                <div style="margin-bottom: 25px" class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                    <asp:DropDownList ID="ddlBranch" runat="server" CssClass="form-control">
                                      
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlBranch"
                                        ErrorMessage="Branch is required." ToolTip="Branch is required." ValidationGroup="Login">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">User Name</label>
                                <div style="margin-bottom: 25px" class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <asp:TextBox CssClass="form-control" ID="tbxUserName" runat="server" placeholder="username">
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator Display="None" ID="UserNameRequired" runat="server" ControlToValidate="tbxUserName"
                                        ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Password</label>
                                <div style="margin-bottom: 25px" class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                    <asp:TextBox CssClass="form-control" ID="tbxPassword" runat="server" TextMode="Password"
                                        placeholder="password"></asp:TextBox>
                                    <asp:RequiredFieldValidator Display="None" ID="PasswordRequired" runat="server" ControlToValidate="tbxPassword"
                                        ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div>
                                <asp:Button ID="LoginButton" runat="server" Text="Login" CssClass="btn btn-primary btn-block" OnClick="LoginButton_Click" ValidationGroup="Login" />
                            </div>
                        </div>
                    </asp:Panel>
                </form>
            </div>
            <div class="panel-footer">

                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="#">Forgot Password?</asp:HyperLink>
            </div>
        </div>

    </div>
</body>
</html>
