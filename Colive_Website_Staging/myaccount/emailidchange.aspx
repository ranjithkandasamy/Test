<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="emailidchange.aspx.cs" Inherits="Colive.Website.myaccount._emailidchange" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Security-Policy" content="script-src 'self' 'unsafe-inline' https://code.jquery.com https://cdnjs.cloudflare.com/ajax/libs/popper.js/ https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/">
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
</head>
<body>
    <!-- site header include -->
    <div class="header include" id="site-header" data-include="header"></div>
    <input type="hidden" id="hdnCustomerID" name="file" />
    <section class="login-wrap" id="login-wrap">
        <div class="container">
            <div class="row">
                <!-- OTP Based login -->
                <div class="login-box col-lg-5 col-10 animated" id="loginotp-template">
                    <h1 class="text-center">Email Verification</h1>
                    <form id="loginForm" name="loginForm">
                        <div class="form-group">
                                   <label class="name" for="firstname">Customer Name</label>
                                   <input class="form-control" id="txtCustomerName" disabled name="customername" type="text" maxlength="90">
                        </div>    
                        <div class="form-group">
                                   <label class="name" for="name">Your Mobile Number</label>
                                   <input type="tel" class="form-control" id="txtMobileNumber" disabled name="mobilenumber" pattern="[0-9]{10}" x-autocompletetype="tel" maxlength="13" placeholder="">                                   
                        </div>
                        <div class="form-group">
                                   <label class="name" for="name">Your Email ID <span style="color: red">*</span></label>
                                   <input type="email" class="form-control" id="txtEmail" name="emailid" placeholder="" maxlength="75"> 
                        </div>
                        <div class="team_row_button row">
                                   <div class="_bottom">
                                          <button type="button" id="btnbasicdetails" style="margin-left: 130px;" class="btn next back submit" onclick="VerifySaveEmailId()">Save & Continue</button>
                                   </div>
                        </div>
                    </form>
                </div>  
                <%--<div class="package">
                     <div class="pbody">
                          <img src="/images/checked.png" alt="">
                          <h4 class="text-center"><p class="proximaNova" ></p></h4>                          
                      </div>
                 </div>--%>                
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

            var querystring = getQueryStringValues();
            var Verificationlink = querystring["link"];
            setTimeout(function () { BindcustomerDetailsForEmailIdChange(Verificationlink) }, 1000);
            $('#hdnCustomerID').val(Verificationlink);
        });
    </script>
</body>

</html>
