<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu.ascx.cs" Inherits="UserControl_Menu" %>
<div class="responsive-navigation visible-sm visible-xs">
    <a href="#" class="menu-toggle-btn">
        <i class="fa fa-bars"></i>
    </a>
    <div class="responsive_menu">
        <ul class="main_menu">
            <li class="active"><a href="/HomePages/GlobalHomePage.aspx">
                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Header,Home %>"></asp:Label></a></li>
            <li><a href="#">
                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Header,AboutUs %>"></asp:Label></a>
                <ul>
                    <li><a href="../../Pages/User/AboutUs.aspx">
                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Header,School %>"></asp:Label></a></li>
                    <li><a href="/Pages/User/Management.aspx">
                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Header,Management %>"></asp:Label></a></li>
                    <li><a href="/Pages/User/ECActivities.aspx">
                        <asp:Label ID="Label66" runat="server" Text="EC Activities"></asp:Label></a></li>
                </ul>
            </li>
            <li><a href="#">
                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Header,Rules %>"></asp:Label></a>
                <ul>
                    <%--<li><a href="/Pages/User/Admission.aspx">
                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Header,Admission %>"></asp:Label></a></li>--%>
                    <li><a href="/Pages/User/Descipline.aspx">
                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Header,Discipline %>"></asp:Label></a></li>
                    <li><a href="/Pages/User/Uniform.aspx">
                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:Header,Uniform %>"></asp:Label></a></li>
                    <%--<li><a href="/Pages/User/Fees.aspx">
                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:Header,Fees %>"></asp:Label></a></li>--%>
                    <li><a href="/Pages/User/waiver.aspx">
                        <asp:Label ID="Label20" runat="server" Text="Waiver"></asp:Label></a></li>
                    <li><a href="/Pages/User/Payment.aspx">
                        <asp:Label ID="Label62" runat="server" Text="<%$ Resources:Header,Payment %>"></asp:Label></a></li>
                </ul>
            </li>
            <li><a href="#">
                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:Header,Routine %>"></asp:Label></a>
                <ul>
                    <li><a href="#">
                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:Header,ClassRoutine %>"></asp:Label></a></li>
                    <li><a href="#">
                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:Header,ExamRoutine %>"></asp:Label></a></li>
                </ul>
            </li>
            <li><a href="../../Pages/User/Result.aspx">
                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:Header,Result %>"></asp:Label></a>
            </li>
            <li><a href="/Pages/User/Notice.aspx">
                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:Header,Notice %>"></asp:Label></a>
            </li>
            <li><a href="#">
                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:Header,Media %>"></asp:Label></a>
                <ul>
                    <li><a href="../../Pages/User/News.aspx">
                        <asp:Label ID="Label41" runat="server" Text="<%$ Resources:Header,News %>"></asp:Label></a>
                    </li>
                    <li><a href="../../Pages/User/EventCalendar.aspx">
                        <asp:Label ID="Label42" runat="server" Text="<%$ Resources:Header,Event %>"></asp:Label></a>
                    </li>
                    <li><a href="#">
                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:Header,Gallery %>"></asp:Label></a></li>
                    <li><a href="#">
                        <asp:Label ID="Label44" runat="server" Text="<%$ Resources:Header,Video %>"></asp:Label></a></li>
                    <li><a href="#">
                        <asp:Label ID="Label45" runat="server" Text="<%$ Resources:Header,Audio %>"></asp:Label></a></li>
                    <li><a href="/Pages/User/Downloads.aspx">
                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:Header,Downloads %>"></asp:Label></a>
                    </li>
                </ul>
            </li>
            <li><a href="#">
                <asp:Label ID="Label48" runat="server" Text="<%$ Resources:Header,Admission %>"></asp:Label></a>
                <ul>
                   <%-- <li><a href="/Pages/User/AdmissionCircular.aspx">
                        <asp:Label ID="Label49" runat="server" Text="<%$ Resources:Header,AdmissionCircular %>"></asp:Label></a></li>--%>
                    <li><a href="/Pages/User/AdmissionCircular.aspx">
                        <asp:Label ID="Label50" runat="server" Text="<%$ Resources:Header,NewApplication %>"></asp:Label></a></li>
                    <li><a href="/Pages/User/ApplicationDownload.aspx">
                        <asp:Label ID="Label58" runat="server" Text="<%$ Resources:Header,ApplicationDownload %>"></asp:Label></a></li>
                    <li><a href="/Pages/User/ApplicationPayment.aspx">
                        <asp:Label ID="Label61" runat="server" Text="<%$ Resources:Header,ApplicationPayment %>"></asp:Label></a></li>
                    <li><a href="/Pages/User/AdmitCard.aspx">
                        <asp:Label ID="Label57" runat="server" Text="<%$ Resources:Header,AdmitCard %>"></asp:Label></a></li>
                    <li><a href="/Pages/User/AdmissionTestSchedule.aspx">
                        <asp:Label ID="Label64" runat="server" Text="Exam Schedule"></asp:Label></a></li>
                    <li><a href="/Pages/User/AdmissionResult.aspx">
                        <asp:Label ID="Label56" runat="server" Text="<%$ Resources:Header,AdmissionResult %>"></asp:Label></a></li>

                </ul>
            </li>
            <li><a href="../../Pages/User/ContactUs.aspx">
                <asp:Label ID="Label47" runat="server" Text="<%$ Resources:Header,ContactUs %>"></asp:Label></a></li>
        </ul>
        <!-- /.main_menu -->
        <%--<ul class="social_icons">
            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
            <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
            <li><a href="#"><i class="fa fa-rss"></i></a></li>
        </ul>--%>
        <!-- /.social_icons -->
    </div>
    <!-- /.responsive_menu -->
</div>
<!-- /responsive_navigation -->

<header class="site-header">
    <section class="container">
        <div class="row">
            <div class="col-md-3 header-left">
                <p><i class="fa fa-phone"></i>+8801844604571</p>
                <p><i class="fa fa-envelope"></i><a href="mailto:admin@prps.edu.bd">admin@prps.edu.bd</a></p>
            </div>
            <!-- /.header-left -->

            <div class="col-md-6 text-center">
                <div class="logo">
                    <a href="~/HomePages/GlobalHomePage.aspx" title="School" rel="home">
                        <img src="../../Images/Common/PRPS.png" height="70" alt="PRAN RFL PUBLIC SCHOOL" /><h3>
                            <asp:Label ID="lblSchool" runat="server"></asp:Label></h3>
                    </a>

                </div>

            </div>
            <!-- /.col-md-4 -->
            <%--<div class="col-sm-1"></div>--%>
            <div class="col-sm-3 header-right">
                <ul class="small-links">
                    <li>
                        <asp:LinkButton ID="lnkBangla" runat="server" Text="বাংলা" OnClick="lnkBangla_Click"></asp:LinkButton>
                        <asp:LinkButton ID="lnkEnglish" runat="server" Text="English" OnClick="lnkEnglish_Click"></asp:LinkButton>
                    </li>
                    <li><a href="../../Login.aspx">
                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:Header,Login %>"></asp:Label></a></li>
                </ul>
                <div class="search-form">
                    <div id="imaginary_container">
                        <div class="input-group stylish-input-group">
                            <asp:TextBox ID="tbxHeaderSearch" runat="server" placeholder="Search the site..." CssClass="form-control" />
                            <span class="input-group-addon">
                                <button type="submit">
                                    <span class="fa fa-search-plus"></span>
                                </button>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.header-right -->
        </div>
    </section>
    <!-- /.container -->

    <div class="nav-bar-main" role="navigation">
        <section class="container">
            <nav class="main-navigation clearfix visible-md visible-lg" role="navigation">
                <ul class="main-menu sf-menu">
                    <li class="active"><a href="/HomePages/GlobalHomePage.aspx">
                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Header,Home %>"></asp:Label></a></li>
                    <li><a href="#">
                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Header,AboutUs %>"></asp:Label></a>
                        <ul class="sub-menu">
                            <li><a href="../../Pages/User/AboutUs.aspx">
                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:Header,School %>"></asp:Label></a></li>
                            <li><a href="/Pages/User/Management.aspx">
                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:Header,Management %>"></asp:Label></a></li>
                            <li><a href="/Pages/User/ECActivities.aspx">
                                <asp:Label ID="Label67" runat="server" Text="EC Activities"></asp:Label></a></li>
                        </ul>
                    </li>
                    <li><a href="#">
                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:Header,Rules %>"></asp:Label></a>
                        <ul class="sub-menu">
                            <%--<li><a href="/Pages/User/Admission.aspx">
                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:Header,Admission %>"></asp:Label></a></li>--%>
                            <li><a href="/Pages/User/Descipline.aspx">
                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:Header,Discipline %>"></asp:Label></a></li>
                            <li><a href="/Pages/User/Uniform.aspx">
                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:Header,Uniform %>"></asp:Label></a></li>
                            <%--<li><a href="/Pages/User/Fees.aspx">
                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:Header,Fees %>"></asp:Label></a></li>--%>
                            <li><a href="/Pages/User/waiver.aspx">
                                <asp:Label ID="Label63" runat="server" Text="Waiver"></asp:Label></a></li>
                            <li><a href="/Pages/User/Payment.aspx">
                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:Header,Payment %>"></asp:Label></a></li>
                        </ul>
                    </li>
                    <li><a href="#">
                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:Header,Routine %>"></asp:Label></a>
                        <ul class="sub-menu">
                            <li><a href="/Pages/User/ClassRoutine.aspx">
                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:Header,ClassRoutine %>"></asp:Label></a></li>
                            <li><a href="/Pages/User/ExamRoutine.aspx">
                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:Header,ExamRoutine %>"></asp:Label></a></li>
                        </ul>
                    </li>
                    <li><a href="../../Pages/User/Result.aspx">
                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:Header,Result %>"></asp:Label></a>
                    </li>
                    <li><a href="/Pages/User/Notice.aspx">
                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:Header,Notice %>"></asp:Label></a>
                    </li>
                    <li><a href="#">
                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:Header,Media %>"></asp:Label></a>
                        <ul class="sub-menu">
                            <li><a href="../../Pages/User/News.aspx">
                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Header,News %>"></asp:Label></a>
                            </li>
                            <li><a href="../../Pages/User/EventCalendar.aspx">
                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:Header,Event %>"></asp:Label></a>
                            </li>
                            <li><a href="/Pages/User/Gallery.aspx">
                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:Header,Gallery %>"></asp:Label></a></li>
                            <li><a href="/Pages/User/Video.aspx">
                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:Header,Video %>"></asp:Label></a></li>
                            <li><a href="/Pages/User/Audio.aspx">
                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:Header,Audio %>"></asp:Label></a></li>
                            <li><a href="/Pages/User/Downloads.aspx">
                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:Header,Downloads %>"></asp:Label></a>
                            </li>
                        </ul>
                    </li>
                    <li><a href="#">
                        <asp:Label ID="Label51" runat="server" Text="<%$ Resources:Header,Admission %>"></asp:Label></a>
                        <ul class="sub-menu">
                            <%--<li><a href="/Pages/User/AdmissionCircular.aspx">
                                <asp:Label ID="Label52" runat="server" Text="<%$ Resources:Header,AdmissionCircular %>"></asp:Label></a></li>--%>
                            <li><a href="/Pages/User/AdmissionCircular.aspx">
                                <asp:Label ID="Label53" runat="server" Text="<%$ Resources:Header,NewApplication %>"></asp:Label></a></li>
                            <li><a href="/Pages/User/ApplicationDownload.aspx">
                                <asp:Label ID="Label54" runat="server" Text="<%$ Resources:Header,ApplicationDownload %>"></asp:Label></a></li>
                            <li><a href="/Pages/User/ApplicationPayment.aspx">
                                <asp:Label ID="Label60" runat="server" Text="<%$ Resources:Header,ApplicationPayment %>"></asp:Label></a></li>
                            <li><a href="/Pages/User/AdmitCard.aspx">
                                <asp:Label ID="Label55" runat="server" Text="<%$ Resources:Header,AdmitCard %>"></asp:Label></a></li>
                            <li><a href="/Pages/User/AdmissionTestSchedule.aspx">
                                <asp:Label ID="Label65" runat="server" Text="Exam Schedule"></asp:Label></a></li>
                            <li><a href="/Pages/User/AdmissionResult.aspx">
                                <asp:Label ID="Label59" runat="server" Text="<%$ Resources:Header,AdmissionResult %>"></asp:Label></a></li>
                        </ul>
                    </li>
                    <li><a href="../../Pages/User/ContactUs.aspx">
                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:Header,ContactUs %>"></asp:Label></a></li>
                </ul>
                <!-- /.main-menu -->

                <%-- <ul class="social-icons pull-right">
                    <li><a href="#" data-toggle="tooltip" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#" data-toggle="tooltip" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#" data-toggle="tooltip" title="Pinterest"><i class="fa fa-pinterest"></i></a></li>
                    <li><a href="#" data-toggle="tooltip" title="Google+"><i class="fa fa-google-plus"></i></a></li>
                    <li><a href="#" data-toggle="tooltip" title="RSS"><i class="fa fa-rss"></i></a></li>
                </ul>--%>
                <!-- /.social-icons -->
            </nav>
            <!-- /.main-navigation -->
        </section>
        <!-- /.container -->
    </div>
    <!-- /.nav-bar-main -->

</header>
