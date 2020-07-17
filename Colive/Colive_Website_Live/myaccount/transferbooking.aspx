<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="transferbooking.aspx.cs" Inherits="Colive.Website.myaccount.transferbooking" %>

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
    <!--Animate CSS plugin-->
    <link href="/css/animate.min.css" rel="stylesheet" />


    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script type="text/javascript" src="https://gc.kis.v2.scr.kaspersky-labs.com/FD126C42-EBFA-4E12-B309-BB3FDD723AC1/main.js?attr=_OTvI17Dc0Ptz_T2ggEcKHef5526qD5nH6ZroIH9PLZrybj6D_428XnSIm092ADL8Ut5TGP8u_5gKw6WvCtYyOiMoVEMvq1GPo2dvtL7JY3gV4er6sUMx2y-HR_2Et6gsmoFNjkSIQ3GsjPHZ6XBxLzJES7fFILpdrj56G-bqVMhdajIMdmU6opu1M4yHntuWA60P5hLrSQFjywla8UJshba92t-egfZ3Gww-EaTdOzUxR6s67IfCf8okU8MomoUBheB1W_IkiL4v4PMgWBat0UzYDe-Xg-w4tXBHydbg-PZPp_M8gMEFfKd0q0D5yQNsGIUiCMyNOv1uZldYYo8a2RQYfzBNxjoFuJW9T_ywhPxhw5bizqiHNZ5c9g88olvuGMQ9g3_9zHG5s9llJBmlbfCrG2rupSp7cz80omLOpyXicuNHIZklNCgkMvlxiYoqZuNnptVEI2U8DeohOo_GeJOSzawj1QTobB9i0ku9HOzVssh6aa7DpSY_vy1_30BBAgLF1p6o1s6k692iPJmyFz1BTVxmUZYdmgIvCRJ4OTQIYC8eTpemYMJe7PiRZNvqXRsL91qD_APuSQvV9qTAO3Z215DQXpH4EiSPEO-0aZvIoFHH_dKWFzhk5yhxX1a7GHxYvpzjR6qQiEUokBCV472-w38dP8UZPTpju8COVXgasVxGCggIpep9Lt-3y4ApB-aUCmZPVURZHF2VCV56FP1ZMRXmk5pESFo3r8VLVNOGBya-gL24mODtyXQhNR5XVpbbmf9sU2XZuozB1lXrmuUNa9NjmsSxKCJ7CwPR6IdS3R2FstbrkdBNJWwlJ0pU73yL4ctjwbE873Mt2LmCCfj2c4UxTEXGyJcJ43_cGQwy-qPs1u_vneEm-083wrTf1-xZF4svfwa8xPrihwScTSKqz2HImmzO2VHnVPAaq9DcgmjiGd65-T9aHbbaAAjqp3X5Oir8RpNIZIoVxqlV9Ymy4n3x_3_Cu9RzIQ7GNYBI5uyMkW_eGIQHf6KEAP0O-uXkyX54Tk7s5ZqwCwuUX4xUve-ZCwZHTZZK5A5otWOsFYHVy8eWlwyJReq5W9E3Gr4hg9ADdBswBwe7d_om0fvb2Z-krSexUTxBMukYu9FKRDmfWPUzF6nbVh5gAmVu9Do34o6pXI0rWy78kt1sKc-VbQrWnNGRLxGVecXUpe_vN-HkNzFvRz_RzfVG1F168NCZr-aHyFaYOxfw4s2KQ" nonce="b469454dc3cfb38c7389dcf94c5b5a4f" charset="UTF-8"></script>
    <style>
        <style >
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

        .Bed-Key {
            color: black !important;
        }

        /*Transfer*/
        #Transfer_Details_Page .white-bg {
            background: #fff;
        }

        #Transfer_Details_Page .TransferPadd {
            margin-top: 35px;
        }

        #Transfer_Details_Page .Div_Ratecard {
            padding: 15px 10px;
        }

        #Transfer_Details_Page .Div_Empty_Space {
            height: 8vh;
            width: 100%;
        }

        #Transfer_Details_Page .Div_Title h4 {
            color: #112950;
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 0px;
        }

        #Transfer_Details_Page .Div_SpanTitle {
            font-size: 14px;
            color: #cccccc;
            font-weight: 500;
        }

        #Transfer_Details_Page .Div_TransferPropCard {
            margin: 25px 0px;
        }

        #Transfer_Details_Page .Div_gen_Title {
            color: #112950;
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 0px;
        }

        #Transfer_Details_Page .Div_LeftCard .Div_HarpineLine {
            float: left;
        }

        #Transfer_Details_Page .Div_RightCard .Div_HarpineLine {
            float: right;
        }

        #Transfer_Details_Page .Div_HarpineLine {
            margin: 6px 0px 12px;
            width: 15%;
            border: 2px solid #efefef;
            border-radius: 3px;
        }

        #Transfer_Details_Page .Div_ChkoutProperty p {
            font-size: 14px;
            color: #324B72;
            margin: 0;
            line-height: 1.5;
        }

            #Transfer_Details_Page .Div_ChkoutProperty p span {
                font-weight: 600;
            }

        #Transfer_Details_Page .Div_RightCard {
            text-align: right;
        }

        #Transfer_Details_Page .Div_ProtocalView {
            padding: 0px 0px 15px;
        }

        #Transfer_Details_Page .Div_CardProp_View {
            border: 2px solid #efefef;
            border-radius: 3px;
        }

        #Transfer_Details_Page .PropDetailDiv {
            background: #efefef;
            padding: 5px 10px;
            color: #324B72;
            line-height: 1.5;
        }

        #Transfer_Details_Page .Div_BedKey {
            font-weight: 600;
        }

        #Transfer_Details_Page .Div_PropCalc_Align {
            padding: 8px 25px 2px;
            color: #324B72;
            font-size: 14px;
        }

            #Transfer_Details_Page .Div_PropCalc_Align:last-child {
                padding-bottom: 8px;
            }

        #Transfer_Details_Page .finalDiv_Bal {
            max-height: 52px;
            height: 52px;
            display: flex;
            align-items: center;
            font-weight: 600;
        }

        #Transfer_Details_Page .Div_Payable_ALign {
            border: 2px solid #efefef;
            background: #efefef;
            border-radius: 3px;
            padding: 10px 15px;
        }

        #Transfer_Details_Page .Div_Payable_Style {
            padding: 0 15px 15px;
        }

        #Transfer_Details_Page .Txt_Style {
            color: #112950;
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 0px;
        }

        #Transfer_Details_Page .Txt-Style1 {
            font-size: 16px;
            font-weight: 600;
            color: #324B72;
        }

        #Transfer_Details_Page .Div_TransferValue {
            padding: 0px 15px;
        }

        #Transfer_Details_Page .Div_Note_Txt {
            font-size: 16px;
            color: #ef0075;
            font-weight: 600;
        }

        #Transfer_Details_Page .Div_TransferValue p:before {
            content: '-';
            color: #ef0073;
            padding-right: 5px;
        }

        #Transfer_Details_Page .Div_TransferValue p {
            color: #ef0073;
            margin: 0px;
            padding-left: 12px;
            line-height: 1.8;
            font-size: 12px;
        }

        #Transfer_Details_Page .red-text {
            color: red;
            font-weight: 600;
        }

        #Transfer_Details_Page .green-text {
            color: green;
            font-weight: 600;
        }

        #Transfer_Details_Page .Icon_InfoALign {
            display: flex;
            align-items: center;
        }

            #Transfer_Details_Page .Icon_InfoALign .material-icons {
                font-size: 15px;
                padding-left: 5px;
                /* color: #ef0073; */
                cursor: pointer;
            }

        .Info_Work {
            position: relative;
            display: flex;
        }

        .Info_Content_Text {
            display: none;
            font-size: 11px;
            color: #fff;
            font-weight: 500;
            padding: 0px 5px;
            /* white-space: pre; */
            position: absolute;
            background: #ef0073;
            border-radius: 3px;
            word-break: break-word;
            max-width: 30vw;
            min-width: 15vw;
            margin-left: 2.5rem;
        }

        #Transfer_Details_Page .Icon_InfoALign .material-icons:hover + .Info_Content_Text {
            display: block;
        }

        .discount {
            background-color: #F4F8FB;
            padding: 20px;
        }

        .promocode {
            width: 100% !important;
            margin: 0;
            height: 52px;
            border: none;
        }
        .last-text{
                color: #112950;
    font-size: 10px;
    font-weight: 400;
    line-height: 12px;
    opacity: 0.5;
    width: 60%;
        }

        #btnCancel:hover {
    background: transparent;
    border: 2px solid #324B72;
    color: #324B72;
}

        #btnRaiseTransfer:hover {
    background: transparent;
    border: 2px solid #ef0073;
    color: #ef0073;
}

        @media (max-width: 767px) {
            #Transfer_Details_Page .Div_RightCard {
                text-align: left;
            }

                #Transfer_Details_Page .Div_RightCard .Div_HarpineLine {
                    float: left;
                }

            #Transfer_Details_Page .Div_Empty_Space {
                height: 3vh;
                width: 100%;
            }

            #Transfer_Details_Page .Div_RightCard {
                text-align: left;
                padding: 18px 0 0;
            }

            #Transfer_Details_Page .Div_LeftCard {
                padding: 0px 0 0;
            }

            #Transfer_Details_Page .TransferPadd {
                margin-top: 0px;
            }
        }

        #TransferPopup > div {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .TransferPopup .w3-modal-content {
            margin: 0 auto;
            border-radius: 3px;
        }

            .TransferPopup .w3-modal-content .TransferPopupAlign {
                margin: 0 auto;
            }

            .TransferPopup .w3-modal-content button {
                margin-top: 1rem;
                background: #ef0075;
                border: 0px;
                color: #fff;
                font-weight: 600;
                border-radius: 3px;
                padding: 5px 65px;
                cursor: pointer;
            }
    </style>
</head>

<body id="Transfer_Details_Page">
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
                                        <li class="privateheader">
                                            <label>Floor Number</label></li>
                                        <ul id="ulFloorFilter_Private">
                                        </ul>
                                        <li class="privateheader">
                                            <label>Sharing Type</label></li>
                                        <ul id="ulSharingFilter_Private">
                                        </ul>
                                        <li class="privateheader">
                                            <label>Room Type</label></li>
                                        <ul id="ulRoomFilter_Private">
                                        </ul>
                                        <li class="privateheader">
                                            <label>Balcony Type</label></li>
                                        <ul id="ulBalconyFilter_Private">
                                        </ul>
                                        <li class="privateheader">
                                            <label>Bath Type</label></li>
                                        <ul id="ulBathFilter_Private">
                                        </ul>
                                    </ul>
                                </div>
                                <div class="apply-filter" onclick="ApplyReservationFilter();ShowFilter();">Apply</div>
                            </section>
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
                                        <input type="text" class="form-control" id="txtMoveinDate" data-mindate="12/12/2017" readonly="" onchange="MoveinDatechangedTransfer(1);" aria-describedby="checkindate" placeholder="Choose a date">
                                        <i class="fa fa-calendar" aria-hidden="true" onclick="$('#txtMoveinDate').click();"></i>
                                    </div>
                                </form>
                            </div>
                            <div class="col-lg-4 col-md-4 col-12">
                                <form>
                                    <div class="form-group pick-time">
                                        <label for="exampleInputPassword1">Select your tentative move-in time</label>
                                        <select class="form-control" id="slTimeSlots" onchange='transfermoveintimeChanged($(this))'>
                                        </select>
                                        <i class="fa fa-angle-down" aria-hidden="true"></i>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="TypeChooseRoom bg-white" id="PrivateSharecontainer">
                        <ul class="nav nav-tabs animated" id="bookingTab" role="tablist">
                            <li class="nav-item" style="width:100%">
                                <a class="nav-link active" id="sharing-tab" data-count="0" data-toggle="tab" href="#sharing" role="tab" aria-controls="sharing" aria-selected="true">Sharing</a>
                            </li>
                            <%--<li class="nav-item">
                                <a class="nav-link" id="private-tab" data-count="0" data-toggle="tab" href="#private" role="tab" aria-controls="private" aria-selected="false">Private</a>
                            </li>--%>
                        </ul>

                        <div class="tab-content" id="bookingTabContent">
                            <!--/. sharing type tab -->
                            <div class="tab-pane fade show active" id="sharing" role="tabpanel" aria-labelledby="sharing-tab">
                                <div class="container p-0 py-3 animated" id="Bookinginfo">
                                    <!-- mt-4 -->
                                    <h3 class="choose-room-title">Choose your room number and occupany type</h3>
                                </div>
                                <div class="room-types container" id="KeysContainer">
                                    <div class="row" id="Keydetails">
                                    </div>
                                </div>
                            </div>
                            <!--/. sharing type tab end -->
                            <!--/. Private type tab -->
                            <div class="tab-pane fade" id="private" role="tabpanel" aria-labelledby="private-tab">
                                <div class="container p-0 py-4" id="PrivateBookinginfo">
                                    <!-- mt-4 -->
                                    <h3 class="choose-room-title">Choose your private room number and occupany type</h3>
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
        <div class="booking-detail container" id="RoomDetails">
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

        <div class="payment-detail-block container p-0">
            <div class="container white-bg TransferPadd">
                <div class="Div_Ratecard">
                    <div class="Div_Title">
                        <h4>Rate Card:</h4>
                        <div class="Div_SpanTitle">Your New Rates</div>
                    </div>
                    <div class="row Div_TransferPropCard">
                        <div class="col col-lg-6 col-md-6 col-12 Div_LeftCard">
                            <div class="Div_gen_Title">Check-Out Detail:</div>
                            <hr class="Div_HarpineLine">
                            <div class="Div_Empty_Space"></div>
                            <div class="Div_ChkoutProperty">
                                <p>Property Name: <span class="Div_PropName" id="spnFromBookingPropertyName"></span></p>
                                <p>Bed Key: <span class="Div_BedKey" id="spnFromBookingBedKey"></span></p>
                                <p>Check-out: <span class="Div_Lockin" id="spnFromBookingCheckOutDate"></span></p>
                                <p>Lock-in: <span class="Div_Lockin" id="spnFromBookingLockIn"></span></p>
                            </div>
                        </div>
                        <!-- /. -->

                        <div class="col col-lg-6 col-md-6 col-12 Div_RightCard">
                            <div class="Div_gen_Title">Check-In Detail:</div>
                            <hr class="Div_HarpineLine">
                            <div class="Div_Empty_Space"></div>
                            <div class="Div_ChkoutProperty">
                                <p>Property Name: <span class="Div_PropName" id="spnToBookingPropertyName"></span></p>
                                <p>Bed Key: <span class="Div_BedKey" id="spnToBookingBedKey"></span></p>
                                <p>Check-in: <span class="Div_Lockin" id="spnToBookingCheckInDate"></span></p>
                                <p>Lock-in: <span class="Div_Lockin" id="spnToBookingLockIn"></span></p>
                            </div>
                        </div>
                    </div>
                    <!-- /. -->
                    <div class="row">
                        <div class="col col-lg-5 col-md-5 col-12">
                            <div class="Div_ProtocalView">
                                <div class="Div_CardProp_View">
                                    <div class="PropDetailDiv">
                                        <div class="Div_PropName red-text" id="dvFromBookingPropertyName"></div>
                                        <div class="Div_BedKey red-text" id="dvFromBookingBedKey"></div>
                                    </div>
                                    <div class="row Div_PropCalc" id="paymentDetailsContainerOld">
                                        <%--                 <div class="col-12 Div_PropCalc_Align">
                                    <div class="pull-left">Deposit Paid</div>
                                    <div class="pull-right">16,000</div>
                                </div>
                                <div class="col-12 Div_PropCalc_Align">
                                    <div class="pull-left">Paid Rent</div>
                                    <div class="pull-right">8,000</div>
                                </div>
                                <div class="col-12 Div_PropCalc_Align">
                                    <div class="pull-left">Prorated Adjusted Rent</div>
                                    <div class="pull-right">1,000</div>
                                </div>
                                <div class="col-12 Div_PropCalc_Align">
                                    <div class="pull-left">Outstanding Dues</div>
                                    <div class="pull-right">4,500</div>
                                </div>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col col-lg-5 col-md-5 col-12">
                            <div class="Div_ProtocalView">
                                <div class="Div_CardProp_View">
                                    <div class="PropDetailDiv">
                                        <div class="Div_PropName green-text" id="dvToBookingPropertyName"></div>
                                        <div class="Div_BedKey green-text" id="dvToBookingBedKey"></div>
                                    </div>
                                    <div class="row Div_PropCalc" id="paymentDetailsContainerNew">
                                        <%-- <div class="col-12 Div_PropCalc_Align">
                                    <div class="pull-left">Deposit Paid</div>
                                    <div class="pull-right">20,000</div>
                                </div>
                                <div class="col-12 Div_PropCalc_Align">
                                    <div class="pull-left">Paid Rent</div>
                                    <div class="pull-right">-</div>
                                </div>
                                <div class="col-12 Div_PropCalc_Align">
                                    <div class="pull-left">Prorated Adjusted Rent</div>
                                    <div class="pull-right">10,000</div>
                                </div>
                                <div class="col-12 Div_PropCalc_Align">
                                    <div class="pull-left">Outstanding Dues</div>
                                    <div class="pull-right">-</div>
                                </div>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col col-lg-2 col-md-2 col-12">
                            <div class="Div_ProtocalView">
                                <div class="Div_CardProp_View">
                                    <div class="PropDetailDiv finalDiv_Bal">
                                        <div class="Div_Tag_Bold">Balance</div>
                                    </div>
                                    <div class="row Div_PropCalc" id="paymentDetailsContainerbalance">
                                        <%-- <div class="col-12 Div_PropCalc_Align">
                                    <div class="text-center m-text-right">-</div>
                                </div>
                                <div class="col-12 Div_PropCalc_Align">
                                    <div class="text-center m-text-right">-</div>
                                </div>
                                <div class="col-12 Div_PropCalc_Align">
                                    <div class="text-center m-text-right">-</div>
                                </div>
                                <div class="col-12 Div_PropCalc_Align">
                                    <div class="text-center m-text-right">-</div>
                                </div>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col col-lg-12 col-md-12 col-12">
                            <div class="row Div_ProtocalView Div_Payable_Style">
                                <div class="col-12 Div_Payable_ALign">
                                    <div class="pull-left Txt_Style">Payable Amount</div>
                                    <div class="pull-right Txt-Style1" id="dvTotalPayable"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /. -->

                    <div class="row">
                        <div class="Div_TransferRate">
                            <div class="Div_TransferValue">
                                <div class="Div_Note_Txt">Note:</div>
                                <p>EB charges and other charges will be added in next month invoice.</p>
                                <p>Electricity/ Power back-up Repairs, Gas refilling are on Actuals</p>
                            </div>
                        </div>
                    </div>
                    <div class="discount" style="margin-top: 30px">
                        <div class="row">
                            <div class="col-md-4">
                                <form class="promocodecontrols">
                                    <div class="form-group">
                                        <input type="text" class="form-control promocode" id="txtCoupon" style="width: 60%" placeholder="Enter Promo Code">
                                    </div>
                                    <div class="form-group">
                                        <input type="button" value="Apply" class="btnPromoApply" id="btnPromoApply" onclick="validateCouponforTransfer();">
                                    </div>
                                </form>
                                <p id="spnCouponMsg" class="below-text"></p>
                            </div>
                            <%--<div class="col-md-5">
                                <p class="last-text">* Electricity/ Power back-up Repairs, Gas refilling are on Actuals</p>
                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="continue-btn-wrap container p-0">
            <div class="continue-cancel-btn">
                <div class="total-amount">
                    <p>Total payable: </p>
                    <p class="amount"><span id="spnTotalPayable"></span></p>
                </div>
                <div class="buttons">
                    <button class="continue-btn btnRentCalculation" id="btnReservationConfirmation" onclick="Transferbooking();" style="white-space: nowrap;">Transfer Request</button>
                    <button class="cancel-btn" id="btnReservationCancellation" onclick="cancelBookingRequest();">Cancel</button>
                </div>
            </div>
        </div>

    </section>


    <input type="hidden" id="hdnCouponID" runat="server" clientidmode="static" value="0" />
    <input type="hidden" id="hdnLocationId" runat="server" clientidmode="static" value="0" />
    <input type="hidden" id="hdnPropertyId" runat="server" clientidmode="static" value="0" />
    <input type="hidden" id="hdnRoomId" runat="server" clientidmode="static" value="0" />
    <input type="hidden" id="hdnTransferBookingId" runat="server" clientidmode="static" value="0" />
    <input type="hidden" id="hdnIsBulkBooking" runat="server" clientidmode="static" value="0" />
    <input type="hidden" id="hdnReferralCode" runat="server" clientidmode="static" value="0" />
    <input type="hidden" id="hdnBedKeyIds" runat="server" clientidmode="static" value="" />
    <input type="hidden" id="hdnPaidAmount" runat="server" clientidmode="static" value="0" />

    <input type="hidden" id="hdnTransferReqId" runat="server" clientidmode="static" value="0" />
    <input type="hidden" id="hdnTransferStatusId" runat="server" clientidmode="static" value="0" />
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

    <!-- Checkout Details Modal -->
    <div class="modal fade" id="CheckoutDetails" tabindex="-1" role="dialog" aria-labelledby="CheckoutDetails" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="ChkoutHeader">
                    <div style="display: flex; flex-direction: column; text-align: center; width: 100%;">
                        <h2 class="ChkoutPropName text-center">Transfer Checkout</h2>
                        <h3 class="ChkoutPropNameuse text-center" id="spnCheckoutPropertyName">Colive 122 Broadway</h3>
                    </div>
                    <button type="button" class="CheckoutDetailButton" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="ChkoutBody">
                    <div class="field">
                        <input id="chkoutDate" class="form-control" type="text" readonly="" style="width: 100%; margin-left: 0; background-color: #fff;" data-mindate="12/12/2017" placeholder="Select Checkout Date" onchange="transfercheckoutdatechanged();">
                    </div>
                    <div class="field">
                        <div class="input-group">
                            <select class="custom-select" id="slCheckoutTime">
                                <option class="" value="" selected="">Select Check-out Time</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="Chkoutfooter">
                    <button type="button" class="chkOutCancelbutton" onclick=" $('#CheckoutDetails').modal('hide');">Cancel</button>
                    <button type="button" class="action-button" onclick="rentCalculationForTransfer('',0,0);">Next</button>
                </div>
            </div>
        </div>
    </div>


    <div class="offset-lg-2 col-lg-8 TransferPopup">
        <div class="w3-modal" id="TransferPopup">
            <div>
                <div class="w3-modal-content w3-animate-top w3-card-4 col-lg-5 col-md-8 col-sm-8 col-10">
                    <!--<header class="w3-container w3-teal">
                <span onclick="$('#cotenantselection').hide();" class="w3-button w3-display-topright">&times;</span>
            </header>-->
                    <div class="row">
                        <div class="col-lg-10 col-md-10 col-12 TransferPopupAlign">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-12 pad0">
                                    <div class="WhatsappContent">
                                        <h4 class="Deals_day" id="whatsappTitle">Transfer Request Raised</h4>
                                        <p id="p_OfferDescription" class="whatsappDescription" style="display: block;">
                                            Your Traansfer request has been raised successfully. After a confirmation from our end, you will be notified to 
                                    proceed for payment of the amount you agreed to.
                                        </p>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-12">
                                    <div class="WhatsappSuggestButton">
                                        <button type="button" class="whatsappYes" id="WhatsappYes" onclick="TransferRequestPopupRedirect();">OK</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="mdlTransferconfirm" class="modal fade">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content" style="height: 120px; width: 435px; margin-top: 326px;">
                <div class="container">
                    <p class="cancel_body_content" style="padding-top: 9px;">Are you sure you want to raise the Transfer Request?</p>
                    <div class="cancel_pop" style="margin-top: 5px; margin-right: 6px;">
                        <button type="button" id="btnRaiseTransfer" class="cancel_popup_yes btn btn-primary" onclick="TransferAndPay();">Yes</button>
                        <button type="button" id="btnCancel" class="cancel_popup_no btn btn-primary" data-dismiss="modal">No</button>
                        <%--<a href="" id="btnPay" class="cancel_popup_yes" onclick="PayDues();">PayDue</a>
                    <a href="" id="btnCancel" class="cancel_popup_no" data-dismiss="modal">Cancel</a>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <form id="fmPayment" name="frmPg" action="http://qa.colive.in/pg/paymentoptions.aspx" method="post">
        <input type="hidden" value="" id="OrderId" name="OrderId" />
    </form>

    <form id="frmCompletion" name="frmPg" action="/pg/Completion.aspx" method="post">
        <input type="hidden" value="" id="order_id" name="order_id" />
        <input type="hidden" value="2" id="order_status_id" name="order_status_id" />
        <input type="hidden" value="1" id="amountType" name="amountType" />
    </form>

    <!-- ./Adreess Modal -->
    <div class="CssLoaderStyles" id="AjaxLoader" style="display: none;">
        <div class="CssLoaderAlign">
            <div class="Logo-loader"></div>
            <div class="logoloader"></div>
        </div>
    </div>
    <!-- ./Footer -->
    <div id="myFilterBtn" class="sidenav d-lg-none d-sm-none d-xl-none d-xs-block">
        <button type="button" onclick="ShowFilter();" id="btnMBReserveFilter" class="btnClicktocall colive-fa-i Wb_hide">
        </button>
    </div>
    <!--jQuery-->
    <script defer src="/assets/js/custom.js?d=20191210"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
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
            var value = getQueryStringValues()["T"];
            if (value !== undefined) {
                setTimeout(function () {
                    $('#AjaxLoader').fadeIn(500);
                    BindBookingTransferDetails(value);
                }, 1000);
            }
            else {
                var sublink = getQueryStringValues()["L"];
                sublink = sublink.replace(/%20/g, " ");
                GetPropertyDetailsById(sublink);
                GetManagerAndSource();



                $("#Keydetails").on("change", "input[type=radio]", function () {
                    TransferBedKeyChange();
                });

                $("#sharing-tab").click(function () {
                    $('#hdnIsBulkBooking').val('0');
                    TransferBedKeyChange();
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

            }
            GetTransferDetails(2);

        });
    </script>
</body>
</html>
