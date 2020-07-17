<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="Colive.Website.search" %>

<!doctype html>
<html lang="en">

<head runat="server" id="head1">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Security-Policy" content="script-src 'self' 'unsafe-inline' https://code.jquery.com https://cdnjs.cloudflare.com/ajax/libs/popper.js/ https://maps.googleapis.com/ https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/ https://www.googletagmanager.com/  https://salesiq.zoho.com/widget https://js.zohostatic.com/ https://js.zohocdn.com/  https://www.google-analytics.com/analytics.js https://www.googleadservices.com/pagead/conversion_async.js http://static.hotjar.com/ https://script.hotjar.com/ https://googleads.g.doubleclick.net/pagead/ https://connect.facebook.net/ http://www.googleadservices.com/ https://colivebot.xyz:8020 https://colivebot.xyz/files/deploy/  https://salesiq.zoho.com/widget https://js.zohostatic.com/ https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/ https://dtzpfzv31buvf.cloudfront.net ">
    <title runat="server" id="searchTitle"></title>
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
    <!-- checkbox plugin -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css">
    <!-- Animation plugin -->
    <link href="/assets/css/animate.min.css" rel="stylesheet" />
</head>

<body style="background-color: #f4f8fb;" id="property_search">
    <!-- site header include -->
    <div class="header include" id="site-header" data-include="header"></div>

    <!-- END of fixed call and chat buttons -->
    <!-- start of grid-view 1st section -->
    <section class="grid-view">
        <div id="search-contain" class="container-fluid pad0">
            <div class="row m-0">
                <!-- Desktop view -->
                <div id="search-property-filter" class="property_leftview search-property-filter bg-white">
                    <div class="search-filter-inside col pad0 ">
                        <div class="search-fitler-property">
                            <div class="search-fitler-box">
                                <div class="search-fitler_title_sec">
                                    <h3 class="search-filter_title">Filters</h3>
                                </div>
                                <div class="properties-filter_section">
                                    <section class="multiproperties_filter_view">
                                        <!-- Mobile Filter -->
                                        <div class="mobile_search_filter">
                                            <div class="mobile_search">
                                                <!-- popularity -->
                                                <div class="mobile-sorting">
                                                    <!-- tabs -->
                                                    <div class="tabbable tabs-left">
                                                        <ul class="nav nav-tabs d-lg-none d-md-none d-block d-xs-block mobileFilterTitle">
                                                            <li class="filternav-active"><a href="#rent" class="active show" data-toggle="tab">Monthly Rent</a></li>
                                                            <li><a href="#sharingtype" data-toggle="tab">Sharing Type</a></li>
                                                            <li><a href="#city" data-toggle="tab">City</a></li>
                                                            <li><a href="#location" data-toggle="tab">Location</a></li>
                                                            <li><a href="#Amenities" data-toggle="tab">Amenities</a></li>
                                                            <li><a href="#Languages" data-toggle="tab">Languages</a></li>
                                                            <li><a href="#Hobbies" data-toggle="tab">Hobbies</a></li>
                                                            <li class="d-none"><a href="#habits" data-toggle="tab">Habits</a></li>
                                                            <li><a href="#Foodhabits" data-toggle="tab">Food Habits</a></li>
                                                        </ul>
                                                        <div class="tab-content search-filter-container" id="ulSearchFilters">
                                                            <ul id="SerFilBox">
                                                                <li style="position: relative;" class="d-lg-block d-md-block d-none d-xs-none">
                                                                    <input class="property-collapsible-search form-control" id="txtSearchFilter" placeholder="Search Filter">
                                                                    <span style="top: 7px; right: 20px;" class="colive-sprites filter-search-iconSearch sprites-search sprites-remove" id="ClosebtnFilter"></span>
                                                                </li>
                                                                <li class="MClearAll">
                                                                    <input type="button" name="spnClearAll" class="filterclear_anchor" onclick="ResetSearchFilter();" id="" value="Clear All" />
                                                                </li>
                                                            </ul>
                                                            <div class="tab-pane active" id="rent">
                                                                <div class="">
                                                                    <div class="header d-lg-block d-md-block d-none d-xs-none" data-toggle="collapse" data-target="#MRent">
                                                                        <label>Monthly Rent</label>
                                                                    </div>
                                                                    <ul id="MRent" class="collapse show">
                                                                        <li>
                                                                            <ul>
                                                                                <li>
                                                                                    <div class="custom-control form-control-lg custom-checkbox">
                                                                                        <input type="checkbox" name="chkPrice" checked class="custom-control-input" onchange="DisableCheckbox($(this));" value="0" data-value="0" id="chkPriceAny">
                                                                                        <label class="custom-control-label" for="chkPriceAny">Any</label>
                                                                                    </div>
                                                                                </li>
                                                                                <li>
                                                                                    <div class="custom-control form-control-lg custom-checkbox">
                                                                                        <input type="checkbox" name="chkPrice" class="custom-control-input" value="1" data-value="0,7000" onchange="DisableCheckbox($(this));" id="chkPriceLess">
                                                                                        <label class="custom-control-label" for="chkPriceLess">< ₹7,000</label>
                                                                                    </div>
                                                                                </li>
                                                                                <li>
                                                                                    <div class="custom-control form-control-lg custom-checkbox">
                                                                                        <input type="checkbox" name="chkPrice" class="custom-control-input" value="1" data-value="7000,9000" onchange="DisableCheckbox($(this));" id="chkPriceRangeLow">
                                                                                        <label class="custom-control-label" for="chkPriceRangeLow">₹7,000 to ₹9,000</label>
                                                                                    </div>
                                                                                </li>
                                                                                <li>
                                                                                    <div class="custom-control form-control-lg custom-checkbox">
                                                                                        <input type="checkbox" name="chkPrice" class="custom-control-input" value="1" data-value="9000,11000" onchange="DisableCheckbox($(this));" id="chkPriceRangeHigh">
                                                                                        <label class="custom-control-label" for="chkPriceRangeHigh">₹9,000 to ₹11,000</label>
                                                                                    </div>
                                                                                </li>
                                                                                <li>
                                                                                    <div class="custom-control form-control-lg custom-checkbox">
                                                                                        <input type="checkbox" name="chkPrice" class="custom-control-input" value="1" data-value="" onchange="DisableCheckbox($(this));" id="chkPriceGreater">
                                                                                        <label class="custom-control-label" for="chkPriceGreater">> ₹11,000</label>
                                                                                    </div>
                                                                                </li>
                                                                            </ul>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                            <div class="tab-pane" id="sharingtype">
		                                                        <div class="header d-lg-block d-md-block d-none d-xs-none" data-toggle="collapse" data-target="#RoomTypebutton" aria-controls="RoomTypebutton">
		                                                            <label>Sharing Type</label>
		                                                        </div>
                                                                <ul id="RoomTypebutton" class="collapse show">
		                                                            <li>
			                                                            <ul id="divRoomType" class="ul-height-limit">
																		 <li>
                                                                                <div class="custom-control form-control-lg custom-checkbox">
                                                                                    <input type="checkbox" class="custom-control-input" id="roomtype_0" onchange="DisableCheckbox($(this));" name="Room_Type" value="0" checked="">
                                                                                    <label class="custom-control-label" for="roomtype_0">Any</label>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div class="custom-control form-control-lg custom-checkbox">
                                                                                    <input type="checkbox" class="custom-control-input" id="roomtype_11" onchange="DisableCheckbox($(this));" name="Room_Type" value="11">
                                                                                    <label class="custom-control-label" for="roomtype_11">Couple</label>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div class="custom-control form-control-lg custom-checkbox">
                                                                                    <input type="checkbox" class="custom-control-input" id="roomtype_1" onchange="DisableCheckbox($(this));" name="Room_Type" value="1">
                                                                                    <label class="custom-control-label" for="roomtype_1">Single</label>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div class="custom-control form-control-lg custom-checkbox">
                                                                                    <input type="checkbox" class="custom-control-input" id="roomtype_2" onchange="DisableCheckbox($(this));" name="Room_Type" value="2">
                                                                                    <label class="custom-control-label" for="roomtype_2">Double</label>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div class="custom-control form-control-lg custom-checkbox">
                                                                                    <input type="checkbox" class="custom-control-input" id="roomtype_3" onchange="DisableCheckbox($(this));" name="Room_Type" value="3,4,8,9">
                                                                                    <label class="custom-control-label" for="roomtype_3">Triple +</label>
                                                                                </div>
                                                                            </li>
																		</ul>
		                                                            </li>
		                                                            <li></li>
	                                                            </ul>
                                                            </div>
                                                            <div class="tab-pane" id="city">
                                                                <div class="header d-lg-block d-md-block d-none d-xs-none" data-toggle="collapse" data-target="#CityListview">
                                                                    <label>City</label>
                                                                </div>
                                                                <ul id="CityListview" class="collapse show">
                                                                    <li>
                                                                        <ul id="ulCityList" class="ul-height-limit "></ul>
                                                                    </li>
                                                                    <li></li>
                                                                </ul>
                                                            </div>
                                                            <div class="tab-pane" id="location">
                                                                <div class="brand-value">
                                                                    <div class="filter-search-filterSearchBox">
                                                                        <input type="text" class="filter-search-inputBox filter-search-hidden" id="txtSearchLoc" placeholder="Search for locations">
                                                                        <span class="colive-sprites filter-search-iconSearch sprites-search" id="CloseBtnLoc"></span>
                                                                    </div>
                                                                </div>
                                                                <div class="header d-lg-block d-md-block d-none d-xs-none" data-toggle="collapse" data-target="#LoctionDiv" aria-controls="LoctionDiv">
                                                                    <label>Locations</label>
                                                                </div>
                                                                <ul id="LoctionDiv" class="collapse show">
                                                                    <li>
                                                                        <ul id="ullocation" class="ul-height-limit active "></ul>
                                                                    </li>
                                                                    <li></li>
                                                                </ul>
                                                            </div>
                                                            <div class="tab-pane" id="Amenities">
                                                                <div class="brand-value">
                                                                    <div class="filter-search-filterSearchBox">
                                                                        <input type="text" class="filter-search-inputBox filter-search-hidden" id="txtSearchAmen" placeholder="Search for Amenities">
                                                                        <span class="colive-sprites filter-search-iconSearch sprites-search" id="CloseBtnAmen"></span>
                                                                    </div>
                                                                </div>
                                                                <%--Filterchanges By Shilpa--%>
                                                                <div class="header d-lg-block d-md-block d-none d-xs-none" data-toggle="collapse" data-target="#PropertyAmenities" aria-controls="PropertyAmenities">
                                                                    <label>Amenities</label>
                                                                </div>
                                                                <ul id="PropertyAmenities" class="collapse show">
                                                                    <li>
                                                                        <ul id="divAmenities" class="ul-height-limit"></ul>
                                                                    </li>
                                                                    <li></li>
                                                                </ul>
                                                            </div>
                                                            <div class="tab-pane" id="Languages">
                                                                <div class="brand-value">
                                                                    <div class="filter-search-filterSearchBox">
                                                                        <input type="text" class="filter-search-inputBox filter-search-hidden" id="txtSearchLanguages" placeholder="Search for Languages">
                                                                        <span class="colive-sprites filter-search-iconSearch sprites-search" id="CloseBtnLanguage"></span>
                                                                    </div>
                                                                </div>
                                                                <div class="header d-lg-block d-md-block d-none d-xs-none" data-toggle="collapse" data-target="#PropertyLanguage" aria-controls="PropertyLanguage">
                                                                    <label>Languages</label>
                                                                </div>
                                                                <ul id="PropertyLanguage" class="collapse show">
                                                                    <li>
                                                                        <ul id="divLanguages" class="ul-height-limit"></ul>
                                                                    </li>
                                                                    <li></li>
                                                                </ul>
                                                            </div>
                                                            <div class="tab-pane" id="Hobbies">
                                                                <div class="brand-value">
                                                                    <div class="filter-search-filterSearchBox">
                                                                        <input type="text" class="filter-search-inputBox filter-search-hidden" id="txtSearchHobbies" placeholder="Search for hobbies">
                                                                        <span class="colive-sprites filter-search-iconSearch sprites-search" id="CloseBtnHobbies"></span>
                                                                    </div>
                                                                </div>
                                                                <div class="header d-lg-block d-md-block d-none d-xs-none" data-toggle="collapse" data-target="#Propertyhobbies" aria-controls="Propertyhobbies">
                                                                    <label>Hobbies</label>
                                                                </div>
                                                                <ul id="Propertyhobbies" class="collapse show">
                                                                    <li>
                                                                        <ul id="divhobbies" class="ul-height-limit"></ul>
                                                                    </li>
                                                                    <li></li>
                                                                </ul>
                                                            </div>
                                                            <div class="tab-pane" id="Foodhabits">
                                                                <div class="header d-lg-block d-md-block d-none d-xs-none" data-toggle="collapse" data-target="#PropertyFoodhobbies" aria-controls="PropertyFoodhobbies">
                                                                    <label>Food Habits</label>
                                                                </div>
                                                                <ul id="PropertyFoodhobbies" class="collapse show">
                                                                    <li>
                                                                        <ul id="ulFoodhabits" class="ul-height-limit active"></ul>
                                                                    </li>
                                                                    <li></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- /tabs -->
                                                </div>
                                                <!-- product filter -->
                                                <div class="mobile-searchtab" id="mobilesearchfilter"></div>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Desktop View End -->
                <!-- filer-button -->
                <div class="mobileFilterbutton d-lg-none d-md-none d-xs-block">
                    <div class="MobileFilterSort">
                        <div class="MobileFilterSortfilter">
                            <button class="mobilefilter-button" value="" id="mobileSorting">
                                <svg width="24" height="24" viewBox="0 0 24 24" class="result-icon">
                                    <g fill="none" fill-rule="evenodd">
                                        <path d="M0 0h24v24H0z" opacity="0.05"></path>
                                        <path fill="#282C3F" d="M7.445 7.48V5.672L5.665 7.48h1.78zm1.09-4.42c.304.12.465.39.465.706v16.437a.784.784 0 01-.783.797.762.762 0 01-.772-.781V8.982H4.003a.832.832 0 01-.765-.204.759.759 0 01.002-1.105L7.652 3.23a.832.832 0 01.882-.17zm8.02 15.269l1.78-1.81h-1.78v1.81zm4.207-3.107a.76.76 0 01-.002 1.106l-4.412 4.442a.832.832 0 01-.882.17c-.305-.12-.466-.39-.466-.706V3.797c0-.432.332-.797.783-.797.45 0 .772.35.772.781v11.237h3.442a.833.833 0 01.765.204z"></path>
                                    </g></svg>Sort By</button>
                            <button class="mobilefilter-button" value="" id="mobileFitlerby">
                                <svg width="24" height="24" viewBox="0 0 24 24" class="result-icon">
                                    <g fill="none" fill-rule="evenodd">
                                        <path d="M0 0h24v24H0z" opacity="0.05"></path>
                                        <path fill="#282C3F" d="M3.749 7.508a.75.75 0 010-1.5h3.138a2.247 2.247 0 014.243 0h9.121a.75.75 0 010 1.5h-9.126a2.248 2.248 0 01-4.232 0H3.749zm13.373 9h3.129a.75.75 0 010 1.5h-3.135a2.247 2.247 0 01-4.231 0H3.749a.75.75 0 010-1.5h9.13a2.248 2.248 0 014.243 0z"></path>
                                    </g></svg>Filter</button>
                        </div>
                    </div>
                    <div class="mobile-filter-apply">
                        <div class="mobileFilterApplyFun">
                            <button class="mobilefilter-button" id="btnCloseFilter" onclick="ResetSearchFilter();">Close</button>
                            <button class="mobilefilter-button ApplyFilterbtn" onclick="ApplySearchFilter(0);">Apply</button>
                        </div>
                    </div>
                </div>
                <!-- Mobile Filter End -->
                <div class="property_rightview bg-white">
                    <div class="property-sorting-total">
                        <div class="property-sorting d-lg-block d-md-block">
                            <div class="properties-sort">
                                <div class="sort-sortBy">
                                    <div class="SortTitle">Sort by : &nbsp;<span id="currsort">Default</span><span class="sort-downArrow sprites-downArrow"><i class="fa fa-angle-down" aria-hidden="true"></i></span></div>
                                    <ul class="sort-list">
                                        <li class="active">
                                            <label class="sort-label priceDefault" data-order="3" onclick="PropertySorting($(this));">
                                                <input type="radio" value="price_desc"><?xml version="1.0" ?>
                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 344.329 344.329" width="14" height="14" style="enable-background: new 0 0 344.329 344.329;" xml:space="preserve">
                                                    <g>
                                                        <g>
                                                            <g>
                                                                <path d="M277.965,90h-50.8c-2.9-28-18-54-40.1-70h90.9c5.5,0,10-4.5,10-10s-4.5-10-10-10h-211.6c-5.5,0-10,4.5-10,10s4.5,10,10,10    h60.6c41.2,0,75.2,31,80.1,70h-140.7c-5.5,0-10,4.5-10,10s4.5,10,10,10h140.7c-5,40.5-39.4,70.9-80.1,71h-60.5    c-5.6,0.1-10.1,4.7-10,10.3c0,2.7,1.2,5.3,3.1,7.2l151.3,143.1c4,3.8,10.3,3.6,14.1-0.4c3.8-4.1,3.6-10.4-0.4-14.3L91.465,201    h35.4c52.2,0,95.3-40,100.3-91h50.8c5.5,0,10-4.5,10-10S283.465,90,277.965,90z" data-original="#000000" class="active-path" data-old_color="#000000" fill="#282C3F" />
                                                            </g>
                                                        </g>
                                                    </g>
                                                </svg>
                                                Default
                                            </label>
                                        </li>
                                        <li>
                                            <label class="sort-label highttolow" data-order="2" onclick="PropertySorting($(this));">
                                                <input type="radio" value="price_desc"><svg width="24" height="24" viewBox="0 0 24 24" class="SortModalIcon"><g fill="none" fill-rule="evenodd"><path d="M0 0h24v24H0z" opacity="0.05"></path>
                                                    <path d="M4 6.215h4.962v2.43H4.505L4.13 9.858h4.764a3.05 3.05 0 01-.827 1.539 2.99 2.99 0 01-2.022.895l-1.361-.003a.304.304 0 00-.214.519l6.717 6.779 1.697-.004-6.107-6.16a4.193 4.193 0 002.14-1.167 4.256 4.256 0 001.198-2.398h2.474l.376-1.215h-2.799v-2.43h3.496V5H4v1.215zm12.389 10.028h1.337l-1.337 1.354v-1.354zm-.818 3.309c.23.09.488.04.663-.127l3.312-3.326a.567.567 0 000-.828.627.627 0 00-.574-.152H16.39v-5.043a.571.571 0 00-.58-.585.587.587 0 00-.587.597v8.935c0 .237.12.439.35.529z" fill="#282C3F"></path>
                                                </g></svg>Price: High to Low
                                            </label>
                                        </li>
                                        <li>
                                            <label class="sort-label lowtohigh" data-order="1" onclick="PropertySorting($(this));">
                                                <input type="radio" value="price_asc"><svg width="24" height="24" viewBox="0 0 24 24" class="SortModalIcon"><g fill="none" fill-rule="evenodd"><path d="M0 0h24v24H0z" opacity="0.05"></path>
                                                    <path d="M4 6.136h4.637v2.272H4.472l-.351 1.135h4.45a2.855 2.855 0 01-.772 1.44c-.51.514-1.177.81-1.888.836H5.91l-1.272-.002c-.25-.001-.377.305-.2.484l6.276 6.338 1.586-.002-5.706-5.76a3.92 3.92 0 002-1.092 3.984 3.984 0 001.119-2.242h2.311l.352-1.135H9.76V6.136h3.267V5H4v1.136zm12.626.733l1.249 1.265h-1.25V6.869zm-1.09-1.333v8.35c0 .3.232.557.548.557a.534.534 0 00.542-.547V9.184h2.414a.586.586 0 00.537-.143.53.53 0 00-.001-.773L16.48 5.161a.585.585 0 00-.62-.12.508.508 0 00-.326.495z" fill="#282C3F"></path>
                                                </g></svg>Price: Low to High
                                            </label>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="filter-concept">
                            <div class="colive">
                                <p class="upgrade viewmapview">Upgrade at Colive in these <span class="spnPropCount"></span>properties</p>
                            </div>
                        </div>
                        <div class="form-inline my-2 my-lg-0">
                            <button id="btnToggle" onclick="ToggleView();" data-viewid="1" class="btn btn-outline-success my-2 my-sm-0 d-lg-block d-md-block d-none d-xs-none">Map view</button>
                            <button id="btnToggle1" onclick="ToggleView();" data-viewid="1" class="btn btn-outline-success my-2 my-sm-0 d-lg-none d-md-none d-xs-block"><i class="fa fa-map-marker" aria-hidden="true"></i></button>
                        </div>
                    </div>
                    <!--pt-5-->
                    <!-- Static content -->
                    <div class="static_content_fr_search">
                        <div class="container-fluid pad0 bg-white pb-3">
                            <div class="text_view pt-0">
                                <h1>Affordable Premium Rental Accommodation in <span class="TitleCity"></span></h1>
                                <p>Get a private, shared or studio room on rent at your budget. Fully- managed rooms with premium amenities and exciting common spaces. For boys, girls and live-in couples!</p>
                                <div class="basic_steps">
                                    <p>
                                        Book in 3 simple steps:
                                        <br class="d-none d-lg-none d-md-none d-block d-xs-block" />
                                        <span class="basic_step_view"><span class="basic_step_view_count">1</span>Select</span><i class="fa fa-chevron-right"></i><span class="basic_step_view"><span class="basic_step_view_count">2</span>Schedule</span><i class="fa fa-chevron-right"></i><span class="basic_step_view"><span class="basic_step_view_count">3</span>Check-in</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <section id="GridView" class="">
                        <!--pt-5-->
                        <div class="container sort-box d-none">
                            <div class="row">
                                <div class="col-md-12  align-items-center justify-content-between pt-5">
                                    <div class="sort-by-rate d-none">
                                        <h5 class="sortby">Sort By:</h5>
                                        <p class="rating">
                                            Rating
                                        </p>
                                        <i class="fa fa-angle-down"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="rightGridView_List">
                                    <div class="property_list_view_pad">
                                        <div class="row card-carousel white-background" id="PropListCards">
                                        </div>
                                    </div>
                                    <div class="property_list_view_pad">
                                        <div class="row card-carousel white-background" id="TrendingPropertiesCards">
                                        </div>
                                    </div>
                                    <div class="property_list_view_pad">
                                        <div class="row card-carousel white-background" id="SimilarPropListCards">
                                        </div>
                                    </div>
                                    <!-- Modal -->
                                    <div class="modal fade QuickviewModal" id="QuickviewModal" tabindex="-1" role="dialog" aria-labelledby="QuickviewModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-body">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span class="close" aria-hidden="true">&times;</span>
                                                    </button>
                                                    <div class="grid-popup-wrap">
                                                        <div class="col-md-8 mt-4">
                                                            <h4><span id="spnQviewPropertyName"></span></h4>
                                                            <div class="location" style="display: flex;">
                                                                <img src="/assets/images/product/location.svg" alt="">
                                                                <p class="head_title" id="spnQviewPropaddr"></p>
                                                            </div>
                                                        </div>

                                                        <div class="first-section">
                                                            <div class="container">
                                                                <div class="row">
                                                                    <div class="col-md-12">
                                                                        <div class="product-carousel">
                                                                            <div class="owl-carousel owl-theme owl-carousel-slider" id="QviewPropertyImages">
                                                                            </div>
                                                                        </div>
                                                                        <div class="info">
                                                                            <div class="row">
                                                                                <div class="col-md-12">
                                                                                    <div class="rating-wrap row">
                                                                                        <div class="rating col-lg-10 col-12">
                                                                                            <p>3.5/5</p>
                                                                                            <p>
                                                                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                                                            </p>
                                                                                        </div>

                                                                                        <div class="col-lg-2 col-12 textcenter d-none">
                                                                                            <i class="fa fa-share-alt" aria-hidden="true"></i>
                                                                                            <i class="fa fa-heart" aria-hidden="true"></i>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <p class="detail-info" id="spnQviewPropDesc">
                                                                                </p>
                                                                            </div>
                                                                        </div>
                                                                        <div class="graphical-info">
                                                                            <table class="table">
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th scope="col">Sharing type</th>
                                                                                        <th scope="col">Room type</th>
                                                                                        <th scope="col">Features</th>
                                                                                        <th scope="col">Rent</th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody id="QviewKeyDetails">
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                        <div class="terms">
                                                                            <div class="terms-points">
                                                                                <h4>Terms</h4>
                                                                                <div class="term-deposit">
                                                                                    <div>
                                                                                        <p>Deposit</p>
                                                                                        <p id="spnQviewDepositDuration"></p>
                                                                                    </div>
                                                                                    <div>
                                                                                        <p>Notice period </p>
                                                                                        <p id="spnQviewNoticeDuration"></p>
                                                                                    </div>
                                                                                    <div>
                                                                                        <p>Lock-in period</p>
                                                                                        <p id="spnQviewlockinDuration"></p>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="offers d-none">
                                                                                <h4>Offers <span>2020 Offer</span></h4>
                                                                                <div class="offers-block">
                                                                                    <img src="/assets/images/product/discount.svg" alt="">
                                                                                    <p>
                                                                                        2 months deposit to be paid in 2 equal installments – first upon check-in & second with the following month rent
                                                                                    </p>
                                                                                </div>
                                                                                <div class="offers-block">
                                                                                    <img src="/assets/images/product/discount.svg" alt="">
                                                                                    <p>
                                                                                        2 months deposit to be paid in 2 equal installments – first upon check-in & second with the following month rent
                                                                                    </p>
                                                                                </div>
                                                                            </div>
                                                                            <div class="know-more">
                                                                                <a id="knowMore_button" href="">Know more</a>
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
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="map-view py-0" id="MapView">
                        <div class="container-fluid bgc">
                            <div class="top-align">
                                <div class="row mapReverse">
                                    <div class="col-sm-12 col-md-4 col-12 mapview">
                                        <div class="d-none">
                                            <div class="col-md-12 d-flex align-items-center justify-content-between">
                                                <div class="display">
                                                    <h5 class="sortby">Sort By:</h5>
                                                    <p class="rating_align">Rating</p>
                                                    <i class="fa fa-angle-down"></i>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="PropMapCards"></div>
                                    </div>
                                    <div class="col-md-8 col-12 maplist">
                                        <div class="map-box">
                                            <div id="PropertySearchMap" class="googlemap">
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

        <div id="faqContect" runat="server"></div>


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
    <div class="CssLoaderStyles" id="AjaxLoader" style="display: none;">
        <div class="CssLoaderAlign">
            <div class="Logo-loader"></div>
            <div class="logoloader"></div>
        </div>
    </div>
    <input type="hidden" id="hdnFilterLoaded" value="0" />
    <input type="hidden" id="hdnMinValue" value="0" />
    <input type="hidden" id="hdnMaxValue" value="0" />
    <input type="hidden" id="hdnInitialMinValue" value="0" />
    <input type="hidden" id="hdnInitialMaxValue" value="0" />
    <input type="hidden" id="hdnQueryString" value="" />
    <!-- ./Footer -->
    <script defer src="/assets/js/custom.js"></script>
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places&key=AIzaSyBl1Wwgdhv4XFl1nHNvCH-2QyD7ltJaueM"></script>
    <!-- jQuery first, then Popper, then Bootstrap JS., owl-carousel2 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <!-- Property Search Filter -->

    <script src="/assets/js/listfier.js"></script>
    <script>
        $(document).ready(function () {
            $('title').data('desc', 'search');
            getPropertyDetailsForSearch();

            $(window).scroll(function () {
                if ($(window).scrollTop() >= 180) {
                    $('.maplist').addClass('fixed-header');
                }
                else {
                    $('.maplist').removeClass('fixed-header');
                }
            });
            // Filer SearchBar
            //$(window).scroll(function () {
            //    if ($(window).scrollTop() >= 50) {
            //        $('#SerFilBox').addClass('search-filter-header');
            //    }
            //    else {
            //        $('#SerFilBox').removeClass('search-filter-header');
            //    }
            //});

            $('#CloseBtnLoc,#CloseBtnAmen,#CloseBtnLanguage,#CloseBtnHobbies').click(function () {
                $(this).toggleClass("sprites-remove");
                $(this).prev().toggleClass("filter-search-visible").focus();
                $(this).parent().toggleClass("filter-search-expanded");
            });


            $('#mobileFitlerby').on('click', function () {
                $('#search-property-filter').removeClass('slideOutDown').addClass('slideInUp Slideanimated').show();
                $('.MobileFilterSort').hide();
                $('.mobile-filter-apply').show();
            });

            $('#mobileSorting').on('click', function () {
                $('.property-sorting').css('display', 'block');
                $('.sort-sortBy').addClass('slideInUp Slideanimated');
            });

            $('.ApplyFilterbtn,#btnCloseFilter').on('click', function () {
                $('#search-property-filter').removeClass('slideInUp').addClass('slideOutDown Slideanimated').hide();
                $('.MobileFilterSort').show();
                $('.mobile-filter-apply').hide();
            });


            $('#FilterPopUP').on('click', function () {
                $('.PopUp_Filter').removeClass('d-none').addClass('d-block');
            });

            $('.mobileFilterTitle').on('click', 'li', function () {
                $('.mobileFilterTitle li.filternav-active').removeClass('filternav-active');
                $(this).addClass('filternav-active');
            });

            $(".section-header").addClass("closed");

            $('.section-header').click(function () {
                let $this = $(this);
                let $others = $(".section-header").not($this);

                $others.addClass("closed").removeClass('active');;
                $others.siblings().slideUp();

                $this.toggleClass("closed active");
                $this.siblings().slideToggle();

                return false;
            });

        });
    </script>
    <asp:PlaceHolder runat="server" ID="JsonContent" />
</body>
</html>
