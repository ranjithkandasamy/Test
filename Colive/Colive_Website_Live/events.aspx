<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="events.aspx.cs" Inherits="Colive.Website.evnets" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Security-Policy" content="script-src 'self' 'unsafe-inline' https://maps.googleapis.com/ https://code.jquery.com https://cdnjs.cloudflare.com/ajax/libs/popper.js/ https://cdnjs.cloudflare.com/ajax/libs/popper.js/ https://www.googletagmanager.com/ https://salesiq.zoho.com/widget https://www.google-analytics.com/analytics.js https://www.googleadservices.com/pagead/conversion_async.js http://static.hotjar.com/ https://script.hotjar.com/ https://googleads.g.doubleclick.net/pagead/ https://connect.facebook.net/ http://www.googleadservices.com/">    
    <title>Colive</title>
    <!-- favicon -->
    <link rel="icon" href="/images/favicon.png">
    <!-- bootstrap -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <!-- font family -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- custom css -->
    <link rel="stylesheet" href="/assets/css/styles.css?d=20190907">
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- checkbox plugin -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css">
</head>

<body>
    <!-- site header include -->

    <!-- site header include -->
    <div class="header include" id="site-header" data-include="header"></div>

    <!-- END of fixed call and chat buttons -->
    <section class="product-wrap" id="eventSecView">
        <div class="first-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 col-md-12 col-12" id="PropertySection">
                        <h4><span id="spnEventName">&nbsp;</span></h4>
                        <div class="product-carousel">
                            <div class="" id="EventImages">
                                <div class="">
                                    <img id="imgEvntImg" src="#" alt="" class="events-img eventbanner img-fluid">
                                </div>
                            </div>
                        </div>

                        <div class="info">
                            <div class="row">
                                <p class="detail-info" id="spnEventDesc"></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-12 col-12">
                        <div class="info mb-0 pb-0">
                            <div class="row">
                                <div class="col-12 Events">
                                    <div class="location">
                                        <i class="fa fa-building" aria-hidden="true"></i>
                                        <p id="spnPropertyName"></p>
                                    </div>
                                    <div class="location">
                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                        <p id="spnEventDate"></p>
                                    </div>
                                    <div class="location">
                                        <i class="fa fa-clock-o" aria-hidden="true"></i>
                                        <p id="spnEventTime"></p>
                                    </div>
                                    <div class="location">
                                        <img src="/assets/images/product/location.svg" alt="">
                                        <p id="spnEventVenue"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="testimonial">
                            <div class="testimonial-carousel">
                                <div id="dvEvent" style="height: 336px;">
                                </div>
                                <div class="MapControls">
                                    <input type="text" class="form-control texbox EventSearch" placeholder="Get Directions" id="txtEventSearch" aria-invalid="true" />
                                    <button type="button" onclick="GetDirections();" class="btnDirections" id="btnEventSearch">
                                        <img data-toggle="tooltip" data-placement="right" data-original-title="Directions" src="/assets/images/directions.png" /></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- /. Gallery Section -->
                    <div class="col-lg-12 col-md-12 col-12 GallerySec mt-1" id="EventGallery">
                        <div class="EventPropSec">
                            <div class="info p-0">
                                <h4>Event Gallery</h4>
                            </div>
                            <div class="masonry" id="Eventmasonry">
                            </div>
                        </div>
                    </div>

                    <!-- /. Feedback Section -->
                    <div class="col-lg-12 col-md-12 col-12 feedback mt-4" id="EventFeedback">
                        <div class="FeedBack_Control bg-white">
                            <div class="row" id="CommentCards">
                                <div class="col-lg-6 col-md-12 col-12 MarginTB">
                                    <div class="feedback_sec">
                                        <div class="FeedBack_img">
                                            <img src="/assets/images/testimonials/PRADEEBPATRA.jpg" class="rounded-circle" alt="">
                                            <div class="FeedBack_OwnerDetails">
                                                <p class="Opacity_Content">Grace Garey</p>
                                                <p class="Designation_OwnerFeedback">Co-founder of Watsi</p>
                                            </div>
                                        </div>
                                        <div class="FeedBack_Comments">
                                            <p class="CommentOfFeedback">“Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.”</p>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12 col-12 MarginTB">
                                    <div class="feedback_sec">
                                        <div class="FeedBack_img">
                                            <img src="/assets/images/testimonials/PRADEEBPATRA.jpg" class="rounded-circle" alt="">
                                            <div class="FeedBack_OwnerDetails">
                                                <p class="Opacity_Content">Grace Garey</p>
                                                <p class="Designation_OwnerFeedback">Co-founder of Watsi</p>
                                            </div>
                                        </div>
                                        <div class="FeedBack_Comments">
                                            <p class="CommentOfFeedback">“Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.”</p>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12 col-12 MarginTB">
                                    <div class="feedback_sec">
                                        <div class="FeedBack_img">
                                            <img src="/assets/images/testimonials/PRADEEBPATRA.jpg" class="rounded-circle" alt="">
                                            <div class="FeedBack_OwnerDetails">
                                                <p class="Opacity_Content">Grace Garey</p>
                                                <p class="Designation_OwnerFeedback">Co-founder of Watsi</p>
                                            </div>
                                        </div>
                                        <div class="FeedBack_Comments">
                                            <p class="CommentOfFeedback">“Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.”</p>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12 col-12 MarginTB">
                                    <div class="feedback_sec">
                                        <div class="FeedBack_img">
                                            <img src="/assets/images/testimonials/PRADEEBPATRA.jpg" class="rounded-circle" alt="">
                                            <div class="FeedBack_OwnerDetails">
                                                <p class="Opacity_Content">Grace Garey</p>
                                                <p class="Designation_OwnerFeedback">Co-founder of Watsi</p>
                                            </div>
                                        </div>
                                        <div class="FeedBack_Comments">
                                            <p class="CommentOfFeedback">“Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.”</p>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12 col-12 MarginTB">
                                    <div class="feedback_sec">
                                        <div class="FeedBack_img">
                                            <img src="/assets/images/testimonials/PRADEEBPATRA.jpg" class="rounded-circle" alt="">
                                            <div class="FeedBack_OwnerDetails">
                                                <p class="Opacity_Content">Grace Garey</p>
                                                <p class="Designation_OwnerFeedback">Co-founder of Watsi</p>
                                            </div>
                                        </div>
                                        <div class="FeedBack_Comments">
                                            <p class="CommentOfFeedback">“Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.”</p>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12 col-12 MarginTB">
                                    <div class="feedback_sec">
                                        <div class="FeedBack_img">
                                            <img src="/assets/images/testimonials/PRADEEBPATRA.jpg" class="rounded-circle" alt="">
                                            <div class="FeedBack_OwnerDetails">
                                                <p class="Opacity_Content">Grace Garey</p>
                                                <p class="Designation_OwnerFeedback">Co-founder of Watsi</p>
                                            </div>
                                        </div>
                                        <div class="FeedBack_Comments">
                                            <p class="CommentOfFeedback">“Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.”</p>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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






    <div class="CssLoaderStyles" id="AjaxLoader" style="display: none;">
        <div class="CssLoaderAlign">
            <div class="Logo-loader"></div>
            <div class="logoloader"></div>
        </div>
    </div>

    <input type="hidden" id="hdnLatLng" value="0" />
    <input type="hidden" id="hdnNavUrl" value="" />
    <!-- ./Footer -->
    <script defer src="/assets/js/custom.js?d=20190909"></script>
    <!--Googlemaps plugin-->
    <script src="https://maps.googleapis.com/maps/api/js?v=3&libraries=places&key=AIzaSyBl1Wwgdhv4XFl1nHNvCH-2QyD7ltJaueM"></script>
    <!-- jQuery first, then Popper, then Bootstrap JS., owl-carousel2 -->  
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            var Arrlist = window.location.href.split('/');
            if (Arrlist.length > 5) {
                var EventCode = Arrlist[5];
                GetEvents(EventCode);
            }
        });
</body>

</html>
