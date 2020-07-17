<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="refunddetails.aspx.cs" Inherits="Colive.Website.appview.refunddetatails" %>

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

        .dashboard_wishlist_wrap #checkout_form .account-details {
            color: #112950;
            font-size: 16px;
            font-weight: 600;
            line-height: 19px;
            text-align: left;
            padding: 10px 0px 20px 0px;
        }

        .dashboard_wishlist_wrap {
            padding: 0px 0 0px;
        }

            .dashboard_wishlist_wrap #checkout_form .checkout-form-wrap {
                background: white;
                border: 0 none;
                border-radius: 3px;
                box-shadow: 0 0 0px 0px rgba(0, 0, 0, 0.4);
                padding: 15px 15px;
                box-sizing: border-box;
                margin: 0 auto;
                position: relative;
            }

            .dashboard_wishlist_wrap #checkout_form #msform {
                margin: 20px auto;
                text-align: center;
                position: relative;
            }

            .dashboard_wishlist_wrap #checkout_form fieldset {
                width: 100% !important;
                position: static !important;
            }

            .dashboard_wishlist_wrap #checkout_form .card {
                background-color: #ffffff;
                border: 1px solid #ffdfe4;
                border-radius: 13px;
                box-shadow: 2px 11px 26px 0 rgba(255, 37, 70, 0.07);
            }

            .dashboard_wishlist_wrap #checkout_form .account-details {
                color: #112950;
                font-size: 16px;
                font-weight: 600;
                line-height: 19px;
                text-align: left;
                padding: 10px 0px 0px 15px;
            }

        hr {
            border: 1px solid #e0e6ed !important;
            margin: 8px 0;
        }

        .dashboard_wishlist_wrap #checkout_form p.holder’s {
            text-align: center;
        }

        .dashboard_wishlist_wrap #checkout_form .card-title {
            color: #112950;
            font-size: 19px;
            font-weight: 600;
            line-height: 30px;
            text-align: center;
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
            border: 2px solid #ccc;
            border-radius: 0px;
            margin-bottom: 6px;
            width: 100%;
            box-sizing: border-box;
            color: #2c3e50;
            font-size: 14px;
            cursor: pointer;
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

        @media (max-width: 320px) {
        }
    </style>
</head>
<body>
    <!-- site header include -->
    <div class="header include" id="site-header" data-include="header"></div>

    <section class="dashboard_wishlist_wrap">
        <div class="container">
            <div class="row" id="checkout_form" style="display: block;">
                <div class="col-lg-12 col-12 ">
                    <div class="checkout-form-wrap">
                        <!-- multistep form -->
                        <form id="msform">
                            <!-- fieldsets -->
                            <fieldset class="Refund_Details" style="display: block; left: 0%; opacity: 1;">
                                <div class="card user_bank_detail">
                                    <p class="account-details">Projected Refund Details</p>
                                    <hr>
                                    <div class="card-body">
                                        <div class="display_align row">
                                            <div class="col-lg-6 col-md-6 col-12 text-left">
                                                <p class="holder’s">Security Deposit:</p>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-12 text-right align_center">
                                                <h4 class="card-title">Rs: <span class="spnDeposit" id="spnDepositAmount"></span></h4>
                                            </div>
                                        </div>
                                        <div class="display_align row">
                                            <div class="col-lg-6 col-md-6 col-12 text-left">
                                                <p class="holder’s">Notice Period Charges:</p>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-12 text-right align_center">
                                                <h4 class="card-title" style="color:green;">Rs: -<span class="spnDeposit" id="spnNoticePeriodCharges"></span></h4>
                                            </div>
                                        </div>

                                        <div class="display_align row">
                                            <div class="col-lg-6 col-md-6 col-12 text-left">
                                                <p class="holder’s">LockIn Period Charges:</p>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-12 text-right align_center refund_dues_sec">
                                                <h4 class="card-title" style="color:green;">Rs: -<span class="spnDeposit" id="spnLockInPeriodCharges"></span></h4>
                                            </div>
                                        </div>

                                        <div class="display_align row">
                                            <div class="col-lg-6 col-md-6 col-12 text-left">
                                                <p class="holder’s">Separation Charges:</p>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-12 text-right align_center refund_dues_sec">
                                                <h4 class="card-title" style="color:green;">Rs: -<span class="spnDeposit" id="spnSeparationCharges"></span></h4>
                                            </div>
                                        </div>

                                        <div class="display_align row mt-4">
                                            <div class="col-lg-6 col-md-6 col-12 text-left">
                                                <p class="holder’s">Tentative Refund Amount:</p>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-12 text-right align_center">
                                                <h4 class="card-title">Rs: <span class="spnDeposit" id="spnRefundAmount"></span></h4>
                                            </div>
                                        </div>
                                    </div>

                                <div class="display_align row mt-4">
                                    <div class="text-left">
                                        <p class="holder’s" style="color: red;font-size: 10px;font-weight: 500;width: 80%;margin: 0 auto;margin-bottom: 22px;">
                                            Note: At the time of physical inspection if any damages, will be  recovered from the Security deposit. The customer has to pay the refund if it is in negative
                                        </p>
                                    </div>
                                </div>
                                </div>
                                <input type="button" name="next" class="next action-button btn btn-primary d-none d-xs-none" onclick="BindBankDetails($(this));" value="Next">
                            </fieldset>
                        </form>
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
    <div class="CssLoaderStyles" id="AjaxLoader" style="display: none;">
        <div class="CssLoaderAlign">
            <div class="Logo-loader"></div>
            <div class="logoloader"></div>
        </div>
    </div>
    <!-- ./Footer -->
    <input type="hidden" id="hdnSourceTypeId" runat="server" clientidmode="static" value="4" />
    <input type="hidden" id="hdnBookingID" runat="server" clientidmode="static" />
    <input type="hidden" id="hdnCheckoutDate" runat="server" clientidmode="static" />
    <input type="hidden" id="hdnCheckoutTime" runat="server" clientidmode="static" />
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="/assets/js/custom.js?d=20191106"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            SourceTypeId = parseInt($('#hdnSourceTypeId').val());
            BindCustomerChargesForNotice($('#hdnBookingID').val(), $('#hdnCheckoutDate').val(), $('#hdnCheckoutTime').val());
        });
    </script>
</body>
</html>
