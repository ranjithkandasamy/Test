<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="Colive.Website.achievements.view" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Security-Policy" content="script-src 'self' 'unsafe-inline' https://code.jquery.com https://cdnjs.cloudflare.com/ajax/libs/popper.js/ https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/">
    <title>Colive - Awards & Recognition</title>
    <meta name="robots" content="noindex, nofollow" /> 
    <!-- favicon -->
    <link rel="icon" href="https://www.colive.in/favicon.png" type="image/png">
    <!-- bootstrap -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <!-- font family -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- custom css -->
    <link rel="stylesheet" href="/assets/css/styles.css">
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- owl carousel -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

</head>
<body id="achievements_Page" class="achivement_page_details">
    <!-- site header include -->
    <div class="header include" id="site-header" data-include="header"></div>
    <section class="achievement_header">
        <div class="container achievement_container">
            <div class="achievementBack_btn">
                <span><a class="achievementBtn" href="javascript:history.back();">Awards & Recognition</a></span><span class="SpaceBreacrumb"><i class="fa fa-chevron-right"></i></span><span id="achievementsbreadcrumb"></span>
            </div>
            <div class="row">
                <div class="col col-md-12 col-12">
                    <h1 class="achievements" id="achievementsheading"></h1>
                    <h3 class="achievementsSubHeading text-center" id="achievementsSubHeading"></h3>
                </div>
                <div class="col offset-lg-2 col-lg-8 col-sm-8 col-12">
                   <div class="owl-carousel owl-theme" id="achievementsImage_blog_contents">
                   
                    </div>
                </div>

                <div class=" col-md-12">
                    <div class="lorem-ipsum-dolor-si">
                        <p class="dolor-si" id="achievementDescription">People for diverse backgrounds, experiences & journeys peacefully co-exist, co-living and sharing common utilities </p>                        
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- site footer include -->
    <div class="footer include" id="site-footer" data-include="footer"></div>

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


    <!-- js included -->
    <script defer src="/assets/js/custom.js"></script>

    <!-- ./Footer -->
    <!-- jQuery first, then Popper, then Bootstrap JS., owl-carousel2 -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script>
        $(document).ready(function () {
            var Arrlist = window.location.href.split('/');
            if (Arrlist.length > 4) {
                var AchievementId = Arrlist[4];
                BindAchievementImagesForAchievementId(AchievementId);
            }
            SourceTypeId = parseInt(getQueryStringValues()["source"]);
            if (SourceTypeId == 2 || SourceTypeId == 3) {
                $('.achivement_page_details .achievement_container').css('padding-top', '0px');
            }
        });
    </script>
</body>

</html>
