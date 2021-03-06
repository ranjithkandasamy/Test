﻿var Cities = ["Bengaluru", "Bangalore", "Chennai", "Vellore", "Coimbatore", "Hyderabad"];
var Windowidth = 0, WindowHeight = 0;
function replaceWhiteSpace(word) { return word.split(' ').join('-'); }
function replaceFslash(word) { return word.split('/').join(''); }
function scrollTop(easingtiming) { $('html,body').animate({ scrollTop: 0 }, easingtiming); }
function Toast(alertMessage) {
    $('#ToastMsg').html('');
    $('#ToastMsg').html(alertMessage);
    $('.toastwrap').fadeIn('slow');
    setTimeout(function () {
        $('.toastwrap').fadeOut('slow');
    }, 10000);
}



function IsValidMobile(stringmobile) {
    var MobileRgx = new RegExp('^[6-9][0-9]{9}$');
    if (MobileRgx.test(stringmobile)) {
        return true;
    } else {
        Toast("Enter a valid Mobile Number !");
        return false;
    }
}

const APICall = (url, data = {}, showPageLoader = false, method = 'POST') => {
    if (showPageLoader) { $('#AjaxLoader').fadeIn(500); }
    const promise = new Promise((resolve, reject) => {
        const xhr = new XMLHttpRequest();
        xhr.open(method, url);
        xhr.responseType = 'json';
        if (data) {
            xhr.setRequestHeader("Content-type", "application/json; charset=utf-8");
        }
        xhr.onload = () => {
            if (xhr.status >= 400) {
                reject(xhr.response);
            } else {
                resolve(xhr.response);
            }
        };
        xhr.onerror = () => {
            reject('Request Status: ' + xhr.status + ' Status Text: ' + xhr.statusText + ' ' + xhr.responseText);
        };
        xhr.send(JSON.stringify(data));
    });
    return promise;
};

$(window).scroll(function () {
    var scroll = $(window).scrollTop();
    if (scroll < 1) {
        $('#navbar').addClass('static');
    } else if (scroll > 1) {
        $('#navbar').removeClass('static');
    }
    if (scroll <= 10) {
        $('#navbar').removeClass("box-shadow");
    } else if (scroll > 10) {
        $('#navbar').addClass("box-shadow");
    }
});

$(document).ready(function () {
    Windowidth = window.innerWidth;
    WindowHeight = window.innerHeight;
    BindPropertiesOftheMonth();
    EquipSearchBar();
    BindHeaderLinks();
    setTimeout(function () { BindcustomerDetails(); }, 500);
    $('#hdnSearchToken').val('');
    $('[data-toggle="tooltip"]').tooltip();
    // loading HTML 
    var includes = $('.include');
    jQuery.each(includes, function () {
        var file = '/' + $(this).data('include') + '.html?d=' + (new Date().toISOString());
        $(this).load(file);
    });
    //header location modal popup
    $('#btnLocation,#MobLocbtn,#btnClose').click(function () {
        if ($('#video-modal').css('display') === 'block') {
            $('.svgDownArrow').removeClass('rotate');
            $('#video-modal').slideUp(300);
            $('#MobLocbtn').css({ 'color': '#000' });
        } else {
            $('.svgDownArrow').addClass('rotate');
            $('#video-modal').slideDown(300);
            ($(this)[0].id === 'MobLocbtn') ? $(this).css({ 'color': '#bd1261' }) : $('#MobLocbtn').css({ 'color': '#000' });
            if ($('#btnNavToggle').hasClass('collapsed') === false) {
                $('#btnNavToggle').click();
            }
        }
    });


    // Shoshkele disabled by ram on 20-08-2019
    //if (readCookie('Shoshkele') === 'undefined' || readCookie('Shoshkele') === null) {
    //    createCookie("Shoshkele", "Enabled", 300000);
    //    $('#Shoshkele').fadeIn();
    //}

    $('#btnShoshkeleClose').click(function () {
        $('#Shoshkele').fadeOut();
    });


    //Location based banner disabled by ram
    $('#homeBanner,#btnExploreStyle,#btnExploreSafety,#btnExploreService,#btnExploreSavings,#btnExploreSmart,#btnExploreSocial').click(function () {
        BannereRedirectByCity();
    });
   
});


function BindPropertiesOftheMonth() {
    APICall('api/Colive/GetPropertiesOfTheMonth', {}).then(result => {
        var response = result;
        var Status = response.Status,
            Message = response.Message,
            Data = response.Data;
        if (Status === "success") {
            $('#SingleBHK,#SingleRoom,#SharedRoom').html('');
            var SingleBHK = Data.SingleBHK,
                SingleRoom = Data.SingleRoom,
                SharedRoom = Data.SharedRoom;
            if (SingleBHK.length > 0) {
                $.each(SingleBHK, function (iteration, callbackValue) {
                    $('#SingleBHK').append(GetPropertyCard(callbackValue, 1));
                });

                if (SingleBHK.length < 2) {
                    $('#1bhk .card-carousel').addClass('aligncenter');
                }
            }

            if (SingleRoom.length > 0) {
                $.each(SingleRoom, function (iteration, callbackValue) {
                    $('#SingleRoom').append(GetPropertyCard(callbackValue, 1));
                });

                if (SingleRoom.length < 2) {
                    $('#single .card-carousel').addClass('aligncenter');
                }
            }

            if (SharedRoom.length > 0) {
                $.each(SharedRoom, function (iteration, callbackValue) {
                    $('#SharedRoom').append(GetPropertyCard(callbackValue, 1));
                });

                if (SharedRoom.length < 2) {
                    $('#shared .card-carousel').addClass('aligncenter');
                }
            }
            $(".property-img").on("error", function (e) {
                this.src = "/assets/images/marathalli.jpg";
            });
            $('#SingleBHK,#SingleRoom,#SharedRoom').owlCarousel({
                autoplay: true,
                loop: false,
                nav: 'true',
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 1
                    },
                    1000: {
                        items: 2
                    }
                }
            });
            $('[data-toggle="tooltip"]').tooltip();
        } else {
            console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
        }

    }).catch(ex => { console.log(ex); }).finally(() => { $('#AjaxLoader').fadeOut(500); });
}

// location menu API loader 
function BindHeaderLinks() {
    APICall('api/Colive/LoadHeaderLocationMenu').then(result => {
        var response = JSON.parse(result);
        var NewData = '';
        var Status = response.Status,
            Message = response.Message,
            Data = response.Data;
        if (Status === 'success') {
            var MenuList = Data;
            MenuList = MenuList.filter(function (object) { return object.IsMenuEnabled === true; });
            var CityList = MenuList.filter(function (object) { return object.MenuLevel === 1; });
            $.each(CityList, function (City_i, City_Val) {
                NewData += '<div class="CityContainer city-div" data-city="' + City_Val.Menu + '" data-bucket=US id="' + City_Val.Menu + '">';
                NewData += '<span class="CityLinks_anc title3"><a href="/' + City_Val.URL + '">' + City_Val.Menu + '</a></span>';
                var ClusterList = MenuList.filter(function (object) { return (object.MenuLevel === 2 && object.ParentMenuId === City_Val.MenuId); });
                $.each(ClusterList, function (SubLoc_i, SubLoc_Val) {
                    if (City_Val.MenuId === SubLoc_Val.ParentMenuId) {
                        NewData += '<div class="cityWrapper"><span class="CityLinks_anc title3">';
                        NewData += '<a class="City_Links_Pointer" href="/' + SubLoc_Val.URL + '">' + SubLoc_Val.Menu + '</a></span>';
                        NewData += '<ul class="undefined ulList_CityTemplate">';
                    }
                    var LocationList = MenuList.filter(function (object) { return (object.MenuLevel === 3 && object.ParentMenuId === SubLoc_Val.MenuId); });
                    $.each(LocationList, function (Area_i, Area_Val) {
                        if (SubLoc_Val.MenuId === Area_Val.ParentMenuId && City_Val.MenuId === SubLoc_Val.ParentMenuId) {
                            NewData += '<li class="CityLinks_anc"><a class="City_Links_Pointer" href="/' + Area_Val.URL + '">' + Area_Val.Menu + '</a></li>';
                        }
                    });
                    NewData += '</ul></div>';
                });
                NewData += '</div>';
            });
            NewData += '</div>';
            $('#CityList').html(NewData);
        }
    }).catch(ex => { console.log(ex); });
}

function BindcustomerDetails() {
    APICall('/api/MyAccount/GetLoginDetails', null).then(result => {
        var response = result;
        var Status = response.Status,
            Message = response.Message,
            Data = response.Data;
        if (Status === 'success') {
            var CustomerDetails = Data;
            $('#hdnCustomerId').val(CustomerDetails.CustomerID);
            $('#spnCustName').html(ReturnWithDotsBylength(CustomerDetails.CustomerName, 15)).attr('title', CustomerDetails.CustomerName);
            $('#custImg').attr('src', CustomerDetails.Photo);
            $('#libtnLogin').hide();
            $('#libtnCustom').show();
            $('#hdnBookingId').val(CustomerDetails.BookingId);
            $('#hdnBookingStatusId').val(CustomerDetails.BookingStatusId);
            $("#custImg").on("error", function (e) { this.src = "/assets/images/user.png"; });
            $('[data-toggle="tooltip"]').tooltip();
            switch (CustomerDetails.BookingStatusId) {
                case 1:
                    if (CustomerDetails.CustomerKeyReceivedStatus === 0) {
                        $('#CustomerControls').attr("href", "/dashboard?movein=" + CustomerDetails.BookingID);
                        $('#CustomerControls').html('Move-In');
                        if ($('title').data('desc') === "factsheet") {
                            $('#PropertyControls, #ancBooknow').css('display', 'block');
                            $('#CustomerControls').css('display', 'block');
                        } else {
                            $('#CustomerControls').css('display', 'block');
                            $('#PropertyControls, #ancBooknow').css('display', 'none');
                        }
                    } else {
                        $('#CustomerControls').attr("href", "/dashboard?opn=service");
                        $('#CustomerControls').html('Service Requests');
                        if ($('title').data('desc') === "factsheet") {
                            $('#PropertyControls, #ancBooknow').css('display', 'block');
                            $('#CustomerControls').css('display', 'block');
                        } else {
                            $('#CustomerControls').css('display', 'block');
                            $('#PropertyControls, #ancBooknow').css('display', 'none');
                        }
                    }
                    break;
                case 2:
                    $('#CustomerControls').attr("href", "/dashboard?rid=" + CustomerDetails.BookingID);
                    $('#CustomerControls').html('Check-In');
                    $('#CustomerControls').show();
                    if ($('title').data('desc') === "factsheet") {
                        $('#PropertyControls, #ancBooknow').css('display', 'block');
                        $('#CustomerControls').css('display', 'block');
                    } else {
                        $('#CustomerControls').css('display', 'block');
                        $('#PropertyControls, #ancBooknow').css('display', 'none');
                    }
                    break;
                default:
                    $('#CustomerControls').html("");
                    $('#CustomerControls').attr("href", "");
                    $('#CustomerControls').hide();
                    if ($('title').data('desc') === "factsheet") {
                        $('#PropertyControls, #ancBooknow').css('display', 'block');
                    } else {
                        $('#PropertyControls, #ancBooknow').css('display', 'none');
                    }
            }
            //WhatsApp Template By Shilpa
            if (!CustomerDetails.IsOptIn) {
                CheckCustomerWhatsAppOptIn(CustomerDetails.Mobile, '', 0);
            }
            if (CustomerDetails.IsStayingAlone === null) {
                $('#WhatsappYes').data('bookingid', CustomerDetails.BookingID);
                $('#whatsappnotnow').data('bookingid', CustomerDetails.BookingID);
                $('#cotenantselection').show();
            }    
        } else {
            $('#hdnCustomerId,#hdnBookingId,#hdnBookingStatusId').val(0);
            $('#spnCustName').html('');
            $('#custImg').attr('src', "/assets/images/user-image.jpeg");
            $('#libtnLogin').show();
            $('#libtnCustom').hide();
            $('#CustomerControls').hide();
            if ($('title').data('desc') === "factsheet") {
                $('#PropertyControls, #ancBooknow').css('display', 'block');
            } else {
                $('#PropertyControls, #ancBooknow').css('display', 'none');
            }
        }
    }).catch(ex => { console.log(ex); });
}

//WhatApp Template By Shilpa
function CheckCustomerWhatsAppOptIn(Mobile, RequestFrom, BookingID) {
    var input = {
        Mobile: Mobile,
        RequestFrom: RequestFrom,
        BookingID: BookingID
    };
    $('#WhatsappYes').data('bookingid', BookingID);
    $('#WhatsappYes').data('requestfrom', RequestFrom);
    $('#WhatsappYes').data('mobile', Mobile);

    APICall('/api/Colive/CheckCustomerWhatsAppOptIn', input).then(result => {
        var response = result;
        var Status = response.Status,
            Message = response.Message,
            Data = response.Data;
        if (Data.OptIn === false) {
            if (RequestFrom === 0) {
                $('#ChkOn').attr('disabled', false);
            }
            else {
                //$('#whatsappOptin').show();
                $('#spWhatsappNumber').text(Mobile);
            }
        }
        else {
            if (RequestFrom === 0) {
                $('#ChkOn').prop('checked', true);
            }
        }
    }).catch(ex => { console.log(ex); });
}

function WhatsappPopDisappear() {
    $('#whatsappOptin').hide();
}

function WhatsAppCustomerOptIn() {
    $('#whatsappOptin').css('display', 'none');
    var input = {
        Mobile: $('#WhatsappYes').data('mobile'),
        RequestFrom: $('#WhatsappYes').data('requestfrom'),
        BookingID: $('#WhatsappYes').data('bookingid'),
        OptInFlag: true
    };

    APICall('/api/Colive/WhatsAppCustomerOptIn', input).then(result => {
        var response = result;
    }).catch(ex => { console.log(ex); });
}

function WhatsAppCustomerOptOut() {
    var input = {
        Mobile: $('#WhatsappYes').data('mobile'),
        Mob2: $("#mobilenumber").val().trim()
    };

    APICall('/api/Colive/WhatsAppCustomerOptOut', input).then(result => {
        var response = result;
    }).catch(ex => { console.log(ex); });
}


function UserLogout() {
    APICall('/api/MyAccount/UserLogout', null).then(result => {
        var response = result;
        var Status = response.Status,
            Message = response.Message,
            Data = response.Data;
        if (Status === 'success') {
            BindcustomerDetails();
            window.location.href = '/';
        } else {
            console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
        }
    }).catch(ex => { console.log(ex); });
}

function ConverToRupees(nStr) {
    nStr += '';
    x = nStr.split('.');
    x1 = x[0];
    x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    var z = 0;
    var len = String(x1).length;
    var num = parseInt((len / 2) - 1);

    while (rgx.test(x1)) {
        if (z > 0) {
            x1 = x1.replace(rgx, '$1' + ',' + '$2');
        } else {
            x1 = x1.replace(rgx, '$1' + ',' + '$2');
            rgx = /(\d+)(\d{2})/;
        }
        z++;
        num--;
        if (num === 0) {
            break;
        }
    }
    return x1 + x2;
}

/* Create Cookies functions Start */
function createCookie(name, value, expiretime) {
    var expires;
    if (expiretime) {
        var date = new Date();
        date.setTime(date.getTime() + expiretime);
        expires = "; expires=" + date.toGMTString();
    } else {
        expires = "";
    }
    document.cookie = encodeURIComponent(name) + "=" + encodeURIComponent(value) + expires + "; path=/";
}

function readCookie(name) {
    var nameEQ = encodeURIComponent(name) + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) === ' ')
            c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) === 0)
            return decodeURIComponent(c.substring(nameEQ.length, c.length));
    }
    return null;
}

function eraseCookie(name) {
    createCookie(name, "", -1);
}
/* Create Cookies functions End */

function CloseWebruuner() {
    $('.websiterunner').slideUp();
    $('body').addClass('ModelvideoAlign');
    if ($('title').data('desc').toLowerCase() === 'search') {
        $('#breadscrumb').css('top', '85px');
        $('.maplist').css({
            'top': '142px',
            'height': '82vh'
        });
    }

}
function ReturnWithDotsBylength(value, slicelength) {
    var finalString = '';
    if (value.length > slicelength) {
        finalString = value.substr(0, slicelength);
        finalString += '....';
    } else {
        finalString = value;
    }
    return finalString;
}

function EquipGeoLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(SetPositions);
    }
}

function SetPositions(Position) {
    var CustCoordinates = {
        latitude: Position.coords.latitude,
        longitude: Position.coords.longitude
    };
    if (readCookie('Coordinates') === null) {
        createCookie('Coordinates', JSON.stringify(CustCoordinates), 86400000);
    } else if (CustCoordinates.latitude === JSON.parse(readCookie('Coordinates')).latitude && CustCoordinates.longitude === JSON.parse(readCookie('Coordinates')).longitude) {
        eraseCookie('Coordinates');
        setTimeout(function () { createCookie('Coordinates', JSON.stringify(CustCoordinates), 86400000); }, 300);
    }
}

function GetCoordinates() {
    EquipGeoLocation(SetPositions);
    return JSON.parse(readCookie('Coordinates'));
}


function BannereRedirectByCity() {
    var Coords = GetCoordinates();

    if (Coords === null) {
        $('#hdnCityID').val(2847);
    } else {
        var input = {
            latitude: Coords.latitude,
            longitude: Coords.longitude
        };

        APICall('/api/Colive/GetCityByCoordinates', input).then(result => {
            var response = result;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var Details = Data[0];
                $('#hdnCityID').val(Details.CityID);
                RedirectBanner();
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }).catch(ex => { console.log(ex); });
    }
}

function RedirectBanner() {
    var BannerLink;
    switch (parseInt($('#hdnCityID').val())) {
        case 2847:
            BannerLink = '/Bangalore';
            break;
        case 2343:
            BannerLink = '/Hyderabad';
            break;
        case 3793:
            BannerLink = '/Chennai';
            break;
        default:
            BannerLink = '/Bangalore';
    }
    window.location.href = BannerLink;
}

function EquipSearchBar() {
    $('#txtSearch').val('').focus();
    $('#hdnURL').val('');
    $('#txtSearch').on('focus', function () { $('#SuggestionsList li').length > 0 ? $('#SuggestionsList').slideDown('fast') : $('#SuggestionsList').slideUp('fast'); $('#txtSearch').val().length > 0 ? $('#SuggestionsList').slideDown('fast') : $('#SuggestionsList').slideUp('fast'); });
    $('#txtSearch').on('blur', function () { if ($('#SuggestionsList li:hover').length <= 0) { $('#SuggestionsList').slideUp('fast'); } });
    $('#SuggestionsList li').on('hover', function () { if ($('#txtSearch').is(':focus')) { $('#SuggestionsList').slideDown('fast'); } else { $('#SuggestionsList').slideUp('fast'); } });
    $('#SuggestionsList li').on('click', function () { if ($('#txtSearch').is(':focus')) { $('#SuggestionsList').slideDown('fast'); } else { $('#SuggestionsList').slideUp('fast'); } });
}

function GetSuggestions() {
    $('#SuggestionsList').html('');
    var strQuery = $('#txtSearch').val();
    var input = {
        SearchQuery: strQuery,
        GoogleSearchToken: $('#hdnSearchToken').val()
    };
    if (strQuery.length >= 3) {
        APICall('/api/Colive/GetSuggestionsBasedonSearchText', input, false
        ).then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var googleList = Data.GoogleSuggestions;
                var PropertyList = Data.PropertySuggestions;
                if (googleList.length > 0) {
                    var strGoogle = '';
                    $.each(googleList, function (i, v) {
                        var DsDetails = v.DisplayDetails[0];
                        strGoogle += '<li class="glDetails" onclick="RedirectToSearch($(this));" data-type="1" data-placeid="' + v.PlaceId + '" data-description="' + DsDetails.Description + '" title="' + DsDetails.Description + ', ' + DsDetails.SubDescription + '"><b>' + DsDetails.Description + '</b>, ' + ReturnWithDotsBylength(DsDetails.SubDescription, 50) + '</li>';
                    });
                    $('#SuggestionsList').html(strGoogle);
                    if (input.GoogleSearchToken === '') {
                        $('#hdnSearchToken').val(Data.GoogleSearchToken);
                    }
                }

                if (PropertyList.length > 0) {
                    $.each(PropertyList, function (i, v) {
                        $('#SuggestionsList').append('<li class="PropDetails" onclick="RedirectToSearch($(this));" data-type="2" data-propertyname="' + v.LocationName + '"  data-propertylink="' + v.PropertyLink + '"><img src="/assets/images/building.svg"><div class="PropListALign">' + v.LocationName + '<span class="PropAmount">&nbsp;|&nbsp;Rs ' + v.Price + '</span><div class="SearchPropLocation">' + v.Cluster + '</div></div></li>');
                    });
                }

                if (strQuery.length === 3) {
                    $('#SuggestionsList').slideDown('fast');
                }
            } else {
                console.log('Request Status: ' + Status + ' Status Text: ' + Message + ' ' + Data);
            }
        }).catch(ex => {
            console.log(ex);
        });
    } else {
        $('#SuggestionsList').slideUp('fast');
    }
}


function RedirectToSearch(obj) {
    var elementData = obj[0].dataset;
    var input = {
        PlaceId: elementData.placeid,
        GoogleSearchToken: $('#hdnSearchToken').val()
    };
    if (elementData.type === "1") {
        APICall('api/Colive/GetDetailsByPlaceId', input).then(result => {
            var response = result;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var RedirectURL = "";
                $('#hdnSearchToken').val('');
                var locTypes = Data.Types;
                var Coords = Data.Coordinates;
                var rad = 0;
                var searchlocation = elementData.description;
                if (locTypes.length > 1) {
                    switch (locTypes[0]) {
                        case 'locality':
                            rad = 1;
                            break;
                        case 'sublocality_level_1':
                            rad = 2;
                            break;
                        default:
                            rad = 0;
                    }
                }
                searchlocation = searchlocation === "Bengaluru" ? "Bangalore" : searchlocation;
                if (Cities.includes(searchlocation)) {
                    RedirectURL = "/" + searchlocation + "?lat=" + Coords.Latitude + "&long=" + Coords.Longitude + "&rad=" + rad + "&loc=" + replaceWhiteSpace(searchlocation);
                } else {
                    RedirectURL = '/search' + "?lat=" + Coords.Latitude + "&long=" + Coords.Longitude + "&rad=" + rad + "&loc=" + replaceWhiteSpace(searchlocation);
                }
                if (Windowidth < 580) {
                    window.location.href = RedirectURL;
                } else {
                    $('#txtSearch').val(obj.text());
                    $('#hdnURL').val(RedirectURL);
                    $('#SuggestionsList').slideUp('fast');
                }
            } else {
                console.log('Request Status: ' + Status + ' Status Text: ' + Message + 'Response Data ' + Data);
            }
        }).catch(ex => { console.log(ex); });
    } else {
        window.location.href = elementData.propertylink;
    }
}




function GetTagName(TrendingTagName, TrendingTagDisplay) {
    var strTag = '';
    if (TrendingTagDisplay === true) {
        strTag = " <div class='ribbon_overlay'>\
                 <div class='report-logo'>\
                     <svg xmlns='http://www.w3.org/2000/svg' viewBox='-1 -1 13 20' id='icon-lightning' style='width: 16px;'>\
                         <g fill='#FAC917'>\
                         <path d='M10.37 6.52L2.76 17.89 5.04 6.02z'></path>\
                         <path d='M9.3 0L4.92 10.3l-4.2-.43L3.41 0z'></path>\
                         </g>\
                     </svg>\
                 </div>\
                 <span class='image_overlay_content'>" + TrendingTagName + "</span>\
             </div>";
    }
    return strTag;
}

function GetVariantsType(PropertyVariantTagName, PropertyVariantsTypeId) {
    var strVariantsType = '';
    if (PropertyVariantsTypeId === 1 || PropertyVariantsTypeId === 2) {
        var strClass = '';
        switch (PropertyVariantsTypeId) {
            case 1:
                strClass = 'silver';
                break;
            case 2:
                strClass = 'gold';
                break;
            default:
                strClass = '';
                break;
        }
        strVariantsType = " <div class='ribbonbox'><div class='ribbon " + strClass + "'><span> " + PropertyVariantTagName + " </span></div></div>";
    }
    return strVariantsType;
}

function GetPropertyCard(obj, type) {
    var StrCards = "", url = "";
    switch (type) {
        case 1: // factsheet url formation from  properties of the month 
            url = "/Bangalore/" + replaceFslash(replaceWhiteSpace(obj.SubLocation)) + "/" + replaceWhiteSpace(obj.PropertyName) + "/" + obj.Link + "?location=" + obj.Link;
            break;
        default: // factsheet url formation default
            url = "/property?location=" + obj.Link;
    }
    if (obj !== null) {
        StrCards = "<div class='item'> \
                            <a class='property' href='"+ url + "'>\
                                <div class='PropCardsImageSec'> \
                                    <div class='card'> \
                                        <img class='propertyBanner property-img' src='" + obj.DetailedImageName + "' alt='" + obj.PropertyName + "'>  \
                                        "+ GetTagName(obj.TrendingTagName, obj.TrendingTagDisplay) + " \
                                            " + GetVariantsType(obj.PropertyVariantTagName, obj.PropertyVariantsTypeId) + " \
                                        <div class='PropImageTitleOverlay'> \
                                            <div class='PropOverlayTextalyer'>\
                                                <h5 class='card-title' > " + obj.PropertyName + " <i class='fa fa-heart-o'></i></h5> \
                                                <div class='row'> \
                                                    <div class='col-lg-6 col-md-6 col-12 p-0 TextAlignJustfy'> \
                                                        <div class='cords' data-toggle='tooltip' data-placement='bottom' data-title='"+ obj.SubLocation + "'> \
                                                            <img src='/assets/images/location_pin.png' alt='marker' class='img-fluid LocationPinFRProp'> \
                                                            " + ReturnWithDotsBylength(obj.SubLocation, 40) + ", " + obj.City + " \
                                                        </div> \
                                                        <div class='price'> \
                                                            <h6 class='pricing'>Starting price</h6> \
                                                            <p><i class='fa fa-inr' aria-hidden='true'></i>" + ConverToRupees(obj.Price) + "</p> \
                                                        </div> \
                                                        <div class='rating'> \
                                                            <p class='rate'> 3.5 / 5</p > \
                                                            <p class='wid'> \
                                                                <i class='fa fa-star' aria-hidden='true'></i> \
                                                                <i class='fa fa-star' aria-hidden='true'></i> \
                                                                <i class='fa fa-star' aria-hidden='true'></i> \
                                                                <i class='fa fa-star' aria-hidden='true'></i> \
                                                                <i class='fa fa-star' aria-hidden='true'></i> \
                                                            </p> \
                                                        </div> \
                                                    </div> \
                                                    <div class='col-lg-6 col-md-6 col-12 ProbCardsDetailsSec'> \
                                                        <div class='card-body'> \
                                                            <div class='row mt-2 malign_style'> \
                                                                <div class='col-lg-6 col-md-6 col-6 PropertyViewDesign'> \
                                                                    <div class='property' >View Property</div> \
                                                                </div > \
                                                                <div class='col-lg-6 col-md-6 col-6 scheduleFreeVissit'> \
                                                                    <div class='property'>Schedule a visit</div> \
                                                                </div> \
                                                            </div> \
                                                        </div> \
                                                    </div> \
                                                </div> \
                                            </div> \
                                        </div> \
                                    </div > \
                                </div> \
                            </a> \
                        </div>";

    }
    return StrCards;
}

function SearchProperties() {
    if ($('#txtSearch').val().length <= 0) {
        Toast("Please enter any locations !");
    } else if ($('#hdnURL').val().length <= 0) {
        Toast("Please select any locations to proceed  !");
    } else {
        window.location.href = $('#hdnURL').val();
    }
}

function ShowScheduleVisit() {
    if ($('#HeaderSchduleVisitPopUp').data('loaded') === 0) {
        $('#HeaderSchduleVisitPopUp').data('loaded', 1);
        $.getScript("/assets/js/jquery.validate.min.js").done(function () {
            $("#schedulevisitformheader").validate({
                rules: {
                    SCHCustomerName: "required",
                    SCHPhoneNumber: {
                        required: true,
                        number: true,
                        maxlength: 10,
                        minlength: 10
                    },
                    SCHCustomerEmailId: {
                        required: true,
                        email: true
                    },
                    SCHScheduleDate: "required",
                    SCHslVisitSlots: "required",
                    SCHProperty: "required",
                    SCHLocations: "required",
                    SCHCities: "required"
                },
                messages: {
                    SCHCustomerName: "Please enter your name !",
                    SCHPhoneNumber: "Please enter a valid mobile number !",
                    SCHCustomerEmailId: "Please enter a valid e-mailid !",
                    SCHScheduleDate: "Please select a valid Schedule Date !",
                    SCHslVisitSlots: "Please select a Time slot !",
                    SCHProperty: "Please select a Property !",
                    SCHLocations: "Please select a Location !",
                    SCHCities: "Please select a City !"
                }
            });
        });
        $.getScript("/assets/js/dcalendar.picker.js").done(function () {
            $('#SCHScheduleDate').dcalendarpicker({
                format: 'dd-mmm-yyyy'
            });
            var dtDate = new Date();
            $('#SCHScheduleDate').data().dcalendar.minDate = dtDate.setDate(dtDate.getDate() - 1);
            $('#SCHScheduleDate').val(formatDate(new Date())).trigger("change");
        });
        BindLocationsByHeaderMenu($('#SCHCities'), { MenuTypeIds: "1" }, 'Select City');
        $('head').append('<link rel="stylesheet" href="/assets/css/dcalendar.picker.css" type="text/css" />');
    }
    $('#SCHCustomerName,#SCHPhoneNumber,#SCHCustomerEmailId').val('');
    $('#SCHCities option').first().prop('selected', true);
    $('#SCHLocations option').first().prop('selected', true);
    $('#SCHProperty option').first().prop('selected', true);
    $('#schedule-btnheader').attr('disabled', false);
    if ($('#hdnCustomerId').val() !== "0") {
        var url = '/api/MyAccount/GetLoginDetails';
        APICall(url, null)
            .then(responseData => {
                var response = responseData;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === 'success') {
                    var CustomerDetails = Data;
                    $('#SCHCustomerName').val(CustomerDetails.CustomerName);
                    $('#SCHPhoneNumber').val(CustomerDetails.Mobile);
                    $('#SCHCustomerEmailId').val(CustomerDetails.EmailID);
                }
            }, errorMsg => { console.log(errorMsg.Message); })
            .catch(ex => { console.log('Exception: ' + ex.message); });
    }
    $('#HeaderSchduleVisitPopUp').modal('show');
}

const BindLocationsByHeaderMenu = (objControl, input, DropdownName, IsTriggerFirst = true) => {
    objControl.html('<option disabled value="">' + DropdownName + '</option>');
    APICall('/api/Colive/GetMenuDetailsByTypeId', input)
        .then(result => {
            let response = result;
            let Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                let list = Data;
                if (list.length > 0) {
                    $.each(list, function (i, v) {
                        objControl.append($('<option>', {
                            value: "lat=" + v.Latitude + "&lng=" + v.Longitude + "&loc=" + v.Location + "&MenuId=" + v.MenuId + "",
                            text: v.Location
                        }));
                    });
                    objControl.find('option').first().prop('selected', IsTriggerFirst).trigger('change');
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log(ex); });
};



function BindLocationsbyParentId(object) {
    if (object.val() !== null) {
        let input = {
            MenuTypeIds: "2,0",
            ParentMenuIds: object.val().split("&")[3].split("=")[1],
            ExcludedIds: "7,8,9"
        };
        BindLocationsByHeaderMenu($('#SCHLocations'), input, 'Preferred locations');
    }
}

function BindPropertiesByLocations(object) {
    if (object.val() !== null) {
        let input = {
            Latitude: object.val().split('&')[0].split('=')[1],
            Longitude: object.val().split('&')[1].split('=')[1]
        };
        $('#SCHProperty').html('<option value="">Select Property</option>');
        APICall("/api/Colive/GetNearByPropertyByCoordinates", input, true).then(result => {
            let response = result;
            let Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                let list = Data;
                if (list.length > 0) {
                    $.each(list, function (i, v) {
                        $('#SCHProperty').append($('<option>', {
                            value: v.PropertyID,
                            text: v.PropertyName
                        }));
                    });
                    $('#SCHProperty option').first().prop('selected', true).trigger('change');
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }).finally(() => { $('#AjaxLoader').fadeOut(500); });
    }
}


function ScheduleDatechangedHeader() {
    if ($('#SCHProperty').val() !== null) {
        $('#SCHslVisitSlots').html('');
        var input = {
            Date: $('#SCHScheduleDate').val(),
            PropertyID: $('#SCHProperty').val()
        };
        var url = '/api/Colive/GetSchedulevisitsTimeSlots';
        APICall(url, input)
            .then(responseData => {
                var response = responseData;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === 'success') {
                    var TimslotList = Data;
                    if (TimslotList.length > 0) {
                        var stroptions = '';
                        $.each(TimslotList, function (i, v) {
                            stroptions += '<option value=' + v.TimeId + '>' + v.TimeString + '</option>';
                        });
                        $('#SCHslVisitSlots').html(stroptions);
                    } else {
                        var dtDate = new Date();
                        var NewDate = new Date();
                        $('#SCHScheduleDate').data().dcalendar.minDate = dtDate.setDate(dtDate.getDate() - 1);
                        if ($('#SCHScheduleDate').data('loaded') === 0) {
                            $('#SCHScheduleDate').data('loaded', 1);
                            NewDate.setDate(NewDate.getDate() + 1);
                            $('#SCHScheduleDate').val(formatDate(NewDate));
                        } else {
                            Toast("Oops! No time slots available for the day.Please select a slot for the next day.");
                            $('#SCHScheduleDate').val(formatDate(NewDate));
                        }
                    }
                } else {
                    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                }
            }, errorMsg => { console.log(errorMsg.Message); })
            .catch(ex => { console.log('Exception: ' + ex.message); });
    }
}

function SchedulevisitFromHeader() {
    if ($('#schedulevisitformheader').valid()) {
        let strmobile = $("#SCHPhoneNumber").val().trim();
        if (IsValidMobile(strmobile)) {
            $('#schedule-btnheader').attr('disabled', true);
            let input = {
                Name: $("#SCHCustomerName").val().trim(),
                LocationId: $('#SCHProperty').val(),
                Phone: strmobile,
                Email: $("#SCHCustomerEmailId").val().trim(),
                PickupDate: $("#SCHScheduleDate").val().trim(),
                PickupTimeId: $("#SCHslVisitSlots").val(),
                LeadApiSuccess: false,
                LocationName: $('#SCHLocations').val().split('&')[2].split("=")[1],
                LeadSource: "Direct",
                VisitTime: $("#SCHslVisitSlots option:selected").text().trim(),
                PropertyName: $('#SCHProperty option:selected').text().trim()
            };
            var url = '/api/Colive/PropertyScheduleVisitInsert';
            APICall(url, input, true)
                .then(responseData => {
                    var response = responseData;
                    var Status = response.Status,
                        Message = response.Message,
                        Data = response.Data;
                    if (Status === 'success') {
                        $('#HeaderSchduleVisitPopUp').modal('hide');
                        Toast("Your visit is scheduled successfully !");
                    } else {
                        console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                    }
                }, errorMsg => { console.log(errorMsg.Message); })
                .catch(ex => { console.log('Exception: ' + ex.message); })
                .finally(() => { $('#AjaxLoader').fadeOut(500); });
        }
    }
}


function formatDate(dateParam) {
    var m_names = new Array("Jan", "Feb", "Mar",
        "Apr", "May", "Jun", "Jul", "Aug", "Sep",
        "Oct", "Nov", "Dec");
    var curr_date = dateParam.getDate();
    var curr_month = dateParam.getMonth();
    var curr_year = dateParam.getFullYear();
    return curr_date + "-" + m_names[curr_month] + "-" + curr_year;
}

function CaptureNoCotenantSelection(obj) {
    if (obj !== undefined) {
        CotenantResponse(obj, true, true);
        $('#cotenantselection').hide();
    } else {
        CotenantResponse(obj, true, true);
        $('#AddCotenant').modal('hide');
    }
}

function CaptureYesCotenantSelection(obj) {
    if (obj !== undefined) {
        CotenantResponse(obj, true, false);
        $('#cotenantselection').hide();
        redirect = "/dashboard?addcotenant=" + obj;
        setTimeout(function () { window.location.href = redirect; }, 1000);
    } else {
        CotenantResponse($("#ancNotAlone").data('bookingid'), true, false);
        redirect = "/dashboard?addcotenant=" + $("#ancNotAlone").data('bookingid');
        setTimeout(function () { window.location.href = redirect; }, 1000);
        $('#AddCotenant').modal('hide');
    }
}

function CheckSelection(obj) {
    var BookingId;
    if (obj.innerText === 'I am staying alone') {
        BookingId = $("#WhatsappYes").data('bookingid');
        CaptureNoCotenantSelection(BookingId);
    }
    else if (obj.innerText === 'I am staying with co-tenant') {
        BookingId = $("#whatsappnotnow").data('bookingid');
        CaptureYesCotenantSelection(BookingId);
    }
}

function CotenantResponse(BookingID, IsUpdate, IsStayingAlone) {
    var input = {
        BookingID: BookingID,
        CustomerID: 0,
        IsUpdate: IsUpdate,
        IsStayingAlone: IsStayingAlone
    };
    var url = '/api/MyAccount/CoTenantResponse';
    APICall(url, input, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                if (IsUpdate === true) {
                    if (Data === true) {
                        $('#ancCotenantAccept').hide();
                        $('#ancCotenantReject').hide();
                        $('#cotenantDisplayresponse').html('Thank you for your selection');
                    }
                }

            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}


