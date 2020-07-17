<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkoutfeedback.aspx.cs" Inherits="Colive.Website.appview.checkoutfeedback" %>

<!DOCTYPE html>
<!-- saved from url=(0043)https://www.colive.in/dashboard?opn=service -->
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Colive</title>
    <!-- favicon -->
    <link rel="icon" href="https://www.colive.in/images/favicon.png">
    <!-- bootstrap -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <!-- font family -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- font family ubuntu-->
    <link href="https://fonts.googleapis.com/css?family=Ubuntu&display=swap" rel="stylesheet">
    <!-- custom css -->
    <link rel="stylesheet" href="/assets/css/styles.css?d=20191105">
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            font-family: 'Ubuntu', sans-serif;
        }

        .dashboard_wishlist_wrap {
            padding: 0px 15px 0 15px;
        }

            .dashboard_wishlist_wrap .account-details {
                color: #112950;
                font-size: 16px;
                font-weight: 600;
                line-height: 19px;
                text-align: left;
                padding: 10px 0px 20px 0px;
            }

            .dashboard_wishlist_wrap #checkout_form .refund {
                color: #324b72;
                font-size: 15px;
                font-weight: 400;
                line-height: 19px;
                opacity: 0.9000000357627869;
                text-align: left;
                padding: 0px 0px 20px 0px;
            }

            .dashboard_wishlist_wrap #checkout_form .what-can-we-change {
                color: #112950;
                font-size: 16px;
                font-weight: 600;
                line-height: 19px;
                text-align: left;
                float: left;
            }

            .dashboard_wishlist_wrap #checkout_form .input-group {
                padding: 0px 0px 8px 0px;
            }

        .yes-check, no-check {
            width: 100%;
            text-align: -webkit-left;
            text-align: -moz-left;
        }

        .dashboard_wishlist_wrap #checkout_form #msform input, .dashboard_wishlist_wrap #checkout_form #msform textarea {
            padding: 15px;
            border: 2px solid #ccc;
            border-radius: 0px;
            margin-bottom: 6px;
            width: 100%;
            box-sizing: border-box;
            color: #2c3e50;
            font-size: 14px;
            cursor: pointer;
        }

        .yes-check input[type="radio"], .no-check input[type="radio"] {
            width: 100% !important;
        }

        .radioInputGroup [type="radio"]:checked, [type="radio"]:not(:checked) {
            position: absolute;
            /* left: 20px; */
            z-index: 999;
            /* top: 1px; */
            opacity: 0;
            width: 21px !important;
            height: 22px !important;
        }

            .radioInputGroup [type="radio"]:checked + label, .radioInputGroup [type="radio"]:not(:checked) + label {
                position: relative;
                padding-left: 28px;
                cursor: pointer;
                line-height: 20px;
                display: inline-block;
                color: #666;
            }

                .radioInputGroup [type="radio"]:checked + label:before, .radioInputGroup [type="radio"]:not(:checked) + label:before {
                    content: '';
                    position: absolute;
                    left: 0;
                    top: 0;
                    width: 18px;
                    height: 18px;
                    border: 2px solid #112950;
                    border-radius: 100%;
                    background: #fff;
                }

                .radioInputGroup [type="radio"]:not(:checked) + label:after {
                    opacity: 0;
                    -webkit-transform: scale(0);
                    transform: scale(0);
                }

                .radioInputGroup [type="radio"]:checked + label:after, .radioInputGroup [type="radio"]:not(:checked) + label:after {
                    content: '';
                    width: 10px;
                    height: 10px;
                    background: #f0086e;
                    position: absolute;
                    top: 4px;
                    left: 4px;
                    border-radius: 100%;
                    -webkit-transition: all 0.2s ease;
                    transition: all 0.2s ease;
                }

        .dashboard_wishlist_wrap #checkout_form #msform {
            margin: 20px auto;
            text-align: center;
            position: relative;
        }

        .custom-select {
            border: 2px solid #ced4da !important;
        }

        .custom-select {
            display: inline-block;
            width: 100%;
            height: calc(2.25rem + 2px);
            padding: .375rem 1.75rem .375rem .75rem;
            line-height: 1.5;
            color: #495057;
            vertical-align: middle;
            background: #fff url(data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' v…0 4 5'%3E%3Cpath fill='%23343a40' d='M2 0L0 2h4zm0 5L0 3h4z'/%3E%3C/svg%3E) no-repeat right .75rem center; background-size: 8px 10px;
            border: 1px solid #ced4da;
            border-radius: .25rem;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
        }

        .dashboard_wishlist_wrap #checkout_form .improve {
            color: #112950;
            font-size: 16px;
            font-weight: 600;
            line-height: 19px;
            text-align: left;
            padding-top: 16px;
            padding-bottom: 5px;
        }

        .dashboard_wishlist_wrap #checkout_form .custom-control {
            position: relative;
            text-align: left;
            padding: 4px 0px 0px 25px;
        }

        input[type=checkbox] {
            display: none;
        }

        .dashboard_wishlist_wrap #checkout_form .wifi {
            color: #112950;
            font-size: 15px;
            font-weight: 300;
            letter-spacing: 0.4px;
            line-height: 14px;
            text-align: left;
        }

        input[type=checkbox] + label {
            display: block;
            margin: 0.2em;
            cursor: pointer;
            padding: 0.2em;
        }

        #booking input[type=checkbox] + label:before {
            height: 20px;
            width: 20px;
            font-size: 14px;
        }

        .custom-checkbox .custom-control-label::before {
            border-radius: .25rem;
        }

        input[type=checkbox] + label:before {
            content: "\2714";
            border: 2px solid #112950;
            border-radius: 0.2em;
            display: inline-block;
            width: 18px;
            height: 18px;
            padding-left: 2px;
            padding-bottom: 0;
            margin-right: 0.2em;
            vertical-align: bottom;
            color: transparent;
            transition: .2s;
            margin-right: 7px;
        }

        .custom-control-label::before {
            background-color: #ffffff;
            top: 9px;
        }

        .dashboard_wishlist_wrap #checkout_form ::placeholder {
            color: #112950;
            font-size: 17px;
            font-weight: 600;
            line-height: 20px;
            text-align: left;
        }

        .dashboard_wishlist_wrap #checkout_form #msform .action-button {
            width: 100px;
            background: white;
            font-weight: bold;
            color: white;
            border: 0 none;
            border-radius: 1px;
            cursor: pointer;
            padding: 10px 0px 5px 0px;
            color: black;
            border: 2px solid #324b72;
        }

        .dashboard_wishlist_wrap #checkout_form #msform input, .dashboard_wishlist_wrap #checkout_form #msform textarea {
            padding: 15px;
            font-family: 'Ubuntu', sans-serif !important;
            border: 2px solid #ccc;
            border-radius: 0px;
            margin-bottom: 6px;
            width: 100%;
            box-sizing: border-box;
            font-family: montserrat;
            color: #2c3e50;
            font-size: 14px;
            cursor: pointer;
        }

        [type=reset], [type=submit], button, html [type=button] {
            -webkit-appearance: button;
            outline: none;
        }

        .dashboard_wishlist_wrap #checkout_form .btn.btn-primary {
            width: 100px;
            background: #e4497d !important;
            font-weight: bold;
            color: white !important;
            border: 0 none;
            border-radius: 1px;
            cursor: pointer;
            padding: 10px 5px;
            color: black;
            border: 0px solid #324b72 !important;
            padding: 10px 5px 10px 0px !important;
        }

        .dashboard_wishlist_wrap .dashboard_bookings_wrap .btn-primary {
            height: 37px;
        }

        .dashboard_wishlist_wrap #checkout_form #msform textarea.feedback_control::placeholder {
            color: #989898 !important;
            font-weight: 400 !important;
        } 

        #feedbackWelcome { 
            display:none;
        }
        #feedbackWelcome {
            background: #fff;
            border: 1px solid #dedede;
            box-shadow: 0px 0px 3px 0px #e8e8e8;
            padding: 30px 25px !important;
            text-align: center;
        }
        #feedbackWelcome h4 {
            line-height: 1.5;
            font-size: 20px;
        }
        #feedbackWelcome hr {
            width: 22%;
            border: 1px solid #ef0075 !important;
            line-height: 0px !important;
        }


        @media (max-width: 320px) {
            .dashboard_wishlist_wrap #checkout_form .improve {
                font-size: 15px;
            }

            .dashboard_wishlist_wrap #checkout_form .what-can-we-change {
                font-size: 15px;
            }
        }
    </style>
</head>
<body>
    <!-- site header include -->
    <div class="header include" id="site-header" data-include="header"></div>

    <section class="dashboard_wishlist_wrap">
        <div class="container">
            <div class="row tab-layout" id="checkout_form">
                <!-- Left side Menu -->
                <div class="col-lg-12 col-md-12 col-12 p-0">
                    <form id="msform">
                        <fieldset style="position: static !important; display: block; left: 0%; opacity: 1;">
                            <p class="account-details">Feedback Form</p>
                            <p class="refund">
                                Providing the best ever staying the person can experience at an affordable price is our motive.So it would be great if you could spend a minute of your time to tell us how we can improve our service
                            </p>
                            <label for="drop" class="what-can-we-change">
                                Would you recommend our service to others ?
                            </label>
                            <div class="input-group radioInputGroup">
                                <div class="yes-check">
                                    <input name="ServiceRecommend" value="true" type="radio">
                                    <label for="Yes" class="yesnoCheckgroup">Yes</label>
                                </div>
                                <div class="no-check">
                                    <input name="ServiceRecommend" value="false" type="radio">
                                    <label for="No" class="yesnoCheckgroup">No</label>
                                </div>
                            </div>
                            <label for="drop" class="what-can-we-change">
                                If you were unhappy with us what can we do to get you back to us ?</label>
                            <div class="input-group">
                                <select class="custom-select" id="feedbackReason">
                                    <option>None</option>
                                    <option>Inventory/Location</option>
                                    <option>Service</option>
                                    <option>Pricing</option>
                                    <option>Amenities</option>
                                </select>
                            </div>
                            <p class="improve">Among this which needs to be improved ?</p>
                            <div class="custom-control form-control-lg custom-checkbox">
                                <input type="checkbox" name="improvements" class="custom-control-input" value="Wifi" id="chkWifi">
                                <label class="custom-control-label wifi" for="chkWifi">Wifi</label>
                            </div>
                            <div class="custom-control form-control-lg custom-checkbox">
                                <input type="checkbox" name="improvements" class="custom-control-input" value="Room-mate-Issues" id="chkIssues">
                                <label class="custom-control-label wifi" for="chkIssues">Room-mate-Issues</label>
                            </div>
                            <div class="custom-control form-control-lg custom-checkbox">
                                <input type="checkbox" name="improvements" class="custom-control-input" value="DTH" id="chkDTH">
                                <label class="custom-control-label wifi" for="chkDTH">DTH</label>
                            </div>
                            <div class="custom-control form-control-lg custom-checkbox">
                                <input type="checkbox" name="improvements" class="custom-control-input" value="Cleanliness" id="chkCleanliness">
                                <label class="custom-control-label wifi" for="chkCleanliness">Cleanliness</label>
                            </div>
                            <div class="custom-control form-control-lg custom-checkbox">
                                <input type="checkbox" name="improvements" class="custom-control-input" value="Safety" id="chkSafety">
                                <label class="custom-control-label wifi" for="chkSafety">Safety</label>
                            </div>
                            <div class="custom-control form-control-lg custom-checkbox">
                                <input type="checkbox" name="improvements" class="custom-control-input" value="Others" id="chkOthers">
                                <label class="custom-control-label wifi" for="chkOthers">Others</label>
                            </div>
                            <p class="improve">Among this which needs to be improved ?</p>
                            <div class="custom-control form-control-lg custom-checkbox" style="padding-left: 0">
                                <textarea id="txtCommments" class="feedback_control" rows="5" placeholder="Enter comments"></textarea>
                            </div>
                            <input type="button" id="btnPrevious" style="visibility: hidden;" name="previous" class="action-button" onclick="void (0);" value="Back">
                            <input type="button" id="btnNext" style="visibility: hidden;" name="submit" class="action-button btn btn-primary" value="Next" onclick="Feedbacksubmitapp();">
                        </fieldset>
                    </form>
                    <div class="col-lg-12 col-md-12 col-12 p-0" id="feedbackWelcome">
                        <h4 style="align-content:center;">Feedback submitted Successfully!!!</h4>
                        <hr />
                        <h4 style="align-content:center;">Thank You</h4>
                    </div>
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
    <!-- Toast Section(alert popup) -->
    <div class="toastwrap">
        <div class="toast">
            <i class="fa fa-times toastclose" aria-hidden="true" onclick="$('.toastwrap').fadeOut();"></i>
            <span id="ToastMsg" class="ToastMsg"></span>
        </div>
    </div>
    <!-- Toast Section(alert popup) -->

    <!-- ./Payment -->
    
    <div class="CssLoaderStyles" id="AjaxLoader" style="display: none;">
        <div class="CssLoaderAlign">
            <div class="Logo-loader"></div>
            <div class="logoloader"></div>
        </div>
    </div>

    <!-- ./Footer -->
    <input type="hidden" id="hdnSourceTypeId" runat="server" clientidmode="static" value="4" />
    <input type="hidden" id="hdnBookingIdchk" runat="server" clientidmode="static" />
    <input type="hidden" id="hdnCustomerId" runat="server" clientidmode="static" />
    <input type="hidden" id="hdnFeedbackCancel" runat="server" value="0" clientidmode="static" />
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="/assets/js/custom.js?d=20191106"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var querystring = getQueryStringValues();
            var res = querystring["res"];

            if (res === 'true') {
                $('#msform').hide();
                $('#feedbackWelcome').show();
                SourceTypeId = 2
            }
            else {
                SourceTypeId = parseInt($('#hdnSourceTypeId').val());

            }
        });

        function Feedbacksubmitapp() {
            if ($('input[name=ServiceRecommend]:checked').length <= 0 || $('input[name=improvements]:checked').length <= 0) {
                Toast('please fill all the details');
            } else if ($('#chkOthers').is(':checked') && $('#txtCommments').val().length === 0) {
                Toast('please enter comments');
            } else {
                Feedbacksubmit();
            }
        }
    </script>
</body>
</html>
