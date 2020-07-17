<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="property.aspx.cs" Inherits="Colive.Website.property" %>

<!doctype html>
<html lang="en">
<head runat="server" id="head1">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Security-Policy" content="script-src 'self' 'unsafe-inline' https://maps.googleapis.com/ https://code.jquery.com https://cdnjs.cloudflare.com/ajax/libs/popper.js/ https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/ https://cdnjs.cloudflare.com/ajax/libs/popper.js/ https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/ https://cdnjs.cloudflare.com/ajax/libs/popper.js/ https://www.googletagmanager.com/ https://salesiq.zoho.com/widget https://www.google-analytics.com/analytics.js https://www.googleadservices.com/pagead/conversion_async.js http://static.hotjar.com/ https://script.hotjar.com/ https://googleads.g.doubleclick.net/pagead/ https://connect.facebook.net/ http://www.googleadservices.com/">
    <title runat="server" id="propertyTitle"></title>
    <!-- favicon -->
    <link rel="icon" href="/assets/images/favicon.png">
    <!-- bootstrap -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <!-- font family -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- custom css -->
    <link rel="stylesheet" href="/assets/css/styles.css?d=20191119">
    <!-- custom calendar picker css -->
    <link rel="stylesheet" href="/assets/css/dcalendar.picker.css">
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- owl carousel -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
    <!-- checkbox plugin -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css">   
    <!--Animate CSS plugin-->
    <link href="/assets/css/animate.min.css" rel="stylesheet" />
	<!-- w3 CSS -->
    <link href="/assets/css/w3.css" rel="stylesheet" />
</head>
<body>
    <!-- site header include -->
    <div class="header include" id="site-header" data-include="header"></div>

    <!-- END of fixed call and chat buttons -->
    <section class="product-wrap">
        <div class="first-section">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-lg-8 col-md-8 " id="PropertySection">
                        <!-- offset-lg-2 offset-xs-0-->

                        <h4><span id="spnPropertyName"></span></h4>
                        <div class="product-carousel">
                            <div class="owl-carousel owl-theme owl-carousel-slider" id="PropertyImages">
                            </div>
                        </div>
                        <div class="info">
                            <div class="row">
                                <div class="col-md-7 col-12">
                                    <div class="location">
                                        <img src="/assets/images/product/location.svg" alt="">
                                        <p id="spnPropaddr"></p>
                                    </div>
                                </div>
                                <div class="col-md-5 col-12">
                                    <div class="rating-wrap">
                                        <div class="rating">
                                            <p>3.5/5</p>
                                            <p>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                            </p>
                                        </div>
                                        <div class="share">
                                            <button onclick="showModal($(this));" id="btnYoutube" data-frameurl=""><i class="fa fa-youtube-play" aria-hidden="true"></i></button>
                                            <button onclick="showModal($(this));" id="btnMatterPort" class="totaldegree" data-frameurl="test">
                                                <img src="/assets/images/mark-360-white-v2.png" class="img-fluid" /></button>
                                            <div class="googlePlus">
                                                <a href="" id="ancGoogleplus" target="_blank" title="Google Plus Code" style="display: -webkit-flex;">
                                                    <img src="/assets/images/pc-logo.svg">
                                                    <span id="spnGooglePlusCode"></span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <p class="detail-info" id="spnPropDesc"></p>
                                <h5>Location highlights</h5>
                                <div class="detail-info" id="spnHighlights"></div>
                            </div>
                        </div>
                        <div class="graphical-info" id="RoomDetails">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Sharing</th>
                                        <th scope="col">Room</th>
                                        <th scope="col">Features</th>
                                        <th scope="col">Rent</th>
                                    </tr>
                                </thead>
                                <tbody id="KeyDetails">
                                </tbody>
                            </table>
                        </div>
                        <div class="terms">
                            <div class="terms-points">
                                <h4>Terms</h4>
                                <div class="term-deposit">
                                    <div>
                                        <p>Deposit</p>
                                        <p id="spnDepositDuration"></p>
                                    </div>
                                    <div>
                                        <p>Notice period </p>
                                        <p id="spnNoticeDuration"></p>
                                    </div>
                                    <div>
                                        <p>Lock-in period</p>
                                        <p id="spnlockinDuration"></p>
                                    </div>
                                </div>
                            </div>
                            <div class="offers d-none">
                                <h4>Offers <span>2020 Offer</span></h4>
                                <div class="offers-block">
                                    <img src="/assets/images/product/discount.svg" alt="">
                                    <p>2 months deposit to be paid in 2 equal installments – first upon check-in & second with the following month rent</p>
                                </div>
                                <div class="offers-block">
                                    <img src="/assets/images/product/discount.svg" alt="">
                                    <p>2 months deposit to be paid in 2 equal installments – first upon check-in & second with the following month rent</p>
                                </div>
                            </div>
                            <div class="know-more">
                                <a id="knowMore_button" href="">Know more</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-12 col-lg-4">
                        <div class="booknow d-md-block d-lg-block d-none d-xs-none">
                            <div class="card tab-card" id="scheduled-card">
                                <ul class="nav nav-tabs " id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active show" id="one-tab" data-toggle="tab" href="#one" role="tab" aria-controls="One" aria-selected="true">Schedule a visit</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="two-tab" data-toggle="tab" href="#two" role="tab" aria-controls="Two" aria-selected="false">Book now</a>
                                    </li>
                                </ul>
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active p-3" id="one" role="tabpanel" aria-labelledby="one-tab">
                                        <div id="schedule-first" class="schedule-first">
                                            <section class="login-wrap" id="schedulevisit">
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="signup-box col-lg-12 col-12">
                                                            <form id="schedulevisitform" name="schedulevisitform">
                                                                <p id="spnSchUserName"></p>
                                                                <div class="form-group">
                                                                    <input type="text" class="form-control name" name="CustomerName" id="CustomerName" aria-describedby="nameHelp" placeholder="Your Name">
                                                                    <span class="focus-input100" data-symbol=""><i class="fa fa-user-o"></i></span>
                                                                </div>
                                                                <div class="form-group">
                                                                    <input type="tel" class="form-control" name="CustomerNumber" id="PhoneNumber" aria-describedby="nameHelp" placeholder="Your Phone number" maxlength="10">
                                                                    <span class="focus-input100" data-symbol=""><i class="fa fa-phone"></i></span>
                                                                </div>
                                                                <div class="form-group">
                                                                    <input type="email" class="form-control" name="CustomerEmailId" id="CustomerEmailId" aria-describedby="emailHelp" placeholder="Your Email">
                                                                    <span class="focus-input100" data-symbol=""><i class="fa fa-envelope-o"></i></span>
                                                                </div>
                                                                <div class="form-group pick-date">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 col-md-6 col-12">
                                                                            <input type="text" class="form-control" name="ScheduleDate" id="ScheduleDate" readonly="" onchange="ScheduleDatechanged();" aria-describedby="checkindate" placeholder="Choose a date">
                                                                            <span class="focus-input100 scheduleCalendar" data-symbol=""><i class="fa fa-calendar" aria-hidden="true"></i></span>
                                                                        </div>
                                                                        <div class="col-lg-6 col-md-6 col-12 scheduleTIminginSChe">
                                                                            <select class="form-control" id="slVisitSlots" name="slVisitSlots"></select>
                                                                            <span class="focus-input100" data-symbol=""><i class="fa fa-angle-down" aria-hidden="true"></i></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <button type="button" class="btn btn-primary mt-5" id="schedule-btn" onclick="Schedulevisit(2);">Schedule Visit</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </section>
                                        </div>
                                        <div id="ScheduleComplete" class="schedule-second">
                                            <div class="yay-scheduled">
                                                <div class="yay-schedule-content">
                                                    <img src="/assets/images/schedulethankimg.svg" alt="">
                                                    <p>Yay! Your visit is scheduled successfully!</p>
                                                    <p>Our team will be available to give you a grand tour of our property</p>
                                                    <p id="spnScheduleDetails" class="detail"></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade p-3" id="two" role="tabpanel" aria-labelledby="two-tab">
                                        <div class="book-first booking-new-schedule">
                                            <p class="card-text">Hey!</p>
                                            <p class="card-text text-indent">Upgrade your lifestyle with Colive, fully- managed rental homes, premium amenities and exciting common spaces. </p>
                                            <p class="card-text text-indent">With a vibrant community of young professionals, Colive promises to give you the best experience of living on your own. </p>
                                           <p class="card-text text-indent">A home with a Cinema room, Fitness room, Terrace Lounge, café and exciting events like Yoga, Zumba, barbecue evenings, live sports screening and more make the 
                                                most of your time without having to stepping out or spending more. </p>
                                           <p class="card-text text-indent">Experience the Colive way of life and be a part of our 15,000 strong Colive Community.</p>
                                            <a class="btn btn-primary confirm-btn mt-0" id="book-first">Book Now</a>
                                        </div>
                                        <div class="book-second">
                                            <form>
                                                <p>OTP Verification </p>
                                                <p>Please enter the OTP sent on the number provided</p>
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="login" aria-describedby="emailHelp" placeholder="98789879789">
                                                </div>
                                            </form>
                                            <a class="btn btn-primary confirm-btn" id="book-second">Book Now</a>
                                        </div>
                                        <div class="book-third">
                                            <form>
                                                <p>Hi Team,</p>
                                                <p>Please enter the OTP sent on the number provided</p>
                                                <div class="otp">
                                                    <input type="text" class="form-control otp-box" maxlength="5" placeholder="Enter your OTP">
                                                </div>
                                            </form>
                                            <a class="btn btn-primary confirm-btn" id="book-second">Book Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="testimonial property_rating" id="PropertyRatings">                            
                           
                            <div class="property_rating_align">
                                <div class="second circle">
                                  <strong></strong>
                                </div>
                                <div class="property_rating_details">
                                    <h4 class="property_rating_title">Property Rating</h4>
                                    <div class="property_Rating_image">
                                        <img src="/assets/images/fav.png" alt="property_rating_image" class="img-fluid"/>
                                        <img src="/assets/images/fav.png" alt="property_rating_image" class="img-fluid"/>
                                        <img src="/assets/images/fav.png" alt="property_rating_image" class="img-fluid"/>
                                        <img src="/assets/images/fav.png" alt="property_rating_image" class="img-fluid"/>
                                        <img src="/assets/images/fav.png" alt="property_rating_image" class="img-fluid"/>
                                    </div>
                                    <div class="property_rated">
                                        Rated By: <span id="spnReviewersCount" class="property_rated_value"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="testimonial" id="CustomerTestimonials">
                            <h4>Resident testimonials</h4>
                            <div class="testimonial-carousel">
                                <div class="owl-carousel owl-theme" id="product-testimonial">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="second-section">
            <div class="promises container">
                <h4>Colive promises</h4>
                <div class="promises-icons">
                    <div class="amenities_area row" id="colivepromises">
                    </div>
                    <div class="amenities_area row" id="offers">
                    </div>
                </div>
            </div>
        </div>


        <div class="bg-grey pt-5 pb-5" id="CharacterSection">
            <div class="promises container">
                <h4>Your Flatmates Likes</h4>
                <!-- /. compatibility include starts here -->
                <div class="include" data-include="compatibilityinclude"></div>
                <!-- /. compatibility include ends here -->
            </div>
        </div>

        <div class="second-section pt-5" id="NearByDetails">
            <div class="nearby container">
                <h4>What's near by</h4>
                <div class="row">
                    <div class="col-md-6 p-0">
                        <div class="mapouter">
                            <div class="gmap_canvas" id="googleMaplocation">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 p-0" style="border: 1px solid #eaf0fa; border-left: none;">
                        <ul class="nav nav-tabs" role="tablist" id="Nearbytablist">
                            <li class="nav-item">
                                <a class="nav-link active" href="#transit" role="tab" onclick="ShowNearbyCategory($('#bus_station'));" data-toggle="tab">Transit</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#essential" role="tab" onclick="ShowNearbyCategory($('#grocery_or_supermarket'));" data-toggle="tab">Essentials</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#tbrestaurant" role="tab" onclick="ShowNearbyCategory($('#restaurant'));" data-toggle="tab">Restaurants</a>
                            </li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade in active show" id="transit">
                                <div class="accordion" id="Transit">
                                    <button class="btn btn-primary btn-block btnlocType collapsed" id="bus_station" data-locationtypeid="1" onclick="NearByMapFunctions.plotmarkers(1)" type="button" data-toggle="collapse" data-target="#clBustops" aria-expanded="true" aria-controls="collapseOne">
                                        Bus-stop
                                    </button>
                                    <div id="clBustops" class="collapse PropNearbyDetails" data-parent="#Transit">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">Distance</th>
                                                </tr>
                                            </thead>
                                            <tbody id="locbus_station">
                                            </tbody>
                                        </table>
                                    </div>
                                    <button class="btn btn-primary btn-block btnlocType collapsed" id="airport" type="button" data-locationtypeid="2" onclick="NearByMapFunctions.plotmarkers(2)"  data-toggle="collapse" data-target="#clAirport" aria-expanded="true" aria-controls="collapseTwo">
                                        Airport
                                    </button>
                                    <div id="clAirport" class="collapse PropNearbyDetails" data-parent="#Transit">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">Distance</th>
                                                </tr>
                                            </thead>
                                            <tbody id="locairport">
                                            </tbody>
                                        </table>
                                    </div>
                                    <button class="btn btn-primary btn-block btnlocType collapsed" type="button" id="train_station" data-locationtypeid="3"   onclick="NearByMapFunctions.plotmarkers(3)"  data-toggle="collapse" data-target="#clRailwayStation" aria-expanded="true" aria-controls="collapseThree">
                                        Railway Station
                                    </button>
                                    <div id="clRailwayStation" class="collapse PropNearbyDetails" data-parent="#Transit">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">Distance</th>
                                                </tr>
                                            </thead>
                                            <tbody id="loctrain_station">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="essential">
                                <div class="accordion" id="accEssential">
                                    <button class="btn btn-primary btn-block btnlocType collapsed" id="grocery_or_supermarket"  type="button" data-locationtypeid="4"   onclick="NearByMapFunctions.plotmarkers(4)"  data-toggle="collapse" data-target="#clgrocery_or_supermarket" aria-expanded="true" aria-controls="collapsefour">
                                        Grocery Stores
                                    </button>
                                    <div id="clgrocery_or_supermarket" class="collapse PropNearbyDetails" data-parent="#accEssential">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">Distance</th>
                                                </tr>
                                            </thead>
                                            <tbody id="locgrocery_or_supermarket">
                                            </tbody>
                                        </table>
                                    </div>
                                    <button class="btn btn-primary btn-block btnlocType collapsed" id="pharmacy" type="button" data-locationtypeid="5"   onclick="NearByMapFunctions.plotmarkers(5)" data-toggle="collapse" data-target="#clpharmacy" aria-expanded="true" aria-controls="collapsefive">
                                        Pharmacy
                                    </button>
                                    <div id="clpharmacy" class="collapse PropNearbyDetails " data-parent="#accEssential">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">Distance</th>
                                                </tr>
                                            </thead>
                                            <tbody id="locpharmacy">
                                            </tbody>
                                        </table>
                                    </div>
                                    <button class="btn btn-primary btn-block btnlocType collapsed" type="button" id="hospital" data-locationtypeid="6"   data-toggle="collapse" onclick="NearByMapFunctions.plotmarkers(6)" data-target="#clhospital" aria-expanded="true" aria-controls="collapsesix">
                                        Hospital
                                    </button>
                                    <div id="clhospital" class="collapse PropNearbyDetails" data-parent="#accEssential">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">Distance</th>
                                                </tr>
                                            </thead>
                                            <tbody id="lochospital">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="tbrestaurant">
                                <div class="accordion" id="accRestaurant">
                                    <button class="btn btn-primary btn-block btnlocType collapsed" id="restaurant" type="button" data-toggle="collapse" data-locationtypeid="7"  onclick="NearByMapFunctions.plotmarkers(7)" data-target="#clrestaurant" aria-expanded="true" aria-controls="collapseseven">
                                        Restaurant
                                    </button>
                                    <div id="clrestaurant" class="collapse PropNearbyDetails" data-parent="#accRestaurant">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">Distance</th>
                                                </tr>
                                            </thead>
                                            <tbody id="locrestaurant">
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
        <div class="third-section pt-5" id="SimilarPropertiesContainer">
            <div class="container">
                <div class="row">
                    <h4>Similar Properties</h4>
                    <div class="owl-carousel owl-theme owl-carousel-cards" id="SimilarPropertiesCards">
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
                <button class="modal-close is-large" id="btnClose" aria-label="close">
                    <svg version="1.1" class="svgClose" id="closeLoc" style="transform: rotate(270deg);" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 31.49 31.49" xml:space="preserve">
                        <path d="M21.205,5.007c-0.429-0.444-1.143-0.444-1.587,0c-0.429,0.429-0.429,1.143,0,1.571l8.047,8.047H1.111C0.492,14.626,0,15.118,0,15.737c0,0.619,0.492,1.127,1.111,1.127h26.554l-8.047,8.032c-0.429,0.444-0.429,1.159,0,1.587	c0.444,0.444,1.159,0.444,1.587,0l9.952-9.952c0.444-0.429,0.444-1.143,0-1.571L21.205,5.007z"></path></svg>
                </button>
            </div>
        </div>
    </div>

    <input type="hidden" id="hdnSubLocation" value="" />
    <input type="hidden" id="hdnLatLong" value="" />
    <input type="hidden" id="hdnLocationLink" value="" />
    <input type="hidden" id="hdnLocationId" value="" />
    <input type="hidden" id="hdnLocationName" value="" />
    <input type="hidden" id="hdnNearByDetails" value="" />
      <div class="CssLoaderStyles" id="AjaxLoader" style="display: none;">
        <div class="CssLoaderAlign">
            <div class="Logo-loader"></div>
            <div class="logoloader"></div>
        </div>
    </div>

    <div class="PropertyModalWrapper">
        <div class="ModalContainer">
            <div class="PropertyIframeClose" onclick="$('.PropertyModalWrapper').slideUp();"><i class="fa fa-times" aria-hidden="true"></i></div>
            <iframe id="PropertyFrame" class="PropertyIframe" src=""></iframe>
        </div>
    </div>

    <!-- ./Footer -->
    <script defer src="/assets/js/custom.js?d=20191119"></script>
    <!--Googlemaps plugin-->
    <script src="https://maps.googleapis.com/maps/api/js?v=3&libraries=places&key=AIzaSyBl1Wwgdhv4XFl1nHNvCH-2QyD7ltJaueM"></script>
    <!-- jQuery first, then Popper, then Bootstrap JS., owl-carousel2 -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="/assets/js/jquery.validate.min.js"></script>
    <script src="/assets/js/dcalendar.picker.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="/assets/js/circle-progress.js"></script>
    <script>
        $(document).ready(function () {
            $('title').data('desc', 'factsheet');
            $('#knowMore_button').hide();
            var LoadedFlag = 0, CompatibilityLoaded = 0;
            var sublink = getQueryStringValues()["location"];
            sublink = sublink.replace(/%20/g, " ");
            GetPropertyDetailsById(sublink);
            setTimeout(function () {
                $('#hdnLocationLink').val(sublink);
                $('#ancBooknow,#book-first').attr('href', "/book?L=" + sublink);
            }, 1000);

            $(window).scroll(function () {
                var scrollPos = $(this).scrollTop();
                var CompotibilityPos = parseInt($('#CharacterSection').position().top) - 300;
                if (scrollPos > 800 && LoadedFlag === 0) {
                    LoadedFlag = 1
                    GetNearByDetailsByLocationID($('#hdnLocationId').val());
                    BindSimilarPropertyDetails($('#hdnSubLocation').val(), $('#hdnLatLong').val().split(',')[0], $('#hdnLatLong').val().split(',')[1]);
                }
                if (scrollPos > CompotibilityPos && CompatibilityLoaded === 0) {
                    CompatibilityLoaded = 1
                    BindCompatibilityDetails($('#hdnLocationId').val());
                }
            });
            setTimeout(function () { EquipScheduleVisitForm(); }, 800);
        });
    </script>
</body>
</html>

