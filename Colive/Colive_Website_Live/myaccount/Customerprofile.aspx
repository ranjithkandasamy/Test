<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customerprofile.aspx.cs" Inherits="Colive.Website.KYC" %>

<!doctype html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Security-Policy" content="script-src 'self' 'unsafe-inline' https://code.jquery.com https://cdnjs.cloudflare.com/ajax/libs/popper.js/ https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/ https://cdnjs.cloudflare.com/ajax/libs/jquery.touchswipe/ https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js">
    <title>Colive</title>
    <!-- favicon -->
    <link rel="icon" href="images/favicon.png">
    <!-- bootstrap -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css" />
    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
    <!-- font family -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- custom dropdown css -->
    <link rel="stylesheet" href="/assets/css/jquery.dropdown.css">
    <!-- custom css -->
    <link rel="stylesheet" href="/assets/css/styles.css?d=20191111">
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- checkbox plugin -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css">
    <link rel="stylesheet" href="/assets/css/dcalendar.picker.css">
</head>
<body>

    <!-- site header include -->
    <div class="header include" id="site-header" data-include="header"></div>

    <!-- END of fixed call and chat buttons -->
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
                                            <div class="col-12">
                                                <div class="row sub-ro">
                                                    <div class="form-group">
                                                        <label class="name" for="firstname">Full Name <span style="color: red">*</span><span class="bankInfoSpan">&nbsp;(As Per PAN Records)</span></label>
                                                        <input class="form-control" id="txtFirstName" style="width: 495px;" name="firstname" placeholder="Name" type="text" maxlength="200">                                                        
                                                    </div>
                                                    <%--<div class="col-6 mid-box">
                                                        <div class="form-group">
                                                            <label class="name" for="firstname">Name <span style="color: red">*</span><span class="bankInfoSpan">&nbsp;(As Per PAN Records)</span></label>
                                                            <input class="form-control" id="txtFirstName" name="firstname" placeholder="First Name" type="text" maxlength="200">
                                                        </div>
                                                    </div>
                                                    <div class="col-6 mid-box2">
                                                        <div class="form-group">
                                                            <label class="name" for="lastname">Last Name</label>
                                                            <input type="text" class="form-control" name="lastname" id="txtLastName" placeholder="Last Name" maxlength="90">
                                                        </div>
                                                    </div>--%>
                                                </div>
                                            </div>
                                            <div class="form-group drop-down">
                                                <i class="fa fa-angle-down" aria-hidden="true"></i>
                                                <label class="name" for="name">Your Gender ? <span style="color: red">*</span></label>
                                                <select class="form-control" id="ddlGender" name="gender">
                                                    <option value="Male">Male</option>
                                                    <option value="Female">Female</option>
                                                </select>
                                            </div>

                                            <div class="form-group KYCDOB">
                                                <label class="name">Date of Birth  <span style="color: red">*</span></label>
                                                <input id="txtDob" name="profiledob" class="form-control" type="text" readonly="" placeholder="Select Date of Birth" style="cursor:pointer;" onchange="DisplayKycAge(this);">
                                                <span class="focus-input100 scheduleCalendar" data-symbol=""><i class="fa fa-calendar" aria-hidden="true"></i></span>
                                                <label id="lblKycAge" style="color:green;font-size:smaller" ></label>
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
                                            <div class="form-group">
                                                <label class="name" foremost="profile[bank_detail_attributes][cheque_leaf]">Upload Your Picture <span style="color: red">*</span></label>
                                                <label class="name" for="profile[bank_detail_attributes][cheque_leaf]">(Maximum file size 1.5MB)</label><br>
                                                <div class="uploader userprofilepicture" name="profilepic">
                                                    <p class="colive-fa-i drag">click here or drag here your images</p>
                                                    <img id="ProfileImg"  src="" onclick="$('#filePhoto').click();" />
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
                                                    <select class="form-control" id="ddlCity" name="city" style="display: none;" onchange="CityChanged();">
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
                                                <label class="name">PAN Card Holder Name<span style="color: red">*</span><span class="bankInfoSpan">&nbsp;(As Per PAN Records)</span></label>
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
                                                <label class="name">Account Holder's Name <span style="color: red">*</span><span class="bankInfoSpan">&nbsp;(As Per Bank Records)</span></label>
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
                                                    <input class="form-control radio-custom-label hdntxtcompany" id="txtOrganization"  type="text" name="organization" placeholder="Enter Name of your organization *" maxlength="45" />
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
                                            <div class="form-group" style="display:none">
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
                                                <input class="form-control" id="txtMedicalHistory" name="medicalhis" maxlength="450"  type="text">
                                            </div>
                                            <div class="form-group">
                                                <label class="name">Languages You Speak</label>
                                                <input class="form-control" id="txtLanguagesSpeak" name="language" maxlength="450" type="text">
                                            </div>
                                            <div class="form-group">
                                                <label class="name">Interests and Hobbies <span style="color: red">*</span></label>
                                                <input class="form-control" id="txtInterestsHobbies" name="hobbies" maxlength="450"  type="text">
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
                                                <label class="name">Own Vehicle <span style="color: red">*</span></label>
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
                                                <span class="spnWhatsApp" style="font-weight:bold">Get Updates on WhatsApp</span>
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
                                            <button id="btnOtherDetails" class="btn next back submit" onclick="SaveOtherDetails();">Save</button>
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
    <!-- js included -->
    <input type="hidden" id="hdnBookingId" />
    <input type="hidden" id="hdnRequestStatusId" runat="server" clientidmode="static" value="1" />
    <input type="hidden" id="hdnLink" runat="server" clientidmode="static" value="0" />
    <!-- js included -->
    <script defer src="/assets/js/custom.js?d=20190924"></script>
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
     <script src="/assets/js/jquery.validate.min.js"></script>
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
    <!-- jQuery first, then Popper, then Bootstrap JS., owl-carousel2 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <!-- custom dropdown JS -->
    <script src="/assets/js/jquery.dropdown.js?d=20190917"></script>
    <script defer src="/assets/js/dcalendar.picker.js"></script>
    <script>
        $(document).ready(function () {
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
<script>

</script>
