<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="book.aspx.cs" Inherits="Colive.Website.myaccount.book" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Security-Policy" content="script-src 'self' 'unsafe-inline' https://code.jquery.com https://cdnjs.cloudflare.com/ajax/libs/popper.js/ https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/" />
    <title data-desc="reservation">Colive</title>
    <!-- favicon -->
    <link rel="icon" href="/assets/images/favicon.png">
    <!-- bootstrap -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <!-- font family -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- custom dropdown css -->
    <link rel="stylesheet" href="/assets/css/jquery.dropdown.css">
    <!-- custom css -->
    <link rel="stylesheet" href="/assets/css/styles.css?d=20191204">
    <!-- calendarpicker css -->
    <link rel="stylesheet" href="/assets/css/dcalendar.picker.css">
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- checkbox plugin -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css">
    <!--Animate CSS plugin-->
    <link href="/css/animate.min.css" rel="stylesheet" />
    <style>
        .bulkBookingcss .TypeChooseRoom.bg-white {
            margin-top: 20px;
            padding: 0px 0px;
            background: transparent !important;
        }

        .bulkBookingcss .TypeChooseRoom ul#myTab {
            padding-top: 14px;
            border-bottom: 1px solid #f2006c;
        }

        .bulkBookingcss .TypeChooseRoom.bg-white ul#bookingTab {
            background-color: #fff;
            padding: 12px 0 0 0;
        }

        .bulkBookingcss .choose-room .room-types .card .card-header {
            background: #f4f8fb;
            border: 0px;
        }

        .bulkBookingcss .choose-room .room-types .card {
            background: #f4f8fb;
            box-shadow: 0px 0px 4px #d8d8d8;
        }

        .bulkBookingcss .TypeChooseRoom .nav-tabs .nav-item.show .nav-link,
        .bulkBookingcss .TypeChooseRoom .nav-tabs .nav-link.active,
        .bulkBookingcss .TypeChooseRoom .nav-tabs .nav-link:hover {
            color: #f2006c;
            background-color: #fff;
            border-bottom: 4px solid #ef0075 !important;
            border-radius: 0px;
            border: 0px;
        }

        .bulkBookingcss .TypeChooseRoom .nav-tabs .nav-link {
            border-bottom: 4px solid transparent !important;
            border-radius: 0px;
            border: 0px;
            margin: 0 0px 0 0;
            padding: 0px 18px 12px 12px !important;
            text-align: center;
            font-size: 14px;
        }

        .bulkBookingcss .TypeChooseRoom .nav-tabs li.nav-item {
            width: 50%;
        }
        .paymentContent {
            color: #98A5B8;
            font-size: 14px;
            font-weight: 400;
            line-height: 20px;
            display: block;
        }
        #bookingPg .DepositEmI li {
            padding: 10px 7px;
            padding-bottom: 0px !important;
            margin-bottom: 0px !important;
            border-bottom: 0px;
        }

        .book-now .payment-detail-block .payment-detail ul.DepositEmI {
            margin-top: 5px;
            margin-bottom: 0px !important;
        }

        .book-now .payment-detail-block .payment-detail ul li.TotalRentCls {
            margin-bottom: 0px;
            border-bottom: 0px solid #E0E6ED;
            padding: 30px 0 10px 0;
        }
        /* ./ Deposit Emi */
        #bookingPg .DepositEmI li label {
            font-size: 14px;
        }

        .DepostiEMI_Btn {
            background: transparent;
            border: 0px;
            color: #ef0073;
            padding: 0px;
            cursor: pointer;
            font-weight: 500;
        }

        #depostiEMIPopup .modal-content {
            position: relative;
            border: 0px;
            border-radius: 3px !important;
            padding: 15px 0px;
        }

        #depostiEMIPopup .modal-header button {
            position: absolute;
            right: 12px;
            top: 12px;
            padding: 3px 8px;
            background: #ffffff;
            opacity: 1;
            border-radius: 50%;
            color: #ef0073;
            box-shadow: 1px -1px 2px #fff !important;
        }

        #depostiEMIPopup .modal-header {
            text-align: center;
            padding: 10px;
            border: 0;
        }

        #depostiEMIPopup .modal-dialog {
            height: 100vh;
            margin: 0 auto;
            display: flex;
            align-items: center;
        }

        #depostiEMIPopup .modal-header {
            text-align: center;
            justify-content: center;
        }

        #depostiEMIPopup h4.modal-title {
            text-align: center;
            color: #ef0073;
            font-size: 16px;
            font-weight: 600;
        }

        .DepositEMI_Content p {
            font-size: 14px;
            text-align: center;
            padding: 0px 46px 25px;
            color: #324B72;
            font-weight: 500;
        }

        #bookingPg .payment-detail-ulli#DepositEmi_Ack {
            padding: 0px !important;
            padding-bottom: 0px !important;
            display: flex !important;
            flex-direction: row !important;
        }

            #bookingPg .payment-detail-ulli#DepositEmi_Ack .TermsWrapper {
                width: 100%;
                display: flex !important;
                flex-direction: row !important;
            }

                #bookingPg .payment-detail-ulli#DepositEmi_Ack .TermsWrapper label {
                    display: flex !important;
                    justify-content: center;
                    font-size: 13px;
                    color: #324B72;
                }

        #depostiEMIPopup .DepositEmi_Submit {
            border: 2px solid #1f1b4e;
            background: transparent;
            color: #1f1b4e;
            font-size: 16px;
            font-weight: 500;
            padding: 3px 18px;
            cursor: pointer;
        }

        #depostiEMIPopup .DepositEmi_Cancel {
            border: 2px solid #ef0073;
            background: #ef0073;
            color: #fff;
            font-size: 16px;
            font-weight: 500;
            padding: 3px 18px;
            cursor: pointer;
        }

        #depostiEMIPopup .modal-footer {
            border: 0px;
            padding-top: 0px;
            display: flex;
            justify-content: center;
        }

        @media (max-width: 767px) {
            #depostiEMIPopup .modal-content {
                width: 88%;
                margin: 0 auto;
            }

            #bookingPg .payment-detail-ulli#DepositEmi_Ack {
                padding-left: 65px !important;
                margin: 0 auto !important;
            }

            .DepositEMI_Content p {
                padding: 0px 0px 25px;
            }
        }
    </style>
</head>

<body id="bookingPg">
    <!-- site header include -->
    <div class="header include" id="site-header" data-include="header"></div>

    <section class="choose-room bulkBookingcss">
        <div class="breadcrumb-wrap container-fluid breadcrumb_booking">
            <div class="links">
                <ul>
                    <li>
                        <a href="/">Home</a>
                    </li>
                    <li>
                        <a href="javascript:void(0);" id="ancBreadScrumb"></a>
                    </li>
                    <li>Book now
                    </li>
                </ul>
            </div>
        </div>
        <div class="container-fluid" id="dvReservationDetails">
            <div class="row">
                <!-- /. Filter -->
                <div class="col-lg-3 col-md-3 col-12 fixed-filter animated" id="ReservationFilter">
                    <div class="filter_box bg-white">
                        <div class="reservation_Filter_Prop">
                        <div class="close_filter_icon" onclick="ShowFilter();"><i class="fa fa-times"></i></div>
                        <div class="filter_title_sec">
                            <h3 class="filter_title">Filters</h3>
                            <input type="button" id="btnClearFilter" name="spnClearAll" class="clear_anchor" onclick="clearfilter(); ShowFilter();" value="Clear All" />
                        </div>
                        <div class="filter_section">
                            <section class="multi_filter_view">
                                <div class="filter-container">
                                    <ul id="my-list" class="active">
                                        <li class="header">
										<label>Floor Number</label></li>
                                        <ul id="ulFloorFilter">
                                        </ul>
                                        <li class="header">
                                            <label>Sharing Type</label></li>
                                        <ul id="ulSharingFilter">
                                        </ul>
                                        <li class="header">
                                            <label>Room Type</label></li>
                                        <ul id="ulRoomFilter">
                                        </ul>
                                        <li class="header">
                                            <label>Balcony Type</label></li>
                                        <ul id="ulBalconyFilter">
                                        </ul>
                                        <li class="header">
                                            <label>Bath Type</label></li>
                                        <ul id="ulBathFilter">
                                        </ul>
                                    </ul>
                                    <ul id="my-list-Private">
                                        <li class="privateheader"><label>Floor Number</label></li>
                                        <ul id="ulFloorFilter_Private">
                                        </ul>
                                        <li class="privateheader"><label>Sharing Type</label></li>
                                        <ul id="ulSharingFilter_Private">
                                        </ul>
                                        <li class="privateheader"><label>Room Type</label></li>
                                        <ul id="ulRoomFilter_Private">
                                        </ul>
                                        <li class="privateheader"><label>Balcony Type</label></li>
                                        <ul id="ulBalconyFilter_Private">
                                        </ul>
                                        <li class="privateheader"><label>Bath Type</label></li>
                                        <ul id="ulBathFilter_Private">
                                        </ul>
                                    </ul>
                                </div>
                                <div class="apply-filter" onclick="ApplyReservationFilter();ShowFilter();">Apply</div>
                            </section>
                        </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-9 col-12 transit" id="dvCheckinDetails">
                    <div class="check-date-time">
                        <h4 id="spnPropertyName"></h4>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-12">
                                <form>
                                    <div class="form-group pick-date">
                                        <label for="exampleInputEmail1">Select your tentative move-in date</label>
                                        <input type="text" class="form-control" id="txtMoveinDate" data-mindate="12/12/2017" readonly="" onclick="bookingdatebind();" onchange="MoveinDatechanged(1);" aria-describedby="checkindate" placeholder="Choose a date">
                                        <i class="fa fa-calendar" aria-hidden="true" onclick="$('#txtMoveinDate').click();"></i>
                                    </div>
                                </form>
                            </div>
                            <div class="col-lg-4 col-md-4 col-12">
                                <form>
                                    <div class="form-group pick-time">
                                        <label for="exampleInputPassword1">Select your tentative move-in time</label>
                                        <select class="form-control" id="slTimeSlots">
                                        </select>
                                        <i class="fa fa-angle-down" aria-hidden="true"></i>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="TypeChooseRoom bg-white" id="PrivateSharecontainer">
                        <ul class="nav nav-tabs animated" id="bookingTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="sharing-tab" data-count="0" data-toggle="tab" href="#sharing" role="tab" aria-controls="sharing" aria-selected="true">Sharing</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="private-tab" data-count="0" data-toggle="tab" href="#private" role="tab" aria-controls="private" aria-selected="false">Private</a>
                            </li>
                        </ul>

                        <div class="tab-content" id="bookingTabContent">
                            <!--/. sharing type tab -->
                            <div class="tab-pane fade show active" id="sharing" role="tabpanel" aria-labelledby="sharing-tab">
                                <div class="container p-0 py-3 animated" id="Bookinginfo">
                                    <!-- mt-4 -->
                                    <h3 class="choose-room-title">Choose your room number and occupancy type</h3>
                                </div>
                                <div class="room-types p-0 container" id="KeysContainer">
                                    <div class="row" id="Keydetails">
                                    </div>
                                </div>
                            </div>
                            <!--/. sharing type tab end -->
                            <!--/. Private type tab -->
                            <div class="tab-pane fade" id="private" role="tabpanel" aria-labelledby="private-tab">
                                <div class="container p-0 py-4" id="PrivateBookinginfo">
                                    <!-- mt-4 -->
                                    <h3 class="choose-room-title">Choose your private room number and occupancy type</h3>
                                </div>
                                <div class="room-types p-0" id="PrivateKeyContainer">
                                    <div class="row" id="PrivateKeyDetails">

                                    </div>
                                </div>
                            </div>
                            <!--/. Private type tab end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="book-now" id="ReservationPayment">
        <div class="booking-detail container">
            <p>Your booking details</p>
            <h4 id="spnBookingProperty"></h4>
            <div class="graphical-info bookingsummary" id="graphicalinfo">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Sharing type</th>
                            <th scope="col">Features</th>
                            <th scope="col">Rent</th>
                        </tr>
                    </thead>
                    <tbody id="SelectedBed">                      
                    </tbody>
                </table>
            </div>
            <div class="period">
                <div class="row">
                    <div class="col-lg-7 col-md-7 col-12">
                        <div class="period-block">
                            <div class="lock-period">
                                <p>Lock-in Period: <span id="spnLockinPeriod"></span></p>
                            </div>
                            <div class="notice-period">
                                <p>Notice Period: <span id="spnNoticePeriod"></span></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5 col-12">
                        <div class="TermsWrapper conditionWrapper">
                            <input type="checkbox" onclick="" id="ChkAgree" name="ChkAgree">
                            <label for="ChkAgree"></label>
                            <span class="spnTerms"><a href="/termsandconditionscheckin.html" class="ancterms" target="_blank">Terms and conditions</a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="select-block container p-0">
            <div class="select-wrap">
                <form>
                    <div class="form-group ">
                        <label for="exampleInputPassword1">Select Sales Manager</label>
                        <select class="form-control" id="ManagerDrpdwn" onchange="GetOthers(1);">
                            <option value="0">Select Manager</option>
                        </select>
                        <i class="fa fa-angle-down" aria-hidden="true"></i>
                    </div>
                    <div class="form-group ">
                        <label for="exampleInputPassword1">Select Source</label>
                        <select class="form-control" id="SourceDrpdwn" onchange="GetOthers(2);">
                            <option value="0">Select Source</option>
                        </select>
                        <i class="fa fa-angle-down" aria-hidden="true"></i>
                    </div>
                    <div class="form-group otherSource">
                        <label for="exampleInputEmail1">Enter Source</label>
                        <input type="text" class="form-control" id="txtSource">
                    </div>
                </form>
            </div>

        </div>
        <div class="payment-detail-block container p-0">
            <div class="payment-detail">
                <h4>Payment details</h4>
                <ul class="radioInputGroup">
                    <li>
                        <div class="text">
                            <p>Room Number</p>
                        </div>
                        <div class="amount-wrap">
                            <span id="spnRoomNumber"></span>
                        </div>
                    </li>

                    <li class="payment-detail-ulli">
                        <input type="radio" id="rdoReservation" name="book" value="" class="radio-custom" checked="checked" onchange="rentCalculationForBooking($('#txtCoupon').val(),$('#hdnCouponID').val(), $('#hdnIsBulkBooking').val());" />
                        <label class="form-group radio-custom-label" for="rdoReservation">
                            <p>Reservation Amount</p>
                            <span class="paymentContent" id="paymentContentRE"></span>
                        </label>
                        <div class="amount-wrap">
                            <span id="spnReservation"></span>
                        </div>
                    </li>

                    <li class="payment-detail-ulli">
                        <input type="radio" id="rdoDeposit" name="book" value="" class="radio-custom" onchange="rentCalculationForBooking($('#txtCoupon').val(),$('#hdnCouponID').val(), $('#hdnIsBulkBooking').val());" />
                        <label class="form-group radio-custom-label" for="rdoDeposit">
                            <p>
                                Deposit
                            </p>
                            <span class="paymentContent" id="paymentContentDE"></span>
                        </label>
                        <div class="amount-wrap">
                            <span id="spnAdvance"></span>
                        </div>
                    </li>
                    <ul class="DepositEmI" id="ulDepositEmI" style="display: none">
                        <li class="payment-detail-ulli">
                            <input type="radio" id="rdoTotalDeposit" name="DepositEMI" value="" class="radio-custom" onchange="rentCalculationForBooking($('#txtCoupon').val(),$('#hdnCouponID').val(), $('#hdnIsBulkBooking').val());">
                            <label class="form-group radio-custom-label" for="rdoDeposit">Pay Total Deposit</label>
                        </li>
                        <%-- EMi Option Commented start--%>
                        <li class="payment-detail-ulli">
                            <input type="radio" id="rdoEMIDeposit" name="DepositEMI" value="" class="radio-custom" onchange="rentCalculationForBooking($('#txtCoupon').val(),$('#hdnCouponID').val(), $('#hdnIsBulkBooking').val());">
                            <label class="form-group radio-custom-label" for="rdoDeposit">
                                Pay 50% Now, Balance in 5 Equal Installments
                             <button type="button" id="btnDepostiEMI" class="DepostiEMI_Btn" data-toggle="modal" data-target="#depostiEMIPopup" style="display: none">EMI Options</button></label>
                            <div class="TermsWrapper conditionWrapper" id="tacDepositemi" style="width: 20%; line-height: 10px;">
                                <input type="checkbox" onclick="" id="ChkDepositemiAgree" checked="checked" name="ChkDepositemiAgree">
                                <label for="ChkDepositemiAgree"></label>
                                <span class="spnTerms"><a href="/termsandconditionsdepositemi.html" class="ancterms" target="_blank">Terms and conditions</a></span>
                            </div>
                        </li>
                         <%-- EMi Option Commented End--%>
                    </ul>
                    <li class="payment-detail-ulli" id="liProratedRent" style="display: none">
                        <div class="TermsWrapper conditionWrapper" style="width: 64%!important">
                            <input type="checkbox" name="bookProratedRent" class="custom-control-input" onchange="rentCalculationForBooking($('#txtCoupon').val(),$('#hdnCouponID').val(), $('#hdnIsBulkBooking').val());" value="0" data-value="" id="chkProratedRent">
                            <label for="chkProratedRent" style="align-items:unset">
							<div style="width:100% !important;">Prorated-Rent<span class="paymentContent" id="paymentContentPR"></span></div>
							</label>
                        </div>

                        <div class="amount-wrap">
                            <span id="spnProratedRent"></span>
                        </div>
                    </li>
                    <li>
                        <div class="text">
                            <p>
                                Total Rent <%--<span>(Including Service charge and GST)*</span>--%>
                            </p>
                        </div>
                        <div class="amount-wrap">
                            <span id="spnRent"></span>
                        </div>
                    </li>

                    
                </ul>
                <div class="discount">
                    <div class="row">
                        <div class="col-md-4">
                            <form class="promocodecontrols">
                                <div class="form-group">
                                    <input type="text" class="form-control promocode" id="txtCoupon" placeholder="Enter Promo Code">
                                </div>
                                <div class="form-group">
                                    <input type="button" value="Apply" class="btnPromoApply" id="btnPromoApply" onclick="validateCoupon();">
                                </div>
                            </form>
                            <p id="spnCouponMsg" class="below-text"></p>
                        </div>
                        <div class="col-md-4">
                            <form class="promocodecontrols">
                                <div class="form-group">
                                    <input type="text" class="form-control promocode" id="TxtReferral" placeholder="Enter refferal code">
                                </div>
                                <div class="form-group">
                                    <input type="button" value="Apply" class="btnPromoApply" id="btnReferralApply" onclick="validateReferralCode();">
                                </div>
                            </form>
                            <p id="SpnReferralMsg" class="below-text"></p>
                        </div>
                        <div class="col-md-4">
                            <p class="last-text">* Electricity/ Power back-up Repairs, Gas refilling are on Actuals</p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="continue-btn-wrap container p-0">

            <div class="continue-cancel-btn" id="continueCancelPayment">
                <div class="total-amount">
                    <p>Total Payable: <span id="spnTotalPayable"></span></p>
                </div>
                <div class="buttons">
                    <button class="continue-btn btnRentCalculation" id="btnReservationConfirmation" onclick="bookingInsert();">Book</button>
                    <button class="cancel-btn" id="btnReservationCancellation" onclick="cancelBookingRequest();">Cancel</button>
                </div>
            </div>
        </div>
    </section>


    <input type="hidden" id="hdnCouponID" runat="server" clientidmode="static" value="0" />
    <input type="hidden" id="hdnLocationId" runat="server" clientidmode="static" value="0" />
    <input type="hidden" id="hdnRoomId" runat="server" clientidmode="static" value="0" />
    <input type="hidden" id="hdnIsBulkBooking" runat="server" clientidmode="static" value="0" />
    <input type="hidden" id="hdnReferralCode" runat="server" clientidmode="static" value="0" />
    <input type="hidden" id="hdnBedKeyIds" runat="server" clientidmode="static" value="" />
    <input type="hidden" id="hdnBookingId" />
    <input type="hidden" id="hdnRequestStatusId" runat="server" clientidmode="static" value="1" />
    <input type="hidden" id="hdnLink" runat="server" clientidmode="static" value="0" />
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

    <!-- Adreess Modal -->
    <div class="modal fade address-popup" id="addressmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-center" id="exampleModalLabel">Permanent Address</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="permanentaddress1" name="loginForm" novalidate="novalidate">
                        <div class="form-group">
                            <label class="name">Country<span style="color: red">*</span></label>
                            <div id="dvCountry1">
                                <select class="form-control" id="ddlCountry1" name="country" style="display: none;" onchange="BindStates($(this),1);">
                                </select>
                            </div>
                            <input class="form-control" id="txtCountry1" name="country" size="30" type="text" maxlength="90" placeholder="Enter your Country">
                        </div>
                        <div class="form-group">
                            <label class="name">State<span style="color: red">*</span></label>
                            <div id="dvState1">
                                <select class="form-control" id="ddlstate1" name="state" style="display: none;" onchange="BindCities($(this),1);">
                                </select>
                            </div>
                            <input class="form-control" id="txtState1" name="state" size="30" type="text" maxlength="90" placeholder="Enter your State">
                        </div>
                        <div class="form-group">
                            <label class="name">Town/City<span style="color: red">*</span></label>
                            <div id="dvCity1">
                                <select class="form-control" id="ddlCity1" name="city" style="display: none;" onchange="CityChanged(1);">
                                </select>
                            </div>
                            <input class="form-control" id="txtCity1" name="city" size="30" type="text" maxlength="90" placeholder="Enter your city">
                        </div>
                        <div class="form-group">
                            <label class="name">Flat/House No<span style="color: red">*</span></label>
                            <input class="form-control" id="txtHouseNumber1" name="housenumber" size="100" type="text" maxlength="120">
                        </div>
                        <div class="form-group">
                            <label class="name">Colony/Street/Locality<span style="color: red">*</span></label>
                            <input class="form-control" id="txtStreet1" name="streetlocality" size="100" type="text" maxlength="120">
                        </div>
                        <div class="form-group">
                            <label class="name">Pincode<span style="color: red">*</span></label>
                            <input class="form-control" id="txtPincode1" name="pincode" type="text" maxlength="6">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="BookingAddressDetailsInsert();">Save changes</button>
                </div>
            </div>
        </div>
    </div>

    <form id="fmPayment" name="frmPg" action="/pg/paymentoptions.aspx" method="post">
        <input type="hidden" value="" id="OrderId" name="OrderId" />
    </form>

    <!-- ./Adreess Modal -->

    <!-- KYC Modal -->
    <div class="modal fade address-popup" id="kycmodal" tabindex="-1" role="dialog" aria-labelledby="kycModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-center" id="kycModalLabel">KYC Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="Tenant-page-wrap">

                        <section class="Tenant-Profiling">
                            <div class="tenant">
                                <div class="container">
                                    <div class="row">
                                        <h1 class="tenant-title">Colive KYC Registration -
                            <br>
                                            Resident Profiling</h1>
                                    </div>
                                    <div class="paseege">
                                        <p class="As-part">
                                            You are important to us and these details will help us know you better . At Colive Community, we  share more than just laughs and smiles - we look after each other & are responsible for each others well-being
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <div class="container">
                                <div class="emmet">
                                    <div class="row">
                                        <div class="col-12 situation">
                                            <div class="form-progress">
                                                <progress class="form-progress-bar" min="0" max="231" value="0" step="33"
                                                    aria-labelledby="form-progress-completion"></progress>
                                                <div class="form-progress-indicator one active"></div>
                                                <div class="form-progress-indicator two"></div>
                                                <div class="form-progress-indicator three"></div>
                                                <div class="form-progress-indicator four"></div>
                                                <div class="form-progress-indicator five"></div>
                                                <div class="form-progress-indicator six"></div>
                                                <div class="form-progress-indicator seven"></div>
                                                <div class="form-progress-indicator eight"></div>
                                                <p id="form-progress-completion" class="js-form-progress-completion sr-only" aria-live="polite">0%  complete</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="container">
                                <div class="aleph">
                                    <div class="animation" style="padding-bottom: 0px !important">
                                        <!-- Step one -->
                                        <div class="col-12">
                                            <div class="form-step js-form-step" data-step="1">
                                                <div name="form-step-1">
                                                    <div class="team_row">
                                                        <div class="navButtons">
                                                            <button type="button" id="btnBasicNext" onclick="showNextForm($(this).parents('.js-form-step'));" class="btn-primary btn kycNext colive-fa-i"><i class="fa fa-chevron-right" style="color: #ef0075 !important;" aria-hidden="true"></i></button>
                                                        </div>
                                                    </div>
                                                    <div class="team row row_direction">
                                                        <form id="personaldetails" name="personaldetails" class="col-6">
                                                            <div class="form-group">
                                                                <label class="name" for="firstname">Full Name <span style="color: red">*</span><span class="bankInfoSpan">&nbsp;(As Per PAN Records)</span></label>
                                                                <input class="form-control" id="txtFirstName" style="width: 495px;" name="firstname" placeholder="Name" type="text" maxlength="200">                                                        
                                                            </div>
                                                            <%--<div class="col-12">
                                                                <div class="row sub-ro">
                                                                    <div class="col-6 mid-box">
                                                                        <div class="form-group">
                                                                            <label class="name" for="firstname">First Name <span style="color: red">*</span></label>
                                                                            <input class="form-control" id="txtFirstName" name="firstname" placeholder="First Name" type="text" maxlength="90">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-6 mid-box2">
                                                                        <div class="form-group">
                                                                            <label class="name" for="lastname">Last Name</label>
                                                                            <input type="text" class="form-control" name="lastname" id="txtLastName" placeholder="Last Name" maxlength="90">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>--%>
                                                            <div class="drop-down">
                                                                <i class="fa fa-angle-down" aria-hidden="true"></i>
                                                                <label class="name" for="name">Your Gender ? <span style="color: red">*</span></label>
                                                                <select class="form-control" id="ddlGender" name="gender">
                                                                    <option value="Male">Male</option>
                                                                    <option value="Female">Female</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="name" for="name">Your Mobile Number <span style="color: red">*</span></label>
                                                                <input type="tel" class="form-control" id="txtMobile" disabled name="mobilenumber" pattern="[0-9]{10}" x-autocompletetype="tel" maxlength="13" placeholder="">
                                                                <p class="emergency">Registered phone number with Colive</p>
                                                            </div>
                                                            <%--EmailVerification Changes By Shilpa--%>
                                                            <div class="form-group">
                                                                <label class="name" for="name">Your Email ID <span style="color: red">*</span></label>
                                                                <input type="email" class="form-control" id="txtEmail" name="emailid" placeholder="" maxlength="75">
                                                                <p id="lblMailValidate" class="emergency">Registered email id with Colive</p>
                                                                <img src="/assets/images/Warning.jpg" id="imgWarning" style="margin-top: 6px; height: 13px;" alt="Warning" />
                                                                <p id="lblMailId" class="emergency" style="margin-left: 18px; margin-top: -15px;">Your mailId is not verified, Click <a href="javascript:;" id="lnkVerifyMail" onclick="SaveKycBasicDetails($(this).parents('.js-form-step'));">here</a>  to verify</p>
                                                            </div>
                                                            <div>
                                                                <%--<button type="button" id="btnVerifyMail" class="btn next back submit" onclick="VerifyMailId();">Verify Email</button>--%>
                                                            </div>

                                                            <div class="form-group">
                                                                <label class="name" foremost="profile[bank_detail_attributes][cheque_leaf]">Upload Your Picture <span style="color: red">*</span></label>
                                                                <label class="name" for="profile[bank_detail_attributes][cheque_leaf]">(Maximum file size 1.5MB)</label><br>
                                                                <div class="uploader userprofilepicture" name="profilepic">
                                                                    <p class="colive-fa-i drag">click here or drag here your images</p>
                                                                    <img id="ProfileImg" src="" onclick="$('#filePhoto').click();" />
                                                                    <input type="file" name="userprofile_picture" accept="image/*" data-imgsrc="ProfileImg" data-imagebinaryid="hdnProfileImageBinary"
                                                                        data-filenameid="hdnProfileImageFile" data-labelid="spnSRFileName" onchange="handleFileImg(this);" id="filePhoto" />
                                                                    <input type="hidden" id="hdnProfileImageBinary" name="file" />
                                                                    <input type="hidden" id="hdnProfileImageFile" name="file" />
                                                                </div>
                                                            </div>
                                                        </form>
                                                        <div class="col-6 padd0">
                                                            <div class="tour">
                                                                <h1 class="Personal Details">Basic Information</h1>
                                                                <div>
                                                                    <p class="foremost">
                                                                        Tell us how the world sees you, everybody you know, knows this about you
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="team_row_button row">
                                                        <div class="_bottom">
                                                            <button type="submit" id="btnbasicdetails" class="btn next back submit" onclick="CheckEmailVerified($(this).parents('.js-form-step'));">Save & Continue</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Step two -->
                            <div class="container">
                                <div class="aleph">
                                    <div class="animation">
                                        <div class="col-12">
                                            <div class="form-step js-form-step waiting hidden" data-step="2">
                                                <div name="form-step-2">
                                                    <div class="team_row">
                                                        <div class="navButtons">
                                                            <button type="button" id="btnAddressPrev" onclick="showPrevForm($(this).parents('.js-form-step'));" class="btn-primary btn kycback colive-fa-i"><i class="fa fa-chevron-left" aria-hidden="true"></i></button>
                                                            <button type="submit" id="btnAddressNext" onclick="showNextForm($(this).parents('.js-form-step'));" class="btn-primary btn kycNext colive-fa-i"><i class="fa fa-chevron-right" style="color: #ef0075 !important;" aria-hidden="true"></i></button>
                                                        </div>
                                                    </div>
                                                    <div class="team row row_direction">
                                                        <form id="permanentaddress" name="permanentaddress" class="col-6">
                                                            <div class="col-12">
                                                                <div class="row sub-ro">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="name">Country<span style="color: red">*</span></label>
                                                                <div id="dvCountry">
                                                                    <select class="form-control" id="ddlCountry" name="country" style="display: none;" onchange="BindStates($(this));">
                                                                    </select>
                                                                </div>
                                                                <input class="form-control" id="txtCountry" name="country" size="30" type="text" maxlength="90" placeholder="Enter your Country">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="name">State<span style="color: red">*</span></label>
                                                                <div id="dvState">
                                                                    <select class="form-control" id="ddlstate" name="state" style="display: none;" onchange="BindCities($(this));">
                                                                    </select>
                                                                </div>
                                                                <input class="form-control" id="txtState" name="state" size="30" type="text" maxlength="90" placeholder="Enter your State">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="name">Town/City<span style="color: red">*</span></label>
                                                                <div id="dvCity">
                                                                    <select class="form-control" id="ddlCity" name="city" style="display: none;" onchange="CityChanged(0);">
                                                                    </select>
                                                                </div>
                                                                <input class="form-control" id="txtCity" name="city" size="30" type="text" maxlength="90" placeholder="Enter your city">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="name">Flat/House No<span style="color: red">*</span></label>
                                                                <input class="form-control" id="txtHouseNumber" name="housenumber" size="100" type="text" maxlength="120">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="name">Colony/Street/Locality<span style="color: red">*</span></label>
                                                                <input class="form-control" id="txtStreet" name="streetlocality" size="100" type="text" maxlength="120">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="name">Pincode<span style="color: red">*</span></label>
                                                                <input class="form-control" id="txtPincode" name="pincode" type="text" maxlength="6">
                                                            </div>

                                                        </form>
                                                        <div class="col-6 padd0">
                                                            <div class="tour">
                                                                <h1 class="Basic-Details">Permanent Address</h1>
                                                                <div>
                                                                    <p class="utmost">
                                                                        As part of the Colive community, it’s our first and
                                                    foremost duty towards you to ensure your security and
                                                    safety to the utmost, for which we need some details so
                                                    that the.
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="team_row_button row">
                                                        <div class="_bottom">
                                                            <button id="btnSavePermanentAddress" class="btn next back submit" onclick="SaveKYCPermanentAddress($(this).parents('.js-form-step'));">Save & Continue</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Step three -->
                            <div class="container">
                                <div class="aleph">
                                    <div class="animation">
                                        <div class="col-12">
                                            <div class="form-step js-form-step waiting hidden" data-step="3">
                                                <div name="form-step-3">
                                                    <div class="team_row">
                                                        <div class="navButtons">
                                                            <button type="button" id="btnPanPrev" onclick="showPrevForm($(this).parents('.js-form-step'));" class="btn-primary btn kycback colive-fa-i"><i class="fa fa-chevron-left" aria-hidden="true"></i></button>
                                                            <button type="submit" id="btnPanNext" onclick="showNextForm($(this).parents('.js-form-step'));" class="btn-primary btn kycNext colive-fa-i"><i class="fa fa-chevron-right" style="color: #ef0075 !important;" aria-hidden="true"></i></button>
                                                        </div>
                                                    </div>
                                                    <div class="team row row_direction">
                                                        <form id="pandetails" name="pandetails" class="col-6">

                                                            <div class="form-group">
                                                                <label class="name">PAN Card Holder Name<span style="color: red">*</span></label>
                                                                <input class="form-control" id="txtPANCardHolderName" name="panholdername" size="30" maxlength="90" type="text">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="name">PAN Number<span style="color: red">*</span></label>
                                                                <input class="form-control" id="txtPANNumber" name="panname" size="30" maxlength="10" type="text">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="name" for="profile[bank_detail_attributes][cheque_leaf]">Scan of PAN Card (image files like jpg,png only)<span style="color: red">*</span></label><br>
                                                                <label for="profile[bank_detail_attributes][cheque_leaf]" style="font-size: 12px;">(Maximum file size 1.5MB)</label><br>
                                                                <div class="uploader pan">
                                                                    <p class="colive-fa-i dragproof">click here or drag here your images</p>
                                                                    <img id="PanImg" src="" onclick="$('#panphoto').click();" />
                                                                    <input type="file" name="panprofile_picture" accept="image/*" data-imgsrc="PanImg" data-imagebinaryid="hdnPanImageBinary"
                                                                        data-filenameid="hdnPanImageFile" data-labelid="spnSRFileName" onchange="handleFileImg(this);" id="panphoto" />
                                                                    <input type="hidden" id="hdnPanImageBinary" name="file" />
                                                                    <input type="hidden" id="hdnPanImageFile" name="file" />
                                                                </div>
                                                            </div>
                                                        </form>
                                                        <div class="col-6 padd0">
                                                            <div class="tour margin_none_sec" style="margin-bottom: 82px;">
                                                                <h1 class="Employment Details">PAN Details</h1>
                                                                <div>
                                                                    <p class="utmost">
                                                                        Share your PAN card details for our records
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="team_row_button row">
                                                        <div class="thrise">
                                                            <button id="btnSavePan" class="btn next back submit" onclick="SavePanDetails($(this).parents('.js-form-step'));">Save & Continue</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Step four -->
                            <div class="container">
                                <div class="aleph">
                                    <div class="animation">
                                        <div class="col-12">
                                            <div class="form-step js-form-step waiting hidden" data-step="4">
                                                <div name="form-step-3">
                                                    <div class="team_row">
                                                        <div class="navButtons">
                                                            <button type="button" id="btnEmergePrev" onclick="showPrevForm($(this).parents('.js-form-step'));" class="btn-primary btn kycback colive-fa-i"><i class="fa fa-chevron-left" aria-hidden="true"></i></button>
                                                            <button type="submit" id="btnEmergeNext" onclick="showNextForm($(this).parents('.js-form-step'));" class="btn-primary btn kycNext colive-fa-i"><i class="fa fa-chevron-right" style="color: #ef0075 !important;" aria-hidden="true"></i></button>
                                                        </div>
                                                    </div>
                                                    <div class="team row row_direction">
                                                        <form id="emergdetails" name="emergdetails" class="col-6">

                                                            <div class="form-group">
                                                                <label class="name">Guardian Name <span style="color: red">*</span> </label>
                                                                <input class="form-control" id="txtGuardianName" name="guardianname" size="50" maxlength="90" type="text">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="name">Relationship <span style="color: red">*</span> </label>
                                                                <select class="form-control" id="ddlRelationship" name="guardianrelation">
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="name">Guardian Phone <span style="color: red">*</span> </label>
                                                                <input class="form-control" id="txtGuardianPhone" name="guardianphone" minlength="10" maxlength="13" size="15" type="text">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="name">Permananent Address <span style="color: red">*</span> </label>
                                                                <input class="form-control" id="txtPermananentAddress" name="permananentadd" size="100" maxlength="240" type="text">
                                                            </div>
                                                        </form>
                                                        <div class="col-6 padd0">
                                                            <div class="tour">
                                                                <h1 class="Employment Details">Emergency Details</h1>
                                                                <div>
                                                                    <p class="utmost">
                                                                        As part of the Colive community, it’s our first and
                                                    foremost duty towards you to ensure your security and
                                                    safety to the utmost, for which we need some details so
                                                    that the.
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="team_row_button row">
                                                        <div class="thrise">
                                                            <button id="btnEmergencydetails" class="btn next back submit" onclick="SaveEmergencyDetailsInsert($(this).parents('.js-form-step'));">Save & Continue</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Step five -->
                            <div class="container">
                                <div class="aleph">
                                    <div class="animation">
                                        <div class="col-12">
                                            <div class="form-step js-form-step waiting hidden" data-step="5">
                                                <div name="form-step-3">
                                                    <div class="team_row">
                                                        <div class="navButtons">
                                                            <button type="button" id="btnBankPrev" onclick="showPrevForm($(this).parents('.js-form-step'));" class="btn-primary btn kycback colive-fa-i"><i class="fa fa-chevron-left" aria-hidden="true"></i></button>
                                                            <button type="submit" id="btnBankNext" onclick="showNextForm($(this).parents('.js-form-step'));" class="btn-primary btn kycNext colive-fa-i"><i class="fa fa-chevron-right" style="color: #ef0075 !important;" aria-hidden="true"></i></button>
                                                        </div>
                                                    </div>
                                                    <div class="team row row_direction">
                                                        <form id="bankinfo" name="bankinfo" class="col-6">

                                                            <div class="form-group">
                                                                <label class="name">Account Holder's Name <span style="color: red">*</span> </label>
                                                                <input class="form-control" id="txtAccountHolderName" name="accholdername" size="30" type="text" maxlength="80">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="name">Bank Name <span style="color: red">*</span></label>
                                                                <input class="form-control" id="txtBankName" name="bankname" size="30" type="text" maxlength="80">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="name">Account Number <span style="color: red">*</span></label>
                                                                <input class="form-control" id="txtAccountNumber" name="accnumber" size="30" type="text" maxlength="80">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="name">IFSC Code <span style="color: red">*</span></label>
                                                                <input class="form-control" id="txtIFSCCode" name="ifsccode" size="30" type="text" maxlength="80">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="name" for="profile[bank_detail_attributes][cheque_leaf]">Scan of Cheque Leaf (image files like jpg,png only)</label><br>
                                                                <label for="profile[bank_detail_attributes][cheque_leaf]" style="font-size: 12px;">(Maximum file size 1.5MB)</label><br>
                                                                <div class="uploader bank">
                                                                    <p class="colive-fa-i dragproof">click here or drag here your images</p>
                                                                    <img id="BankImg" src="" onclick="$('#bankphoto').click()" />
                                                                    <input type="file" name="bankprofile_picture" accept="image/*" data-imgsrc="BankImg" data-imagebinaryid="hdnbankImageBinary"
                                                                        data-filenameid="hdnbankImageFile" data-labelid="spnSRFileName" onchange="handleFileImg(this);" id="bankphoto" />
                                                                    <input type="hidden" id="hdnbankImageBinary" name="file" />
                                                                    <input type="hidden" id="hdnbankImageFile" name="file" />
                                                                </div>
                                                            </div>
                                                        </form>
                                                        <div class="col-6 padd0">
                                                            <div class="tour">
                                                                <h1 class="Employment Details">Bank details (to process deposit refund)</h1>
                                                                <div>
                                                                    <p class="utmost">
                                                                        Update your account details, this is useful when we process your deposit refunds at the time of your check-out
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="team_row_button row">
                                                        <div class="thrise">
                                                            <button id="btnBankdetails" class="btn next back submit" onclick="SaveBankDetails($(this).parents('.js-form-step'));">Save & Continue</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Step six -->
                            <div class="container">
                                <div class="aleph">
                                    <div class="animation">
                                        <div class="col-12">
                                            <div class="form-step js-form-step waiting hidden" data-step="6">
                                                <div name="form-step-3">
                                                    <div class="team_row">
                                                        <div class="navButtons">
                                                            <button type="button" id="btnQualificationPrev" onclick="showPrevForm($(this).parents('.js-form-step'));" class="btn-primary btn kycback colive-fa-i"><i class="fa fa-chevron-left" aria-hidden="true"></i></button>
                                                            <button type="submit" id="btnQualificationNext" onclick="showNextForm($(this).parents('.js-form-step'));" class="btn-primary btn kycNext colive-fa-i"><i class="fa fa-chevron-right" style="color: #ef0075 !important;" aria-hidden="true"></i></button>
                                                        </div>
                                                    </div>
                                                    <div class="team row row_direction">
                                                        <form id="employinfo" name="employinfo" class="col-6 radioInputGroup">
                                                            <div class="form-group" style="padding-top: 42px;">
                                                                <div>
                                                                    <input class="radio-custom" id="Iamemployed" name="employment" type="radio" onchange="ShowEmploytext($(this));" value="1">
                                                                    <label class="radio-custom-label" for="Iamemployed">I am employed</label>
                                                                    <input class="form-control radio-custom-label hdntxtcompany" id="txtOrganization" type="text" name="organization" placeholder="Enter Name of your organization *" maxlength="45" />
                                                                    <input class="form-control radio-custom-label hdntxtcompany" id="txtDesignation" type="text" name="designation" placeholder="Enter Designation" maxlength="115" />
                                                                </div>
                                                                <div>
                                                                    <input class="radio-custom" id="IamStudent" name="employment" type="radio" onchange="ShowEmploytext($(this));" value="2">
                                                                    <label class="radio-custom-label" for="IamStudent">I am Student</label>
                                                                </div>
                                                                <div>
                                                                    <input class="radio-custom" id="Iamselfemployed" name="employment" type="radio" onchange="ShowEmploytext($(this));" value="3">
                                                                    <label class="radio-custom-label" for="Iamselfemployed">I am self employed</label>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="form-label-title">Highest Education Qualification</label>
                                                                <div class="error" id="employment_education_error_div" style="display: none;"></div>
                                                                <div>
                                                                    <div>
                                                                        <input class="radio-custom" id="HighSchool" name="education" type="radio" value="1">
                                                                        <label class="radio-custom-label" for="HighSchool">High School</label>
                                                                    </div>
                                                                </div>
                                                                <div>
                                                                    <div>
                                                                        <input class="radio-custom" id="Diploma" name="education" type="radio" value="2">
                                                                        <label class="radio-custom-label" for="Diploma">Diploma</label>
                                                                    </div>
                                                                </div>
                                                                <div>
                                                                    <div>
                                                                        <input class="radio-custom" id="BachelorsDegree" name="education" type="radio" value="3">
                                                                        <label class="radio-custom-label" for="BachelorsDegree">Bachelor's Degree</label>
                                                                    </div>
                                                                </div>
                                                                <div>
                                                                    <div>
                                                                        <input class="radio-custom" id="MastersDegree" name="education" type="radio" value="4">
                                                                        <label class="radio-custom-label" for="MastersDegree">Master's Degree</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                        <div class="col-6 padd0">
                                                            <div class="tour">
                                                                <h1 class="Employment Details">Employment Information</h1>
                                                                <div>
                                                                    <p class="utmost">
                                                                        Tell us what you do, share your occupational details 
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="team_row_button row">
                                                        <div class="thrise">
                                                            <button id="btnEmployementdetails" class="btn next back submit" onclick="SaveEmployementDetails($(this).parents('.js-form-step'));">Save & Continue</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Step seven -->
                            <div class="container">
                                <div class="aleph">
                                    <div class="animation">
                                        <div class="col-12">
                                            <div class="form-step js-form-step waiting hidden" data-step="7">
                                                <div name="form-step-3">
                                                    <div class="team_row">
                                                        <div class="navButtons">
                                                            <button type="button" id="btnIDProofPrev" onclick="showPrevForm($(this).parents('.js-form-step'));" class="btn-primary btn kycback colive-fa-i"><i class="fa fa-chevron-left" aria-hidden="true"></i></button>
                                                            <button type="submit" id="btnIDProofNext" onclick="showNextForm($(this).parents('.js-form-step'));" class="btn-primary btn kycNext colive-fa-i"><i class="fa fa-chevron-right" style="color: #ef0075 !important;" aria-hidden="true"></i></button>
                                                        </div>
                                                    </div>
                                                    <div class="team row row_direction">
                                                        <form id="idprrof" name="idprrof" class="col-6 radioInputGroup">
                                                            <div class="form-group" style="padding-top: 42px;">
                                                                <div>
                                                                    <input class="radio-custom" id="rbIDAadharCard" name="idproof" type="radio" value="2">
                                                                    <label class="radio-custom-label" for="rbIDAadharCard">Voter ID</label>
                                                                </div>
                                                                <div>
                                                                    <input class="radio-custom" id="rbIDPassport" name="idproof" type="radio" value="3">
                                                                    <label class="radio-custom-label" for="rbIDPassport">Driving License</label>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="name">ID Holder Name<span style="color: red">*</span><span class="bankInfoSpan">&nbsp;(As Per Records)</span></label>
                                                                <input class="form-control" id="txtIDHolderName" name="IDname" size="30" maxlength="90" type="text">
                                                                <label class="name" for="firstname">Number for Choosen ID <span style="color: red">*</span></label>
                                                                <input class="form-control" id="txtIDNumber" name="IDNumber" placeholder="ID Number" type="text" maxlength="90">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="name" for="profile[bank_detail_attributes][cheque_leaf]">Scan of chosen ID Proof with Address (image files like jpg,png only)<span style="color: red">*</span></label><br>
                                                                <label for="profile[bank_detail_attributes][cheque_leaf]" style="font-size: 12px;">(Maximum file size 1.5MB)</label><br>
                                                                <div class="uploader idaddress">
                                                                    <p class="colive-fa-i dragproof">click here or drag here your images</p>
                                                                    <img id="Imgproof" src="" onclick="$('#idproofprofile').click()" />
                                                                    <input type="file" name="idprofile_picture" accept="image/*" data-imgsrc="Imgproof" data-imagebinaryid="hdnidproofImageBinary"
                                                                        data-filenameid="hdnidproofImageFile" data-labelid="spnSRFileName" onchange="handleFileImg(this);" id="idproofprofile" />
                                                                    <input type="hidden" id="hdnidproofImageBinary" name="file" />
                                                                    <input type="hidden" id="hdnidproofImageFile" name="file" />
                                                                </div>
                                                            </div>
                                                        </form>
                                                        <div class="col-6 padd0">
                                                            <div class="tour margin_none_sec" style="margin-bottom: 78px;">
                                                                <h1 class="Employment Details">Resident KYC</h1>
                                                                <div>
                                                                    <p class="utmost">
                                                                        Share your photo id proof with permanent address, this is a pre-requisite for all rental agreements as per government regulations
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="team_row_button row">
                                                        <div class="thrise">
                                                            <button id="btnResidentKYC" class="btn next back submit" onclick="SaveResidentKYC($(this).parents('.js-form-step'));">Save & Continue</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Step eight -->
                            <div class="container">
                                <div class="aleph">
                                    <div class="animation">
                                        <div class="col-12">
                                            <div class="form-step js-form-step waiting hidden" data-step="8">
                                                <div name="form-step-3">
                                                    <div class="team_row">
                                                        <div class="navButtons">
                                                            <button type="button" id="btnOtherPrev" onclick="showPrevForm($(this).parents('.js-form-step'));" class="btn-primary btn kycback colive-fa-i"><i class="fa fa-chevron-left" aria-hidden="true"></i></button>
                                                        </div>
                                                    </div>
                                                    <div class="team row row_direction">
                                                        <form id="otherinfo" name="otherinfo" class="col-6 radioInputGroup">
                                                            <div class="form-group">
                                                                <i class="fa fa-angle-down" aria-hidden="true"></i>
                                                                <label class="name">Blood Group <span style="color: red">*</span></label>
                                                                <select class="form-control" id="ddlBloodGroup" name="bloodgroup">
                                                                    <option value=""></option>
                                                                    <option value="A-">A-</option>
                                                                    <option value="A+">A+</option>
                                                                    <option value="AB+">AB+</option>
                                                                    <option value="B-">B-</option>
                                                                    <option value="B+">B+</option>
                                                                    <option value="O-">O-</option>
                                                                    <option value="O+">O+</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <i class="fa fa-angle-down" aria-hidden="true"></i>
                                                                <label class="name">Age Group <span style="color: red">*</span></label>
                                                                <select class="form-control" id="ddlAgeGroup" name="agegroup">
                                                                    <option value=""></option>
                                                                    <option value="18-24">18-24</option>
                                                                    <option value="25-31">25-31</option>
                                                                    <option value="31 and above">31 and above</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="name">Medical History</label>
                                                                <input class="form-control" id="txtMedicalHistory" name="medicalhis" maxlength="450" type="text">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="name">Languages You Speak</label>
                                                                <input class="form-control" id="txtLanguagesSpeak" name="language" maxlength="450" type="text">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="name">Interests and Hobbies <span style="color: red">*</span></label>
                                                                <input class="form-control" id="txtInterestsHobbies" name="hobbies" maxlength="450" type="text">
                                                            </div>
                                                            <div class="form-group">
                                                                <i class="fa fa-angle-down" aria-hidden="true"></i>
                                                                <label class="name">Marital Status</label>
                                                                <select class="form-control" id="ddlMaritalStatus" name="martialstatus">
                                                                    <option value=""></option>
                                                                    <option value="Unmarried">Unmarried</option>
                                                                    <option value="Married">Married</option>
                                                                    <option value="Live-in">Live-in</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="name">College Alumni <span style="color: red">*</span></label>
                                                                <input class="form-control" id="txtCollegeAlumni" name="alumni" maxlength="450" type="text">
                                                            </div>
                                                            <div class="form-group">
                                                                <i class="fa fa-angle-down" aria-hidden="true"></i>
                                                                <label class="name">Income Range</label>
                                                                <select class="form-control" id="ddlIncomeRange" name="incomerange">
                                                                    <option value=""></option>
                                                                    <option value="2 Lakhs to 5 Lakhs">2 Lakhs to 5 Lakhs</option>
                                                                    <option value="6 Lakhs to 10 Lakhs">6 Lakhs to 10 Lakhs</option>
                                                                    <option value="10 Lakhs and above">10 Lakhs and above</option>
                                                                </select>
                                                            </div>

                                                            <div class="form-group">
                                                                <label class="name">Allergic To</label>
                                                                <input class="form-control" id="txtAllergicTo" name="allergic" maxlength="450" type="text">
                                                            </div>
                                                            <div class="form-group">
                                                                <i class="fa fa-angle-down" aria-hidden="true"></i>
                                                                <label class="name">Own Vehicle</label>
                                                                <select class="form-control" id="ddlOwnVehicle" name="ownvechicle">
                                                                    
                                                                    <option value="2 wheeler">2 Wheeler</option>
                                                                    <option value="4 wheeler">4 Wheeler</option>
                                                                    <option value="Both">Both</option>
                                                                    <option value="None">None</option>
                                                                </select>
                                                            </div>
                                                             <div class="form-group">
                                                                <label class="name" id="lbl2WheelerNumber">2 Wheeler Number <span style="color: red">*</span></label>
                                                                <input class="form-control" id="txt2WheelerNumber" name="WheelerNumber" maxlength="250" type="text">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="name" style="display:none" id="lbl4WheelerNumber">4 Wheeler Number <span style="color: red">*</span></label>
                                                                <input class="form-control" style="display:none" id="txt4WheelerNumber" name="WheelerNumber" maxlength="250" type="text">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="name form-label-title">Food Habits</label>
                                                                <div style="padding-top: 65px;">
                                                                    <div class="col-1-4">
                                                                        <input class="radio-custom" id="rbVegeterian" name="vegeterian" type="radio" value="Vegeterian">
                                                                        <label class="radio-custom-label" for="rbVegeterian">Vegeterian</label>
                                                                    </div>
                                                                    <div class="col-1-4">
                                                                        <input class="radio-custom" id="rbNonVegeterian" name="vegeterian" type="radio" value="NonVegeterian">
                                                                        <label class="radio-custom-label" for="rbNonVegeterian">Non Vegeterian</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <%--WhatsApp Template By Shilpa--%>
                                                            <div class="whatsapp_Toogle">
                                                                <img src="/assets/images/whatsapp.png" />
                                                                <span class="spnWhatsApp" style="font-weight: bold">Get Updates on WhatsApp</span>
                                                                <input type="checkbox" id="ChkOn" name="ChkOn" data-toggle="toggle" data-size="small">
                                                                <label for="ChkOn"></label>

                                                            </div>
                                                        </form>
                                                        <div class="col-6 padd0">
                                                            <div class="tour">
                                                                <h1 class="Employment Details">Additional details </h1>
                                                                <div>
                                                                    <p class="utmost">
                                                                        Some important details that will improve the effectiveness of our Emergency Response Team
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="team_row_button row">
                                                        <div class="fourth">
                                                            <button id="btnOtherDetails" class="btn next back submit" onclick="SaveOtherDetails(1);">Save</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>

                </div>

            </div>
        </div>
    </div>
    <!-- ./KYC Modal -->
    <div class="CssLoaderStyles" id="AjaxLoader" style="display: none;">
        <div class="CssLoaderAlign">
            <div class="Logo-loader"></div>
            <div class="logoloader"></div>
        </div>
    </div>

    <!-- ./ DepositEMI Popup -->
    <div id="depostiEMIPopup" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">EMI Options</h4>
                </div>
                <div class="modal-body">
                    <div class="graphical-info" id="RoomDetails">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Months</th>
                                    <th scope="col">Per month EMI</th>
                                    <th scope="col">Overall EMI</th>
                                </tr>
                            </thead>
                            <tbody id="EMIOptions">
                            </tbody>
                        </table>
                    </div>

                    <%--<div class="DepositEMI_Content">
                        <p>You are opting for EMI option. Additional Installment fee Rs. 1000 will be added to your remaining Deposit. Pending Deposit will be collected in 5 equal installments and will be shown in monthly invoice</p>
                    </div>--%>
                    <%-- <ul class="">
                        <li class="payment-detail-ulli" id="DepositEmi_Ack" style="display: flex;">
                            <div class="TermsWrapper conditionWrapper">
                                <input type="checkbox" name="DepositEmi_name" class="custom-control-input" onchange="" value="" data-value="" id="DepositEmi_Ack_Chk">
                                <label for="DepositEmi_Ack_Chk" style="align-items: unset">
                                    <span style="width: 100% !important;">Agree Terms and Conditions</span>
                                </label>
                            </div>
                        </li>
                    </ul>--%>
                </div>
                <%-- <div class="modal-footer">
                    <button type="button" class="DepositEmi_Submit">Submit</button>
                    <button type="button" class="DepositEmi_Cancel" data-dismiss="modal">Cancel</button>
                </div>--%>
            </div>

        </div>
    </div>
<!-- ./Footer -->
<div id="myFilterBtn" class="sidenav d-lg-none d-sm-none d-xl-none d-xs-block">
    <button type="button"  onclick="ShowFilter();" id="btnMBReserveFilter" class="btnClicktocall colive-fa-i Wb_hide">
    </button>
</div>
<!--jQuery-->
<script defer src="/assets/js/custom.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
 <script src="/assets/js/jquery.validate.min.js"></script>
<script defer src="/assets/js/dcalendar.picker.js"></script>
<!-- jQuery first, then Popper, then Bootstrap JS., owl-carousel2 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/accordian.js"></script>
<!-- custom dropdown JS -->
<script src="/assets/js/jquery.dropdown.js?d=20191219"></script>
<script>
    $(document).ready(function () {
        $('#txtMoveinDate').dcalendarpicker({ format: 'dd-mmm-yyyy' });
        var sublink = getQueryStringValues()["L"];
        sublink = sublink.replace(/%20/g, " ");
        GetPropertyDetailsById(sublink);
        GetManagerAndSource();

        $("#Keydetails").on("change", "input[type=radio]", function () {
            SharingBedKeyChange();
        });

        $("#sharing-tab").click(function () {
            $('#hdnIsBulkBooking').val('0');
            SharingBedKeyChange();
            $('#my-list-Private').removeClass('active');
            $('#my-list').addClass('active');
        });

        $("#private-tab").click(function () {
            $('#hdnIsBulkBooking').val('1');
            var sublink = getQueryStringValues()["L"];
            sublink = sublink.replace(/%20/g, " ");
            if ($(this).data('count') == "0") {
                $(this).data('count', '1');
                GetPrivateBookingPropertyDetailsById(sublink);
            }
            else {
                PrivateRoomChange();
                MoveinDatechanged();              
            }
            $('#my-list-Private').addClass('active');
            $('#my-list').removeClass('active');
        });

        $("#PrivateKeyDetails").on("change", "input[type=radio]", function () {
            PrivateRoomChange();
            MoveinDatechanged();
        });    
            $('#rdoReservation').click(function () {
                if ($('#rdoReservation').is(':checked')) {
                    $('#liProratedRent').css("display", "none");
                    $('#ulDepositEmI').css("display", "none");
                }
            });

            $('#rdoDeposit').click(function () {
                if ($('#rdoDeposit').is(':checked')) {
                    $('#liProratedRent').css("display", "flex");
                    $('#ulDepositEmI').css("display", "block");
                }
            });

            EquipMyProfileForm();
            var bid = getQueryStringValues()["bid"];
            $('#hdnBookingId').val(bid);
        });

        // variables used for next and previous form
        var $body = $('body'); var $progressBar = $('progress');
        var $animContainer = $('.animation'); var value = 0;
        var transitionEnd = 'webkitTransitionEnd transitionend';
    </script>
</body>
</html>
