<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="propertyalbum.aspx.cs" Inherits="Colive.Website.propertyalbum" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title data-desc="reservation">Colive</title>
    <!-- favicon -->
    <link rel="icon" href="/assets/images/favicon.png" />
    <!-- font family -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css" />
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.css' />
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick-theme.min.css' />
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style>
        html, body {
            margin: 0;
            padding: 0;
            font-family: "Montserrat", sans-serif;
            font-size: 14px;
            font-weight: normal;
        }

        .action {
            display: block;
            margin: 100px auto;
            width: 100%;
            text-align: center;
        }

            .action a {
                display: inline-block;
                padding: 5px 10px;
                background: #f30;
                color: #fff;
                text-decoration: none;
            }

                .action a:hover {
                    background: #000;
                }

        .albumslide {
            position: relative;
            height: 100vh;
        }

        .slick-prev {
            position: absolute;
            z-index: 999;
            left: 0;
        }

        .slick-next {
            right: 0;
            position: absolute;
        }

        .Slick_slider img {
            width: 100%;
            height: 100vh;
        }

        .FullSizeAlbum {
            margin-bottom: 0px;
        }

        .slick-next:before, .slick-prev:before {
            font-size: 50px;
            line-height: 1;
            opacity: .75;
            color: #fff;
        }

        .slick-next, .slick-prev {
            width: 50px;
            height: 50px;
        }

        .AlbumPropertyDetails {
            position: absolute;
            top: 0;
        }

        .AlbumPropOverlay {
            background: #04040452;
            margin: 15px 0px 0px 15px;
            padding: 15px;
            line-height: 1.5;
            color: #fff;
        }

        .AlbumPropName {
            font-size: 16px;
            font-weight: 500;
            margin-bottom: 6px;
            display: flex;
            align-items: center;            
        }

            .AlbumPropName > div {
                width: 75px;
            }

        .WebDetails a {
            color: #fff;
            font-weight: 600;
            padding-left: 5px;
            cursor: pointer;
        }

        .AlbumPropAddress:before {
            content: "\f041";
            display: inline-block;
            font: normal normal normal 14px/1 FontAwesome;
            font-size: inherit;
            text-rendering: auto;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            font-size: 18px;
            padding-right: 6px;
            color: #ef0075;
        }

        .WebDetails:before {
            content: "\f08e";
            display: inline-block;
            font: normal normal normal 14px/1 FontAwesome;
            font-size: inherit;
            text-rendering: auto;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            padding-right: 6px;
        }

        .AlbumPropName a.ViewMore-Toggle {
            color: #fff;
            padding-left: 10px;
            font-size: 12px;
            font-weight: 300;
            outline: none;
            width: 15px;
        }

            .AlbumPropName a.ViewMore-Toggle:hover {
                text-decoration: underline;
            }

        .WebDetails {
            margin-top: 10px;
            border-top: 1px solid #ffffffb8;
            padding-top: 10px;
        }

        @media (max-width: 767px) {
            .AlbumPropertyDetails {
                width: 100%;
            }

            .AlbumPropOverlay {
                margin: 0px 0px 0px 0px;
            }

            .DivStaticVal {
                width: 100%;
                height: 100vh;
                display: flex;
                justify-content: center;
            }

            .Slick_slider img {
                width: auto;
                height: auto;
                max-width: fit-content !important;
            }
        }
    </style>
    <script>

        function getValueAtIndex(index) { var str = window.location.href.split("/"); if (index < str.length) { return str[index]; } else { return '' } }
        
    </script>
</head>
<body>
    <div class="container-fluid p-0">
        <div class="Album_Slider">
            <div class="albumslide">
                <div class="Slick_slider slider-for FullSizeAlbum" id="virtualRealityImage_blog_contents">
                    <!-- loop-1 -->                    
                </div>
            </div>
        </div>
    </div>

    <!--jQuery-->
    <script defer src="/assets/js/custom.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <!-- jQuery first, then Popper, then Bootstrap JS., owl-carousel2 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.js'></script>

    <script id="rendered-js">        
        $(document).ready(function () {
            var redirect = "/";
            var retVal = getValueAtIndex(6);
            if (retVal == '')
                window.location.href = redirect;
            else
                BindVirtualRealityImagesForProperty(retVal);           
        });


    </script>    
</body>
</html>
