<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Colive.Website.myaccount._default" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Security-Policy" content="script-src 'self' 'unsafe-inline' https://code.jquery.com https://cdnjs.cloudflare.com/ajax/libs/popper.js/ https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/ https://www.googletagmanager.com/ https://salesiq.zoho.com/widget https://www.google-analytics.com/analytics.js https://www.googleadservices.com/pagead/conversion_async.js http://static.hotjar.com/ https://script.hotjar.com/ https://googleads.g.doubleclick.net/pagead/ https://connect.facebook.net/ http://www.googleadservices.com/">
    <title>Colive</title>
    <!-- favicon -->
    <link rel="icon" href="/assets/images/favicon.png">
    <!-- bootstrap -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <!-- font family -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- custom css -->
    <link rel="stylesheet" href="/assets/css/styles.css?v=20190820">
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- checkbox plugin -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css">
    <!--Animate CSS plugin-->
    <link href="/assets/css/animate.min.css" rel="stylesheet" />
    <!--meta code start-->
    <meta title="Affordable Coliving space to call home | Colive Home" />
    <meta name="description" content="With no brokerage and flexible deposits, Colive Homes provide affordable yet plush Coliving space for everyone looking for comfort.">
    <!-- Google Tag Manager -->
    <script>
        (function (w, d, s, l, i) {
            w[l] = w[l] || []; w[l].push({
                'gtm.start':
                    new Date().getTime(), event: 'gtm.js'
            }); var f = d.getElementsByTagName(s)[0],
                j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
                    'https://www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f);
        })(window, document, 'script', 'dataLayer', 'GTM-TJ5QFWR');
    </script>
    <!-- End Google Tag Manager -->
    <!-- Global site tag (gtag.js) - AdWords: 918341494 -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=AW-918341494"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'AW-918341494');
    </script>
    <meta property="og:title" content="Flats, House, Rooms on rent without broker | Furnished Apartments on rent | CoLive" />
    <meta property="og:type" content="website" />
    <meta property="og:image" content='https://www.colive.in/favicon.png' />
    <meta property="og:image:secure_url" content='https://www.colive.in/images/favicon.png' />
    <meta property="og:image:type" content="image/png" />
    <meta property="og:image:width" content=400 />
    <meta property="og:image:height" content=300 />
    <meta property="og:url" content="https://www.colive.in/" />
    <meta property="og:description" content="Flats, House, Rooms on rent without broker | Furnished Apartments on rent | CoLive" />
    <!-- font-awesome -->
    <!--<link rel="stylesheet" href="/css/font-awesome.min.css">-->
    <!-- Google Analytics -->
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
                m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');
        ga('create', 'UA-76869298-1', 'auto');
        ga('send', 'pageview');
    </script>
    <!--Avoid duplicate content-->
    <!--Conversion Tracking Start-->
    <script>function gtag_report_conversion(url) { var callback = function () { if (typeof (url) != 'undefined') { window.location = url; } }; gtag('event', 'conversion', { 'send_to': 'AW-918341494/8NMrCInzwYkBEPaO87UD', 'event_callback': callback }); return false; }</script>
    <!--Conversion Tracking End-->
    <!--meta code end-->
</head>
<body>
     <!-- Google Tag Manager (noscript) -->
    <noscript>
        <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-TJ5QFWR"
                height="0" width="0" style="display:none;visibility:hidden"></iframe>
    </noscript>
    <!-- End Google Tag Manager (noscript) -->
    <!-- site header include -->
    <div class="header include" id="site-header" data-include="header"></div>

    <!-- END of fixed call and chat buttons -->
    <section class="login-wrap" id="login-wrap">
        <div class="container">
            <div class="row">
                <!-- OTP Based login -->
                <div class="login-box col-lg-5 col-10 animated" id="loginotp-template">
                    <h1 class="text-center">Sign In/Sign Up</h1>
                    <form id="loginForm" name="loginForm" onsubmit="return false;">
                        <div class="form-group">
                            <span class="spnCountryCode">+91</span>
                            <label for="exampleInputEmail1">Mobile number</label>
                            <input type="tel" class="tel form-control" name="customermobile" id="customermobile" maxlength="10" aria-describedby="mobileHelp" placeholder="Enter your mobile number" />
                            <span class="focus-input100" data-symbol=""><i class="fa fa-phone"></i></span>
                        </div>
                        <input type="button" class="btn btn-primary" value="Generate OTP" id="Genloginbtn" onclick="GenerateOTPLogin();" />
                    </form>
                </div>

                <!-- OTP Verfication section -->
                <div class="login-box col-lg-5 col-10 animated" id="loginotpVerifytemplate" style="display: none;">
                    <h4 class="text-center">Enter OTP</h4>
                    <form id="verifyForm" name="verifyForm" onsubmit="return false;">
                        <div class="usernameWrapper">Hi&nbsp;<span id="spnUserName"></span> ,</div> 
                        <p class="text-center">
                         We have send you a verification code <br />
                            on your mobile number.
                        </p>
                        <div class="form-group-verify AlignOTPsec">
                            <div class="otpAlignSection">
                                <input type="password" class="tel form-control" name="loginotp" id="txtotp" maxlength="5" autocomplete="do-not-show-ac" />
                            </div>
                        </div>
                        <div id="timer" class="timer animated delay-1s" data-minutes-left="2">&nbsp;</div>
                        <p class="text-center didntReceive animated" id="ResendContainer">Didn't receive the code? <a href="javascript:ResentOTP();" class="strongtag">Resend</a></p>
                        <input type="button" class="btn btn-primary" value="Confirm" id="loginVerify" onclick="VerifyOTP($('#txtotp'), loginAPICall);" />
                    </form>
                </div>

                <!-- OTP Based Signup -->
                <div class="signup-box col-lg-5 col-10 animated" id="signupotp-template">
                    <h4 class="text-center">Sign Up</h4>
                    <form id="signupForm" name="signupForm" onsubmit="return false;">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Full name</label>
                            <input type="text" class="form-control  firstname" name="CustomerName" id="txtUserName" aria-describedby="nameHelp" placeholder="Full name">
                            <span class="focus-input100" data-symbol=""><i class="fa fa-user-o"></i></span>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Mobile number</label>
                            <input type="tel" class="tel form-control" name="mobilenumber" id="txtUserMobile" maxlength="10" aria-describedby="mobileHelp" placeholder="Mobile number" />
                            <span class="focus-input100" data-symbol=""><i class="fa fa-phone"></i></span>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email Address</label>
                            <input type="email" class="form-control" name="useremail" id="txtUserMail" aria-describedby="emailHelp" placeholder="Email Address" aria-invalid="false">
                            <span class="focus-input100" data-symbol=""><i class="fa fa-envelope-o"></i></span>
                        </div>
                        <input type="button" class="btn btn-primary mt-0" value="Generate OTP" id="GenSignupbtn" onclick="SignUpOtp();" />
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- site footer include -->
    <div class="footer include" id="site-footer" data-include="footer"></div>

    <div class="modal" id="video-modal">
        <div class="modal-background"></div>
        <div class="modal-content">
            <div class="container" id="divLocationMenus">
                <!-- HERE ADD Menus -->
                <div class="CityList" id="CityList">
                </div>
            </div>
            <button class="modal-close is-large" id="btnClose" aria-label="close">
                <svg version="1.1" class="svgClose" id="closeLoc" style="transform: rotate(270deg);" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 31.49 31.49" xml:space="preserve">
                    <path d="M21.205,5.007c-0.429-0.444-1.143-0.444-1.587,0c-0.429,0.429-0.429,1.143,0,1.571l8.047,8.047H1.111C0.492,14.626,0,15.118,0,15.737c0,0.619,0.492,1.127,1.111,1.127h26.554l-8.047,8.032c-0.429,0.444-0.429,1.159,0,1.587	c0.444,0.444,1.159,0.444,1.587,0l9.952-9.952c0.444-0.429,0.444-1.143,0-1.571L21.205,5.007z"></path></svg>
            </button>

        </div>
    </div>

    <%--<div class="loader" id="AjaxLoader" style="display:none;">
        <div class="strip-holder">
            <img src="./images/loader.gif" />
        </div>
    </div>--%>
    <!-- ./Footer -->
    <input type="hidden" id="hdnMobile" />
    <input type="hidden" id="hdnUserName" />
    <!--jQuery-->
    <script defer src="/assets/js/custom.js?v=20190913"></script>
     <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="/assets/js/jquery.validate.min.js"></script>
    <!-- jQuery first, then Popper, then Bootstrap JS., owl-carousel2 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <!--CountDown Timer Plugin-->
    <script src="/assets/js/countdowntimer.js"></script>
    <script>
        $(document).ready(function () {

            $("#loginForm").validate({
                rules: {
                    customermobile: {
                        required: true,
                        number: true,
                        maxlength: 10,
                        minlength: 10
                    }
                },
                messages: {
                    customermobile: "Please enter a valid mobile number",
                },
            });

            $("#signupForm").validate({
                rules: {
                    CustomerName: "required",
                    mobilenumber: {
                        required: true,
                        number: true,
                        maxlength: 10,
                        minlength: 10
                    },
                    useremail: {
                        required: true,
                        email: true,
                    },
                   
                }           
            });

            $('#customermobile').on('keyup', function (event) {
                if (event.keyCode === 13) {
                    $('#Genloginbtn').click();
                }

            });
            $('#txtotp').on('keyup', function (event) {
                if (event.keyCode === 13) {
                    $('#loginVerify').click();
                }
            }); 

            $('#txtUserMail').on('keyup', function (event) {
                if (event.keyCode === 13) {
                    $('#GenSignupbtn').click();
                }
            });
        });
    </script>
</body>

</html>
