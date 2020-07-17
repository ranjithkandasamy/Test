<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="Colive.Website.feedback" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <meta http-equiv="Content-Security-Policy" content="script-src 'self' 'unsafe-inline' https://code.jquery.com https://cdnjs.cloudflare.com/ajax/libs/popper.js/" />
    <title></title>
    <!-- favicon -->
    <link rel="icon" href="https://www.colive.in/favicon.png" type="image/png" />
    <!-- bootstrap -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css" />
    <!-- font family -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
    <!-- custom css -->
    <link rel="stylesheet" href="/assets/css/styles.css?d=20191218" />
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <!--Animate CSS plugin-->
    <link href="/assets/css/animate.min.css" rel="stylesheet" />
    <style>
        html, body {
            font-family: 'Montserrat', sans-serif;
            font-size: 14px;
        }

        .rating {
            display: block;
            padding: 20px 0;
        }

            .rating i {
                font-size: 43px;
                color: #e3b428;
                cursor: pointer;
            }

        .feedback_page_title {
            font-size: 26px;
            text-align: center;
            margin-top: 15px;
            color: #ef0075;
            font-weight: 500;
        }

        .Feedback_msg hr {
            margin-top: 1rem;
            margin-bottom: 1rem;
            border: 0;
            border-top: 2px solid rgba(0,0,0,.1);
            width: 10%;
        }

        .msg-box {
            border-radius: 2px;
            text-align: -webkit-center;
            margin-top: 32px;
            background-color: #ffffff;
            border: 1px solid #f4f8fb;
            box-shadow: 0 2px 14px 0 rgba(0, 0, 0, 0.06)
        }

        h1.msg_title {
            font-size: 22px;
            padding: 22px 10px;
            color: #112950;
            font-weight: 500;
        }

        h5.msg_content {
            font-weight: 600;
            color: #ef0075;
            font-size: 28px;
        }

        .msg_rate.fa.fa-star {
            padding-bottom: 24px;
            padding-top: 15px;
            cursor: pointer;
        }

        .msg-box-img {
            width: 10%;
            margin: 4px 10px;
            cursor: pointer;
            padding: 5px;
        }

        .pad5 {
            padding: 16px;
        }

        h3.msg-info-txt {
            width: 100%;
            font-size: 22px;
            font-weight: 500;
            padding-bottom: 7px;
            color: #112950;
        }

        .mt20 {
            margin-top: 20px;
        }

        .m-auto {
            margin: 0 auto;
        }

        .text-say {
            width: 92%;
            border: 3px solid #eee;
            outline: 0px;
            font-size: 14px;
            color: #112950;
            font-weight: 500;
        }

        .say-something {
            text-align: -webkit-center;
            width: 100%;
            font-size: 13px;
            font-weight: 500;
            color: #112950;
        }

        .upload-sec .msg-info-txt img {
            width: 7%;
            margin-left: 16px;
        }

        .upload-sec .msg-info-txt {
            display: block;
        }

        .upload-sec .md-form {
            position: relative;
            margin-top: 2px;
            margin-bottom: 5px;
        }

        .upload-sec .file-field {
            position: relative;
        }

            .upload-sec .file-field span {
                cursor: pointer;
            }

            .upload-sec .file-field input[type=file] {
                position: absolute;
                top: 0;
                right: 0;
                left: 0;
                bottom: 0;
                width: 100%;
                margin: 0;
                padding: 0;
                cursor: pointer;
                opacity: 0;
            }

        .upload-sec .btn.btn-outline-white.waves-effect.btn-sm.float-left {
            border: 2px solid #ef0075;
            color: #ef0075;
            padding: 8px 5px;
            font-size: 15px;
            font-weight: 500;
            position: relative;
            cursor: pointer;
            display: contents;
        }

        .upload-sec i.fa.fa-cloud-upload {
            padding-left: 10px;
        }

        .submit_section {
            margin: 15px auto;
            text-align: center;
        }

        #btnSubmit {
            background: #ef0075;
            border: 0px;
            color: #fff;
            padding: 6px 30px;
            font-size: 18px;
            border-radius: 4px;
            font-weight: 500;
            cursor: pointer;
            background: #ef0075;
            height: 50px;
        }

        .msg_title_welcome {
            font-size: 22px;
            padding: 100px 10px 0px;
            color: #112950;
            font-weight: 500;
        }

        .msg-box-welcome {
            box-shadow: 0px 0px 2px #8c8b8b;
            border-radius: 4px;
            text-align: -webkit-center;
            margin-top: 32px;
            padding-bottom: 8px;
            min-height: 245px;
        }

        .msg-bottom-border {
            width: 10%;
        }

        .FeedbackWrapper {
            padding: 115px 0;
            background: #F4F8FB;
        }

        .spnTitle {
            display:none;
        }

        @media (max-width: 767px) {
            h1.msg_title {
                font-size: 18px;
                padding: 22px 10px;
                color: #112950;
                font-weight: 500;
            }

            .upload-sec .btn.btn-outline-white.waves-effect.btn-sm.float-left {
                margin: 0 77px;
                display: contents;
            }

            h3.msg-info-txt {
                font-size: 18px;
            }

            .msg-box-img {
                width: 19%;
            }

            .feedback_page_title {
                font-size: 19px;
            }
        }
    </style>
</head>
<body>

    <!-- site header include -->
    <div class="header include" id="site-header" data-include="header"></div>

    <!-- END of fixed call and chat buttons -->
    <div class="FeedbackWrapper">
        <div class="container">
            <div class="Feedback_msg">
                <div class="feedback_page_title spnTitle">Feedback Form</div>
                <hr class="spnTitle">
            </div>
        </div>
        <div class="container">
            <div class="col-lg-8 col-md-12 col-12 m-auto">
                <div class="msg-box animated" id="dvRating">
                    <h1 class="msg_title" id="FeedbackQuestion"></h1>
                    <h5 class="msg_content" id="RatingMsg"></h5>
                    <input id="rating" type="text" class="rating" value="5" onchange="RatingChanged();" />
                </div>
                <div class="msg-box mt20 animated" id="NegContainer">
                    <div class="row pad5">
                        <h3 class="msg-info-txt" id="NegativeQuestion"></h3>
                        <div class="col-lg-12 col-md-12 col-12 text-center" id="NegativeOptions">
                        </div>
                    </div>
                </div>
                <div class="msg-box mt20 animated" id="feedbackComment">
                    <div class="row pad5">
                        <h3 class="msg-info-txt" id="PositiveQuestion"></h3>
                        <div class="col-lg-12 col-md-12 col-12">
                            <form>
                                <textarea class="text-say" rows="4" id="txtComments"></textarea>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="msg-box mt20 upload-sec" id="feedbackimageUpload">
                    <div class="row pad5">
                        <h3 class="msg-info-txt">please Upload Photo (if any)<img src="/assets/images/feedback/upload.svg" class="img-fluid msg-box-icon" /></h3>
                        <div class="col-lg-12 col-md-12 col-12">
                            <form class="md-form" action="#">
                                <div class="file-field">
                                    <div class="btn btn-outline-white waves-effect btn-sm float-left">
                                        <span>Choose file<i class="fa fa-cloud-upload" aria-hidden="true"></i></span>
                                        <input type="file" />
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="msg-box-welcome msg-box animated" id="dvThankyou">
                    <h1 class="msg_title_welcome" id="Feedbackmsg">Your Feedback Has been Submitted already !</h1>
                    <hr class="msg-bottom-border" />
                </div>

                <div class="submit_section">
                    <button type="button" class="btn btn-primary col-lg-5" id="btnSubmit" onclick="SaveFeedbackForm();">Submit</button>
                </div>


            </div>
        </div>
    </div>

    <!-- site footer include -->
    <div class="footer include" id="site-footer" data-include="footer"></div>
    
    <div class="CssLoaderStyles" id="AjaxLoader" style="display: none;">
        <div class="CssLoaderAlign">
            <div class="Logo-loader"></div>
            <div class="logoloader"></div>
        </div>
    </div>
    <!-- model popup -->
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

    <input type="hidden" id="hdnRatingMaster" value="" />
    <input type="hidden" id="hdnTypeId" value="" />
    <input type="hidden" id="hdnFeedackForId" value="" />
    <input type="hidden" id="hdnSuccessMessage" value="" />
    <input type="hidden" id="hdnOrderId" value="" /> 
    <input type="hidden" id="hdnFoodPQuestion" value="" /> 
    <!-- js included -->
    <script defer src="/assets/js/custom.js?d=20191218"></script>
    <!-- ./Footer -->
    <!-- jQuery first, then Popper, then Bootstrap JS., owl-carousel2 -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/rating.js"></script>
    <script>
        $(document).ready(function () {
            var ArrRedirect = window.location.pathname;
            var Params = ArrRedirect.split("/");
            if (Params.length > 2) {
                switch (Params[2]) {
                    case 'schedulevisit':
                        $('title').html('Colive Feedback Form - Schedule Visit');
                        $('#hdnTypeId').val(1);
                        setTimeout(function () { GetFeedbackMasterDetails(); }, 500);
                        break;
                    case 'movein':
                        $('title').html('Colive Feedback Form - Move In');
                        $('#hdnTypeId').val(2);
                        setTimeout(function () { GetFeedbackMasterDetails(); }, 500);
                        break;
                    case 'checkout':
                        $('title').html('Colive Feedback Form - Checkout');
                        $('#hdnTypeId').val(3);
                        setTimeout(function () { GetFeedbackMasterDetails(); }, 500);
                        break;
                    case 'event':
                        $('title').html('Colive Feedback Form - Event');
                        $('#hdnTypeId').val(4);
                        setTimeout(function () { GetFeedbackMasterDetails(); }, 500);
                        break;
                    case 'food':
                        $('title').html('Colive Feedback Form - Foodgasm');
                        $('#hdnTypeId').val(5);
                        $('#hdnFeedackForId').val(Params[3]);
                        $('#hdnOrderId').val(Params[4]);  
                        console.log(Params[4]); 
                        setTimeout(function () { GetFeedbackMasterDetails(); }, 500);
                        break;
                };
                $('#hdnFeedackForId').val(Params[3]);
            }

            SourceTypeId = parseInt(getQueryStringValues()["source"]);
            if (SourceTypeId === 2 || SourceTypeId === 3) {
                setTimeout(function () {
                    $('.FeedbackWrapper').css('padding-top', '35px');
                    $('body').css('background', '#F4F8FB');
                }, 500);
            }
        });
    </script>
</body>
</html>
