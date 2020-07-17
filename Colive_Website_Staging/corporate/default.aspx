<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Colive.Website.corporate._default" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Security-Policy" content="script-src 'self' 'unsafe-inline' https://code.jquery.com https://cdnjs.cloudflare.com/ajax/libs/popper.js/ https://cdnjs.cloudflare.com/ajax/libs/popper.js/ https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/">
    <title>Corporate Living Program - Colive</title>
    <meta name="robots" content="noindex, nofollow" />
    <!-- favicon -->
    <link rel="icon" href="https://www.colive.in/favicon.png" type="image/png">
    <!-- bootstrap -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <!-- font family -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- custom css -->
    <link rel="stylesheet" href="/assets/css/styles.css?d=20191108">
    <!-- custom calendar picker css -->
    <link rel="stylesheet" href="/assets/css/dcalendar.picker.css">
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- checkbox plugin -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css">
</head>
<body>
    <!-- site header include -->
    <div class="header include" id="site-header" data-include="header"></div>

    <!-- END of fixed call and chat buttons -->
    <div class="corporate">
        <div class="corporate-banner">
            <div class="banner-content">
                <div class="container">
                    <div class="row">
                        <div class="col-12 col-md-8">
                            <div class="">
                                <h1 class="colive-corp">Colive For Corporates</h1>
                                <span class="colive-subtitle">Offer your employees an upgraded lifestyle</span>
                            </div>
                        </div>
                        <div class="col-12 col-md-4">
                            <div class="custom-rect">
                                <a class="corporateReg" id="bookTour" href="javascript:void(0);">Register</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="Sub-corporate">
        <div class="container sub-corporateWrapper" id="CorporateMainWrapper">
            <div class="row">
                <div class="col-12 col-md-12">
                    <h2 class="sub-corporate-content" id="CorporateHeadingOne">Platinum Corporate Program:</h2>
                    <div>
                        <p class="technology" id="CorporateDescOne">
                            The Colive Platinum Corporate Program is a unique opportunity for you to provide that sense of belonging and a great lifestyle upgrade to your employees. This thoughtfully personalized program is to not only make your employees feel at home but also provide them with amenities that are a cut above the rest. With this program, your employees can experience the co-living way of life with a vibrant community of amiable people who bond over interests and values.
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="benfits">
            <div class="container" id="CorporateBenefits">
                <div class="row">
                    <div class="col-12 col-md-6">
                        <div class="housing ">
                            <h3 class="sub-benfits" id="dvHeadingSecond">Benefits to the company</h3>
                        </div>
                        <div id="dvDescriptionsecond">
                        </div>
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="housing ">
                            <h3 class="sub-benfits" id="dvHeadingThird">Benefits to the employee</h3>
                        </div>
                        <div id="dvDescriptionthird">
                        </div>
                    </div>

                </div>
            </div>
            <div id="dvvalueclients" class="container partner-with-us-wrap">
                <h3 class="text-center">Our Valuable Clients</h3>
                <div class="row">
                    <div class="col-12 col-md-12 col-lg-12 partners-section">
                        <div class="partners-block-wrap">
                            <div class="partners-block">
                                <div class="row" id="dvPartnesImage">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container pb-4">
                <div class="col-md-6 offset-md-3 col-12 d-flex justify-content-center">
                    <a href="\contactus.html" class="btn btn-primary anclink">Contact us</a>
                </div>
            </div>
            <div class="cowork-wrap" id="CoporateEnquiry">
                <div class="enquiry-form">
                    <div class="container shadow">
                        <div class="row">
                            <div class="col-12 col-md-6">
                                <div class="tour">
                                    <h2 class="Book-a-tour">Colive Corporate Partnership form</h2>
                                    <div>
                                        <p class="fill">Offer your employees an upgraded lifestyle</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="team">
                                    <form id="CorporateForm">
                                        <div class="form-group">
                                            <label class="name" for="name">Company Name <span style="color: red">*</span></label>
                                            <input type="text" class="form-control" name="CompanyName" id="txtCompanyName" placeholder="Company Name" maxlength="230">
                                        </div>
                                        <div class="form-group">
                                            <label class="name" for="name">Envoy Name <span style="color: red">*</span></label>
                                            <input type="text" class="form-control" name="EnvoyName" id="txtEnvoyName" placeholder="Envoy Name" maxlength="45">
                                        </div>
                                        <div class="form-group">
                                            <label class="name" for="name">Designation <span style="color: red">*</span></label>
                                            <input type="text" class="form-control" name="Designation" id="txtDesignation" placeholder="Designation" maxlength="230">
                                        </div>
                                        <div class="form-group">
                                            <label class="name" for="name">Email <span style="color: red">*</span></label>
                                            <input type="text" class="form-control" name="CopEmailID" id="txtCopEmailID" placeholder="EmailID" maxlength="80">
                                        </div>
                                        <div class="form-group">
                                            <label class="name" for="name">Phone <span style="color: red">*</span></label>
                                            <input type="text" class="form-control" name="CopMobile" id="txtCopMobile" placeholder="Mobile" maxlength="10">
                                        </div>
                                        <div class="form-group" style="margin-bottom: 30px;">
                                            <label class="name" for="name">Company Address <span style="color: red">*</span></label>
                                            <textarea type="text" class="form-control" name="CompanyAddress" id="txtCompanyAddress" rows="5" style="height: 100px !important;"></textarea>
                                        </div>
                                        <div class="form-group" id="CorpDatetimeWrapper">
                                            <div class="row">
                                                <div class="col-12 col-md-12">
                                                    <label class="name" for="name" style="width: 100%;">Appointment Date &amp; Time<span style="color: red">*</span></label>
                                                    <div class="drop-down appointDate">
                                                        <input type="text" class="form-control" name="AppointmentDate" id="txtAppointmentDate" style="cursor: pointer;" placeholder="Appointment Date">
                                                    </div>
                                                    <div class="drop-down">
                                                        <i class="fa fa-angle-down" aria-hidden="true"></i>
                                                        <select class="form-control" name="corporateHR" id="ddlHour" placeholder="HH">
                                                            <option disabled selected value="HH">HH</option>
                                                            <option value="01">01</option>
                                                            <option value="02">02</option>
                                                            <option value="03">03</option>
                                                            <option value="04">04</option>
                                                            <option value="05">05</option>
                                                            <option value="06">06</option>
                                                            <option value="07">07</option>
                                                            <option value="08">08</option>
                                                            <option value="09">09</option>
                                                            <option value="10">10</option>
                                                            <option value="11">11</option>
                                                            <option value="12">12</option>
                                                        </select>
                                                    </div>
                                                    <div class="drop-down">
                                                        <i class="fa fa-angle-down" aria-hidden="true"></i>
                                                        <select class="form-control" name="corporateMin" id="ddlMinutes" placeholder="select">
                                                            <option disabled selected value="MM">MM</option>
                                                            <option value="00">00</option>
                                                            <option value="01">01</option>
                                                            <option value="02">02</option>
                                                            <option value="03">03</option>
                                                            <option value="04">04</option>
                                                            <option value="05">05</option>
                                                            <option value="06">06</option>
                                                            <option value="07">07</option>
                                                            <option value="08">08</option>
                                                            <option value="09">09</option>
                                                            <option value="10">10</option>
                                                            <option value="11">11</option>
                                                            <option value="12">12</option>
                                                            <option value="13">13</option>
                                                            <option value="14">14</option>
                                                            <option value="15">15</option>
                                                            <option value="16">16</option>
                                                            <option value="17">17</option>
                                                            <option value="18">18</option>
                                                            <option value="19">19</option>
                                                            <option value="20">20</option>
                                                            <option value="21">21</option>
                                                            <option value="22">22</option>
                                                            <option value="23">23</option>
                                                            <option value="24">24</option>
                                                            <option value="25">25</option>
                                                            <option value="26">26</option>
                                                            <option value="27">27</option>
                                                            <option value="28">28</option>
                                                            <option value="29">29</option>
                                                            <option value="30">30</option>
                                                            <option value="31">31</option>
                                                            <option value="32">32</option>
                                                            <option value="33">33</option>
                                                            <option value="34">34</option>
                                                            <option value="35">35</option>
                                                            <option value="36">36</option>
                                                            <option value="37">37</option>
                                                            <option value="38">38</option>
                                                            <option value="39">39</option>
                                                            <option value="40">40</option>
                                                            <option value="41">41</option>
                                                            <option value="42">42</option>
                                                            <option value="43">43</option>
                                                            <option value="44">44</option>
                                                            <option value="45">45</option>
                                                            <option value="46">46</option>
                                                            <option value="47">47</option>
                                                            <option value="48">48</option>
                                                            <option value="49">49</option>
                                                            <option value="50">50</option>
                                                            <option value="51">51</option>
                                                            <option value="52">52</option>
                                                            <option value="53">53</option>
                                                            <option value="54">54</option>
                                                            <option value="55">55</option>
                                                            <option value="56">56</option>
                                                            <option value="57">57</option>
                                                            <option value="58">58</option>
                                                            <option value="59">59</option>
                                                        </select>
                                                    </div>
                                                    <div class="drop-down">
                                                        <i class="fa fa-angle-down" aria-hidden="true"></i>
                                                        <select class="form-control" name="corporatemeridiem" id="ddlMeridiem" placeholder="select">
                                                            <option disabled selected value="AM/PM">AM/PM</option>
                                                            <option value="AM">AM</option>
                                                            <option value="PM">PM</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="submit_button">
                                        <button class="btn btn_submit" onclick="CorporateFormInsert();" id="btnCoworkForm">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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


    <div class="CssLoaderStyles" id="AjaxLoader" style="display: none;">
        <div class="CssLoaderAlign">
            <div class="Logo-loader"></div>
            <div class="logoloader"></div>
        </div>
    </div>


    <input type="hidden" id="hdnLeadSource" value="" />
    <!-- js included -->
    <script defer src="/assets/js/custom.js?d=20190801"></script>
    <!-- ./Footer -->
    <!-- jQuery first, then Popper, then Bootstrap JS., owl-carousel2 -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="/assets/js/jquery.validate.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="/assets/js/dcalendar.picker.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {

            $('#bookTour').click(function () { $('html, body').animate({ scrollTop: $('#CoporateEnquiry').offset().top - 100 }, 1000); $('#txtCompanyName').focus(); });
            EquipCorporateForm();
            GetCorporatePageContent();

            switch (window.location.pathname) {
                case "/corporate/offline":
                case "corporate/offline/":
                    $('#hdnLeadSource').val("Corporate_Offline Activity");
                    break;
                case "/corporate":
                case "/corporate/":
                    $('#hdnLeadSource').val("Corporate Lead");
                    break;
                default:
                    $('#hdnLeadSource').val("Corporate Lead");
                    break;
            }
        });
    </script>
</body>

</html>
