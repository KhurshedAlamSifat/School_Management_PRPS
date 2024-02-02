<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Footer.ascx.cs" Inherits="UserControl_Footer" %>
<%@ Register Src="ContactUs.ascx" TagName="ContactUs" TagPrefix="UC" %>
<div class="footerAll">
    <footer class="container">
        <div class="row">
            <div class="footerbottom">
                <div class="col-md-3 col-sm-6">
                    <div class="footerwidget">
                        <h4>
                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Header,AboutUs %>"></asp:Label>
                        </h4>
                        <div class="menu-course">
                            <ul class="menu">
                                <li><a href="../../Pages/User/AboutUs.aspx">
                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Header,School %>"></asp:Label></a></li>
                                <li><a href="/Pages/User/Management.aspx">
                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Header,Management %>"></asp:Label></a></li>
                                <li><a href="/Pages/User/ECActivities.aspx">
                                    <asp:Label ID="Label66" runat="server" Text="EC Activites"></asp:Label></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="footerwidget">
                        <h4>
                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Header,Rules %>"></asp:Label>
                        </h4>
                        <div class="menu-course">
                            <ul class="menu">
                                <%--<li><a href="/Pages/User/Admission.aspx">
                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Header,Admission %>"></asp:Label></a></li>--%>
                                <li><a href="/Pages/User/Descipline.aspx">
                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Header,Discipline %>"></asp:Label></a></li>
                                <li><a href="/Pages/User/Uniform.aspx">
                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:Header,Uniform %>"></asp:Label></a></li>
                               <%-- <li><a href="/Pages/User/Fees.aspx">
                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:Header,Fees %>"></asp:Label></a></li>--%>
                                <li><a href="/Pages/User/waiver.aspx">
                                    <asp:Label ID="Label20" runat="server" Text="Waiver"></asp:Label></a></li>
                                <li><a href="/Pages/User/Payment.aspx">
                                    <asp:Label ID="Label62" runat="server" Text="<%$ Resources:Header,Payment %>"></asp:Label></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="footerwidget">
                        <h4>
                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Header,Admission %>"></asp:Label>
                        </h4>
                        <div class="menu-course">
                            <ul class="menu">
<%--                                <li><a href="/Pages/User/AdmissionCircular.aspx">
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
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="footerwidget">
                        <h4>Contact</h4>
                        <p>PRAN-RFL PUBLIC SCHOOL</p>
                        <div class="contact-info">
                            <i class="fa fa-map-marker"></i>By pass Road, Fuldirtek, Ghorashal, Palash, Narsingdi
                            <br>
                            <i class="fa fa-phone"></i>+04476351136 (Ext-103)<br />
                            <i class="fa fa-mobile"></i>+8801844604571
                                <br>
                            <i class="fa fa-envelope-o"></i>prps@pip.prangroup.com
                        </div>
                    </div>
                    <!-- end widget -->
                </div>
            </div>
        </div>
        <div class="social text-center">
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="https://www.facebook.com/pranrflpublicschool" target="_blank"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-dribbble"></i></a>
            <a href="#"><i class="fa fa-flickr"></i></a>
            <a href="#"><i class="fa fa-github"></i></a>
        </div>

        <div class="clear"></div>
        <div class="row">
            <div class="container">
            </div>
        </div>

        <!--CLEAR FLOATS-->
        <div class="footer2">
            <section class="container">
                <div class="row">
                    <div class="col-sm-12 panel">
                        <div class="panel-body">
                            <p class="pull-left">
                                Copyright &copy; 2016.
                            </p>
                            <p class="pull-right">
                                Design and Developed by <a href="http://pranrflgroup.com/" target="_blank">PRAN-RFL Group</a>.
                            </p>
                        </div>
                    </div>
                </div>
                <!-- /row of panels -->
            </section>
        </div>
    </footer>
</div>
