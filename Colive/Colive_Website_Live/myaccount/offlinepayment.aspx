<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="offlinepayment.aspx.cs" Inherits="Colive.Website.myaccount.offline" %>

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
    <style>
        body {
            background: #f4f8fb;
        }
        #offlinepayment_Page section#footer {
            padding: 0px !important;
            margin: 0px !important;
        }

        #offlinepayment_Page section#footer footer {
            margin: 0px !important;
        }

        @media (max-width: 767px) {
            .login-wrap {
                padding: 72px 0;
            }
        }
    </style>
</head>
<body id="offlinepayment_Page">
    <!-- site header include -->
    <header>
        <!-- site header include -->
        <nav class="navbar navbar-expand-md navbar-toggleable fixed-top static" id="navbar">
            <!-- navbar-expand  -->
            <div class="nav w-100 container justify-content-between align-middle">
                <!-- brand logo -->
                <a class="navbar-brand" href="javascript:void(0);">
                    <img class="img-fluid" alt="Colive" src="/assets/images/logo-colive.png">
                </a>
                <!-- End of collapse div  -->
            </div>
            <!-- navbar-expand end -->
        </nav>
    </header>

    <!-- END of fixed call and chat buttons -->
    <section class="login-wrap" id="login-wrap">
        <div class="container">
            <div class="row">
                <!-- OTP Based login -->
                <div class="login-box col-lg-5 col-10 animated" id="OfflineVerifyMobileTemplate">
                    <h1 class="text-center">Offline Payments</h1>
                    <form id="offlinePaymentBasic" name="offlinePaymentBasic" onsubmit="return false;">
                        <div class="form-group">
                            <span class="spnCountryCode">+91</span>
                            <label for="exampleInputEmail1">Mobile number</label>
                            <input type="tel" class="tel form-control" name="customermobile" id="customermobile" maxlength="10" aria-describedby="mobileHelp" placeholder="Enter your mobile number" />
                            <span class="focus-input100" data-symbol=""><i class="fa fa-phone"></i></span>
                        </div>
                        <input type="button" class="btn btn-primary" value="Proceed" id="btnVerifyRegester" onclick="VerifyRegisteredCustomer();" />
                    </form>
                </div>

                <!-- OTP Based Signup -->
                <div class="signup-box col-lg-5 col-10 animated" id="offlinepayment-template">
                    <h4 class="text-center">Offline Payments</h4>
                    <form id="offlinePayment" name="offlinePayment" onsubmit="return false;">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Full name</label>
                            <input type="text" class="form-control  firstname" name="CustomerName" id="txtUserName" aria-describedby="nameHelp" placeholder="Full name">
                            <span class="focus-input100" data-symbol=""><i class="fa fa-user-o"></i></span>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Mobile number</label>
                            <input type="tel" class="tel form-control" name="MobileNumber" id="txtUserMobile" maxlength="10" aria-describedby="mobileHelp" placeholder="Mobile number" />
                            <span class="focus-input100" data-symbol=""><i class="fa fa-phone"></i></span>
                        </div>
                        <div class="form-group" id="dvPaymentOTP">
                            <label for="exampleInputEmail1">OTP</label>
                            <div id="timer" class="timer animated delay-1s" data-minutes-left="2" style="position:absolute;">&nbsp;</div>
                            <p class="text-center didntReceive animated" id="ResendContainer"><a href="javascript:ResentOTPOfflinePayment();" class="strongtag">Resend</a></p>
                            <input type="text" class="form-control" name="OTP" id="txtCustomerOTP" aria-describedby="otp" placeholder="Enter Your OTP" aria-invalid="false">
                            <span class="focus-input100" data-symbol=""><i class="fa fa-envelope-o"></i></span>                           
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email Address</label>
                            <input type="email" class="form-control" name="useremail" id="txtUserMail" aria-describedby="emailHelp" placeholder="Email Address" aria-invalid="false">
                            <span class="focus-input100" data-symbol=""><i class="fa fa-envelope-o"></i></span>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Amount</label>
                            <input type="text" class="form-control" name="PaymentAmount" onpaste="return false" id="txtAmount" aria-describedby="otp" placeholder="Enter Amount" aria-invalid="false">
                            <span class="focus-input100" data-symbol=""><i class="fa fa-inr"></i></span>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Notes</label>
                            <textarea class="form-control" name="PaymentNotes" id="PaymentNotes" onpaste="return false"  aria-describedby="otp" placeholder="Notes" aria-invalid="false"></textarea>
                        </div>
                        <input type="button" class="btn btn-primary mt-4" value="Make Payment" id="btnOfflinePayments" onclick="GetOrderIdForOfflinePayments();" style="margin: 10px 0;" />
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- site footer include -->
    <div class="footer" id="site-footer" data-include="footer">
        <section id="footer">
            <footer>
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 col-sm-5">
                            <div class="copyright">© Colive 2020</div>
                        </div>
                    </div>
                </div>
            </footer>
        </section>
    </div>

    <div class="CssLoaderStyles" id="AjaxLoader" style="display: none;">
        <div class="CssLoaderAlign">
            <div class="Logo-loader"></div>
            <div class="logoloader"></div>
        </div>
    </div>

    <!-- ./Footer -->
    <input type="hidden" id="hdnIsReigisteredCustomer" value="false" />
    <input type="hidden" id="hdnPaymentCustomerID" />
    <input type="hidden" id="hdnMobile" />
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
            $('#customermobile').val('');
            $("#offlinePaymentBasic").validate({
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

            $("#offlinePayment").validate({
                rules: {
                    CustomerName: "required",
                    MobileNumber: {
                        required: true,
                        number: true,
                        maxlength: 10,
                        minlength: 10
                    },
                    useremail: {
                        required: true,
                        email: true,
                    },
                    PaymentAmount: {
                        required: true,
                        number: true,
                        minlength: 1,
                        min: 1,
                        maxlength: 6,
                        max: 100000
                    },
                    PaymentNotes: "required"
                },
                messages: {
                    CustomerName: "Please enter a valid Name",
                    MobileNumber: "Please enter a valid mobile number",
                    useremail: "Please enter a valid Email-ID",
                    PaymentAmount: "Please enter a valid amount",
                    PaymentNotes: "Please enter a Notes/Description"
                }
            });

            $('#customermobile').on('keyup', function (event) {
                if (event.keyCode === 13) {
                    $('#btnVerifyRegester').click();
                }
            });

            $('#PaymentNotes').on('keyup', function (event) {
                if (event.keyCode === 13) {
                    $('#btnOfflinePayments').click();
                }
            });
        });
    </script>
</body>

</html>
