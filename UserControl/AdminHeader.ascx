<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminHeader.ascx.cs" Inherits="UserControl_AdminHeader" %>
<header class="main-header">
    <!-- Logo -->
    <a href="/HomePages/GlobalHomePage.aspx" target="_blank" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>PRG</b></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>School</b> Management</span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- Notifications: style can be found in dropdown.less -->
                <li class="dropdown notifications-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-bell-o"></i>
                        <span id="lblNotice" class="label label-warning" runat="server"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="header">You have
                            <asp:Label ID="lblcount" runat="server"></asp:Label>
                            notifications</li>
                        <li>
                            <!-- inner menu: contains the actual data -->
                            <ul class="menu">
                                <li>
                                    <asp:Repeater ID="rptNotice" runat="server">
                                        <ItemTemplate>
                                            <table id="example12" class="table table-bordered table-hover">
                                                <tr>
                                                    <td>
                                                        <a href="<%#String.Concat("../../Pages/Notification/View.aspx?Id=",Eval("ID")) %>">
                                                            <i class="fa fa-envelope"></i><%#Eval("Title") %>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </li>

                            </ul>
                        </li>
                        <li class="footer"><a href="#">View all</a></li>
                    </ul>
                </li>
                <li><a href="/HomePages/GlobalHomePage.aspx" target="_blank" title="Website"><i class="fa fa-globe"></i> Web</a></li>
                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="../../Images/Common/avatar5.png" class="img-circle" height="15" width="15" />
                        <span class="hidden-xs">
                            <asp:Label ID="lblUser" runat="server"></asp:Label></span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img src="../../Images/Common/avatar5.png" class="img-circle" />
                            <div>
                                <h3>PRAN</h3>

                            </div>
                        </li>
                        <!-- Menu Body -->
                        <li class="user-body">
                            <div class="row">
                                <div class="col-sm-12 text-center" style="color: white;">
                                    <a href="../../Pages/UserManagement/ChangePassword.aspx" class="btn btn-block btn-default btn-flat">Change Password</a>

                                </div>
                            </div>
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <asp:LinkButton ID="lnbProfile" runat="server" CssClass="btn btn-info btn-flat" Text="Profile" OnClick="lnbProfile_Click"></asp:LinkButton>
                            </div>
                            <div class="pull-right">
                                <asp:Button ID="btnLogout" UseSubmitBehavior="false" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn btn-default btn-flat" />
                            </div>
                        </li>
                    </ul>
                </li>
                <!-- Control Sidebar Toggle Button -->
                <%-- <li>
                    <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                </li>--%>
            </ul>
        </div>

    </nav>
</header>
