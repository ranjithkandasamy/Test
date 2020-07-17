<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Colive.Website.lp.chennai._default" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="robots" content="noindex, nofollow" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
    <title>Colive | Offers In Chennai</title>
    <!-- favicon -->
    <link rel="icon" href="https://www.colive.in/favicon.png" type="image/png" />
    <meta http-equiv="Content-Security-Policy" content="script-src 'self' 'unsafe-inline' 'unsafe-eval' http://ajax.aspnetcdn.com/ajax/ https://www.googletagmanager.com/ https://www.google-analytics.com/analytics.js https://www.googleadservices.com/pagead/conversion_async.js http://static.hotjar.com/ https://script.hotjar.com/ https://googleads.g.doubleclick.net/pagead/ https://connect.facebook.net/ http://www.googleadservices.com/ https://cdnjs.cloudflare.com/ajax/libs/font-awesome/ https://code.jquery.com/ https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/" />

    <link rel="stylesheet" href="/assets/css/dcalendar.picker.css">
    <link rel="stylesheet" href="/assets/lp/chennai/assets/css/style.css" />
    <script type="text/javascript">window.history.forward();</script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
</head>
<body>
    <form runat="server" id="EnquiryForm">
        <asp:Label ID="lblInformation" runat="server" Style="font-size: 14px; color: red;"></asp:Label>
        <asp:ScriptManager ID="ScriptManager2" runat="server" EnableCdn="true"></asp:ScriptManager>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="upLandingPage">
            <ProgressTemplate>
                <div id='loadingmsg' style="line-height: 0px;" class="">
                    <div style="position: relative;">
                        <img src="/assets/lp/chennai/assets/images/loader.gif" />
                    </div>
                </div>
                <div id='loadingover' class="">
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel ID="upLandingPage" runat="server">
            <ContentTemplate>
                <section class="slider-wrapper section section-1" id="slider">
                    <div class="slider">
                        <div class="container">
                            <div class="row">
                                <div class="xlarge-8 large-8 medium-8 small-12 text-white">
                                    <div class="logo-place float-left pt-35">
                                        <a href="/">
                                            <div class="lp-item-img WebLogo AlignImage"></div>
                                        </a>
                                    </div>
                                    <div class="">
                                        <div class="slider-headline pt-30">
                                            <h1>Premium Rental Accommodation<br>
                                                in Chennai<br>
                                                at rents like never before!</h1>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="register-form-section section p0">
                    <div class="FormWrapper" id="formbox">
                        <div class="formbox">
                            <div class="formboxInside">
                                <div class="bgTop">
                                    <h2 class="text-heading text-center text-white m-t2">Upgrade your living!</h2>
                                </div>
                                <ul id="ulMainForm" runat="server" class="ulMainForm">
                                    <li>
                                        <div class="fieldWrap floatingName FormNameLogo FAlignImage FOfferImgSize">
                                            <asp:TextBox ID="txtName" runat="server" CssClass="inputTxt" placeholder="Name *" autocomplete="off" MaxLength="50"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvtxtName" runat="server" ErrorMessage="Please enter Name" Display="Dynamic" ControlToValidate="txtName"
                                                CssClass="validationError" ValidationGroup="vgEnquire"></asp:RequiredFieldValidator>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="fieldWrap FormPhoneLogo FAlignImage FOfferImgSize">
                                            <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="inputTxt" placeholder="Phone Number *" AutoPostBack="false" autocomplete="off" MaxLength="10"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvtxtMobileNumber" Enabled="true" runat="server" ErrorMessage="Please enter Mobile No." Display="Dynamic"
                                                ControlToValidate="txtMobileNumber" CssClass="validationError" ValidationGroup="vgEnquire"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="revtxtMobileNumber" runat="server" ErrorMessage="Invalid contact number" ControlToValidate="txtMobileNumber"
                                                CssClass="validationError" Enabled="true" ValidationGroup="vgEnquire"
                                                Display="Dynamic" ValidationExpression="^[6789]\d{9}|[0-9]" />
                                        </div>
                                    </li>
                                    <li>
                                        <div class="fieldWrap FormEmaillogo FAlignImage FOfferImgSize">
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="inputTxt" placeholder="Email *" AutoPostBack="false" autocomplete="off" MaxLength="50"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvtxtEmail" Enabled="true" runat="server" ErrorMessage="Please enter Email" Display="Dynamic" ControlToValidate="txtEmail"
                                                CssClass="validationError" ValidationGroup="vgEnquire"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="revtxtEmail" runat="server" ErrorMessage="Invalid email" Display="Dynamic" ControlToValidate="txtEmail"
                                                CssClass="validationError" ValidationGroup="vgEnquire" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                        </div>
                                    </li>
                                    <li>
                                        <div class="fieldWrap FormLocationLogo FAlignImage FOfferImgSize">
                                            <div id="ddlLocation" class="Fullwidth radioInputGroup text-white">
                                                <div class="lp-form-section">
                                                    <asp:DropDownList ID="ddlLocations" CssClass="lp-form-section" runat="server">
                                                        <asp:ListItem Text="Preferred Locations *" Value=""></asp:ListItem>
                                                        <asp:ListItem Text="Porur" Value="lat=13.036800&long=80.146974&loc=Porur"></asp:ListItem>
                                                        <asp:ListItem Text="DLF IT Park" Value="lat=13.024366&long=80.177354&loc=DLF IT Park"></asp:ListItem>
                                                        <asp:ListItem Text="Kattupakkam" Value="lat=13.038200&long=80.156500&loc=Kattupakkam"></asp:ListItem>
                                                        <asp:ListItem Text="Manapakkam" Value="lat=13.012618&long=80.180698&loc=Manapakkam"></asp:ListItem>
                                                        <asp:ListItem Text="OMR" Value="lat=12.948816&long=80.240169&loc=OMR"></asp:ListItem>
                                                        <asp:ListItem Text="Tidle Park" Value="lat=12.970707&long=80.246308&loc=Tidle Park"></asp:ListItem>
                                                        <asp:ListItem Text="Perungudi" Value="lat=12.970707&long=80.246308&loc=Perungudi"></asp:ListItem>
                                                        <asp:ListItem Text="Velachery" Value="lat=12.973444&long=80.210750&loc=Velachery"></asp:ListItem>
                                                        <asp:ListItem Text="Vadapalani" Value="lat=13.049707&long=80.209766&loc=Vadapalani"></asp:ListItem>
                                                        <asp:ListItem Text="KK Nagar" Value="lat=13.044373&long=80.208758&loc=KK Nagar"></asp:ListItem>
                                                        <asp:ListItem Text="Forum Vijaya Mall" Value="lat=13.050465&long=80.207459&loc=Forum Vijaya Mall"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rfvrblLocations" runat="server" ErrorMessage="Please select a location" Display="Dynamic" ControlToValidate="ddlLocations" CssClass="validationError" ValidationGroup="vgEnquire"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="fieldWrap FormPropertyLogo FAlignImage FOfferImgSize">
                                            <div id="pplLocation" class="Fullwidth text-white">
                                                <div class="lp-form-section">
                                                    <asp:DropDownList ID="ddlProperty" CssClass="lp-form-section" runat="server" ClientIDMode="Predictable" onchange="PropertyChange();">
                                                        <asp:ListItem Text="Select Property" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="Colive 302 Alaka Palazzo A Chennai" Value="30369"></asp:ListItem>
                                                        <asp:ListItem Text="Colive 301 Sanjana Emerald" Value="30506"></asp:ListItem>
                                                        <asp:ListItem Text="Colive 303 Alaka Palazzo B Chennai" Value="30525"></asp:ListItem>
                                                        <asp:ListItem Text="Colive 309 Primex Verterra" Value="30528"></asp:ListItem>
                                                        <asp:ListItem Text="Colive 306 Golden Square" Value="30539"></asp:ListItem>
                                                        <asp:ListItem Text="Colive 307 Radisson" Value="30557"></asp:ListItem>
                                                        <asp:ListItem Text="Colive 316 Akshaya Metropolis Villas" Value="30860"></asp:ListItem>
                                                        <asp:ListItem Text="Colive 320 Central Park" Value="30868"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li id="liScheduleDate" class="row fieldWrap FormCalendarLogo FAlignImage FOfferImgSize" style="display: none;">
                                        <div class="large-5 small-4 pr15">
                                            <asp:TextBox ID="ScheduleDate" runat="server" ClientIDMode="Predictable" CssClass="inputTxt" placeholder="Choose a date" AutoPostBack="false" autocomplete="off" onchange="ScheduleDatechanged();"></asp:TextBox>
                                        </div>
                                        <div class="large-4 small-4 lp-form-section-date pl15">
                                            <asp:DropDownList ID="slVisitSlots" CssClass="lp-form-section" runat="server" ClientIDMode="Predictable">
                                                <asp:ListItem Text="01:00 PM" Value="13"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </li>
                                </ul>
                                <ul class="ulMainForm" id="ulOtpForm" visible="false" runat="server">
                                    <li>
                                        <div class="ButtonWrap thankyou text-white">
                                            Please enter the OTP sent to your mobile
                                        </div>
                                    </li>
                                    <li>
                                        <div class="fieldWrap FormEmaillogo FAlignImage FOfferImgSize">
                                            <asp:TextBox ID="txtOtp" runat="server" CssClass="inputTxt" autocomplete="off" MaxLength="5"></asp:TextBox>
                                            <span class="lblOTPTimer spnOTP text-white" id="OtpTimer" runat="server">02:00</span>
                                            <span class="lblOTPTimer btnResend text-white" onclick="ResendOTP();">RESEND</span>
                                            <asp:RequiredFieldValidator ID="rfvtxtOtp" Enabled="true" runat="server" ErrorMessage="Please enter a valid OTP" Display="Dynamic" ControlToValidate="txtOtp"
                                                CssClass="validationError" ValidationGroup="vgOtp"></asp:RequiredFieldValidator>
                                            <asp:CustomValidator ID="custxtOtp" runat="server" ControlToValidate="txtOtp" Display="Dynamic" CssClass="validationError"
                                                ValidationGroup="vgOtp" OnServerValidate="cusCustom_ServerValidate" ErrorMessage="Incorrect OTP" />
                                        </div>
                                    </li>
                                </ul>
                                <ul class="ulMainForm" id="thankyouForm" runat="server" visible="false">
                                    <li>&nbsp;</li>
                                    <li>
                                        <div class="ButtonWrap thankyou">
                                            Thank you for contacting us, Our sales representative will connect with you shortly.
                                        </div>
                                        <br />
                                    </li>
                                </ul>
                                <div class="bgBottom">
                                    <div class="btnBox">
                                        <asp:Button ID="btnSubmit" runat="server" Text="Schedule a visit" CssClass="buttonCSS btn_blue" ValidationGroup="vgEnquire"
                                            OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnOtpSubmit" runat="server" Visible="false" CausesValidation="true" Text="Submit" CssClass="buttonCSS btn_blue"
                                            ValidationGroup="vgOtp" OnClick="btnOtpSubmit_Click" />
                                        <asp:Button ID="btnOK" runat="server" Text="View Colive Properties" CssClass="buttonCSS btn_blue" Visible="false" ValidationGroup="vgEnquire" />
                                        <a href="tel:+917676000500" id="ContactContainer1" class="callWrapper">
                                            <span class="spnPhonenumber">7676 000 500</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="section section-2" id="offer">
                    <div class="container">
                        <div class="row">
                            <div class="xlarge-8 large-8 medium-8 small-12">
                                <div class="section-heading text-center">
                                    <h2 class="text-left font-weight600 font-26">What we offer</h2>
                                </div>
                                <div class="lp-row row">
                                    <div class="lp-item width20 text-center m-tb1">
                                        <div class="lp-item-img DepositLogo AlignImage offerImageSize"></div>
                                        <div class="lp-item-heading font-14 font-weight600 width72 opacity08 m-auto">2 month deposit</div>
                                    </div>

                                    <div class="lp-item width20 text-center m-tb1">
                                        <div class="lp-item-img FlexiLogo AlignImage offerImageSize"></div>
                                        <div class="lp-item-heading font-14 font-weight600 width72 opacity08 m-auto">Flexi-Transfers</div>
                                    </div>

                                    <div class="lp-item width20 text-center m-tb1">
                                        <div class="lp-item-img FitnessLogo AlignImage offerImageSize"></div>
                                        <div class="lp-item-heading font-14 font-weight600 width72 opacity08 m-auto">Fitness Room</div>
                                    </div>

                                    <div class="lp-item width20 text-center m-tb1">
                                        <div class="lp-item-img CinemaLogo AlignImage offerImageSize"></div>
                                        <div class="lp-item-heading font-14 font-weight600 width72 opacity08 m-auto">Cinema Room</div>
                                    </div>

                                    <div class="lp-item width20 text-center m-tb1">
                                        <div class="lp-item-img PowerLogo AlignImage offerImageSize"></div>
                                        <div class="lp-item-heading font-14 font-weight600 width72 opacity08 m-auto">Power Back-up</div>
                                    </div>

                                    <div class="lp-item width20 text-center m-tb1">
                                        <div class="lp-item-img WifiLogo AlignImage offerImageSize"></div>
                                        <div class="lp-item-heading font-14 font-weight600 width72 opacity08 m-auto">Hi-Speed Free WiFi</div>
                                    </div>

                                    <div class="lp-item width20 text-center m-tb1">
                                        <div class="lp-item-img CCTVLogo AlignImage offerImageSize"></div>
                                        <div class="lp-item-heading font-14 font-weight600 width72 opacity08 m-auto">24*7 CCTV Surveilance</div>
                                    </div>

                                    <div class="lp-item width20 text-center m-tb1">
                                        <div class="lp-item-img HousekeepingLogo AlignImage offerImageSize"></div>
                                        <div class="lp-item-heading font-14 font-weight600 width72 opacity08 m-auto">Professional Housekeeping</div>
                                    </div>

                                    <div class="lp-item width20 text-center m-tb1 m-hide">
                                        <div class="lp-item-img FurnishedLogo AlignImage offerImageSize"></div>
                                        <div class="lp-item-heading font-14 font-weight600 width72 opacity08 m-auto">Stylishly-Furnished</div>
                                    </div>

                                    <div class="lp-item width20 text-center m-tb1">
                                        <div class="lp-item-img EmergencyLogo AlignImage offerImageSize"></div>
                                        <div class="lp-item-heading font-14 font-weight600 width72 opacity08 m-auto">Emergency Response Team</div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="section section-3" id="weare">
                    <div class="container">
                        <div class="row">
                            <div class="xlarge-8 large-8 medium-8 small-12 text-center">
                                <div class="section-heading text-center">
                                    <h2 class="text-left font-weight600 font-26">Who we are!</h2>
                                </div>
                                <div class="row">
                                    <div class="lp-text text-justify">
                                        <p>
                                            Colive is a technology-enabled fully-managed, ready-to-move-in rental homes that are conveniently located near your workplaces. All rooms are fully-furnished and offer flexible options to suit your urban lifestyle. Home
                                to 20,000+ single professionals & young couples, the Colive Community comprises of members from diverse backgrounds, with different experiences and interests.
                                        </p>
                                    </div>
                                    <div class="lp-img-row row">
                                        <div class="xlarge-6 large-6 medium-6 small-12 img-center">
                                            <div class="lp-img-size m-r1">
                                                <img src="/assets/lp/chennai/assets/images/celebrate/party-1.png" class="img-fluid border-radius">
                                            </div>
                                        </div>
                                        <div class="xlarge-6 large-6 medium-6 small-12 img-center">
                                            <div class="lp-img-size m-l1">
                                                <img src="/assets/lp/chennai/assets/images/celebrate/party-2.png" class="img-fluid border-radius">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="section section-4" id="promises">
                    <div class="container">
                        <div class="row">
                            <div class="xlarge-8 large-8 medium-8 small-12 text-center">
                                <div class="section-heading text-center">
                                    <h2 class="text-left font-weight600 font-26">Colive's 6 Promises</h2>
                                </div>
                                <div class="lp-row row m-t2">
                                    <div class="lp-promises xlarge-2 large-2 medium-2 small-4">
                                        <div class="lp-promises-img StyleLogo AlignImage promisesImageSize"></div>
                                        <div class="lp-promises-heading text-pink font-14 font-weight600 font-bold text-uppearcase">Style</div>
                                    </div>
                                    <div class="lp-promises xlarge-2 large-2 medium-2 small-4">
                                        <div class="lp-promises-img SavingsLogo AlignImage promisesImageSize"></div>
                                        <div class="lp-promises-heading text-pink font-14 font-weight600 font-bold text-uppearcase">Savings</div>
                                    </div>
                                    <div class="lp-promises xlarge-2 large-2 medium-2 small-4">
                                        <div class="lp-promises-img SafetyLogo AlignImage promisesImageSize"></div>
                                        <div class="lp-promises-heading text-pink font-14 font-weight600 font-bold text-uppearcase">Safety</div>
                                    </div>
                                    <div class="lp-promises xlarge-2 large-2 medium-2 small-4">
                                        <div class="lp-promises-img SocialLogo AlignImage promisesImageSize"></div>
                                        <div class="lp-promises-heading text-pink font-14 font-weight600 font-bold text-uppearcase">Social</div>
                                    </div>
                                    <div class="lp-promises xlarge-2 large-2 medium-2 small-4">
                                        <div class="lp-promises-img ServicesLogo AlignImage promisesImageSize"></div>
                                        <div class="lp-promises-heading text-pink font-14 font-weight600 font-bold text-uppearcase">Services</div>
                                    </div>
                                    <div class="lp-promises xlarge-2 large-2 medium-2 small-4">
                                        <div class="lp-promises-img SmartLogo AlignImage promisesImageSize"></div>
                                        <div class="lp-promises-heading text-pink font-14 font-weight600 font-bold text-uppearcase">Smart</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="section-2 section" id="faq">
                    <div class="container">
                        <div class="row">
                            <div class="xlarge-8 large-8 medium-8 small-12">
                                <div class="section-heading text-center">
                                    <h2 class="text-left font-weight600 font-26">Frequently Asked Questions</h2>
                                </div>
                                <div id="faq-testimonials" class="owl-carousel m-t3">
                                    <!--TESTIMONIAL 1 -->
                                    <div class="item">
                                        <div class="shadow-effect bg-pink border-radius">
                                            <div class="row text-white p25 plr45 align-center">
                                                <h1 class="font-18">Q. Are Colive homes co-residencies / Gender Neutral?</h1>
                                                <p class="font-14 m-b0 m-t0 p-t5">Majority of Colive properties areco-residencies or gender neutral with Boys, Girls & couples staying in the same building. Colive also has homes for all-boys or all-girls as well available across all locations.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--END OF TESTIMONIAL 1 -->
                                    <!--TESTIMONIAL 2 -->
                                    <div class="item">
                                        <div class="shadow-effect bg-darkpink border-radius">
                                            <div class="row text-white p25 plr45 align-center">
                                                <h1 class="font-18">Q. What is the average price of staying at Colive?</h1>
                                                <p class="font-14 m-b0 m-t0 p-t5">Rooms and beds at Colive are reasonably priced based on multiple factors including - property type (Colive Gold / Colive Platinum), location, amenities provided & more.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--END OF TESTIMONIAL 2 -->
                                    <!--TESTIMONIAL 3 -->
                                    <div class="item">
                                        <div class="shadow-effect bg-pink border-radius">
                                            <div class="row text-white p25 plr45 align-center">
                                                <h1 class="font-18">Q. What kind of rooms are there in Colive?</h1>
                                                <p class="font-14 m-b0 m-t0 p-t5">At Colive, residents can choose from a wide array of options based on their comfort, need & budget. Shared Rooms - Double/Triple occupancy Rooms, Single Occupancy Rooms and Couple Rooms.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--END OF TESTIMONIAL 3 -->
                                    <!--TESTIMONIAL 4 -->
                                    <div class="item">
                                        <div class="shadow-effect bg-darkpink border-radius">
                                            <div class="row text-white p25 plr45 align-center">
                                                <h1 class="font-18">Q. Is food provided in Colive homes?</h1>
                                                <p class="font-14 m-b0 m-t0 p-t5">Food is available at select Colive locations. Dinner service is provided at Colive properties and some Colive homes have breakfast facilities as well.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--END OF TESTIMONIAL 4 -->
                                    <!--TESTIMONIAL 5 -->
                                    <div class="item">
                                        <div class="shadow-effect bg-pink border-radius">
                                            <div class="row text-white p25 plr45 align-center">
                                                <h1 class="font-18">Q. How much is the security deposit at Colive?</h1>
                                                <p class="font-14 m-b0 m-t0 p-t5">Unlike the rental industry in Bangalore, Chennai and Hyderabad, the security deposit is equal to just 2 months rent.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--END OF TESTIMONIAL 5 -->
                                    <!--TESTIMONIAL 6 -->
                                    <div class="item">
                                        <div class="shadow-effect bg-darkpink border-radius">
                                            <div class="row text-white p25 plr45 align-center">
                                                <h1 class="font-18">Q. How can I schedule a visit to a Colive property?</h1>
                                                <p class="font-14 m-b0 m-t0 p-t5">You can Schedule a Visit or Book a Tour of the Colive Property on the Website or the Colive App.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--END OF TESTIMONIAL 6 -->
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="section-2 section m-hide" id="coliverstalk">
                    <div class="container">
                        <div class="row">
                            <div class="xlarge-8 large-8 medium-8 small-12">
                                <div class="section-heading text-center">
                                    <h2 class="text-left font-weight600 font-26">Coliver's Talk</h2>
                                </div>
                                <div id="talk-testimonials" class="owl-carousel m-t3">
                                    <!--TESTIMONIAL 1 -->
                                    <div class="item">
                                        <div class="coliver-talk-carousel">
                                            <div class="row p25 plr45 text-center">
                                                <div class="talk-container">
                                                    <h1 class="text-pink font-20 font-bold font-weight600">"I Stumbled upon Colive property and it was love at first sight."</h1>
                                                    <div class="colive-author text-pink font-16 font-bold font-weight600 text-right p-t15">-Soumya Vasudeva</div>
                                                    <p class="colivers-message">
                                                        I was new to town when I stumbled upon Colive and the property is safe, well-maintained and apart from basic amenities, there are events like parties, Zumba, Yoga which brings people together. My 3 months here has
                                            been exciting and fun.
                                                    </p>
                                                    <div class="colivers-identity text-pink font-20 font-bold font-weight600">
                                                        #HumansofColive
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--END OF TESTIMONIAL 1 -->
                                    <!--TESTIMONIAL 2 -->
                                    <div class="item">
                                        <div class="coliver-talk-carousel">
                                            <div class="row p25 plr45 text-center">
                                                <div class="talk-container">
                                                    <h1 class="text-pink font-20 font-bold font-weight600">"You live here as you want, No restrictions."</h1>
                                                    <div class="colive-author text-pink font-16 font-bold font-weight600 text-right p-t15">-Shubham</div>
                                                    <p class="colivers-message">
                                                        It's fun to live in Colive. You live here as you want, no restrictions, the people living here are too good and it's goog to interact with them. The most loving part is the parties and fun activities they organize
                                            on weekends.
                                                    </p>
                                                    <div class="colivers-identity text-pink font-20 font-bold font-weight600">
                                                        #HumansofColive
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--END OF TESTIMONIAL 2 -->
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <div class="container d-none d-large-none d-medium-none d-block d-small-block p0" id="scheduleBar">
                    <div class="schedule-mobile">
                        <button type="button" value="" class="scheduleVisitBtn" id="BtnScheduleVisit" />
                        Schedule Visit</button>
                    </div>
                </div>

                <!-- footer area -->
                <footer class="grey-bg height">
                    <div class="container">
                        <div class="float-left white-text copyright-text">&copy; 2019 Colive, All right reserved</div>
                    </div>
                </footer>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <script src="/assets/js/dcalendar.picker.js" defer></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" defer></script>
    <script src="/assets/lp/chennai/assets/js/custom.js" defer></script>
    <script id="rendered-js">
        jQuery(document).ready(function ($) {
            //  TESTIMONIALS CAROUSEL HOOK
            $('#faq-testimonials, #talk-testimonials').owlCarousel({
                loop: true,
                center: true,
                items: 1,
                margin: 0,
                autoplay: false,
                autoHeight: true,
                dots: false,
                nav: true,
                navText: ["<img src='/assets/lp/chennai/assets/images/right-thin-chevron.png'>", "<img src='/assets/lp/chennai/assets/images/right-thin-chevron.png'>"],
                autoplayTimeout: 5000,
                smartSpeed: 450,
                responsive: {
                    0: {
                        items: 1
                    },

                    768: {
                        items: 1
                    },

                    1170: {
                        items: 1
                    }
                }
            });

        });
        //# sourceURL=pen.js

        $('#BtnScheduleVisit').click(function () { $('html, body').animate({ scrollTop: $('.register-form-section').offset().top }, 1000); });
    </script>
</body>
</html>

