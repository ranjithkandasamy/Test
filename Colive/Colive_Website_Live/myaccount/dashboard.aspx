<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Colive.Website.myaccount.profile" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Security-Policy" content="script-src 'self' 'unsafe-inline' https://code.jquery.com https://cdnjs.cloudflare.com/ajax/libs/popper.js/ https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/">
    <title data-desc="dashboard">Colive</title>
    <!-- favicon -->
    <link rel="icon" href="/assets/images/favicon.png">
    <!-- bootstrap -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <!-- font family -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- custom css -->
    
    <link rel="stylesheet" href="/assets/css/styles.css">
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- checkbox plugin -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css">
    <link rel="stylesheet" href="/assets/css/dcalendar.picker.css">
    <style>
		  .DepositEmI li label {
            font-size: 14px;
        }

        .DepostiEMI_Btn {
            background: transparent;
            border: 0px;
            color: #007bff;
            padding: 0px;
            cursor: pointer;
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

        #dashboard_Page_Wrapper .payment-detail-ulli#DepositEmi_Ack .TermsWrapper label {
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

        #dashboard_Page_Wrapper ul.DepositEmI {
            list-style-type: none;
            background: #fff;
            padding: 15px 15px 0px;
            margin-bottom: 10px;
        }

        .DepositEmI.radioInputGroup [type="radio"]:checked + label:after,
        .DepositEmI.radioInputGroup [type="radio"]:not(:checked) + label:after {
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

        @media (max-width: 767px) {
            #depostiEMIPopup .modal-content {
                width: 88%;
                margin: 0 auto;
            }

            #dashboard_Page_Wrapper .payment-detail-ulli#DepositEmi_Ack {
                padding-left: 65px !important;
                margin: 0 auto !important;
            }

            .DepositEMI_Content p {
                padding: 0px 0px 25px;
            }
        /*.btnTransferReq {
            position: absolute;
            bottom: 21px;
            margin-left: 0px !important;
            padding: 5px 5px !important;
            height: 36px !important;
            font-size: 14px !important;
            width: 87% !important;
        }
          .pTransferApproved{
              margin-left:15px;
          }*/
        .dashboard_wishlist_wrap .dashboard_bookings_wrap #CurrentBookingsContainer .card-wrap {
            min-height: 536px;
        }
    </style>
</head>
<body>
    <!-- site header include -->
    <div class="header include" id="site-header" data-include="header"></div>

    <!-- END of fixed call and chat buttons -->
    <section class="dashboard_wishlist_wrap">
        <div class="container">
            <div class="row tab-layout">
                <div class="col-lg-3 col-md-3 col-12 p-0">
                    <div class="sidebar-wrap">
                        <ul class="sidebar nav nav-tabs" id="ulDashboardTabs">
                            <li class="d-none"><a data-toggle="tab" href="#wishlist" class="active show">
                                <div class="sidebar-items">
                                    <img src="/assets/images/dashboard/whilist.png" alt=""><span class="d-none d-xs-none d-md-block d-lg-block">My Wishlist</span>
                                </div>
                            </a></li>
                            <li class="d-none"><a data-toggle="tab" href="#visit" class="">
                                <div class="sidebar-items">
                                    <img src="/assets/images/dashboard/visit.png" alt="" class="manual-marginright"><span class="d-none d-xs-none d-md-block d-lg-block">My Visits</span>

                                </div>
                            </a></li>
                            <li class="" id="liBookings"><a data-toggle="tab" id="ancbooking" data-count="0" data-target="#booking" class="">
                                <div class="sidebar-items">
                                    <img src="/assets/images/dashboard/bookings.png" alt=""><span class="d-none d-xs-none d-md-block d-lg-block">Bookings</span>

                                </div>
                            </a></li>
                            <li class="" id="liServiceRequests"><a data-toggle="tab" id="ancServiceRequest" data-target="#service" data-count="0" class="">
                                <div class="sidebar-items">
                                    <img src="/assets/images/dashboard/service_request.png"
                                        alt=""><span class="d-none d-xs-none d-md-block d-lg-block">Service Requests</span>
                                </div>
                            </a></li>
                            <li class=""><a data-toggle="tab" href="#payment" data-count="0" id="ancDuesAndPayment" data-target="" class="" data-type="1">
                                <div class="sidebar-items">
                                    <img src="/assets/images/dashboard/payment.png" alt=""><span class="d-none d-xs-none d-md-block d-lg-block">Dues and Payments</span>
                                </div>
                            </a></li>
                            <li class="d-none"><a data-toggle="tab" href="#event" class="">
                                <div class="sidebar-items">
                                    <img src="/assets/images/dashboard/events.png" alt=""><span class="d-none d-xs-none d-md-block d-lg-block">My Events</span>

                                </div>
                            </a></li>
                            <%--Website SmartLock--%>
                            <li class="liSmartLock" id="ancSmartLock">
                                <a data-toggle="tab"  class="" data-target="#smartlock" data-count="0">
                                    <div class="sidebar-items">
                                        <img src="/assets/images/dashboard/RoomLock.jpg" style="width: 20px; height: 20px;" alt=""><span class="d-none d-xs-none d-md-block d-lg-block">Room Access Code</span>
                                    </div>
                                </a>
                            </li>
                            <li class="">
                                <a data-toggle="tab" id="ancReferral" class="" data-target="#referral" data-count="0">
                                    <div class="sidebar-items">
                                        <img src="/assets/images/dashboard/events.png" alt=""><span class="d-none d-xs-none d-md-block d-lg-block">Referral</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a data-toggle="tab" id="ancCoTenant" class="" data-target="#cotenants" data-count="0">
                                    <div class="sidebar-items">
                                        <img src="/assets/images/dashboard/cotenant.png" alt=""><span class="d-none d-xs-none d-md-block d-lg-block">Co-Tenants</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9 col-mg-9 col-12 p-0">
                    <div class="tab-content homepage-card container">
                        <!-- MY WISHLIST -->
                        <div id="wishlist" class="tab-pane fade in">
                            <div class="main-content">
                                <div class="title">My Wishlists</div>
                                <div class="row">
                                    <div class="col-12 ">
                                        <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent_wishlist">
                                            <div class="tab-pane fade show active" id="nav-scheduled-visit" role="tabpanel" aria-labelledby="nav-home-tab">
                                                <div class="row">
                                                    <div class="col-lg-6 col-md-6 col-12">
                                                        <div class="card-wrap">
                                                            <div class="card-img">
                                                                <img src="/assets/images/Bitmap (3).png" alt="">
                                                                <p class="date-on-hover">Mon, 27th Feburary, 4:00PM</p>
                                                            </div>
                                                            <div class="card-info">

                                                                <div class="card-detail">
                                                                    <div class="card-title">
                                                                        <p>Colive 186 Liberty</p>
                                                                        <span>
                                                                            <img src="/assets/images/location.png" alt="">1st
                                                                        stage, BTM
                                                                        Layout</span>
                                                                    </div>
                                                                    <div class="like-share">
                                                                        <img src="/assets/images/share.png" alt="">
                                                                        <i class="fa fa-heart-o"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="pricing-rating">
                                                                    <div class="price">
                                                                        <p>Starting price</p>
                                                                        <p>₹7500</p>
                                                                    </div>
                                                                    <div class="rating">
                                                                        <p>3.5/5</p>
                                                                        <p class="stars">
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                                <div class="cancel-request">
                                                                    <p class="cancel">View Property</p>
                                                                    <p class="reschedule">Schedule a Visit</p>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-12">
                                                        <div class="card-wrap">
                                                            <div class="card-img">
                                                                <img src="/assets/images/Bitmap (1).png" alt="">
                                                                <p class="date-on-hover">Mon, 27th Feburary, 4:00PM</p>
                                                            </div>
                                                            <div class="card-info">
                                                                <div class="card-detail">
                                                                    <div class="card-title">
                                                                        <p>Colive 186 Liberty</p>
                                                                        <span>
                                                                            <img src="/assets/images/location.png" alt="">1st
                                                                        stage, BTM
                                                                        Layout</span>
                                                                    </div>
                                                                    <div class="like-share">
                                                                        <img src="/assets/images/share.png" alt="">
                                                                        <i class="fa fa-heart-o"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="pricing-rating">
                                                                    <div class="price">
                                                                        <p>Starting price</p>
                                                                        <p>₹7500</p>
                                                                    </div>
                                                                    <div class="rating">
                                                                        <p>3.5/5</p>
                                                                        <p class="stars">
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                                <div class="cancel-request">
                                                                    <p class="cancel">View Property</p>
                                                                    <p class="reschedule">Schedule a Visit</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- MY VISIT -->
                        <div id="visit" class="tab-pane fade in  ">
                            <div class="main-content">
                                <div class="title">My Visits</div>
                                <div class="row">
                                    <div class="col-12 ">
                                        <nav>
                                            <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                                <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#my-scheduled-visit" role="tab" aria-controls="nav-home" aria-selected="true">My scheduled visits</a>
                                                <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#my-visited-properties" role="tab" aria-controls="nav-profile" aria-selected="false">My visited properties</a>
                                            </div>
                                        </nav>
                                        <div class="tab-content" id="nav-tabContent_schedulevisits">
                                            <div class="tab-pane fade show active" id="my-scheduled-visit" role="tabpanel" aria-labelledby="nav-home-tab">
                                                <div class="row" id="reschedule-visit-cards">
                                                    <div class="col-lg-6 col-md-6 col-12">
                                                        <div class="card-wrap">
                                                            <div class="card-img">
                                                                <img src="/assets/images/Bitmap (3).png" alt="">
                                                                <p class="date-on-hover">Mon, 27th Feburary, 4:00PM</p>
                                                            </div>
                                                            <div class="card-info">

                                                                <div class="card-detail">
                                                                    <div class="card-title">
                                                                        <p>Colive 186 Liberty</p>
                                                                        <span>
                                                                            <img src="/assets/images/location.png" alt="">1st
                                                                        stage, BTM
                                                                        Layout</span>
                                                                    </div>
                                                                    <div class="like-share">
                                                                        <img src="/assets/images/share.png" alt="">
                                                                        <i class="fa fa-heart-o"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="pricing-rating">
                                                                    <div class="price">
                                                                        <p>Starting price</p>
                                                                        <p>₹7500</p>
                                                                    </div>
                                                                    <div class="rating">
                                                                        <p>3.5/5</p>
                                                                        <p class="stars">
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                                <div class="cancel-request">
                                                                    <p class="cancel">Cancel</p>
                                                                    <p class="reschedule" id="reschedule-visit">
                                                                        Reschedule Visit
                                                                    </p>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-12">
                                                        <div class="card-wrap">
                                                            <div class="card-img">
                                                                <img src="/assets/images/Bitmap (1).png" alt="">
                                                                <p class="date-on-hover">Mon, 27th Feburary, 4:00PM</p>
                                                            </div>
                                                            <div class="card-info">
                                                                <div class="card-detail">
                                                                    <div class="card-title">
                                                                        <p>Colive 186 Liberty</p>
                                                                        <span>
                                                                            <img src="/assets/images/location.png" alt="">1st
                                                                        stage, BTM
                                                                        Layout</span>
                                                                    </div>
                                                                    <div class="like-share">
                                                                        <img src="/assets/images/share.png" alt="">
                                                                        <i class="fa fa-heart-o"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="pricing-rating">
                                                                    <div class="price">
                                                                        <p>Starting price</p>
                                                                        <p>₹7500</p>
                                                                    </div>
                                                                    <div class="rating">
                                                                        <p>3.5/5</p>
                                                                        <p class="stars">
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                                <div class="cancel-request">
                                                                    <p class="cancel">Cancel</p>
                                                                    <p class="reschedule" id="reschedule-visit">
                                                                        Reschedule Visit
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="booknow">
                                                    <div class="card tab-card" id="rescheduled-card">
                                                        <ul class="nav nav-tabs " id="myTab" role="tablist">
                                                            <li class="nav-item">
                                                                <a class="nav-link active show" id="one-tab" data-toggle="tab" href="#one" role="tab" aria-controls="One" aria-selected="true"><i
                                                                    class="fa fa-arrow-left"
                                                                    aria-hidden="true"></i>Reschedule Visit</a>
                                                            </li>
                                                        </ul>

                                                        <div class="tab-content" id="myTabContent">
                                                            <div class="tab-pane fade show active p-3" id="one" role="tabpanel" aria-labelledby="one-tab">
                                                                <div class="reschedule-process-first">
                                                                    <p class="card-text">
                                                                        One of our representatives will be there at the property to show you around at your given date and time
                                                                    </p>
                                                                    <form>
                                                                        <div class="form-group pick-date">
                                                                            <label for="exampleInputEmail1">
                                                                                Choose a
                                                                            date</label>
                                                                            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Choose a date">

                                                                            <i class="fa fa-calendar" aria-hidden="true"></i>
                                                                        </div>
                                                                        <div class="form-group pick-time">
                                                                            <label for="exampleInputPassword1">
                                                                                Pick a
                                                                            time</label>
                                                                            <select class="form-control" id="exampleFormControlSelect1">
                                                                                <option>Pick a time</option>
                                                                                <option>11:00 AM</option>
                                                                                <option>12:00 PM</option>
                                                                                <option>1:00 PM</option>
                                                                                <option>3:00 PM</option>
                                                                            </select>
                                                                            <i class="fa fa-angle-down" aria-hidden="true"></i>
                                                                        </div>
                                                                        <span>*You can reschedule the visit</span>
                                                                    </form>
                                                                    <a class="btn btn-primary confirm-btn" id="schedule-third">Confirm</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="yay-scheduled">
                                                        <div class="yay-schedule-content">
                                                            <img src="/assets/images/delivery.svg" alt="">
                                                            <p>
                                                                Yay! You’re scheduled visit details<br>
                                                                have been updated!
                                                       
                                                            </p>
                                                            <p class="detail">
                                                                Thurs, 16th March,<br>
                                                                4:00 PM
                                                       
                                                            </p>
                                                        </div>
                                                        <a class="btn btn-primary confirm-btn" id="done">Done</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="my-visited-properties" role="tabpanel" aria-labelledby="nav-profile-tab">
                                                <div class="row">
                                                    <div class="col-lg-6 col-md-6 col-12">
                                                        <div class="card-wrap">
                                                            <div class="card-img">
                                                                <img src="/assets/images/Bitmap (6).png" alt="">
                                                                <p class="date-on-hover">Mon, 27th Feburary, 4:00PM</p>
                                                            </div>
                                                            <div class="card-info">

                                                                <div class="card-detail">
                                                                    <div class="card-title">
                                                                        <p>Colive 186 Liberty</p>
                                                                        <span>
                                                                            <img src="/assets/images/location.png" alt="">1st
                                                                        stage, BTM
                                                                        Layout</span>
                                                                    </div>
                                                                    <div class="like-share">
                                                                        <img src="/assets/images/share.png" alt="">
                                                                        <i class="fa fa-heart-o"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="pricing-rating ">
                                                                    <div class="price">
                                                                        <p>Starting price</p>
                                                                        <p>₹7500</p>
                                                                    </div>
                                                                    <div class="rating">
                                                                        <p>3.5/5</p>
                                                                        <p class="stars">
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                                <div class="cancel-request">
                                                                    <p class="cancel">Schedule visit</p>
                                                                    <p class="reschedule">Book now</p>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-12">
                                                        <div class="card-wrap">
                                                            <div class="card-img">
                                                                <img src="/assets/images/Bitmap (5).png" alt="">
                                                                <p class="date-on-hover">Mon, 27th Feburary, 4:00PM</p>
                                                            </div>
                                                            <div class="card-info">
                                                                <div class="card-detail">
                                                                    <div class="card-title">
                                                                        <p>Colive 186 Liberty</p>
                                                                        <span>
                                                                            <img src="/assets/images/location.png" alt="">1st
                                                                        stage, BTM
                                                                        Layout</span>
                                                                    </div>
                                                                    <div class="like-share">
                                                                        <img src="/assets/images/share.png" alt="">
                                                                        <i class="fa fa-heart-o"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="pricing-rating ">
                                                                    <div class="price">
                                                                        <p>Starting price</p>
                                                                        <p>₹7500</p>
                                                                    </div>
                                                                    <div class="rating">
                                                                        <p>3.5/5</p>
                                                                        <p class="stars">
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                                <div class="cancel-request">
                                                                    <p class="cancel">Schedule visit</p>
                                                                    <p class="reschedule">Book now</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- MY BOOKINGS -->
                        <div id="booking" class="tab-pane dashboard_bookings_wrap fade show active ">
                            <div class="main-content">
                                <div class="title" id="booking_title">Bookings</div>
                                <div class="row">
                                    <div class="col-12 ">
                                        <nav>
                                            <div class="nav nav-tabs nav-fill" id="nav-tab-bookings" role="tablist">
                                                <a class="nav-item nav-link active" id="nav-bookings-Reservation" data-toggle="tab" href="#bookings-nav-Reservation" role="tab" aria-controls="nav-Reservation" aria-selected="true">Reservation</a>
                                                <a class="nav-item nav-link" id="nav-bookings-Movein" data-toggle="tab" href="#bookings-nav-Movein" role="tab" aria-controls="nav-Reservation" aria-selected="false">Move-in</a>
                                                <a class="nav-item nav-link" id="nav-bookings-Current" data-toggle="tab" href="#bookings-nav-current" role="tab" aria-controls="nav-Current" aria-selected="false">Current</a>
                                                <a class="nav-item nav-link" id="nav-bookings-Previous" data-toggle="tab" href="#bookings-nav-Previous" role="tab" aria-controls="nav-Previous" aria-selected="false">Previous</a>
                                            </div>
                                        </nav>
                                        <div class="tab-content py-3 px-3 px-sm-0 booking-cards" id="nav-tabBookings">
                                            <div class="tab-pane container fade active show" id="bookings-nav-Reservation" role="tabpanel" aria-labelledby="nav-home-tab">
                                                <div class="row" id="ReservationCardContainer">
                                                </div>
                                                <div class="row" id="checkinContainer">
                                                    <div class="row px-3">
                                                        <div class="col-lg-8 col-12 pl-0 pr-1">
                                                            <div class="card">
                                                                <div class="card-horizontal">
                                                                    <div class="img-square-wrapper">
                                                                        <img src="/assets/images/marathalli.jpg" id="PropImg" class="property-img">
                                                                    </div>
                                                                    <div class="card-body">
                                                                        <h4 class="card-title" id="spnPropertyName"></h4>
                                                                        <div class="ahjg">
                                                                            <i class="fa fa-map-marker" aria-hidden="true"></i>
                                                                            <p class="card-text" id="spnPropertyAddress"></p>
                                                                        </div>
                                                                        <hr class="dash" />
                                                                        <div class="rom-allots">
                                                                            <p class="room-number">Room Number :</p>
                                                                            <p class="rm-digit" id="spnRoomName"></p>
                                                                        </div>
                                                                        <div class="rom-allots">
                                                                            <p class="room-number">Bed Key :</p>
                                                                            <p class="key" id="spnBedkey"></p>
                                                                        </div>
                                                                        <div class="rom-allots">
                                                                            <p class="room-number">Sharing Type :</p>
                                                                            <span class="RoomDetails" id="spnSharingType"></span>
                                                                        </div>
                                                                        <div class="rom-allots">
                                                                            <p class="room-number">Lock in Period :</p>
                                                                            <span class="RoomDetails" id="spnlockinPeriod"></span>
                                                                        </div>
                                                                        <div class="rom-allots">
                                                                            <p class="room-number">Notice Period :</p>
                                                                            <span class="RoomDetails" id="spnNoticePeriod"></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-12 px-0 pb-1">
                                                            <div class="card">
                                                                <div class="card-header">Move-in Details</div>
                                                                <div class="Confirm">
                                                                    <label for="date" class="pic-date">Confirmed Move-in Date</label>
                                                                    <div class="sdhgh">
                                                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                                                        <input id="dtMoveinDate" disabled class="date" type="text" data-mindate="12/12/2017" readonly="" aria-describedby="checkindate" placeholder="Choose a date" />
                                                                    </div>
                                                                    <div class="time-take">
                                                                        <label for="date" class="pic-time">Confirmed Move-in Time</label>
                                                                        <div class="input-group">
                                                                            <select class="custom-select" id="slMoveInTime" disabled>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="EditButton">
                                                                    <input type="button" onclick="EditMoveInDetails($(this));" value="Edit" class="btncheckinEdit" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="page-nation">
                                                        <div class="price-page">
                                                            <div class="container">
                                                                <div class="row">
                                                                    <div class="col-sm col-4">
                                                                        <p class="Payment-details">Payment details</p>
                                                                    </div>
                                                                    <div class="col-sm col-4">
                                                                        <p class="Total">Total (₹)</p>
                                                                    </div>
                                                                    <div class="col-sm col-4">
                                                                        <p class="Payable-at-check">
                                                                            Payable-at-check in (₹)                                                            
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                                <div id="paymentDetailsContainer">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <ul id="checkInDepositEMI" class="DepositEmI radioInputGroup">
                                                        <li class="payment-detail-ulli">
                                                            <input type="radio" id="rdoTotalDeposit" name="DepositEMI" value="" class="radio-custom" onchange="GetcheckinDetails($('#hdnBookingIdchk').val(), $('#hdnCouponID').val(), $('#hdnCheckinDate').val(),0);">
                                                            <label class="form-group radio-custom-label" for="rdoDeposit">Pay Total Deposit</label>
                                                        </li>
                                                          <%--EMi Option Commented start--%>
                                                          <li class="payment-detail-ulli">
                                                            <input type="radio" id="rdoEMIDeposit" name="DepositEMI" value="" class="radio-custom" onchange="GetcheckinDetails($('#hdnBookingIdchk').val(), $('#hdnCouponID').val(), $('#hdnCheckinDate').val(),0);">
                                                            <label class="form-group radio-custom-label" for="rdoDeposit">
                                                                Pay 50% Now, Balance in 5 Equal Installments
                                                                    <button type="button" id="btnDepostiEMI" class="DepostiEMI_Btn" data-toggle="modal" data-target="#depostiEMIPopup" style="display: none;">EMI Options</button></label>
                                                          
                                                             <div class="TermsWrapper conditionWrapper" id="tacDepositemi" style="width: 26%; line-height: 10px;display:none;">
                                                                <input type="checkbox" onclick="" id="ChkDepositemiAgree"  checked="checked" name="ChkDepositemiAgree">
                                                                <label for="ChkDepositemiAgree"></label>
                                                                <span class="spnTerms"><a href="/termsandconditionsdepositemi.html" class="ancterms" target="_blank">Terms and conditions</a></span>
                                                            </div>
                                                        </li>
                                                          <%--EMi Option Commented End--%>
                                                    </ul>

                                                    <div class="footy Promowrapper" id="dvCoupon">
                                                        <div class="checkinPromocodeWrapper">
                                                            <input type="text" class="form-control promocode" id="txtCoupon" placeholder="Enter Promo Code">
                                                            <input type="button" value="Apply" class="btncheckinPromoApply" id="btnCheckinPromoApply" onclick="validateCheckInCoupon();">
                                                        </div>
                                                    </div>
                                                    <div class="footy">
                                                        <div class="adj-item">
                                                            <div class="container">
                                                                <div class="agree">
                                                                    <div class="">
                                                                        <div class="custom-control form-control-lg custom-checkbox" style="padding-left: 0;">
                                                                            <input type="checkbox" class="custom-control-input" id="chkterms">
                                                                            <label for="chkterms"></label>
                                                                            <a class="spnTermscheckin" href="/termsandconditionscheckin.html" target="_blank">I agree to the terms and conditions</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="">
                                                                        <input type="button" id="btnCheckinConfirmation" class="btn btn-primary" value="Pay now" onclick="ProceedTocheckin();" />
                                                                        <input type="button" id="btnKycRedirect" class="btn btn-primary" value="Complete KYC" onclick="javascript: void (0);" />
                                                                        <input type="button" id="btnCheckinCancellation" class="btn btn-primary" value="Cancel" onclick="CheckinCancellation();" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="booking_detail_section" id="ServiceRequestContainer">
                                                    <div class="row">
                                                        <div class="col-8">
                                                            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                                                                <div class="carousel-inner">
                                                                    <div class="carousel-item active">
                                                                        <img src="/assets/images/dashboard-bookings/Bitmap (6).png" class="d-block w-100" alt="...">
                                                                    </div>
                                                                    <div class="carousel-item">
                                                                        <img src="/assets/images/dashboard-bookings/Bitmap (6).png" class="d-block w-100" alt="...">
                                                                    </div>
                                                                    <div class="carousel-item">
                                                                        <img src="/assets/images/dashboard-bookings/Bitmap (6).png" class="d-block w-100" alt="...">
                                                                    </div>
                                                                </div>
                                                                <div class="left">
                                                                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                                                                        <i class="fa fa-angle-left" aria-hidden="true"></i>
                                                                    </a>
                                                                </div>
                                                                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                                                                    <i class="fa fa-angle-right" aria-hidden="true"></i>
                                                                </a>
                                                            </div>
                                                            <div class="page-main-title">
                                                                <div class="just-sub-lable">
                                                                    <p class="broadway">CoLive 122 Broadway</p>
                                                                </div>
                                                                <div class="sub-boardway-lable">
                                                                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                                                                    <p class="maruthi-enclave">
                                                                        Room no. 102a, Maruthi enclave, Hennur, Bangalore - 657992
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-4 pr-0">
                                                            <div class="card-wrap">
                                                                <div class="card-img">
                                                                    <img class="schedule" src="/assets/images/dashboard-bookings/schedule.png" alt="">
                                                                </div>
                                                                <div class="Move">
                                                                    <div class="indate">
                                                                        <p class="intime">Move in date &time :</p>
                                                                        <p class="wed-march">
                                                                            Wed, 30th March 2019, 4:00PM

                                                                        </p>
                                                                    </div>
                                                                </div>
                                                                <div class="Move">
                                                                    <div class="indate">
                                                                        <p class="intime">Move in date &time :</p>
                                                                        <p class="wed-march">
                                                                            Wed, 30th March 2019, 4:00PM

                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row find-new">
                                                        <div class="col-8">
                                                            <div class="booking">
                                                                <div class="just-lable">
                                                                    <p class="Sharing-type">Sharing type</p>
                                                                    <p class="Room-Type">Room Type</p>
                                                                </div>
                                                                <hr class="dash" />
                                                                <div class="sub-lable">
                                                                    <i class="fa fa-user" aria-hidden="true"></i>
                                                                    <div class="group-ico">
                                                                        <img src="/assets/images/dashboard-bookings/Group 92.png" alt="">
                                                                        <p class="Studio">Studio</p>
                                                                    </div>
                                                                </div>
                                                                <hr class="dash" />
                                                                <div class="outstanding">
                                                                    <p class="balence">Outstanding Balance :</p>
                                                                    <p class="bal-chk">₹34,000</p>
                                                                </div>
                                                                <div class="outstanding">
                                                                    <p class="balence">Total rent :</p>
                                                                    <p class="bal-chk">₹34,000</p>
                                                                </div>
                                                                <div class="outstanding">
                                                                    <p class="balence">Reservation amount :</p>
                                                                    <p class="bal-chk">₹4,000</p>
                                                                </div>
                                                                <div class="outstanding">
                                                                    <p class="balence">Rent :</p>
                                                                    <p class="bal-chk">₹34,000</p>
                                                                </div>
                                                                <hr class="dash" />
                                                                <div class="outstanding">
                                                                    <p class="balence">Amount Paid :</p>
                                                                    <p class="paid-amount">₹4,000</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-8">
                                                            <iframe class="map-of-iframe" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2822.7806761080233!2d-93.29138368446431!3d44.96844997909819!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x52b32b6ee2c87c91%3A0xc20dff2748d2bd92!2sWalker+Art+Center!5e0!3m2!1sen!2sus!4v1514524647889"
                                                                width="600" height="450" frameborder="0" style="border: 0" allowfullscreen></iframe>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane container fade" id="bookings-nav-Movein" role="tabpanel" aria-labelledby="nav-home-tab">
                                                <div class="row" id="MoveinContainer">
                                                </div>
                                                <div class="booking_detail_section" id="MoveinSection">
                                                    <div class="row">
                                                        <div class="col col-lg-8 col-md-8 col-12">
                                                            <div id="carouselExampleControls" class="carousel slide">
                                                                <img src="" class="property-img moveinPropImg" id="ImgMoveinProp" />
                                                            </div>
                                                            <div class="page-main-title">
                                                                <div class="just-sub-lable">
                                                                    <p class="broadway" id="spnMoveinPropName"></p>
                                                                </div>
                                                                <div class="sub-boardway-lable">
                                                                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                                                                    <p class="maruthi-enclave" id="spnMoveinPropAddress"></p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col col-lg-4 col-md-4 col-12 pr-0">
                                                            <div class="card-wrap">
                                                                <div class="card-img">
                                                                    <img class="schedule" src="/assets/images/dashboard-bookings/schedule.png" alt="">
                                                                </div>
                                                                <div class="Move">
                                                                    <div class="indate">
                                                                        <p class="intime">Move in date &time :</p>
                                                                        <p class="wed-march" id="spnMoveinDetails"></p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row find-new">
                                                        <div class="col col-lg-8 col-md-8 col-12">
                                                            <div class="booking">
                                                                <h5>Move In</h5>
                                                                <h6 class="colive-fa-i info">Please confirm the Move-In date and time. You can reschedule also in case of change in plan. (You can not prepone but postpone it, No money will be refunded).</h6>
                                                                <h6 class="colive-fa-i info">You can change the date 4 hours prior to move in.</h6>
                                                                <hr class="dash" />
                                                                <div class="MoveinContainer">
                                                                    <div class="moveinDateWrapper">
                                                                        <label for="date" class="pic-date">Move-In Date</label>
                                                                        <input id="MoveinDate" class="moveinDate form-control" type="text" readonly="" aria-describedby="MoveinDate" onchange="MoveinDateChange();" placeholder="Choose a date" />
                                                                    </div>
                                                                    <div class="moveintimeWrapper">
                                                                        <label for="date" class="pic-time">Move-In Time</label>
                                                                        <div class="input-group moveinTime">
                                                                            <select class="custom-select" id="MoveInTime">
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="moveintimeWrapper">
                                                                        <input type="button" class="keyconfirmation btn btn-primary" id="btnKeyMoveinDateChange" value="Confirm" onclick="ChangeMoveinDetails();" />
                                                                    </div>
                                                                </div>
                                                                <hr class="dash" />
                                                                <div class="KeyReceivedWrapper">
                                                                    <input type="checkbox" class="custom-control-input" id="chkKeyReceived">
                                                                    <label for="chkKeyReceived">I have received the keys for the property</label>
                                                                    <input type="button" class="keyconfirmation btn btn-primary" id="btnKeyReceived" value="Submit" onclick="ConfirmKeyReceivedStatus();" />
                                                                    <input type="button" class="keyconfirmation btn btn-primary" value="Cancel" onclick="MoveInCancellation();" style="margin-left: 10px;" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane container fade" id="bookings-nav-current" role="tabpanel" aria-labelledby="nav-home-tab">
                                                <div class="row" id="CurrentBookingsContainer">
                                                </div>
                                                <div class="row" id="checkout_form">
                                                    <div class="dues">
                                                        <div class="bg-white">
                                                            <p class="bookings">Bookings</p>
                                                            <i class="fa fa-angle-right" aria-hidden="true"></i>
                                                            <p class="bookings ChkoutPropName"></p>
                                                            <i class="fa fa-angle-right" aria-hidden="true"></i>
                                                            <p class="bookings">Check out</p>
                                                            <i class="fa fa-angle-right" aria-hidden="true"></i>
                                                        </div>
                                                    </div>
                                                    <div class="offset-lg-2 col-lg-8 offset-col-0 col-12 ">
                                                        <div class="checkout-form-wrap">
                                                            <h2 class="fs-title ChkoutPropName"></h2>
                                                            <h3 class="fs-subtitle">Check out</h3>
                                                            <!-- multistep form -->
                                                            <form id="msform">
                                                                <!-- progressbar -->
                                                                <ul id="progressbar">
                                                                    <li class="active"></li>
                                                                    <li></li>
                                                                    <li></li>
                                                                    <li></li>
                                                                </ul>
                                                                <!-- fieldsets -->
                                                                <fieldset id="checkoutrequest">
                                                                    <div class="field">
                                                                        
                                                                        <%--CancelNotice By Shilpa--%>
                                                                        <input id="chkoutDate" class="form-control" type="text" readonly="" data-mindate="12/12/2017" onclick="checkoutdatebind();" placeholder="Select Checkout Date" onchange="checkoutdatechanged();" />
                                                                        <span class="focus-input100 scheduleCalendar" data-symbol=""><i class="fa fa-calendar" aria-hidden="true"></i></span>
                                                                    </div>
                                                                    <div class="field">
                                                                        <i class="fa fa-angle-down" aria-hidden="true"></i>
                                                                        <div class="input-group">
                                                                            <select class="custom-select" id="slCheckoutTime">
                                                                                <option class="" value="" selected="">Select Check-out Time</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <input type="button" id="btnCancelCheckout" name="cancel" onclick="CancelCheckout();" class="action-button" value="Cancel" />
                                                                    <%--CancelNotice By Shilpa--%>
                                                                    <input type="button" name="next" onclick="BankDetailsCheckout($(this));" class="action-button" value="Next" />
                                                                </fieldset>
                                                                <fieldset class="Refund_Details">
                                                                    <!--/.-->
                                                                 
                                                                     <button id="ancBack2" type="button"  class="checkout_nav_anchor_left" onclick="PreviousCheckoutForm($(this));"><i class="fa fa-chevron-left" aria-hidden="true"></i></button>
                                                                   <button type="button" id="ancNext2" class="checkout_nav_anchor_right" onclick="NextCheckoutForm($(this));"><i class="fa fa-chevron-right" aria-hidden="true"></i></button>
                                                                
                                                                    <!--/.-->
                                                                    <div class="card user_bank_detail">
                                                                        <p class="account-details">Projected Refund Details</p>
                                                                        <hr />
                                                                        <div class="card-body">
                                                                            <div class="display_align row">
                                                                                <div class="col-lg-6 col-md-6 col-12 text-left">
                                                                                    <p class="holder’s">Security Deposit:</p>
                                                                                </div>
                                                                                <div class="col-lg-6 col-md-6 col-12 text-right align_center">
                                                                                    <h4 class="card-title">Rs: <span class="spnDeposit" id="spnDepositAmount">20000</span></h4>
                                                                                </div>
                                                                            </div>
                                                                            <div class="display_align row">
                                                                                <div class="col-lg-6 col-md-6 col-12 text-left">
                                                                                    <p class="holder’s">Notice Period Charges:</p>
                                                                                </div>
                                                                                <div class="col-lg-6 col-md-6 col-12 text-right align_center">
                                                                                    <h4 class="card-title" style="color:green;">Rs: -<span class="spnDeposit" id="spnNoticePeriodCharges">10000</span></h4>
                                                                                </div>
                                                                            </div>

                                                                            <div class="display_align row">
                                                                                <div class="col-lg-6 col-md-6 col-12 text-left">
                                                                                    <p class="holder’s">LockIn Period Charges:</p>
                                                                                </div>
                                                                                <div class="col-lg-6 col-md-6 col-12 text-right align_center refund_dues_sec">
                                                                                    <h4 class="card-title" style="color:green;">Rs: -<span class="spnDeposit" id="spnLockInPeriodCharges">1000</span><%--<i class="fa fa-info-circle" data-toggle="modal" data-target="#dueModal"></i>--%></h4>
                                                                                </div>
                                                                            </div>

                                                                            <div class="display_align row">
                                                                                <div class="col-lg-6 col-md-6 col-12 text-left">
                                                                                    <p class="holder’s">Separation Charges:</p>
                                                                                </div>
                                                                                <div class="col-lg-6 col-md-6 col-12 text-right align_center refund_dues_sec">
                                                                                    <h4 class="card-title" style="color:green;">Rs: -<span class="spnDeposit" id="spnSeparationCharges">500</span><%--<i class="fa fa-info-circle" data-toggle="modal" data-target="#dueModal"></i>--%></h4>
                                                                                </div>
                                                                            </div>                                            
                                                                        <div class="display_align row">
                                                                            <div class="col-lg-6 col-md-6 col-12 text-left">
                                                                                <p class="holder’s">Deposit EMI Charges:</p>
                                                                            </div>
                                                                            <div class="col-lg-6 col-md-6 col-12 text-right align_center refund_dues_sec">
                                                                                <h4 class="card-title" style="color: green;">Rs: -<span class="spnDeposit" id="spnEMIInterestCharges">500</span><%--<i class="fa fa-info-circle" data-toggle="modal" data-target="#dueModal"></i>--%></h4>
                                                                            </div>
                                                                        </div>

                                                                            <div class="display_align row mt-4">
                                                                                <div class="col-lg-6 col-md-6 col-12 text-left">
                                                                                    <p class="holder’s">Tentative Refund Amount:</p>
                                                                                </div>
                                                                                <div class="col-lg-6 col-md-6 col-12 text-right align_center">
                                                                                    <h4 class="card-title">Rs: <span class="spnDeposit" id="spnRefundAmount">17,000</span></h4>
                                                                                </div>
                                                                            </div>
                                                                            <div class="display_align row mt-4">
                                                                                <div class="text-left">
                                                                                    <p class="holder’s" style="color:red;font-size: 10px;
    font-weight: 500;margin-left: 17px;
">Note: At the time of physical inspection if any damages, will be  recovered from the Security deposit. The customer has to pay the refund if it is in negative</p>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <%--  <button class="action-button" id="btnPayNext" onclick="RedirectToDuesAndPayment($(this));">Next</button>--%>
                                                                    <input type="button" name="next" class="next action-button btn btn-primary" onclick="BindBankDetails($(this));" value="Next" />             
                                                                </fieldset>
                                                                <fieldset class="User_Bank_Details">
                                                                      <button id="ancBack3" type="button" class="checkout_nav_anchor_left" onclick="PreviousCheckoutForm($(this));"><i class="fa fa-chevron-left" aria-hidden="true"></i></button>
                                                                   <button type="button" id="ancNext3" class="checkout_nav_anchor_right" onclick="NextCheckoutForm($(this));"><i class="fa fa-chevron-right" aria-hidden="true"></i></button>
                                                                    <%--CancelNotice By Shilpa--%>
                                                                    <p class="account-details">Bank Account details</p>
                                                                    <p class="refund">
                                                                        The refund amount will be sent to the given bank account details. Please ensure they are right.
                                                                    </p>
                                                                    <div class="card user_bank_detail">
                                                                        <div class="card-body">
                                                                            <p class="holders">Account holder’s name</p>
                                                                            <%--<h4 class="card-title" id="spnHolderName"></h4>--%>
                                                                            <input class="card-title" id="txtAccountHolderName" name="accholdername" disabled size="30" type="text" maxlength="80" style="width: 319px;height: 41px;">
                                                                            <p class="holders">Bank Name</p>
                                                                            <%--<h4 class="card-title" id="spnBankName"></h4>--%>
                                                                            <input class="form-control" id="txtBankName" name="bankname"  disabled size="30" type="text" maxlength="80" style="width: 319px;height: 41px;">
                                                                            <div class="account">
                                                                                <div class="askl">
                                                                                    <p class="holders">Account Number</p>
                                                                                    <%--<h4 class="card-title" id="spnAccountNumber"></h4>--%>
                                                                                    <input class="form-control" id="txtAccountNumber" disabled name="accnumber" size="30" type="text" maxlength="80" style="width: 148px;height: 41px;" >
                                                                                </div>
                                                                                <div class="personal">
                                                                                    <p class="ifsc">IFSC code</p>
                                                                                    <%--<p class="sent" id="spnifscCode"></p>--%>
                                                                                    <input class="form-control" id="txtIFSCCode" disabled name="ifsccode" size="30" type="text" maxlength="80" style="width: 148px;height: 41px;">
                                                                                </div>
                                                                            </div>
                                                                            <p class="never">Email ID</p>
                                                                            <%--<p class="Email" id="spnEmailId"></p>--%>
                                                                            <input type="email" class="form-control" id="txtEmail" disabled name="emailid" placeholder="" maxlength="75" style="width: 319px;height: 41px;">
                                                                        </div>
                                                                    </div>
                                                                    <input type="button" id="btnEdit" class="action-button" value="Edit" onclick="EditBankDetailsDuringNoticeRaise($(this));"/>
                                                                    <input type="button" name="next" class="next action-button btn btn-primary" onclick="NextCheckoutForm($(this));" value="Next" />
                                                                </fieldset>
                                                                <fieldset style="position: static !important;">
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
                                                                    <p class="improve" style="margin-top: 20px;">Among this which needs to be improved ?</p>
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
                                                                        <input id="txtCommments" class="feedbackComments" type="text" aria-describedby="comments" placeholder="Enter comments" />
                                                                    </div>
                                                                    <input type="button" name="previous" class="action-button" onclick="PreviousCheckoutForm($(this));" value="Back" />
                                                                    <input type="button" name="submit" class="action-button btn btn-primary" value="Submit" onclick="CheckoutFormFinal($(this));" />
                                                                </fieldset>
                                                                <fieldset>
                                                                    <div class="package">
                                                                        <div class="pbody">
                                                                            <img src="/assets/images/checked.png" alt="">
                                                                            <h4 class="text-center">Your Check-out request
                                                                                    <br>
                                                                                has been recieved</h4>
                                                                            <div class="cards">
                                                                                <p class="proximaNova" id="spnCheckoutDetails"></p>
                                                                                <div class="prime">
                                                                                    <input type="button" class="btn btn-primary" value="Done" onclick="CancelCheckout();" />
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </fieldset>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane container fade" id="bookings-nav-Previous" role="tabpanel" aria-labelledby="nav-profile-tab">
                                                <div class="row" id="PreviousBookingContainer">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- MY SERVICE REQUEST -->
                        <div id="service" class="tab-pane fade in  ">
                            <div class="main-content">
                                <div class="title">
                                    Service request
                                </div>
                                <div class="row">
                                    <div class="col-12 ">
                                        <nav>
                                            <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                                <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#booking-current-service" role="tab" aria-controls="nav-home" aria-selected="true">Current</a>
                                                <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#booking-past-service" role="tab" aria-controls="nav-profile" aria-selected="false">Past</a>
                                            </div>
                                        </nav>
                                        <div class="tab-content" id="nav-tabContent">
                                            <div class="tab-pane fade show active" id="booking-current-service" role="tabpanel" aria-labelledby="nav-home-tab">
                                                <div class="row" id="servicerequestcard">
                                                </div>
                                                <div class="current-service-form-wrap" id="ServiceRequestForm">
                                                    <div class="form-wrap">
                                                        <h5 class="text-center"><span id="spnSRProperty"></span></h5>
                                                        <p class="text-center booking-id">
                                                            Booking id: <span id="spnBookingId"></span>
                                                        </p>
                                                        <form>
                                                            <div class="form-group">
                                                                <label for="SlServiceRequestCategory">Service type *</label>
                                                                <select class="form-control" id="SlServiceRequestCategory" onchange="BindServiceRequestMasters($(this).val());">
                                                                </select>
                                                                <i class="fa fa-angle-down" aria-hidden="true"></i>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="SlSRSubCategory">Issue type*</label>
                                                                <select id="SlSRSubCategory" class="form-control">
                                                                </select>
                                                                <i class="fa fa-angle-down" aria-hidden="true"></i>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="txtSRDescription">
                                                                    Service  description*</label>
                                                                <textarea class="form-control" id="txtSRDescription" rows="5" placeholder="Please describe the problems you are facing...."></textarea>
                                                            </div>
                                                            <div class="form-group">
                                                                <div class="file ">
                                                                    Choose file
                                                                        <input type="file" accept="image/*" id="fuSRFileUpload" data-imagebinaryid="hdnSRImageBinary" data-filenameid="hdnSRImageFile" data-labelid="spnSRFileName" name="file" onchange="handleFileImg(this);" />
                                                                    <input type="hidden" id="hdnSRImageBinary" name="file" />
                                                                    <input type="hidden" id="hdnSRImageFile" name="file" />
                                                                </div>
                                                                <span class="no-file-choosen" id="spnSRFileName"></span>
                                                            </div>
                                                        </form>
                                                        <div class="submit">
                                                            <button class="btn submit-service-request" onclick="CancelServiceRequest();">Cancel</button>
                                                            <button class="btn submit-service-request" onclick="SendServiceRequest();">Submit</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="booking-past-service" role="tabpanel" aria-labelledby="nav-profile-tab">
                                                <div class="past-service-card-wrap">
                                                    <div class="row" id="ServiceRequestHistory">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- MY DUES & PAYMENT -->
                        <div id="payment" class="tab-pane fade in">
                            <div class="main-content">
                                <div class="title">Dues and Payments</div>
                                <div class="row">
                                    <div class="col-12 ">
                                        <nav>
                                            <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                                <a class="nav-item nav-link active" id="nav-CEONotes-tab" data-toggle="tab" href="#CEONotes" role="tab" aria-controls="nav-home" aria-selected="true">CEO Notes</a>
                                                <a class="nav-item nav-link" id="nav-dues-tab" data-toggle="tab" href="#my-dues" role="tab" aria-controls="nav-home" aria-selected="true">Dues</a>
                                                <a class="nav-item nav-link" id="nav-invoice-tab" data-toggle="tab" href="#my-invoice" role="tab" aria-controls="nav-profile" aria-selected="false">Invoice</a>
                                                <a class="nav-item nav-link" id="nav-transaction-tab" data-toggle="tab" href="#my-transaction" role="tab" aria-controls="nav-home" aria-selected="true">Payments</a>
                                                <a class="nav-item nav-link" id="nav-accounts-tab" data-toggle="tab" href="#my-accounts" role="tab" aria-controls="nav-profile" aria-selected="false">Statements</a>
                                                <a class="nav-item nav-link" id="nav-PMNotes-tab" data-toggle="tab" href="#PMNotes" role="tab" aria-controls="nav-home" aria-selected="true">PM Notes</a>
                                            </div>
                                        </nav>
                                        <div class="tab-content" id="nav-tabContent_dues">
                                            <div class="tab-pane fade show active" id="CEONotes" role="tabpanel" aria-labelledby="nav-home-tab">
                                                <div class="" id="invoice-first">
                                                    <div class="invoice">
                                                        <div class="container pad0">
                                                            <div class="bgc">
                                                                <div class="col-lg-12 col-md-12 col-12 bkhc" id="dvCEONotes">
                                                                  
                                                                </div>
                                                                <div class="col-lg-12 col-md-12 col-12 ceo_details">
                                                                    <div class="ceo_image">
                                                                        <img src="https://www.colive.in/utility/invoice/sureshkumar.jpg" class="img-fluid ceo_images"/>
                                                                    </div>
                                                                    <div class="ceo_desig">
                                                                        <div class="ceo_name">Suresh Rangarajan</div>
                                                                        <div class="designation">Founder & CEO</div>
                                                                        <div class="ceo_corporate">Colive.</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade show" id="my-dues" role="tabpanel" aria-labelledby="nav-home-tab">
                                                <div class="" id="invoice-first">
                                                    <div class="invoice">
                                                        <div class="container pad0">
                                                            <div class="bgc">
                                                                <div class="col-lg-12 col-md-12 col-12 bkhc" id="DuesSection">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade show " id="my-invoice" role="tabpanel" aria-labelledby="nav-home-tab">

                                                <div class="" id="invoice-second">
                                                    <div class="invoice-deta">
                                                        <div class="container status-mail">
                                                            <div class="detail-status" id="InvoiceContainer">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade show " id="my-transaction" role="tabpanel" aria-labelledby="nav-home-tab">
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="table-wrap">
                                                            <table class="table">
                                                                <thead>
                                                                    <tr id="ReceiptDetails">
                                                                        <th scope="col">Property</th>
                                                                        <th scope="col">Transaction Date</th>
                                                                        <th scope="col">Reference ID</th>
                                                                        <th scope="col">Amount</th>
                                                                        <th></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="ReceiptSection">
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade show " id="my-accounts" role="tabpanel" aria-labelledby="nav-home-tab">
                                                <div class="accounts-wrap">
                                                    <div class="accordion-header" id="StatementsHeader">
                                                        <p class="col-lg-2 col-12 text-center">S No</p>
                                                        <p class="col-lg-2 col-12 text-center">Month</p>
                                                        <p class="col-lg-2 col-12 text-center">Dues</p>
                                                        <p class="col-lg-2 col-12 text-center">Paid</p>
                                                        <p class="col-lg-2 col-12 text-center">OS</p>
                                                    </div>
                                                    <div class="accordion" id="accordionExample">
                                                    </div>
                                                </div>
                                            </div>
                                             <div class="tab-pane fade show" id="PMNotes" role="tabpanel" aria-labelledby="nav-home-tab">
                                                <div class="" id="invoice-notes">
                                                    <div class="invoice">
                                                        <div class="container pad0">
                                                            <div class="bgc">
                                                                <div class="col-lg-12 col-md-12 col-12 bkhc" id="dvPMNotes">
                                                                   
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="event" class="tab-pane fade in  ">
                            <div class="main-content">
                                <div class="title">My Events</div>
                                <div class="row">
                                    <div class="col-12 ">
                                        <nav>
                                            <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                                <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#create_events" role="tab" aria-controls="nav-home" aria-selected="true">Create events</a>
                                                <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#past_events" role="tab" aria-controls="nav-profile" aria-selected="false">Past events</a>
                                            </div>
                                            <div class="create_events_btn">
                                                Create events

                                            </div>
                                        </nav>
                                        <div class="tab-content" id="nav-tabContent_events">
                                            <div class="tab-pane fade show active" id="create_events" role="tabpanel" aria-labelledby="nav-home-tab">
                                                <div class="row">
                                                    <div class="col-lg-5 col-md-5 col-12">
                                                        <div class="card">
                                                            <img class="card-img-top" src="/assets/images/dashboards_events/Bitmap.png" alt="Card image cap">
                                                            <div class="card-body">
                                                                <h5 class="card-title">Colive 122 Broadway</h5>
                                                                <div class="approval">
                                                                    <div class="evn-dt">
                                                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                                                        <p class="july">14th July 2019</p>
                                                                    </div>
                                                                    <div class="clock-al">
                                                                        <i class="fa fa-clock-o" aria-hidden="true"></i>
                                                                        <p class="quick-time">7:00PM - 12:00AM</p>
                                                                    </div>
                                                                </div>
                                                                <div class="ster">
                                                                    <div class="event-aprove">
                                                                        <i class="fa fa-info-circle" aria-hidden="true"></i>
                                                                        <p class="card-text">Approval Pending</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="tab-pane fade " id="past_events" role="tabpanel" aria-labelledby="nav-home-tab">
                                                <div class="row">

                                                    <div class="col-lg-5 col-md-5 col-12">
                                                        <div class="card">
                                                            <img class="card-img-top" src="/assets/images/dashboards_events/Bitmap.png" alt="Card image cap">
                                                            <div class="card-body">
                                                                <h5 class="card-title">Colive 122 Broadway</h5>
                                                                <div class="approval">
                                                                    <div class="evn-dt">
                                                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                                                        <p class="july">14th July 2019</p>
                                                                    </div>
                                                                    <div class="clock-al">
                                                                        <i class="fa fa-clock-o" aria-hidden="true"></i>
                                                                        <p class="quick-time">7:00PM - 12:00AM</p>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-5 col-md-5 col-12">
                                                        <div class="card">
                                                            <img class="card-img-top" src="/assets/images/dashboards_events/Bitmap.png" alt="Card image cap">
                                                            <div class="card-body">
                                                                <h5 class="card-title">Colive 122 Broadway</h5>
                                                                <div class="approval">
                                                                    <div class="evn-dt">
                                                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                                                        <p class="july">14th July 2019</p>
                                                                    </div>
                                                                    <div class="clock-al">
                                                                        <i class="fa fa-clock-o" aria-hidden="true"></i>
                                                                        <p class="quick-time">7:00PM - 12:00AM</p>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="create_event_form">

                                                <h2 class="fs-title">Create an event</h2>
                                                <h3 class="fs-subtitle">Want to throw a party? Invite your community and make it grander!</h3>
                                                <div class="wrapper">
                                                    <form action="" id="wizard">
                                                        <!-- SECTION 1 -->
                                                        <h2></h2>
                                                        <section>
                                                            <div class="inner">

                                                                <div class="form-content">

                                                                    <div class="form-row">
                                                                        <div class="form-holder">
                                                                            <label for="">Give your event a title*</label>
                                                                            <input type="text" placeholder="Event Name" class="form-control">
                                                                        </div>
                                                                        <div class="form-holder">
                                                                            <label for="">
                                                                                Select your check out date and
                                                                            time</label>
                                                                            <input type="text" placeholder="25th February" class="form-control">
                                                                            <i class="fa fa-calendar" aria-hidden="true"></i>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-row">
                                                                        <div class="form-holder">
                                                                            <label for="">
                                                                                What’s type of event is
                                                                            this?*</label>
                                                                            <input type="text" placeholder="Your Email" class="form-control">
                                                                        </div>
                                                                        <div class="form-holder">
                                                                            <label for="">
                                                                                What’s type of event is
                                                                            this?*</label>
                                                                            <div class="to-from-box">
                                                                                <div class="select-time">
                                                                                    <select class="form-control" id="exampleFormControlSelect1">
                                                                                        <option>11:00 AM</option>
                                                                                        <option>12:00 AM</option>
                                                                                        <option>01:00 AM</option>
                                                                                    </select>
                                                                                    <i class="fa fa-angle-down" aria-hidden="true"></i>

                                                                                </div>

                                                                                <span>From</span>
                                                                                <div class="select-time">
                                                                                    <select class="form-control" id="exampleFormControlSelect1">
                                                                                        <option>11:00 AM</option>
                                                                                        <option>12:00 AM</option>
                                                                                        <option>01:00 AM</option>
                                                                                    </select>
                                                                                    <i class="fa fa-angle-down" aria-hidden="true"></i>

                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                    <div class="form-row">
                                                                        <div class="form-holder">
                                                                            <label for="">Describe the event</label>
                                                                            <textarea name="" id="" cols="30" rows="10"></textarea>
                                                                        </div>
                                                                        <div class="form-holder"></div>
                                                                    </div>
                                                                    <div class="form-row checkbox">
                                                                        <div class="form-holder">
                                                                            <label for="">
                                                                                Does you event have
                                                                            amenities?</label>
                                                                            <ul class="unstyled centered">
                                                                                <li>
                                                                                    <input class="styled-checkbox" id="styled-checkbox-1" type="checkbox" value="value1">
                                                                                    <label for="styled-checkbox-1">
                                                                                        Yes</label>
                                                                                </li>
                                                                                <li>
                                                                                    <input class="styled-checkbox" id="styled-checkbox-2" type="checkbox" value="value2" checked>
                                                                                    <label for="styled-checkbox-2">
                                                                                        No</label>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </section>

                                                        <!-- SECTION 2 -->
                                                        <h2></h2>
                                                        <section>
                                                            <div class="inner">

                                                                <div class="form-content">
                                                                    <div class="form-row checkbox">
                                                                        <div class="form-holder">
                                                                            <label for="">Food</label>
                                                                            <ul class="unstyled centered">
                                                                                <li>
                                                                                    <input class="styled-checkbox" id="styled-checkbox-1" type="checkbox" value="value1">
                                                                                    <label for="styled-checkbox-1">
                                                                                        Yes</label>
                                                                                </li>
                                                                                <li>
                                                                                    <input class="styled-checkbox" id="styled-checkbox-2" type="checkbox" value="value2" checked>
                                                                                    <label for="styled-checkbox-2">
                                                                                        No</label>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-row">
                                                                        <div class="form-holder">
                                                                            <label for="">Type of food</label>
                                                                            <input type="text" placeholder="Event Name" class="form-control">
                                                                            <i class="fa fa-plus" aria-hidden="true"></i>

                                                                        </div>
                                                                        <div class="form-holder">
                                                                            <label for="">Type of food</label>
                                                                            <input type="text" placeholder="Event Name" class="form-control">
                                                                            <i class="fa fa-plus" aria-hidden="true"></i>

                                                                        </div>
                                                                    </div>
                                                                    <div class="form-row">
                                                                        <div class="form-holder">
                                                                            <label for="">Beverages</label>
                                                                            <div class="select-food-type">
                                                                                <select class="form-control" id="exampleFormControlSelect1">
                                                                                    <option>BYOB</option>
                                                                                    <option>BYOB</option>
                                                                                    <option>BYOB</option>
                                                                                </select>
                                                                                <i class="fa fa-angle-down" aria-hidden="true"></i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-holder">
                                                                            <label for="">Beverage Type</label>
                                                                            <div class="select-food-type">
                                                                                <select class="form-control" id="exampleFormControlSelect1">
                                                                                    <option>Non - Alcoholic</option>
                                                                                    <option>Non - Alcoholic</option>
                                                                                    <option>Non - Alcoholic</option>
                                                                                </select>
                                                                                <i class="fa fa-angle-down" aria-hidden="true"></i>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-row checkbox">
                                                                        <div class="form-holder">
                                                                            <label for="">
                                                                                Does you event have
                                                                            amenities?</label>
                                                                            <ul class="unstyled centered">
                                                                                <li>
                                                                                    <input class="styled-checkbox" id="styled-checkbox-1" type="checkbox" value="value1">
                                                                                    <label for="styled-checkbox-1">
                                                                                        Yes</label>
                                                                                </li>
                                                                                <li>
                                                                                    <input class="styled-checkbox" id="styled-checkbox-2" type="checkbox" value="value2" checked>
                                                                                    <label for="styled-checkbox-2">
                                                                                        No</label>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="form-holder">
                                                                            <label for="">Music type</label>
                                                                            <div class="select-food-type">
                                                                                <select class="form-control" id="exampleFormControlSelect1">
                                                                                    <option>Bollywood</option>
                                                                                    <option>Hollywod</option>
                                                                                    <option>Tollywood</option>
                                                                                </select>
                                                                                <i class="fa fa-angle-down" aria-hidden="true"></i>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                    <div class="form-row">
                                                                        <div class="form-holder">
                                                                            <label for="">Event Theme</label>
                                                                            <input type="text" placeholder="About the event" class="form-control">
                                                                        </div>
                                                                        <div class="form-holder"></div>

                                                                    </div>
                                                                    <div class="form-row">
                                                                        <div class="form-holder">
                                                                            <label for="">Event theme description</label>
                                                                            <input type="text" placeholder="Description" class="form-control">
                                                                        </div>
                                                                        <div class="form-holder"></div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </section>

                                                        <!-- SECTION 3 -->
                                                        <h2></h2>
                                                        <section>
                                                            <div class="inner third_section">

                                                                <div class="form-content">

                                                                    <div class="form-row">
                                                                        <div class="form-holder">
                                                                            <label for="">Where is the event?</label>
                                                                            <input type="text" placeholder="Enter location" class="form-control">
                                                                        </div>

                                                                    </div>
                                                                    <div class="form-row checkbox">
                                                                        <div class="form-holder">
                                                                            <label for="">
                                                                                Who do you want to
                                                                            invite?</label>
                                                                            <ul class="unstyled centered">
                                                                                <li>
                                                                                    <input class="styled-checkbox" id="styled-checkbox-1" type="checkbox" value="value1">
                                                                                    <label for="styled-checkbox-1">
                                                                                        Entire
                                                                                    colive community</label>
                                                                                </li>
                                                                                <li>
                                                                                    <input class="styled-checkbox" id="styled-checkbox-2" type="checkbox" value="value2" checked>
                                                                                    <label for="styled-checkbox-2">
                                                                                        My
                                                                                    property</label>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </section>
                                                        <!-- SECTION 4 -->
                                                        <h2></h2>
                                                        <section>
                                                            <div class="inner">

                                                                <div class="final_event_page">
                                                                    <div class="tick">
                                                                        <img src="/assets/images/checked.png" alt="">
                                                                    </div>
                                                                    <div class="content">
                                                                        <p>
                                                                            Your event has been sent to the admin for approval
                                                                        </p>
                                                                    </div>
                                                                    <div class="button">
                                                                        Back to Events

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </section>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- MY VISIT -->
                        <div id="referral" class="tab-pane fade in  ">
                            <div class="main-content">
                                <div class="title">Referral</div>
                                <div class="row">
                                    <div class="col-12">
                                        <nav>
                                            <div class="nav nav-tabs nav-fill" id="nav-tab_Referral" role="tablist">
                                                <a class="nav-item nav-link active" id="nav-referral-tab" data-toggle="tab" href="#Referral_Details" role="tab" aria-controls="nav-home" aria-selected="true">Referral</a>
                                                <a class="nav-item nav-link" id="nav-profile-referral-tab" data-toggle="tab" href="#Referral_History" role="tab" aria-controls="nav-profile" aria-selected="false">History</a>
                                            </div>
                                        </nav>
                                        <div class="tab-content" id="nav-tabContent_Referral">
                                            <div class="tab-pane fade show active" id="Referral_Details" role="tabpanel" aria-labelledby="nav-home-tab">
                                                <div class="col-lg-10 col-12 referralwhite-bg">
                                                    <div class="row" id="reschedule-visit-cards">
                                                        <h1 style="text-align: center" class="referurfriend">Refer your friends by sharing your code</h1>
                                                        <input class="referal-code" id="txtReferralCode" value="" size="10" disabled="" type="text">
                                                        <div class="referral-image col-10 offset-1">
                                                            <img id="Imgreferral" src="" class="img-fluid" />
                                                        </div>
                                                        <h1 class="referurfriend" id="spnReferral"></h1>
                                                        <h1 class="referurfriend">Please enter your friends Details</h1>
                                                        <div class="ReferralForm row">
                                                            <form id="ReferralForm">
                                                                <div class="form-group col-lg-5 col-12">
                                                                    <input type="text" class="form-control" name="name" id="ReferralName" aria-describedby="nameHelp" placeholder="Name">
                                                                </div>
                                                                <div class="form-group col-lg-4 col-12">
                                                                    <input type="tel" class="tel form-control" name="mobilenumber" id="ReferralMobile" pattern="[0-9]{10}" x-autocompletetype="tel" maxlength="13" aria-describedby="mobileHelp" placeholder="Mobile number" required="">
                                                                </div>
                                                                <div class="form-group col-lg-3 col-12">
                                                                    <input type="button" class="btn btn-primary" value="Submit" id="submit" onclick="ReferralInsert();">
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade show" id="Referral_History" role="tabpanel" aria-labelledby="nav-home-tab">
                                                <div class="referralwhite-bg">
                                                    <div class="row" id="referral_history">
                                                        <div class="table-wrap">
                                                            <table class="table" id="tbReferral">
                                                                <thead>
                                                                    <tr id="ReferralDetails">
                                                                        <th scope="col">S No</th>
                                                                        <th scope="col">Referral Name</th>
                                                                        <th scope="col">Status</th>
                                                                        <th scope="col">Offer Availed</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="ReferralSection">
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--Website SmartLock--%>
                        <div id="smartlock" class="tab-pane fade in  ">
                            <div class="main-content">
                                <div class="title">Room Access Code</div>
                                <div class="row">
                                    <div class="col-12">
                                        <nav>
                                            <div class="nav nav-tabs nav-fill" id="nav-tab_SmartLock" role="tablist">
                                                <a class="nav-item nav-link active" id="nav-smartlock-tab" data-toggle="tab" href="#SmartLock_Details" role="tab" aria-controls="nav-home" aria-selected="true">Access Code</a>
                                            </div>
                                        </nav>
                                        <div class="tab-content" id="nav-tabContent_SmartLock">
                                            <div class="tab-pane fade show active" id="SmartLock_Details" role="tabpanel" aria-labelledby="nav-home-tab">
                                                <div>                                                    
                                                    <div style="width: 100%; height: 100%;">
                                                        <h1 class="smartlock">Hey <span id="spnSmartLock"></span>,</h1>
                                                    </div>

                                                    <div style="width: 100%; height: 100%;">
                                                        <h1 class="smartlock" style="margin-left: 45px;">Here's the code to unlock the door.</h1>                                                        
                                                    </div>
                                                    <div style="width: 100%; height: 100%;">
                                                        <div style="position:relative;">
                                                            <input type="text" class="form-control d-lg-block d-md-block d-xs-block" style="margin-left: 110px; margin-top: 25px;width: 88px; height: 100%;max-width:90px;box-sizing:border-box;"
                                                                id="txtSmartLock" readonly="readonly" value="" size="10">
                                                            <input type="button" style="margin-top: -60px;margin-left: 219px;" class="btn btn-primary valid" value="Generate Pin" id="submit" onclick="DeactivateActivate($('#hdnBookingId').val())" aria-invalid="false">
                                                            <%--<img id="ImgRefresh" alt="Refresh Access Code" src="/assets/images/Refresh.png" style="width: 20px; height: 20px; position:absolute;top:7px;left:203px;cursor:pointer;"
                                                            onclick="DeactivateActivate($('#hdnBookingId').val())" />--%>
                                                        </div>
                                                        <div style="width:20%; height: 100%;">
                                                        
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <img id="Imghome" src="/assets/images/RoomLocation.jpg" style="width: 25px; height: 25px; margin-left: 45px; float: left;" />
                                                        </div>
                                                        <div style="padding-left: 75px;">
                                                            <h1 class="smartlock"><span id="spnLocName"></span>-<span id="spnRoomCode"></span></h1>
                                                        </div>
                                                    </div>
                                                    <%--</div>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--Co-Tenants--%>
                        <div id="cotenants" class="tab-pane fade in  ">
                            <div class="main-content">
                                <div class="title">Booking Details</div>
                                <div class="row" id="CotenantDetails">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- Dues Modal -->
    <div class="modal fade" id="DuesModal" tabindex="-1" role="dialog" aria-labelledby="DuesModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title font-weight-bold" id="DuesModalLabel">Choose Payment</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="CancelDuesTransaction();">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12 radioInputGroup">
                        <div class="form-check paymentType">
                            <input class="form-check-input radio-custom" type="radio" id="PaymentTypeOverall" name="PaymentType" value="1">
                            <label class="form-check-label font-weight-normal radio-custom-label" for="PaymentTypeOverall">Payable Due: </label>
                            <label class="font-weight-normal float-right" for="PaymentTypeOverall">Rs. <span id="spnOverallDues"></span></label>
                        </div>
                        <div class="form-check paymentType" id="ChooseRent" style="display:none">
                            <input class="form-check-input" type="radio" id="PaymentTypeRent" name="PaymentType" value="2">
                            <label class="form-check-label font-weight-normal" for="PaymentTypeRent">Rent: </label>
                            <label class="font-weight-normal float-right" for="PaymentTypeRent">Rs.  <span id="spnOverallRent"></span></label>
                        </div>
                        <%--CancelNotice By Shilpa--%>
                        <div class="form-check paymentType" id="ChoosePay">
                            <input class="form-check-input" type="radio" id="PaymentTypeOthers" name="PaymentType" value="3">
                            <label class="font-weight-normal form-check-label" for="PaymentTypeOthers">Others : </label>
                            <input id="txtOtherPayment" class="form-control float-right otherpayment" type="text" onkeypress="return NumberOnly();" maxlength="7" placeholder="Rs." />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="CancelDuesTransaction();">Cancel</button>
                    <button type="button" class="btn btn-primary" data-buttonid="0" id="btnDuesConfirm" onclick="PayDuePayment($(this));">Make Payment</button>
                </div>
            </div>
        </div>
    </div>
    <!-- ./Dues Modal -->

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


    <!-- Modal -->
    <div class="modal fade" id="mdlCheckoutModal" tabindex="-1" role="dialog" aria-labelledby="mdlCheckoutModal" aria-hidden="true">
        <div class="container">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="CheckoutModalLongTitle">Check-out</h5>
                    </div>
                    <div class="modal-body">
                        <div class="scrollOvereff">
                            <div class="customizepopup">
                                <div class="sub-title">Terms & Conditions</div>
                                <div class="checkout-Terms">
                                    <p>Trust you had a great stay at Colive and adapted well with the co-living way of life. You have been one of the early adopters of this concept in India & hope you would recommend this upgraded lifestyle to peers and friends.</p>
                                    <p>Continue to enjoy the Colive way of life even when you are moving to another city. Colive properties are now available in Hyderabad & Chennai. Opt-in with a transfer request and make the move seamlessly</p>
                                    <ul class="CheckoutTermsList">
                                        <li>Notice period is calculated for one full month starting from the 1st day of the calendar month to the last day of the month. Vacating notice should be raised before the month begins. <strong>EXAMPLE: For a vacating notice raised between 2nd July to 31st July, the notice period will be calculated from 1st August onwards</strong></li>
                                        <li>Vacating Notice can be raised post the completion of Lock- in period only</li>
                                        <li>1 month notice period is mandatory for all Colive properties, all dues & outstanding rent along with the rent of the notice period has be cleared before the check-out</li>
                                        <li>The rent for the notice period will be calculated for the whole month without exceptions <strong>EXAMPLE: If you choose to check-out on 20th August, the rent will be calculated till the end of the notice period, ie, 30th August</strong></li>
                                        <li>Rent for the 1 month notice period should to be paid in full and all dues have to cleared before the check-out, rent and outstanding dues will not be adjusted with the deposit</li>
                                        <li>Your bed will be re-assigned for sales once you raise the notice period, if you wish to continue with your stay at Colive – it will be subject to availability</li>
                                        <li>Cancellation of Notice to Vacate is entertained not more than twice in your booking time period. While we would love to have you extend your stay with Colive, our properties are usually in high demand and this condition lets us provide hassle-free accommodation to our prospects. </li>
                                    </ul>
                                    <h4 class="sub-title">Refund of the security deposit</h4>
                                    <h5 class="subTitlecontent">Standard deductions</h5>
                                    <ul class="CheckoutTermsList">
                                        <li>Separation charges equal to 7 days rent will be deducted as per agreement terms To waive off your separation charges – refer a friend & receive your deposit refund without any deductions </li>
                                        <li>Property Manager will evaluate the property at the time of check-out in your presence to inspect the Colive Property and assets for any damages. Charges for repairs, maintenance, damages along with the additional penalty will be deducted from the security deposit</li>
                                        <li>Any amount due or outstanding post check-out would lead to the deposit being forfeited in full</li>
                                    </ul>
                                    <h5 class="subTitlecontent">Pay- out</h5>
                                    <ul class="CheckoutTermsList">
                                        <li>Please ensure your bank details are updated correctly in the system</li>
                                        <li>Deposit refund will be received no later than 15th of the consecutive month, post your check-out</li>
                                    </ul>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="customizepopupbtn customizepopup">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-12">
                                    <button type="button" id="btnContinueCheckout" class="btn btn-primary" onclick="RaiseCheckoutRequest($(this));">I Agree and continue with the check-out</button>
                                    <button type="button" id="btnMayBeLater" class="btn btn-secondary" data-dismiss="modal">May be later</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="mdlPayDueModal" class="modal fade">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content" style="height: 107px;width: 435px;margin-top: 326px;">
                <div class="container">
                <p class="cancel_body_content" style="padding-top: 9px;">Please clear your dues before raising the notice to vacate</p>
                <div class="cancel_pop" style="margin-top: -16px;margin-right: 6px;">
                    <button type="button" id="btnPay" class="btn btn-primary" onclick="PayDues();">PayDue</button>
                    <button type="button" id="btnCancel" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <%--<a href="" id="btnPay" class="cancel_popup_yes" onclick="PayDues();">PayDue</a>
                    <a href="" id="btnCancel" class="cancel_popup_no" data-dismiss="modal">Cancel</a>--%>
                </div>
                    </div>
            </div>
        </div>
    </div>
    <div class="CssLoaderStyles" id="AjaxLoader" style="display: none;">
        <div class="CssLoaderAlign">
            <div class="Logo-loader"></div>
            <div class="logoloader"></div>
        </div>
    </div>

        <!-- Opt-in cancel raised request popup -->
<!-- The Modal -->
<div id="cancel_raise_noticed" class="modal fade">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <!--<span onclick="$('#cancel_raise_noticed').hide();" class="close w3_close" data-dismiss="modal">&times;</span>-->
            <p class="cancel_body_content">Are you sure you want to cancel the Notice Period Request?</p>
            <div class="cancel_pop">
                <button type="button" class="cancel_popup_yes" id="ancYes" onclick="CancelRaisedCheckoutRequest(this);">Yes</button>
                <button type="button" class="cancel_popup_no" id="ancNo" data-dismiss="modal">No</button>
                
            </div>
        </div>
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
                            <tbody id="CheckInEMIOptions">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div id="AddCotenant" class="modal fade" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <!--<span onclick="$('#cancel_raise_noticed').hide();" class="close w3_close" data-dismiss="modal">&times;</span>-->
            <p class="cancel_body_content">Are you Moving-in alone or with co-Tenant?</p>
            <div class="d-flex cancel_pop AlignDflex">
                <button type="button" class="cancel_popup_yes" id="ancYesAlone" onclick="CaptureNoCotenantSelection(this);">Yes! I am Alone</button>
                <button type="button" class="cancel_popup_no" id="ancNotAlone" onclick="CaptureYesCotenantSelection(this);">I am moving in with someone</button>
                
                </div>
            </div>
        </div>

    </div>

    <div id="mdlTransferModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="container">
                    <h1 class="TransferHeader">Transfer Category</h1>
                    <p class="transfer_body_content" style="padding-top: 9px;">
                        Hi Coliver, tell us where you would like to be transferred to
                        <br />
                        within the same property / to another colive property
                    </p>
                    <div class="transfercontainer">
                        <div class="check_box">
                            <div class="check-default-width pretty">
                                <div class="check-align radioInputGroup">
                                    <input class="radio-custom" id="sameProperty" name="rdtransfer" type="radio" value="1" onchange="rdtransferchanged();">
                                    <label class="radio-custom-label" for="sameProperty">Same Property</label>
                                </div>
                            </div>
                        </div>
                        <div class="check_box">
                            <div class="check-default-width pretty">
                                <div class="check-align radioInputGroup">
                                    <input class="radio-custom" id="otherProperty" name="rdtransfer" type="radio" value="2" onchange="rdtransferchanged();">
                                    <label class="radio-custom-label" for="otherProperty">Other</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="transfercontainer" id="TransfersLocations">
                        <div class="form-group">
                            <label for="SlServiceRequestCategory">Cities</label>
                            <select class="form-control" id="SlCity" onchange="BindClusters();">
                            </select>
                            <i class="fa fa-angle-down" aria-hidden="true"></i>
                        </div>
                        <div class="form-group">
                            <label for="SlServiceRequestCategory">Clusters</label>
                            <select class="form-control" id="SlClusters">
                            </select>
                            <i class="fa fa-angle-down" aria-hidden="true"></i>
                        </div>
                    </div>
                    <div class="cancel_pop" style="margin-right: 6px; margin-bottom: 16px;">
                        <button type="button" id="btnTransferBack" class="btn btn-secondary" data-dismiss="modal">Back</button>
                        <button type="button" id="btnTransferContinue" class="btn btn-primary" onclick="TransferContinue();">Continue</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="mdlTransferCancel" class="modal fade">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content" style="height: 120px; width: 435px; margin-top: 326px;">
                <div class="container">
                    <p class="cancel_body_content" style="padding-top: 9px;">Are you sure you want to cancel the Transfer Request Raised?</p>
                    <div class="cancel_pop" style="margin-top: 5px; margin-right: 6px;">
                        <button type="button" id="btnPay" class="cancel_popup_yes btn btn-primary" onclick="CancelTransfer();">Yes</button>
                        <button type="button" id="btnCancel" class="cancel_popup_no btn btn-primary" data-dismiss="modal">No</button>
                        <%--<a href="" id="btnPay" class="cancel_popup_yes" onclick="PayDues();">PayDue</a>
                    <a href="" id="btnCancel" class="cancel_popup_no" data-dismiss="modal">Cancel</a>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Payment -->
    <form id="fmPayment" name="frmPg" action="/pg/paymentoptions.aspx" method="post">
        <input type="hidden" value="" id="OrderId" name="OrderId" />
          <input type="hidden" value="" id="forcancelnotice" name="forcancelnotice" />
    </form>

    <!-- Modal -->
    <div class="modal fade" id="mdCoTenantValidation" tabindex="-1" role="dialog" aria-labelledby="mdCoTenantValidation" aria-hidden="true">
        <div class="container">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="CoTenantValidationTitle">Co-Tenant</h5>
                    </div>
                    <div class="modal-body">
                        <div class="scrollOvereff">
                            <div class="customizepopup">
                                <div class="ValidationMessage">
                                    <i class="fa fa-exclamation-triangle"></i>
                                    <h5 class="CoTenantValidationMessage" id="CoTenantValidationMessage"></h5>
                                </div>
                                <div class="cotenantcard green">
                                    <div class="general">
                                        <h1 id="CoTenantDetails_Name">Jane Doe</h1>
                                        <div class="more-info">
                                            <div class="stats">
                                                <div class="details">
                                                    <i class="fa fa-envelope"></i>
                                                    <div class="title" id="CoTenantDetails_Email"></div>

                                                </div>
                                                <div class="details">
                                                    <i class="fa fa-mobile"></i>
                                                    <div class="title" id="CoTenantDetails_Mobile"></div>
                                                </div>
                                                <div class="details">
                                                    <i class="fa fa-id-card-o"></i>
                                                    <div class="title" id="CoTenantDetails_KYC"></div>
                                                    <img src="/assets/images/alert.svg" id="imgKYCStatus" />
                                                </div>
                                                <div class="details">
                                                    <i class="fa fa-building"></i>
                                                    <div class="title" id="CoTenantDetails_Bookings"></div>
                                                    <img src="/assets/images/tick.svg" id="imgBookingStatus" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="customizepopupbtn customizepopup">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-12">
                                    <button type="button" id="btnAddCoTenant" class="btn btn-primary" onclick="AddCoTenant();">Add CoTenant</button>
                                    <button type="button" id="btnCoTenantCancel" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- ./Footer -->
    <!-- Hidden Fields -->
    <input type="hidden" id="hdnBookingIdchk" runat="server" clientidmode="static" value="0" />
    <input type="hidden" id="hdnCouponID" runat="server" clientidmode="static" value="0" />
    <input type="hidden" id="checkoutTimeId" runat="server" clientidmode="static" value="0" />
    <input type="hidden" id="hdnPropertyID" runat="server" clientidmode="static" value="0" />
    <input type="hidden" id="hdnCheckinDate" runat="server" clientidmode="static" value="0" />
    <input type="hidden" id="hdnCheckinTime" runat="server" clientidmode="static" value="0" />
    <input type="hidden" id="hdnCheckInTimeId" runat="server" clientidmode="static" value="0" />
    <input type="hidden" id="hdnRoomId" runat="server" clientidmode="static" value="0" />
    <input type="hidden" id="hdnBookingType" runat="server" clientidmode="static" value="0" />
    <input type="hidden" id="hdnSourceTypeId" runat="server" clientidmode="static" value="4" />
    <%--Website SmartLock--%>
    <input type="hidden" id="hdnBookingId" runat="server" clientidmode="static" value="0" />
    <input type="hidden" id="hdnCancelNotice" runat="server" clientidmode="static" value="0" />
    <input type="hidden" id="hdnSRBookinstatusId" runat="server" clientidmode="static" value="0" />
    <input type="hidden" id="hdnTransferReqId" runat="server" clientidmode="static" value="0" />
	<input type="hidden" id="hdnPayableOptionTypeId" runat="server" clientidmode="static" value="" />
    <!-- ./Hidden Fields -->
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="/assets/js/jquery.validate.min.js"></script>
    <script src="/assets/js/custom.js"></script>
    <!-- jQuery first, then Popper, then Bootstrap JS., owl-carousel2 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>
    <script src="/assets/js/jquery.steps.js"></script>
    <script defer src="/assets/js/dcalendar.picker.js"></script>
    <script>
        $(document).ready(function () {
            var queryStringList = getQueryStringValues();
            RenderDashboard(queryStringList);
            //Website SmartLock
            ShowHideancSmartLock();

            localStorage.setItem("transferKey", "0");

            //CancelNotice By Shilpa
            $("#ancDuesAndPayment").click(function () {
                if ($(this).data('count') == "0") {
                    $(this).data('count', '1');
                    if ($(this).data('type') === "2") {
                        $('#nav-dues-tab').click();
                        $('#hdnCancelNotice').val('forcancelnotice');
                    }
                    BindCustomerPayementHistory();
                }
            });
            $("#ancServiceRequest").click(function () {
                if ($(this).data('count') == "0") {
                    $(this).data('count', '1');
                    GetServiceRequestHistory();
                }
            });

            $("#ancbooking").click(function () {
                if ($(this).data('count') == "0") {
                    $(this).data('count', '1');
                    BindCustomerBookingHistory();
                }
            });

            $("#ancReferral").click(function () {
                if ($(this).data('count') == "0") {
                    $(this).data('count', '1');
                    BindReferralDetails();
                }
            });

            //Website SmartLock
            $("#ancSmartLock").click(function () {
                BindSmartLockDetails();
            });

            $("#ancCoTenant").click(function () {
                if ($(this).data('count') == "0") {
                    $(this).data('count', '1');
                    GetCotenantDetails();
                }
            });

            if ($("#wizard-p-3").is(".current")) {
                alert("jj");
            }

            $("#btnMayBeLater").on('click', function () {
                $("#btnContinueCheckout").data("property", 0);
                $("#btnContinueCheckout").data("roomid", 0);
                $("#btnContinueCheckout").data("propertyid", 0);
                $("#btnContinueCheckout").data("bookingid", 0);
            });

            setTimeout(function () {
                $('#ancbooking').click();
            }, 1000);

            $('#dtMoveinDate').on('datechanged', function (e) {
                $('#slMoveInTime').find('option').remove().end();
                var input = {
                    date: $('#dtMoveinDate').val(),
                    PropertyID: $('#hdnPropertyID').val()
                };
                $.ajax({
                    url: '/api/MyAccount/GetMoveinTimeSlots',
                    type: 'post',
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(input),
                    success: function (data) {
                        var response = data;
                        var Status = response.Status,
                            Message = response.Message,
                            Data = response.Data;
                        if (Status === 'success') {
                            if (Data.length > 0) {
                                for (var i = 0; i < Data.length; i++) {
                                    $('#slMoveInTime').append($('<option>', {
                                        value: Data[i].TimeId,
                                        text: Data[i].TimeString
                                    }));
                                }
                                $("#txtCoupon").val('');
                                $('#hdnCouponID').val('0');
                                $("#txtCoupon").removeAttr('disabled');
                                $("#btnCheckinPromoApply").val("Apply");
                                GetcheckinDetails($('#hdnBookingIdchk').val(), $('#hdnCouponID').val(), $('#dtMoveinDate').val(), $('#hdnPayableOptionTypeId').val());
                            } else {
                                Toast("Sorry, Please Choose Another Day ! Our Sales Ninjas Too Need A Day Off.");
                                $('#dtMoveinDate').val('');
                            }
                        } else {
                            console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                        }
                    },
                    error: function (xhr) {
                        console.log('Request Status: ' + xhr.status + ' Status Text: ' + xhr.statusText + ' ' + xhr.responseText);
                    }
                });
            });

            $("#ReferralForm").validate({
                rules: {
                    name: "required",
                    mobilenumber: {
                        required: true,
                        number: true,
                        maxlength: 10,
                        minlength: 10
                    }
                },
                messages: {
                    name: 'Please enter the name',
                    mobilenumber: 'Please enter the mobile number',
                },
            });

            $("#wizard").steps({
                headerTag: "h2",
                bodyTag: "section",
                transitionEffect: "fade",
                enableAllSteps: true,
                transitionEffectSpeed: 500,
                labels: {
                    next: "Next",
                    previous: "Cancel"
                }
            });
            $('.wizard > .steps li a').click(function () {
                $(this).parent().addClass('checked');
                $(this).parent().prevAll().addClass('checked');
                $(this).parent().nextAll().removeClass('checked');
            });
            // Custome Jquery Step Button
            $('.forward').click(function () {
                $("#wizard").steps('next');
            });
            $('.backward').click(function () {
                $("#wizard").steps('previous');
            });

            $('.CotenantDetails input').focus(function () {
                $(this).parents('.CotenantDetails .form-group').addClass('focused');
            });

            $('.CotenantDetails input').blur(function () {
                var inputValue = $(this).val();
                if (inputValue == "") {
                    $(this).removeClass('filled');
                    $(this).parents('.CotenantDetails .form-group').removeClass('focused');
                } else {
                    $(this).addClass('filled');
                }
            })
        });
    </script>
</body>
</html>
