<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GlobalHomePage.aspx.cs" Inherits="HomePage_GlobalHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--Meta Tags-->
    <%--  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="" />
    <meta name="keywords" content="" />--%>

    <!--Favicons-->
    <%--<link rel="shortcut icon" type="image/x-icon" href="/ContentOuterTheme/assets/img/favicon.ico" />--%>

    <!--Page Title-->
    <title>PRPS</title>

    <!-- Bootstrap core CSS -->
    <link href="/ContentOuterTheme/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Google Font  -->
    <link href="https://fonts.googleapis.com/css?family=Dosis:300,400,500,600,700,800|Roboto:300,400,400i,500,500i,700,700i,900,900i" rel="stylesheet" />
    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="/ContentOuterTheme/assets/css/icofont.min.css" />
    <!-- Meanmenu CSS -->
    <link rel="stylesheet" href="/ContentOuterTheme/assets/css/meanmenu.min.css" />
    <!--- owl carousel Css-->
    <link rel="stylesheet" href="/ContentOuterTheme/assets/owlcarousel/css/owl.carousel.min.css" />
    <link rel="stylesheet" href="/ContentOuterTheme/assets/owlcarousel/css/owl.theme.default.min.css" />
    <!-- animate CSS -->
    <link rel="stylesheet" href="/ContentOuterTheme/assets/css/animate.css" />
    <!-- venobox -->
    <link rel="stylesheet" href="/ContentOuterTheme/assets/venobox/css/venobox.css" />
    <!-- SLIDER REVOLUTION 4.x CSS SETTINGS -->
    <link rel="stylesheet" type="text/css" href="/ContentOuterTheme/rs-plugin/css/settings.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/ContentOuterTheme/assets/css/extralayers.css" media="screen" />
    <!-- Style CSS -->
    <link rel="stylesheet" href="/ContentOuterTheme/assets/css/style.css" />
    <!-- Responsive  CSS -->
    <link rel="stylesheet" href="/ContentOuterTheme/assets/css/responsive.css" />
    <style>
        .home-3 .top-area {
            background: #ffffff;
        }

        .logo-area {
            padding: 0px 0;
        }

        .welcome-section-padding {
            padding: 30px 0;
        }

        .section-padding {
            padding: 30px 0;
        }

        p {
            text-align: justify;
        }

        @media only screen and (max-width: 488px) {
            .top-header-area {
                display: block !important;
            }
        }

        .top-header-area {
            display: flex;
            justify-content: center;
            align-items: center;
        }

            .top-header-area .logo-area img {
                max-width: 120px;
                margin-right: 20px;
            }

        .logo-text-area {
            text-align: left;
        }

        .top-header-area .logo-text-area h1 {
            font-size: 30px;
            font-weight: 600;
            color: rgb(0,87,255);
        }

        .top-header-area .logo-text-area span {
            font-size: 15px;
            font-weight: 500;
            color: rgb(0,2,139);
            font-style: italic;
        }
    </style>
</head>

<body class="home-3">
    <form id="form2" runat="server">
        <!-- START PRELOADER -->
        <div id="page-preloader">
            <div class="loader"></div>
            <div class="loa-shadow"></div>
        </div>
        <!-- END PRELOADER -->
        <!-- START HEADER SECTION -->
        <header class="main-header">
            <!-- START TOP AREA -->
            <div class="top-area">
                <div class="auto-container">
                    <div class="row">
                        <div class="col-lg-8 col-12 mx-auto text-center justify-content-center">
                            <div class="top-menu top-header-area">
                                <div class="logo-area">
                                    <img src="/ContentOuterTheme/assets/img/custom/logo_prps.jpg" />
                                </div>
                                <div class="logo-text-area">
                                    <h1>PRAN RFL Public School</h1>
                                    <span>Where Knowledge Unfolds...</span>
                                </div>
                            </div>
                        </div>
                        <!-- end col -->
                    </div>
                </div>
            </div>
            <!-- END TOP AREA -->

            <asp:Panel ID="pnlScrollingMessage" runat="server">
                <div class="logo-area">
                    <div class="auto-container">
                        <div class="row">
                            <marquee behavior="scroll" direction="left" style="color: blue; font-size: large; font-weight: 700;" onmouseover="this.stop();" onmouseout="this.start();">
                                <asp:Repeater ID="rptNotice" runat="server">
                                    <itemtemplate>
                                        <a href="../Pages/Public/ViewGlobalNotice.aspx?id=<%#Eval("Id") %>">| &nbsp;&nbsp;&nbsp; <%#Eval("Title") %> &nbsp;&nbsp;&nbsp;|</a>
                                    </itemtemplate>
                                </asp:Repeater>
                            </marquee>
                        </div>
                    </div>
                </div>
            </asp:Panel>

            <!-- START NAVIGATION AREA -->
            <div class="sticky-menu">
                <div class="mainmenu-area">
                    <div class="auto-container">
                        <div class="row">
                            <div class="col-9 mx-auto d-none d-lg-block d-md-none">
                                <nav class="navbar navbar-expand-lg justify-content-center">
                                    <ul class="navbar-nav">
                                        <%--<li><a href="#slider" class="nav-link js-scroll-trigger">Top</a></li>--%>
                                        <%--<li><a href="#overview" class="nav-link js-scroll-trigger">Over View</a></li>--%>
                                        <%--<li><a href="#all_campus" class="nav-link js-scroll-trigger">All Campus</a></li>--%>
                                        <%--<li><a href="../Login.aspx" class="nav-link js-scroll-trigger">Login</a></li>--%>
                                        <li><a href="/HomePages/LocalHomePage.aspx?CampusNo=1" class="nav-link js-scroll-trigger" style="text-transform: capitalize;">Ghorashal Campus</a></li>
                                        <li><a href="/HomePages/LocalHomePage.aspx?CampusNo=2" class="nav-link js-scroll-trigger" style="text-transform: capitalize;">Habiganj Campus</a></li>
                                        <li><a href="/HomePages/LocalHomePage.aspx?CampusNo=3" class="nav-link js-scroll-trigger" style="text-transform: capitalize;">Danga Campus</a></li>
                                        <li><a href="../Pages/Public/GlobalNoticeList.aspx" class="nav-link js-scroll-trigger" style="text-transform: capitalize;">Notice</a></li>
                                        <li><a href="../Login.aspx" class="nav-link js-scroll-trigger" style="text-transform: capitalize;">Login</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END NAVIGATION AREA -->
        </header>
        <!-- END HEADER SECTION -->
        <section id="slider" class="slider-section">
            <div class="tp-banner-container">
                <div class="tp-banner">
                    <ul>
                        <!-- SLIDE 1 -->
                        <li data-transition="slideup" data-slotamount="1" data-masterspeed="1000" data-delay="10000" data-saveperformance="off" data-title="Slide One">
                            <!-- MAIN IMAGE -->
                            <img src="/ContentOuterTheme/assets/img/custom/banner_1.jpg" alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" />
                            <!-- LAYERS -->
                            <div class="tp-caption lfb ltt tp-resizeme rs-parallaxlevel-10"
                                data-x="right" data-hoffset="-245"
                                data-y="center" data-voffset="70"
                                data-speed="1400"
                                data-start="1400"
                                data-endspeed="1200"
                                data-easing="easeOutExpo"
                                data-splitin="none"
                                data-splitout="none"
                                data-elementdelay="0.01"
                                data-endelementdelay="0.1">
                                <a href="/HomePages/LocalHomePage.aspx?CampusNo=1" class="slide-btn-two">Go To Ghorashal Campus Page</a>
                            </div>
                        </li>
                        <!-- SLIDE 1 -->
                        <li data-transition="slideright" data-slotamount="1" data-masterspeed="1000" data-delay="10000" data-saveperformance="off" data-title="Slide two">
                            <!-- MAIN IMAGE -->
                            <img src="/ContentOuterTheme/assets/img/custom/banner_2.jpg" alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" />
                            <!-- LAYERS -->
                            <div class="tp-caption lfb ltt tp-resizeme rs-parallaxlevel-10"
                                data-x="right" data-hoffset="-245"
                                data-y="center" data-voffset="70"
                                data-speed="1400"
                                data-start="1400"
                                data-endspeed="1200"
                                data-easing="easeOutExpo"
                                data-splitin="none"
                                data-splitout="none"
                                data-elementdelay="0.01"
                                data-endelementdelay="0.1">
                                <a href="/HomePages/LocalHomePage.aspx?CampusNo=2" class="slide-btn-two">Go To Habiganj Campus Page</a>
                            </div>
                        </li>
                        <!-- SLIDE 3 -->
                        <li class="text-center" data-transition="slideleft" data-slotamount="1" data-masterspeed="1000" data-delay="10000" data-saveperformance="off" data-title="Slide Three">
                            <!-- MAIN IMAGE -->
                            <img src="/ContentOuterTheme/assets/img/custom/banner_3.jpg" alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" />
                            <!-- LAYERS -->
                            <div class="tp-caption lfb ltt tp-resizeme rs-parallaxlevel-10"
                                data-x="right" data-hoffset="-245"
                                data-y="center" data-voffset="70"
                                data-speed="1400"
                                data-start="1400"
                                data-endspeed="1200"
                                data-easing="easeOutExpo"
                                data-splitin="none"
                                data-splitout="none"
                                data-elementdelay="0.01"
                                data-endelementdelay="0.1">
                                <a href="/HomePages/LocalHomePage.aspx?CampusNo=3" class="slide-btn-two">Go To Danga Campus Page</a>
                            </div>
                        </li>
                    </ul>
                    <div class="tp-bannertimer"></div>
                </div>
            </div>
        </section>
        <section id="overview" class="welcome-section-padding">
            <div class="auto-container">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-12 mb-lg-0 mb-lg-0 mb-5">
                        <div class="about-wel-des">
                            <h2 class="my-4">Overview Of PRPS</h2>
                            <p>
                                <b>PRAN-RFL Public School (PRPS)</b> is an educational initiative by <b>PRAN-RFL Group</b> with a view to
                                providing high standard of education to the children of its employees and compatriots. It’s totally
                                a non-profitable institute, established in 2014 from the point of CSR (Corporate Social
                                Responsibilities) view.
                            </p>
                            <br />
                            <p>
                                Major General Amjad Khan Chowdhury (Retd), former CEO, PRAN-RFL Group and founder of this
                                great institute dreamed to make PRPS a leading educational institute in the country by providing
                                the community with quality, time standard education, education-friendly facilities and congenial
                                environment required to learn and grow to the fullest sense.
                            </p>
                            <br />
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-12">
                        <div class="thumbnail">
                            <iframe style="width: 100%; height: 370px" src="https://www.youtube.com/embed/mL8AghmlJwI?autoplay=1" allow="autoplay" frameborder="0" allowfullscreen></iframe>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-12 mb-lg-0 mb-lg-0 mb-5">
                        <div class="about-wel-des">
                            <p>
                                Facilities include high highly qualified and well trained teaching staff, well-equipped and well-
                                decorated specious classroom, computer lab, science lab, school library, auditorium, kids’ play
                                zone, large campus, transport facilities for students and open fields for running wide range of
                                sports and extra-curricular activities throughout the year. Alongside proper education we create
                                fun-loving and caring atmosphere for intellectual growth of the little angles and students in the
                                upper classes.
                            </p>
                            <br />
                            <p>
                                <b>PRAN-RFL Public school</b> affirms the dignity, potential and contribution of employees and
                                partners in all respects. The management supports and stimulates freedom of expression. PRPS
                                is following both Bangla & English Version Curriculum under NCTB (Pre-primary to Higher
                                Secondary).
                            </p>
                            <br />
                            <p>
                                The School Management Committee (SMC) <b>facilitates effective teaching and learning and
                                performing as overall monitor of the school.</b> PRPS SMC is a bridge between the school and the
                                top management. SMC also plays vital role in the school as both decision and policy makers.
                                Currently there are almost 2500 students, 85 highly educated and well trained faculty members
                                and 35 admin staff at all its 03 campuses.
                            </p>
                            <br />
                            <p>
                                Finally, PRPS aims that its pupils will leave PRPS as God's gifts to mankind, assets to the family,
                                society, country and the world as well having all the characteristics of future super heroes.
                            </p>
                        </div>

                    </div>
                    <div class="col-lg-12 col-md-12 col-12 mb-lg-0 mb-lg-0 mb-5">
                        <div class="about-wel-des">
                            <h2 class="my-4">Our Vision</h2>
                            <p>
                                Imparting quality education to every intended pupil with the latest findings and
                                technology in the field of education so that our students can compete with the rest
                                of the world with self-confidence and self-esteem.
                            </p>
                            <br />
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-12 mb-lg-0 mb-lg-0 mb-5">
                        <div class="about-wel-des">
                            <h2 class="my-4">Our Mission</h2>
                            <p>
                                Our mission is to provide the best opportunity for students to develop
                                their potential to the full, to acquire knowledge, and to adopt a positive attitude
                                towards work, life and their community so that they can be future leaders having
                                all possible characteristics of global citizens in accordance with our school.
                            </p>
                            <br />
                        </div>
                    </div>
                </div>
            </div>
            <!--- END CONTAINER -->
        </section>
        <section id="all_campus" class="section-padding">
            <div class="auto-container">
                <div class="row mb-5">
                    <div class="col">
                        <div class="fea-class-slides owl-carousel owl-theme">
                            <div class="single-featured-class shadow text-center">
                                <div class="single-featured-class-img">
                                    <img class="img-fluid" src="/ContentOuterTheme/assets/img/custom/banner_1.jpg" alt="" />
                                </div>
                                <div class="single-featured-class-de mt-4">
                                    <h4>Ghorashal Campus</h4>
                                    <ul>
                                        <li>By pass Road, Fuldirtek, Ghorashal,</li>
                                        <li>Palash, Narsingdi</li>
                                        <li>01844-604-571</li>
                                    </ul>
                                    <a class="class-into-btn  mb-3" href="/HomePages/LocalHomePage.aspx?CampusNo=1">Go To Campus Page</a>
                                </div>
                            </div>
                            <div class="single-featured-class shadow text-center">
                                <div class="single-featured-class-img">
                                    <img class="img-fluid" src="/ContentOuterTheme/assets/img/custom/banner_2.jpg" alt="" />
                                </div>
                                <div class="single-featured-class-de mt-4">
                                    <h4>Habiganj Campus</h4>
                                    <ul>
                                        <li>Shoiljura, Olipur,</li>
                                        <li>Shayestagonj, Habiganj</li>
                                        <li>01704-132-270</li>
                                    </ul>
                                    <a class="class-into-btn  mb-3" href="/HomePages/LocalHomePage.aspx?CampusNo=2">Go To Campus Page</a>
                                </div>
                            </div>
                            <div class="single-featured-class shadow text-center">
                                <div class="single-featured-class-img">
                                    <img class="img-fluid" src="/ContentOuterTheme/assets/img/custom/banner_3.jpg" alt="" />
                                </div>
                                <div class="single-featured-class-de mt-4">
                                    <h4>Danga Campus</h4>
                                    <br />
                                    <ul>
                                        <li>Kazirchar, Danga,</li>
                                        <li>Palash, Narsingdi</li>
                                        <li>01846-478-335</li>
                                    </ul>
                                    <a class="class-into-btn  mb-3" href="/HomePages/LocalHomePage.aspx?CampusNo=3">Go To Campus Page</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--- END CONTAINER -->
        </section>


        <!-- START FOOTER -->
        <footer class="footer-section footer-2">
            <div id="bottom-footer" class="bg-gray">
                <div class="auto-container">
                    <div class="row mb-lg-0 mb-md-4 mb-4">
                        <div class="col-12 text-center">
                            <p class="copyright-text">Copyright © 2022 <a href="#">PRAN RFL Group-CS-MIS</a> All Rights Reserved</p>
                        </div>
                        <!-- end col -->
                    </div>
                </div>
            </div>
        </footer>
        <!-- END FOOTER -->
        <!-- Latest jQuery -->
        <script src="/ContentOuterTheme/assets/js/jquery-2.2.4.min.js"></script>
        <!-- popper js -->
        <script src="/ContentOuterTheme/assets/bootstrap/js/popper.min.js"></script>
        <!-- Latest compiled and minified Bootstrap -->
        <script src="/ContentOuterTheme/assets/bootstrap/js/bootstrap.min.js"></script>
        <!-- Meanmenu Js -->
        <script src="/ContentOuterTheme/assets/js/jquery.meanmenu.js"></script>
        <!-- Sticky JS -->
        <script src="/ContentOuterTheme/assets/js/jquery.sticky.js"></script>
        <!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
        <script src="/ContentOuterTheme/rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
        <script src="/ContentOuterTheme/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
        <!-- countdown js -->
        <script src="/ContentOuterTheme/assets/js/jquery.countdown.min.js"></script>
        <!-- owl-carousel min js  -->
        <script src="/ContentOuterTheme/assets/owlcarousel/js/owl.carousel.min.js"></script>
        <!-- isotope js -->
        <script src="/ContentOuterTheme/assets/js/isotope.3.0.6.min.js"></script>
        <!-- venobox js -->
        <script src="/ContentOuterTheme/assets/venobox/js/venobox.min.js"></script>
        <!-- jquery appear js  -->
        <script src="/ContentOuterTheme/assets/js/jquery.appear.js"></script>
        <!-- countTo js -->
        <script src="/ContentOuterTheme/assets/js/jquery.inview.min.js"></script>
        <!-- scrolltopcontrol js -->
        <script src="/ContentOuterTheme/assets/js/scrolltopcontrol.js"></script>
        <!-- WOW - Reveal Animations When You Scroll -->
        <script src="/ContentOuterTheme/assets/js/wow.min.js"></script>
        <!-- scripts js -->
        <script src="/ContentOuterTheme/assets/js/scripts.js"></script>
        <script>
            jQuery(document).ready(function () {
                jQuery('.tp-banner').show().revolution(
                    {
                        dottedOverlay: "none",
                        delay: 16000,
                        startwidth: 1170,
                        startheight: 550,
                        hideThumbs: 200,
                        thumbWidth: 100,
                        thumbHeight: 50,
                        thumbAmount: 5,
                        navigationType: "bullet",
                        navigationArrows: "solo",
                        navigationStyle: "preview2",
                        touchenabled: "on",
                        onHoverStop: "on",
                        swipe_velocity: 0.7,
                        swipe_min_touches: 1,
                        swipe_max_touches: 1,
                        drag_block_vertical: false,
                        parallax: "mouse",
                        parallaxBgFreeze: "on",
                        parallaxLevels: [7, 4, 3, 2, 5, 4, 3, 2, 1, 0],
                        keyboardNavigation: "off",
                        navigationHAlign: "center",
                        navigationVAlign: "bottom",
                        navigationHOffset: 0,
                        navigationVOffset: 20,
                        soloArrowLeftHalign: "left",
                        soloArrowLeftValign: "center",
                        soloArrowLeftHOffset: 20,
                        soloArrowLeftVOffset: 0,
                        soloArrowRightHalign: "right",
                        soloArrowRightValign: "center",
                        soloArrowRightHOffset: 20,
                        soloArrowRightVOffset: 0,
                        shadow: 0,
                        fullWidth: "on",
                        fullScreen: "off",
                        spinner: "spinner4",
                        stopLoop: "off",
                        stopAfterLoops: -1,
                        stopAtSlide: -1,
                        shuffle: "off",
                        autoHeight: "off",
                        forceFullWidth: "off",
                        hideThumbsOnMobile: "off",
                        hideNavDelayOnMobile: 1500,
                        hideBulletsOnMobile: "off",
                        hideArrowsOnMobile: "off",
                        hideThumbsUnderResolution: 0,
                        hideSliderAtLimit: 0,
                        hideCaptionAtLimit: 0,
                        hideAllCaptionAtLilmit: 0,
                        startWithSlide: 0,
                        fullScreenOffsetContainer: ""
                    });
            });
        </script>
    </form>
</body>
</html>
