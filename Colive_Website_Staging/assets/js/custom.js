

var zoomlevel = 12,
    Windowidth = 0,
    WindowHeight = 0,
    SourceTypeId = 0;

function replaceWhiteSpace(word) {
    return word.split(' ').join('-');
}

function replaceFslash(word) {
    return word.split('/').join('');
}

function isEmail(email) {
    var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return regex.test(email);
}

function scrollTop(easingtiming) {
    $('html,body').animate({ scrollTop: 0 }, easingtiming);
}
const ReplaceSpecialCharacters = (ReplaceString) => {
    return ReplaceString.replace(/[&\/\\#,+()$~%.'":*?<>{}]/g, '');
};

function NumberOnly() {
    var asciiValue = event.keyCode;
    if ((asciiValue >= 48 && asciiValue <= 57) || (asciiValue === 8 || asciiValue === 127))
        event.returnValue = true;
    else
        event.returnValue = false;
}

const getOS = () => {
    var userAgent = window.navigator.userAgent,
        platform = window.navigator.platform,
        macosPlatforms = ['Macintosh', 'MacIntel', 'MacPPC', 'Mac68K'],
        windowsPlatforms = ['Win32', 'Win64', 'Windows', 'WinCE'],
        iosPlatforms = ['iPhone', 'iPad', 'iPod'],
        os = null;

    if (macosPlatforms.indexOf(platform) !== -1) {
        os = 'Mac OS';
    } else if (iosPlatforms.indexOf(platform) !== -1) {
        os = 'iOS';
    } else if (windowsPlatforms.indexOf(platform) !== -1) {
        os = 'Windows';
    } else if (/Android/.test(userAgent)) {
        os = 'Android';
    } else if (!os && /Linux/.test(platform)) {
        os = 'Linux';
    }

    return os;
};

function handleFileImg(obj) {
    if (parseInt((obj.files[0].size)) <= 2097152) {
        var id = obj.id;
        var hdnBinaryId = $('#' + id).data('imagebinaryid');
        var hdnFileName = $('#' + id).data('filenameid');
        var lblFileName = $('#' + id).data('labelid');
        var imgsrc = $('#' + id).data('imgsrc');
        var reader = new FileReader();
        var FileName = obj.files[0].name;
        var idxDot = FileName.lastIndexOf(".") + 1;
        var extFile = FileName.substr(idxDot, FileName.length).toLowerCase();
        if (extFile == "jpg" || extFile == "jpeg" || extFile == "png") {
            $('#' + hdnFileName).val(FileName);
            $('#' + lblFileName).html(FileName);
            reader.onload = function () {
                var binaryValue = this.result.toString().split(',')[1];
                $('#' + hdnBinaryId).val(binaryValue);
                $('#' + imgsrc).attr('src', 'data:image/png;base64,' + binaryValue);
                $('#' + imgsrc).show();
            };
            reader.readAsDataURL(obj.files[0]);
        } else {
            $('#' + hdnBinaryId).val("");
            $('#' + hdnFileName).val("");
            $('#' + lblFileName).html("");
            $('#' + imgsrc).attr('src', '');
            Toast("Only jpg/jpeg and png files are allowed !");
        }
        return true;
    } else {
        Toast("Maximum File 1.5MB !");
        return false;
    }
}

const handleDocument = (obj) => {
    if (parseInt((obj.files[0].size)) <= 3097152) {
        var id = obj.id;
        var lblFileName = $('#' + id).data('spanid');
        var lblStatusId = $('#' + id).data('statusid');
        var FileName = obj.files[0].name;
        var idxDot = FileName.lastIndexOf(".") + 1;
        var extFile = FileName.substr(idxDot, FileName.length).toLowerCase();
        if (extFile == "doc" || extFile == "docx" || extFile == "pdf") {
            $('#' + lblFileName).html(FileName).show();
            $('#' + lblStatusId).html("Document Attached");
        } else {
            $('#' + lblFileName).html("");
            $('#' + id).val('');
            $('#' + lblStatusId).html("Attach Document");
            Toast("Only doc/docx and pdf files are allowed !");
        }
        return true;
    } else {
        Toast("Maximum File 3MB !");
        return false;
    }
};


const SaveDocument = (FileData, type, showPageLoader = false) => {
    let url = window.location.origin === 'http://localhost:51886' ? 'http://localhost:56675/' : window.location.origin + '/webservices';
    switch (type) {
        case 1:
            url += '/api/Career/SaveResumeByCandidateId';
            break;
        default:
            url += '';
            break;
    }
    if (showPageLoader) { $('#AjaxLoader').fadeIn(500); }
    const promise = new Promise((resolve, reject) => {
        const xhr = new XMLHttpRequest();
        xhr.contentType = false;
        xhr.processData = false;
        xhr.open('POST', url);
        xhr.responseType = 'json';
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
        xhr.send(FileData);
    });
    return promise;
};


const GenerateRandomByLength = (length) => {
    var result = '';
    var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    var charactersLength = characters.length;
    for (var i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
};


function Toast(alertMessage) {
    $('#ToastMsg').html('');
    $('#ToastMsg').html(alertMessage);
    $('.toastwrap').fadeIn('slow');
    setTimeout(function () { $('.toastwrap').fadeOut('slow'); }, 10000);
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

const ScrollByElement = (Element, animationSpeed) => {
    $('html, body').animate({ scrollTop: Element.offset().top - 100 }, animationSpeed);
};

const APICall = (url, data, showPageLoader = false, method = 'POST') => {
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

// Page Load events common for all pages
$(document).ready(function () {
    Windowidth = window.innerWidth;
    WindowHeight = window.innerHeight;
    BindHeaderLinks();
    $('[data-toggle="tooltip"]').tooltip();
    setTimeout(function () {
        if (SourceTypeId !== 3 && SourceTypeId !== 2) {

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
                }
            });
            setTimeout(function () { BindcustomerDetails(); }, 300);
        }
    }, 300);
});

function BindHeaderLinks() {
    var url = '/api/Colive/LoadHeaderLocationMenu';
    APICall(url, {})
        .then(responseData => {
            var response = JSON.parse(responseData);
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

            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

function getPropertyDetailsForSearch() {
    var input = GetSearchInput();
    bindPropertyDetails(input);
}

function bindPropertyDetails(inputJson) {
    var url = '/api/Colive/GetPropertySearchDetails';
    APICall(url, inputJson, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var PropertyList = Data.Property,
                    SimilarPropertyList = Data.SimilarProperties,
                    TrendingPropertiesList = Data.TrendingProperties,
                    strPropGridCards = '',
                    strPropSimilarCards = '',
                    strtrendingProperties = '',
                    strPropMapCards = '',
                    strEmptyCards = "<div class='container'>\
                <div class='no_properties_found text-center'>\
                    <div class='no_prop_image'>\
                        <img src='/assets/images/apartment.png' alt='No_Property_Found' class='img-fluid'/>\
                    </div>\
                    <h1 class='h1_noProperties_heading'>No Properties Found</h1>\
                    <div class='noProperties_description'>We couldn’t find any properties for your search locations.<br><span class='noProperties_FlatButton'>Try out our other locations </span></div>\
                    <div class='noProperties_Button noProperties_PrimeButton' onclick=\"$('#btnLocation')[0].click();\">Our Locations</div>\
                </div>\
            </div>";
                FilterConfiguration(Data.Filter);
                var markers = [];
                if (PropertyList.length > 0) {
                    var location = window.location.pathname;
                    if (location.search('/pg-rooms-for-rent') === -1) {
                        strPropGridCards += "<h2 class='similarProperty'>It's a Match</h2>";
                    }
                    $.each(PropertyList, function (i, v) {
                        var _url = window.location.pathname === "/search" ? "/property?location=" + v.Link : "/" + window.location.pathname.substr(1).split('/')[0] + '/' + replaceFslash(replaceWhiteSpace(v.LocationName)) + '/' + replaceWhiteSpace(v.PropertyName) + '/' + replaceWhiteSpace(v.Link) + '?location=' + v.Link + '';
                        strPropGridCards += GetPropertyCard(v, 2, i);

                        strPropMapCards += "<a data-price='" + v.Price + "' data-order='" + i + "' href='" + _url + "'><div class='well well-sm'> \
                            <div class='card mb-4 container ok'> \
                                <div class='row no-gutt'>  \
                                    <div class='col-md-4 avail_list_mapview'> \
                                        <img src='" + v.TileImageName + "' class='widhigh-img property-img' alt='" + v.PropertyName + "' >\
                                               "+ GetTagName(v.TrendingTagName, v.TrendingTagDisplay) + " \
                                         </div> \
                                    <div class='col-md-8 pl-0'> \
                                        <div class='card-body p-0'> \
                                            <h5 class='title m-0'>" + v.PropertyName + "<i class='fa fa-heart-o'></i></h5> \
                                        </div> \
                                        <div class='BTM'> \
                                            <div class='stager'> \
                                                <img src='/assets/images/marker.png' class='pl-1' alt=''> \
                                                <p class='beforeTag m-0'>" + v.LocationName + ", " + v.City + "</p> \
                                            </div> \
                                            <p class='pricings m-0'>Starting price</p> \
                                            <p class='load m-0'><i class='fa fa-inr' aria-hidden='true'></i>&nbsp;" + ConverToRupees(v.Price) + "</p> \
                                            <div class='view-property '> \
                                                <span class='view'>Schedule a Visit</span> \
                                            </div> \
                                        </div> \
                                    </div> \
                                     " + GetVariantsType(v.PropertyVariantTagName, v.PropertyVariantsTypeId) + " \
                                </div> \
                            </div> \
                        </div></a>";

                        var object = {
                            title: v.PropertyName,
                            lat: v.Latitude,
                            lng: v.Longitude,
                            description: v.LocationName,
                            link: v.Link,
                            imageName: v.TileImageName,
                            amenities: v.Amenities,
                            price: v.Price,
                            rentaltermstype: v.RentalTermsType
                        };
                        markers.push(object);
                    });
                }
                else {
                    strPropGridCards = strEmptyCards;
                    strPropMapCards = strEmptyCards;
                }

                if (SimilarPropertyList.length > 0) {
                    $('#SimilarPropListCards').show();
                    strPropSimilarCards += "<h2 class='similarProperty'>Similar Properties</h2>";
                    $.each(SimilarPropertyList, function (i, v) {
                        strPropSimilarCards += GetPropertyCard(v, 2, i);
                    });

                } else {
                    $('#SimilarPropListCards').hide();
                }

                if (TrendingPropertiesList.length > 0) {
                    $('#TrendingPropertiesCards').show();
                    strtrendingProperties += "<h2 class='similarProperty'>Trending Properties</h2>";
                    $.each(TrendingPropertiesList, function (i, v) {
                        strtrendingProperties += GetPropertyCard(v, 2, i);
                    });

                } else {
                    $('#TrendingPropertiesCards').hide();
                }

                $('#PropListCards').html(strPropGridCards);
                $('#PropMapCards').html(strPropMapCards);
                $('#SimilarPropListCards').html(strPropSimilarCards);
                $('#TrendingPropertiesCards').html(strtrendingProperties);
                $('section.grid-view p.upgrade').fadeIn();
                $('.spnPropCount').html(PropertyList.length + " ");
                $(".property-img").on("error", function (e) { this.src = "/assets/images/marathalli.jpg"; });
                $('[data-toggle="tooltip"]').tooltip();
                PropertySorting($('.sort-list li.active label'));
                if ($('#hdnFilterLoaded').val() === "1") {
                    MapViewMap.initialize();
                }
                MapViewMap.plotmarkers(markers);
            } else {
                $('#PropListCards').html(strEmptyCards);
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log(ex); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}


function getQueryStringValues() {
    var vars = [],
        hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (var i = 0; i < hashes.length; i++) {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}

function getVariablesByPath() {
    var hashes = window.location.pathname.split('/');
    return hashes;
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


function ToggleView() {
    var viewid = $('#btnToggle').data('viewid');
    $(window).scrollTop(0);
    if (viewid === 1) {
        $('#btnToggle').html('Grid view');
        $('#btnToggle1').html('<i class="fa fa-th" aria-hidden="true"></i>');
        $('#btnToggle').data('viewid', 2);
        $('#btnToggle1').data('viewid', 2);
        $('#MapView').fadeIn();
        $('#GridView').fadeOut();
    } else {
        $('#btnToggle').html('Map view');
        $('#btnToggle1').html('<i class="fa fa-map-marker" aria-hidden="true"></i>');
        $('#btnToggle').data('viewid', 1);
        $('#btnToggle1').data('viewid', 1);
        $('#GridView').fadeIn();
        $('#MapView').fadeOut();
    }
}


// PropertyDetails Page functions Start
function GetPropertyDetailsById(sublink) {
    var objPropertyDto = {
        LocationLink: "" + sublink + ""
    };
    var url = '/api/Colive/GetPropertyDetailsById';
    APICall(url, objPropertyDto, true)
        .then(responseData => {
            if (responseData.Status === "success") {
                switch ($('title').data('desc').toLowerCase()) {
                    case 'factsheet':
                        BindPropertyDetails_Factsheet(responseData);
                        break;
                    case 'reservation':
                        BindPropertyDetails_Booking(responseData);
                        break;
                    case 'search':
                        getPropertyview(responseData);
                        break;
                    case 'schedulevisit':
                        GetLocationDetails(responseData);
                        break;
                    default:
                        console.log('title description - ' + $('title').data('desc'));
                }
            } else {
                console.log('Request Status: ' + responseData.Status + ' Status Text: ' + responseData.Message + ' ' + responseData.Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}

function GetPropertyAvailablityDetails(locationID) {
    var objPropertyDto = {
        PropertyID: locationID
    };
    var url = '/api/Colive/GetPropertyAvailablityDetails';
    APICall(url, objPropertyDto)
        .then(responseData => {

            if (responseData.Status === "success") {
                switch ($('title').data('desc').toLowerCase()) {
                    case 'factsheet':
                        BindPropertyAvailability_Factsheet(responseData);
                        break;
                    case 'search':
                        BindPropertyAvailability_Quickview(responseData);
                        break;
                    default:
                        console.log('title data - ' + $('title').data('desc'));
                }
            } else {
                console.log('Request Status: ' + responseData.Status + ' Status Text: ' + responseData.Message + ' ' + responseData.Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}


// PropertyDetails Page functions End
function returnwithmonths(period) {
    var strmonth = '';
    if (period > 1) {
        strmonth = period + ' Months';
    } else {
        strmonth = period + ' Month';
    }
    return strmonth;
}

function returnratings(Rating) {
    var strRating = '';
    for (t = 0; t < Rating; t++) {
        strRating += '<i class="fa fa-star" aria-hidden="true"></i>';
    }
    return strRating;
}

function returnSharingTypes(SharingType) {
    var strSharingType = '';
    for (t = 0; t < SharingType; t++) {
        strSharingType += '<i class="fa fa-user" aria-hidden="true"></i>&nbsp;';
    }
    return strSharingType;
}

function returnBedIconsbyCount(count) {
    var strBeds = '';
    for (t = 0; t < count; t++) {
        strBeds += '<i class="fa fa-bed" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;';
    }
    return strBeds;
}



function returnAmenitiesImageDetails(ImagesList) {
    var strImages = '';
    if (ImagesList.length > 0) {
        $.each(ImagesList, function (i, v) {
            strImages += "<div class='position-relative' data-toggle='tooltip' data-placement='top' title='" + v.Text + "'><img src='" + v.Image + "' alt='" + v.Text + "'><p>" + v.Text + "</p></div>";
        });
    }
    return strImages;
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


function ConverToRupees_V2(x) {
    x = x.toString();
    var afterPoint = '';
    if (x.indexOf('.') > 0)
        afterPoint = x.substring(x.indexOf('.'), x.length);
    x = Math.floor(x);
    x = x.toString();
    var lastThree = x.substring(x.length - 3);
    var otherNumbers = x.substring(0, x.length - 3);
    if (otherNumbers != '')
        lastThree = ',' + lastThree;
    return otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree + afterPoint;
}


function GetDistanceFromLatLng(lat1, lon1, lat2, lon2) {
    var R = 6371; // km
    var dLat = toRad(lat2 - lat1);
    var dLon = toRad(lon2 - lon1);
    lat1 = toRad(lat1);
    lat2 = toRad(lat2);

    var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
        Math.sin(dLon / 2) * Math.sin(dLon / 2) * Math.cos(lat1) * Math.cos(lat2);
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    var d = R * c;
    return d;
}

// Converts numeric degrees to radians
function toRad(Value) {
    return Value * Math.PI / 180;
}

function returnAmenityImages(Amenities) {
    var extraCount = 0;
    var result = '';
    $.each(Amenities, function (ind, val) {
        if (ind < 4) {
            result += '<img src="' + val.Image + '" title="' + val.AmenityName + '" />';
        } else {
            extraCount++;
        }
    });
    return extraCount.toString() + ',' + result;
}


function BindSimilarPropertyDetails(location, Latitude, Longitude) {
    var input = {
        Date: formatDate(new Date()),
        LocationName: location,
        OfferId: 0,
        RoomTypeIds: '',
        RoomSubTypeIds: '',
        RoomClassIds: '',
        FurnishStatusIds: '',
        Latitude: Latitude,
        Longitude: Longitude,
        Distance: 2,
        RoomShareCategory: '',
        MinValue: '',
        MaxValue: ''
    };
    var url = '/api/Colive/GetPropertySearchDetails';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var SimilarPropList = Data.SimilarProperties;
                if (SimilarPropList.length > 0) {
                    $.each(SimilarPropList, function (i, v) {
                        $('#SimilarPropertiesCards').append(GetPropertyCard(v, 1));
                    });
                    $('#SimilarPropertiesCards').owlCarousel({
                        loop: true,
                        margin: 10,
                        nav: true,
                        responsive: {
                            0: {
                                items: 1
                            },
                            600: {
                                items: 2
                            },
                            1000: {
                                items: 3
                            }
                        }
                    });
                    $(".property-img").on("error", function (e) {
                        this.src = "/assets/images/marathalli.jpg";
                    });
                    $('[data-toggle="tooltip"]').tooltip();
                } else {
                    $('#SimilarPropertiesContainer').hide();
                }
            } else {
                $('#SimilarPropertiesContainer').hide();
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log(ex); });
}


function login() {
    if ($('#CustEmailId').val() === "" || $('#CustPassword').val() === "") {
        return;
    }

    var objPropertyDto = {
        Email: $('#CustEmailId').val(),
        Password: $('#CustPassword').val()
    };
    loginAPICall(objPropertyDto);
}

function loginAPICall() {
    var ArrRedirect = window.location.href.slice(window.location.href.indexOf('?') + 1).split("~");
    var RedirectURL = "";
    if (ArrRedirect[0].split("/")[1] === "") {
        RedirectURL = "";
    } else {
        RedirectURL = "/" + ArrRedirect[0].split("/")[1];
    }

    var url = '/api/MyAccount/UserLogin';
    APICall(url, null)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                if (RedirectURL === "") {
                    var redirect = "/";
                    switch (Data.BookingStatusId) {
                        case 1:
                            if (Data.CustomerKeyReceivedStatus === 0) {
                                redirect = "/dashboard?movein=" + Data.BookingID;
                            } else {
                                redirect = "/dashboard?opn=service";
                            }
                            break;
                        case 2:
                            redirect = "/dashboard?rid=" + Data.BookingID;
                            break;
                        default:
                            redirect = "/";
                    }
                    window.location.href = redirect;
                } else {
                    window.location.href = RedirectURL;
                }
            } else {
                Toast(Message);
                $('#CustPassword').removeClass('valid').addClass('error');
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

function BindPropertyDetails_Factsheet(response) {
    var Status = response.Status,
        Message = response.Message,
        Data = response.Data;
    if (Status === 'success') {
        var strPropImages = '',
            strTestimonials = '',
            strOffers = '',
            strAmenities = '';

        if (Data.Property.length > 0) {
            var PropertyData = Data.Property[0];
            $('#spnPropertyName').html(PropertyData.PropertyName);
            $('#spnPropaddr').html(PropertyData.Landmark + ", " + PropertyData.City);
            $('#spnPropDesc').html(PropertyData.LocationDescription);
            $('#spnHighlights').html(PropertyData.LocationHighlights);
            $('#hdnLatLong').val(PropertyData.Latitude + ',' + PropertyData.Longitude);
            $('#hdnSubLocation').val(PropertyData.SubLocation);
            $('#hdnLocationId').val(PropertyData.PropertyID);
            $('#hdnLocationName').val(PropertyData.PropertyName);
            if (PropertyData.YouTubeURL !== null) {
                $('#btnYoutube').data('frameurl', PropertyData.YouTubeURL);
                $('#btnYoutube').show();
            }
            if (PropertyData.URL360Deg !== null) {
                $('#btnMatterPort').data('frameurl', PropertyData.URL360Deg);
                $('#btnMatterPort').show();
            }
            if (PropertyData.GooglePlusCode !== null) {
                $('#spnGooglePlusCode').html(PropertyData.GooglePlusCode);
                $('#ancGoogleplus').attr('href', "https://www.google.com/maps?q=" + PropertyData.GooglePlusCode.replace("+", "%2b"));
                $('#ancGoogleplus').show();
            }
            if (PropertyData.PropertyRating !== 0.0) {
                BindPropertyRating(PropertyData.PropertyRating, PropertyData.CustomerReviewsCount);
            }
            var PropertyimagesList = PropertyData.Images;
            var Testimonialslist = PropertyData.Testimonials;
            var AmenitiesList = PropertyData.Amenities;
            var OfferList = PropertyData.Offers
            if (PropertyimagesList.length > 0) {
                $.each(PropertyimagesList, function (i, v) {
                    strPropImages += "<div class='item'> \
                                <div class='carousel-img' > \
                                    <img src='" + v.DetailedImage + "' alt='" + v.ImageType + "' class='property-img'> \
                                    </div> \
                                </div>";
                });
                $('#PropertyImages').append(strPropImages);
                $('#PropertyImages').owlCarousel({
                    loop: true,
                    margin: 10,
                    nav: true,
                    pagination: true,
                    responsive: {
                        0: {
                            items: 1
                        },
                        600: {
                            items: 1
                        },
                        1000: {
                            items: 1
                        }
                    }
                });

            }
            if (Testimonialslist.length > 0) {
                $.each(Testimonialslist, function (i, v) {
                    strTestimonials += "<div class='item'> \
                                        <p>" + v.Description + "</p> \
                                        <div class='user'>  \
                                            <img src='" + v.Image + "' alt='" + v.CustomerName + "'> \
                                            <div class='user-info'> \
                                                <p>" + v.CustomerName + "</p> <br> \
                                                <p>" + returnratings(v.Rating) + "</p> \
                                            </div> \
                                        </div> \
                                    </div>";
                });
                $('#product-testimonial').html(strTestimonials);
                $('#product-testimonial').owlCarousel({
                    autoHeight: true,
                    loop: true,
                    nav: true,
                    responsive: {
                        0: {
                            items: 1
                        },
                        600: {
                            items: 1
                        },
                        1000: {
                            items: 1
                        }
                    }
                });
                $('#CustomerTestimonials').fadeIn();

            } else {
                $('#CustomerTestimonials').fadeOut();
            }

            if (AmenitiesList.length > 0) {
                $.each(AmenitiesList, function (i, v) {
                    var HdnUtilityList = [], DisplayUtilityList = [];
                    if (v.Utility.length > 3) {
                        DisplayUtilityList = v.Utility.slice(0, 3);
                        HdnUtilityList = v.Utility.slice(3, v.Utility.length);
                    } else {
                        DisplayUtilityList = v.Utility;
                    }

                    strAmenities += "<div class='AmenitiesLoc col-lg-4 col-md-4 col-12'> \
                            <div class='amenityItemWrapper'> \
                            <div class='amenityTypeHeader'>  \
                                <div class='amenityImg'> \
                                    <img src='" + GetUtilityImage(v.UtilityType) + "' alt='' class='AmenitiesTitle'> \
                                </div> \
                                <span>" + v.UtilityType + "</span> \
                                </div> \
                                <div class='AmenitiesheightSet'> \
                                <div class='amenityItems' > \
                                           " + ReturnUtilityDetails(DisplayUtilityList) + "  \
                                     </div> \
                                    <div class='amenityItems hdnamenity adjustheight' style='display:none'> \
                                     " + ReturnUtilityDetails(HdnUtilityList) + " \
                                    </div> \
                                    <p class='btnShowextraamenity' onclick='ToggleAmenities($(this))' style='display: " + (HdnUtilityList.length > 0 ? ' block' : 'none') + "'>" + HdnUtilityList.length + " More &nbsp;&nbsp;<i class='fa fa-angle-right' aria-hidden='true'></i></p > \
                                </div> \
                            </div> \
                        </div>";
                });
                $('#colivepromises').append(strAmenities);
                $('[data-toggle="tooltip"]').tooltip();

            }
            if (OfferList.length > 0) {
                strOffers += "<div class='AmenitiesLoc col-lg-12 col-md-12 col-12'> \
                            <div class='amenityItemWrapper'> \
                            <div class='amenityTypeHeader'>  \
                                <div class='amenityImg'> \
                                    <img src='/assets/images/about/about-social.svg' alt='' class='AmenitiesTitle'> \
                                </div> \
                                <span>offer</span> \
                                </div> \
                                <div class=''> \
                                <div class='amenityItems' > \
                                          " + ReturnOfferDetails(OfferList) + "  \
                                  </div> \
                                </div> \
                            </div> \
                        </div>";
                $('#offers').append(strOffers);
			}
            $(".property-img").on("error", function (e) {
                this.src = "/assets/images/marathalli.jpg";
            });
            GetPropertyAvailablityDetails(PropertyData.PropertyID);
        } else {
            window.location.href = '/';
        }
    } else {

        console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
    }
}

function BindPropertyAvailability_Factsheet(response) {
    var Status = response.Status,
        Message = response.Message,
        Data = response.Data;
    if (Status === 'success') {
        var PropertyList = Data,
            CommonDetails = {},
            strKeyDetails = '';
        if (PropertyList.length > 0) {
            CommonDetails = PropertyList[0];
            $.each(PropertyList, function (i, v) {
                strKeyDetails += "<tr> \
                              <td scope='row'> \
                               " + returnSharingTypes(v.BedCount) + " \
                              </td> \
                             <td>" + v.RoomSubType + "</td> \
                             <td> \
                             <div class='feature-svg'> \
                               " + returnAmenitiesImageDetails(v.Images) + " \
                      </div> \
                  </td> \
          <td>₹ " + ConverToRupees(v.PricePerMonth) + "</td> \
         </tr> ";
            });
            $('#KeyDetails').append(strKeyDetails);
            $('#spnDepositDuration').html(returnwithmonths(CommonDetails.DepositInMonthPropertyLevel));
            $('#spnNoticeDuration').html(returnwithmonths(CommonDetails.NoticePeriodPropertyLevel));
            $('#spnlockinDuration').html(returnwithmonths(CommonDetails.LockinPeriodPropertyLevel));
            $('[data-toggle="tooltip"]').tooltip();
        } else {
            $('#RoomDetails').hide();
            window.location.href = '/';
        }
    } else {
        console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
    }
}


function BindPropertyDetails_Booking(response) {
    var Status = response.Status,
        Message = response.Message,
        Data = response.Data;
    if (Status === 'success') {
        var PropertyList = Data.Property;
        if (PropertyList.length > 0) {
            var PropertyData = PropertyList[0];
            var PropertyName = PropertyData.PropertyName;
            var PropUrl = PropertyData.ReferUrl.substr(PropertyData.ReferUrl.lastIndexOf('/') + 1);
            var input = { PropertyID: PropertyData.PropertyID };
            $('#ancBreadScrumb,#spnPropertyName,#spnBookingProperty').html(PropertyName);
            $('#ancBreadScrumb').attr('href', '/' + PropUrl);
            $('#hdnLocationId').val(input.PropertyID);
            BindPropertyAvailability_Booking(input, 1);
        } else {
            window.history.back(2);
        }
    } else {
        console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
    }
}

function BindPropertyAvailability_Booking(inputJson, type) {

    var url = '/api/MyAccount/GetBedkeyDetails';
    APICall(url, inputJson)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var strBedkeys = "",
                    occ = "";
                var ApartmentList = Data.BedKeyDetails;
                if (type === 1) {
                    EquipReservationFilter(Data.FilterMaster, 1);
                }
                if (ApartmentList.length > 0) {
                    var n = 0;
                    $.each(ApartmentList, function (i, t) {
                        strBedkeys += " ";
                        var strNoticeperiod = " ";
                        var StrAmenityImages = returnAmenityImagesForBooking(t.Images);
                        if (t.OnNoticePeriod === true) {
                            strNoticeperiod = "<span class='noticeperiodkey'>Room will be available from " + t.NoticePeriodEndDate + "</span>";
                        }
                        n = n + 1;
                        strBedkeys += "<div class='booking-card-design card col col-lg-6 col-md-6 col-12 p-0 animated " + (n % 2 === 0 ? 'cardright' : 'cardleft') + "  " + (i > 3 ? 'delay-2s' : '') + "'> \
                        <div class='booking-main-whitebg'> \
                        <h2 class='ApartmentName'>"+ t.ApartmentName + "</h3> \
                        <div class='booking-card-design'> \
                        <div class='booking-card'> \
                              <div class='booking-overview' > \
                                <div class='row booling-property-details'> \
                                    <div class='col col-lg-12 col-md-12 col-12'> \
                                        <div class='booking-selection'> \
                                            <div class='form-check'> \
                                            <input class='form-check-input radioBeds' type='radio' name='bed' id='BkRadio" + t.RoomID + "' value='" + t.RoomID + "' data-offer='" + t.OfferCode + "' data-propertyid='" + t.LocationID + "' data-rent='" + t.RentWithUtility + "' data-maintenance='" + t.FixedAmenitiesPricing + "' data-share='" + t.RoomTypeId + "' data-type='" + t.RoomSubTypeId + "' data-bath='" + t.RoomClassId + "' data-roomid='" + t.RoomID + "' data-noticeperiodenddate='" + t.NoticePeriodEndDate + "' data-bedcount='" + t.BedCount + "'> \
                                            <label class='form-check-label' for='BkRadio" + t.RoomID + "'></label> \
                                            </div> \
                                        </div> \
                                        <div class='booking-room-no'> \
                                            <div class='card-header' id = 'heading" + i + "' > \
                                            <h5 class='mb-0'> \
                                                <span class='btn btn-link'> " + t.BedKey + " </span> \
                                            </h5> \
                                            </div> \
                                        </div> \
                                        <div class='booking-confirm-row'> \
                                                <div class=''> \
                                                    <div class='booking-confirmation-button'> \
                                                        <div class='continue-cancel-btn tdRoomselect' id='selectkey_"+ t.RoomID + "'></div> \
                                                    </div> \
                                                </div> \
                                            </div> \
                                        </div> \
                                    </div> \
                                    <div class='row share-rent-details'> \
                                    <div class='col col-lg-6 col-md-6 col-6 border-right'> \
                                        <div class='booking-sharing-type'> \
                                        <p class='booking-heading'>Sharing Type</p> \
                                        <div class='booking-sharing-type-img'> " + returnSharingTypes(t.BedCount) + " </div> \
                                        </div> \
                                    </div > \
                                    <div class='col col-lg-6 col-md-6 col-6 booking-rent-align'> \
                                        <div class='booking-rent-details'> \
                                            <p class='booking-heading'>Rent</p> \
                                            <div class='booking-rent-amount'> \
                                                <div class='rent'>₹ " + t.RentWithUtility + " </div> \
                                            </div> \
                                        </div> \
                                    </div> \
                                    </div> \
                                    <div class='row amenity-details'> \
                                    <div class='col col-lg-12 col-md-12 col-12'> \
                                        <div class='room-amenities'> \
                                        <p class='booking-heading'>Features</p> \
                                        <div class='feature-amenities-img'> \
                                            <div class='feature-svg' id='RoomAmenities_"+ t.RoomID + "'> " + StrAmenityImages + " </div> \
                                        </div> \
                                        </div> \
                                    </div> \
                                    </div> \
                                    <div class='row booking-confirm-row'> \
                                        <div class='col col-lg-12 col-md-12 col-12'> \
                                            <div class='booking-confirmation-button'> \
                                                <div class='continue-cancel-btn tdRoomselect' id='selectkey_"+ t.RoomID + "'></div> \
                                            </div> \
                                        </div> \
                                    </div> \
                                    <div class='booking-notice-period'><p class='booking-notice-period-content'> \
                                        " + strNoticeperiod + " </p> \
                                    </div> \
                                </div> \
                                </div > \
                            </div> \
                            </div> </div>";
                        strBedkeys += " ";
                        strBedkeys += "</div>";
                    });
                    $('#Keydetails').html(strBedkeys);
                    if (type === 1) {
                        $('#Keydetails .card,#bookingTab,#Bookinginfo').addClass('fadeInUp');
                    } else {
                        $('#Keydetails .card').removeClass('fadeInUp').addClass('fadeInUp');
                    }
                    setTimeout(function () { $('input[name="bed"]').first().prop('checked', true).trigger('change'); }, 1000);
                } else {
                    strBedkeys += "<div class='card'><div class='Nobookings'><h6>No Rooms Available</h6></div>";
                    $('#Keydetails').html(strBedkeys);
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log(ex); });
}

function returnAmenityImagesForBooking(ImagesList) {
    var strImages = '';
    if (ImagesList.length > 0) {
        $.each(ImagesList, function (i, v) {
            strImages += "<div class='position-relative'> \
                        <img src='" + v.Image + "' alt='" + v.Text + "'> \
                           <p>" + v.Text + "</p> \
                          </div>";
        });
    }
    return strImages;
}

function MoveinDatechanged() {
    var _propertyid = '';
    var text = $('#txtMoveinDate').val();
    $('#slTimeSlots').html('');

    if (text !== "") {
        if ($('#hdnIsBulkBooking').val() === "0") {
            _propertyid = $('.radioBeds:checked').data('propertyid');
        }
        else {
            _propertyid = $('.radiorooms:checked').data('propertyid');
        }
        var input = {
            date: text,
            PropertyID: "" + _propertyid + ""
        };

        var url = '/api/MyAccount/GetMoveinTimeSlots';
        APICall(url, input)
            .then(responseData => {
                var response = responseData;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === "success") {
                    if (Data.length > 0) {
                        for (var i = 0; i < Data.length; i++) {
                            $('#slTimeSlots').append($('<option>', {
                                value: Data[i].TimeId,
                                text: Data[i].TimeString
                            }));
                        }
                    } else {
                        Toast("Sorry, Please Choose Another Day ! Our Sales Ninjas Too Need A Day Off.");
                    }
                } else {
                    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                    Toast("Sorry, Please Choose Another Day ! Our Sales Ninjas Too Need A Day Off.");
                }
                if ($('#ReservationPayment:visible').length != 0) {
                    rentCalculationForBooking($('#txtCoupon').val(), $('#hdnCouponID').val(), $('#hdnIsBulkBooking').val());
                }
            }, errorMsg => { console.log(errorMsg.Message); })
            .catch(ex => { console.log('Exception: ' + ex.message); });
    }
}

function rentCalculationForBooking(valOfferCode, valCouponId, isbulkbooking) {

    var _roomid = '', _bookingtype = '', _reservationAmountType = 0;
    if (isbulkbooking == "1") {
        _roomid = $('.radiorooms:checked').data('roomid');
        _bookingtype = 1;
    }
    else {
        _roomid = $('.radioBeds:checked').data('roomid');
        _bookingtype = 2;
    }

    if ($('#rdoDeposit').is(':checked')) {
        $('#btnDepostiEMI').css("display", "none");
        $('#tacDepositemi').css("display", "none");
        $('#paymentContentRE').text("");
        $('#paymentContentDE').text("( Fastrack this booking. Pay your Security Deposit & Check-in to Colive to avail exciting offers.)");

        if ($('#rdoTotalDeposit').is(':checked') === false && $('#rdoEMIDeposit').is(':checked') === false) {
            $("#rdoTotalDeposit").prop('checked', true);
        }
        $('#paymentContentPR').text("");
        if ($('#chkProratedRent').is(':checked') === true && $('#rdoTotalDeposit').is(':checked') === true) {
            _reservationAmountType = 2;
            $('#paymentContentPR').text("( Pay from the day you choose to stay & unlock Colive benefits.)");
        } else if ($('#chkProratedRent').is(':checked') === false && $('#rdoTotalDeposit').is(':checked') === true) {
            _reservationAmountType = 1;
        }
            /*EMi Option Commented start*/
        else if ($('#rdoEMIDeposit').is(':checked') === true && $('#chkProratedRent').is(':checked') === false) {
            _reservationAmountType = 3;
            $('#btnDepostiEMI').css("display", "contents");
            $('#tacDepositemi').css("display", "block");
        }
        else if ($('#rdoEMIDeposit').is(':checked') === true && $('#chkProratedRent').is(':checked') === true) {
            _reservationAmountType = 4;
            $('#btnDepostiEMI').css("display", "contents");
            $('#tacDepositemi').css("display", "block");
            $('#paymentContentPR').text("( Pay from the day you choose to stay & unlock Colive benefits.)");
        }
         /*EMi Option Commented End*/
    } else if ($('#rdoReservation').is(':checked')) {
        _reservationAmountType = 0;
        $('#paymentContentRE').text("( To reserve this booking pay Rs. 2,000, this amount will be adjusted with your security Deposit.)");
        $('#paymentContentDE').text("");
        $('#paymentContentPR').text("");
        $("#chkProratedRent").prop('checked', false);
        $("#rdoTotalDeposit").prop('checked', false);
        $("#rdoEMIDeposit").prop('checked', false);
    }

    if ($('#txtMoveinDate').val() === '') {
        Toast("Kindly choose the Check-in date!");
        scrollTop(1000);
        $('#txtMoveinDate').focus();
    } else if ($('#slTimeSlots').val() === null) {
        Toast("Please select the move-in Time");
        scrollTop(1000);
        $('#slTimeSlots').focus();
    } else {
        var checkinDate = new Date($('#txtMoveinDate').val());
        var input = {};
        if (valOfferCode === '' && valOfferCode === 0) {
            input = {
                BookingFrom: formatDate(checkinDate),
                BookingTo: formatDate(new Date(parseInt(checkinDate.getFullYear()) + 1, checkinDate.getMonth(), checkinDate.getDate())),
                RoomIDs: _roomid,
                CustomerID: $('#hdnCustomerId').val(),
                BookingType: _bookingtype,
                ReservationAmountType: _reservationAmountType,
            };
        } else {
            input = {
                OfferCode: valOfferCode,
                BookingFrom: formatDate(checkinDate),
                BookingTo: formatDate(new Date(parseInt(checkinDate.getFullYear()) + 1, checkinDate.getMonth(), checkinDate.getDate())),
                RoomIDs: _roomid,
                CouponId: valCouponId,
                CustomerID: $('#hdnCustomerId').val(),
                BookingType: _bookingtype,
                ReservationAmountType: _reservationAmountType,
            };
        }
        var url = '/api/MyAccount/RentCalculationForBooking';
        APICall(url, input)
            .then(responseData => {
                var response = responseData;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                var Sharingtype = '';
                var BookingList = Data;
                if (BookingList.length > 0) {
                    var BookingDetails = BookingList[0];
                    if (BookingDetails.AddressFilled === 5) {
                        var ActualRent = (parseFloat(BookingDetails.ActualPricePerMonth) + parseFloat(BookingDetails.ActualFixedAmenitiesPricing) + parseFloat(BookingDetails.ActualPestControl));
                        $('#ancChooseRoom').attr('href', 'javascript:cancelBookingRequest();');
                        $('#spnRent').html('Rs. ' + ActualRent.toString());
                        $('#spnMaintenance').html(BookingDetails.FixedAmenitiesPricing);
                        $('#spnAdvance').html('Rs. ' + BookingDetails.Advance);
                        $('#spnDiscount').html(BookingDetails.DiscountValue);
                        $('#spnTotalPayable').html('Rs. ' + BookingDetails.TotalReservationAmount);
                        $('#spnReservation').html('Rs. ' + BookingDetails.ReservationAmount);
                        $('#spnProratedRent').html('Rs. ' + (BookingDetails.PricePerMonth + BookingDetails.FixedAmenitiesPricing));
                        $('#spnLockinPeriod').html(returnwithmonths(BookingDetails.Lockinperiod));
                        $('#spnNoticePeriod').html(returnwithmonths(BookingDetails.NoticePeriod));
                        $('#spnRoomNumber').html(BookingDetails.RoomName);
                        $('.radioBeds').attr('disabled', 'true');
                        $('#referheader').html(BookingDetails.ReferralTitle);
                        $('#spnreferralDesc').html(BookingDetails.ReferralDescription);
                        $('#ReservationFilter').addClass('fadeOutLeft').hide(1000);
                        $('#Keydetails .card,#bookingTab,#Bookinginfo').removeClass('fadeInUp').addClass('fadeOutRight');
                        $('#myFilterBtn').hide();
                        setTimeout(function () {
                            $('#Bookinginfo').hide(100);
                            $('#KeysContainer').slideUp(500);
                            $('#PrivateSharecontainer').hide(100);
                            $('#ReservationPayment').slideDown(500);
                            $('#dvReservationDetails').removeClass('container-fluid').addClass('container');
                            $('#dvCheckinDetails').removeClass('col-lg-9 col-md-9').addClass('p-0');
                        }, 1000);
                        if ($('#rdoReservation').is(':checked')) {
                            $('#paymentContentRE').text("( To reserve this booking pay Rs. " + BookingDetails.ReservationAmount + ", this amount will be adjusted with your security Deposit.)");
                            $('#paymentContentDE').text("");
                            $('#paymentContentPR').text("");
                        }
                        if ($('#hdnCouponID').val() === "0") {
                            //  scrollTop(1000);
                        }
                        var valDefaultCouponAmount = 0;
                        if (parseInt(BookingDetails.DefaultCouponId) > 0) {
                            valDefaultCouponAmount = BookingDetails.DefaultCouponAmount;
                        }
                        var iHTML = "";
                        if (valOfferCode == '' && valOfferCode == 0) {
                            if (isbulkbooking == "0") {
                                $("#SelectedBed").html(GetBedkeySummary());
                            }
                            else {
                                $("#SelectedBed").html(GetBedkeySummary());
                            }
                            if (parseInt(BookingDetails.DefaultCouponId) > 0) {
                                let newRent = parseFloat(BookingDetails.RentWithUtility) - parseFloat(valDefaultCouponAmount);
                                iHTML = iHTML + "<strike style='color:#f00;'>Rs." + parseFloat(BookingDetails.RentWithUtility) + "</strike> &nbsp;Rs." + newRent + "";
                                $('#ulSelectedBeds .bedsRent').html(iHTML);
                                $('#spnRent').html('');
                                ActualRent = parseFloat(ActualRent) - parseFloat(valDefaultCouponAmount);
                                $('#spnRent').html(iHTML);
                            }
                            if (input.ReservationAmountType === 2 && BookingDetails.IsKYCFilled !== true) {
                                $('#kycmodal').modal('show');
                                $('#btnReservationConfirmation').hide();
                                Toast('Please complete your KYC Before Proceed further');
                            } else {
                                $('#btnReservationConfirmation').show();
                            }
                        } else {
                            if (isbulkbooking == "0") {
                                $("#SelectedBed").html(GetBedkeySummary());
                            }
                            else {
                                $("#SelectedBed").html(GetBedkeySummary());
                            }
                            let newRent = parseFloat(BookingDetails.RentWithUtility) - parseFloat(BookingDetails.CouponAmount) - parseFloat(valDefaultCouponAmount);
                            iHTML = iHTML + "<strike style='color:#f00;'>Rs." + parseFloat(BookingDetails.RentWithUtility) + "</strike> &nbsp;Rs." + newRent + "";
                            $('#ulSelectedBeds .bedsRent').html(iHTML);
                            $('#spnRent').html('');
                            ActualRent = parseFloat(ActualRent) - parseFloat(BookingDetails.CouponAmount) - parseFloat(valDefaultCouponAmount);
                            $('#spnRent').html(iHTML);
                            /*Double Deducation Secutiry Deposit*/
                            if (parseInt(BookingDetails.DepositCouponAmount) > 0) {
                                var sdHTML = "";
                                let newSecuityDeposit = parseFloat(BookingDetails.Advance) - parseFloat(BookingDetails.DepositCouponAmount);
                                sdHTML = sdHTML + "<strike style='color:#f00;'>Rs." + parseFloat(BookingDetails.Advance) + "</strike> &nbsp;Rs." + newSecuityDeposit;
                                $('#spnAdvance').html(sdHTML);
                            }

                            if (input.ReservationAmountType === 2 && BookingDetails.IsKYCFilled !== true) {
                                $('#kycmodal').modal('show');
                                $('#btnReservationConfirmation').hide();
                                Toast('Please complete your KYC Before Proceed further');
                            } else {
                                $('#btnReservationConfirmation').show();
                            }
                        }
                        if (valOfferCode !== '') {
                            if (valCouponId === 32) {
                                $("#btnRemove").show();
                                $('#spnCouponMsg').html('Promo Applied Successfully').fadeIn();
                                $('#btnPromoApply').val('Cancel').addClass('success');
                            } else if (valCouponId === 55) {
                                $("#btnRemove").show();
                                $('#spnCouponMsg').html('*47% off on your colive home 2nd month rent. Applicable only if you move-in to your colive home on or before 18th Aug').fadeIn();
                                $('#btnPromoApply').val('Cancel').addClass('success');
                            } else {
                                if (BookingDetails.CouponAmount > 0) {
                                    $('#btnPromoApply').val('Cancel').addClass('success');
                                    $('#spnCouponMsg').html('Discount of Rs.' + BookingDetails.CouponAmount + ' Applied Successfully').fadeIn();
                                } else {
                                    $('#txtCoupon').val("");
                                    $("#btnPromoApply").html("Apply").removeClass('success');
                                    $("#btnRemove").hide();
                                    $('#txtCoupon').removeAttr('disabled');
                                    $('#spnCouponMsg').html('Invalid Coupon').fadeIn();
                                }
                            }
                        }
                    } else {
                        DefaultAddressConfig(1);
                        EnableAddressFormValidators(1);
                        $('#txtPincode1,#txtStreet1,#txtHouseNumber1').val('');
                        $('#addressmodal').modal('show');
                    }
                    var EMiOptions = BookingDetails.EMIOptions;
                    var strEMiOptions = '';
                    $.each(EMiOptions, function (i, v) {
                        strEMiOptions += "<tr> \
                              <td scope='row'> \
                               " + v.Months+ " \
                              </td>\
                                <td>₹ " + v.EMI+ "</td> \
                              <td>₹ " + ConverToRupees(v.OverallEMI)+ "</td> \
                             </tr> ";
                    });
                    $('#EMIOptions').html(strEMiOptions);
                } else {
                    alert('Booking Failed !');
                }

            }, errorMsg => { console.log(errorMsg.Message); })
            .catch(ex => { console.log('Exception: ' + ex.message); })
            .finally(() => { $(".se-pre-prop").fadeOut("slow"); });
    }
}

// PropertyDetails Page functions Start
function GetPrivateBookingPropertyDetailsById(sublink) {
    var objPropertyDto = {
        LocationLink: "" + sublink + ""
    };
    var url = '/api/Colive/GetPropertyDetailsById';
    APICall(url, objPropertyDto)
        .then(responseData => {
            var Status = responseData.Status,
                Message = responseData.Message,
                Data = responseData.Data;
            if (Status === 'success') {
                var PropertyList = Data.Property;
                if (PropertyList.length > 0) {
                    var PropertyData = PropertyList[0];
                    var obj = {
                        PropertyID: PropertyData.PropertyID
                    };
                    BindPropertyAvailability_PrivateBooking(obj, 1);
                } else {
                    window.history.back(2);
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

function BindPropertyAvailability_PrivateBooking(input, type) {
    var url = '/api/MyAccount/GetPrivateBookingAvailableByPropertyId';
    APICall(url, input, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var strBedkeys = "",
                    occ = "",
                    strbulkbooking = "";
                var RoomsList = Data.BedKeyDetails;
                if (type === 1) {
                    EquipReservationFilter(Data.FilterMaster, 2);
                }
                var n = 0;
                if (RoomsList.length > 0) {
                    $.each(RoomsList, function (i, t) {
                        var strRoomIds = "";
                        strLocationId = "";
                        n += 1;
                        var strNoticeperiod = "";
                        var StrAmenityImages = returnAmenityImagesForBooking(t.Images);
                        if (t.OnNoticePeriod === true) {
                            strNoticeperiod = "<span class='noticeperiodkey'>Room will be available from " + t.NoticePeriodEndDate + "</span>";
                        }
                        strBedkeys += "<div class='booking-card-design card col col-lg-6 col-md-6 col-12 p-0 animated " + (n % 2 === 0 ? 'cardright' : 'cardleft') + "  " + (i > 3 ? 'delay-2s' : '') + "'> \
                <div class='booking-card'> \
                    <div class=''> \
                        <div class='booking-overview'> \
                            <div class='row booling-property-details'> \
                                <div class='col col-lg-12 col-md-12 col-12'> \
                                    <div class='booking-selection'> \
                                <div class='form-check'> \
                                            <input class='form-check-input radiorooms' type='radio' name='privateroom' id='roomsRadio" + t.RoomID + "' value='" + t.RoomID + "' data-offer='" + t.OfferCode + "' data-propertyid='" + input.PropertyID + "' data-rent='" + t.RentWithUtility + "' data-maintenance='" + t.FixedAmenitiesPricing + "' \
                                        data-share='" + t.RoomTypeId + "' data-type='" + t.RoomSubTypeId + "' data-bath='" + t.RoomClassId + "' data-roomid='" + t.RoomID + "' data-bedkeysid='" + t.BedKeysId + "' data-noticeperiodenddate='" + t.NoticePeriodEndDate + "' data-bedcount='" + t.BedCount + "'> \
                                            <label class='form-check-label' for='roomsRadio" + t.RoomID + "'></label> \
                                        </div> \
                                    </div> \
                                <div class='booking-room-no'> \
                                        <div class='card-header' id='heading" + i + "'> \
                                            <h5 class='mb-0'> \
                                                <span class='btn btn-link'> \
                                                " + t.ApartmentName + " \
                                                    </span> \
                                            </h5> \
                                        </div> \
                                    </div> \
                                <div class='booking-confirm-row'> \
                                        <div class=''> \
                                         <div class='booking-confirmation-button'> \
                                         <div class='continue-cancel-btn tdRoomselect' id='selectkeyprivate_" + t.RoomID + "'></div> \
                                            </div> \
                                        </div> \
                                    </div> \
                                </div > \
                            </div > \
                                <div class='row share-rent-details'> \
                                <div class='col col-lg-6 col-md-6 col-6 border-right'> \
                                    <div class='booking-sharing-type'> \
                                        <p class='booking-heading'>Number of Beds</p> \
                                        <div class='booking-sharing-type-img'> " + returnBedIconsbyCount(t.BedCount) + " </div> \
                                    </div> \
                                </div> \
                                <div class='col col-lg-6 col-md-6 col-6 booking-rent-align'> \
                                    <div class='booking-rent-details'> \
                                        <p class='booking-heading'>Rent</p> \
                                        <div class='booking-rent-amount'> \
                                            <div class='rent'>₹ " + t.RentWithUtility + " </div> \
                                        </div> \
                                    </div> \
                                </div> \
                            </div> \
                                <div class='row amenity-details'> \
                                <div class='col col-lg-12 col-md-12 col-12'> \
                                    <div class='room-amenities'> \
                                        <p class='booking-heading'>Features</p> \
                                        <div class='feature-amenities-img'> \
                                            <div class='feature-svg' id='RoomPrivate_"+ t.RoomID + "'> " + StrAmenityImages + " </div> \
                                        </div> \
                                    </div> \
                                </div> \
                            </div> \
                                <div class='row booking-confirm-row'> \
                                <div class='col col-lg-12 col-md-12 col-12'> \
                                    <div class='booking-confirmation-button'> \
                                        <div class='continue-cancel-btn tdRoomselect' id='selectkeyprivate_"+ t.RoomID + "'></div> \
                                    </div> \
                                </div> \
                            </div> \
                                <div class='booking-notice-period'> \
                                    <p class='booking-notice-period-content'> " + strNoticeperiod + " </p> \
                            </div> \
                        </div > \
                    </div > \
                </div > \
            </div>";
                        strRoomIds += t.RoomID + ",";
                        strLocationId = t.LocationID;
                    });

                    $('#PrivateKeyDetails').html(strBedkeys);
                    $('#PrivateKeyDetails .card').removeClass('fadeInUp').addClass('fadeInUp');
                    $(".btn-link").click(function () {
                        $(this).find(".fa").toggleClass('rotate-angledown');
                    });
                    setTimeout(function () { $('input[name="privateroom"]').first().prop('checked', true).trigger('change'); }, 1000);
                }
                else {
                    strBedkeys += "<div class='card'> \
                                        <div class='Nobookings'><h6>No Rooms Available</h6></div>";
                    $('#PrivateKeyDetails').html(strBedkeys);
                    $('#my-list-Private').html("<div class='card'> \
                                        <div class='Nobookings'><h6>No Filters Available</h6></div>");
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log(ex); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}

function GetManagerAndSource() {

    var url = '/api/MyAccount/GetManagerAndSourceDetails';
    APICall(url, {})
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {

                var SalesManager = Data.SalesManagers;
                var Source = Data.Source;
                $.each(SalesManager, function (i, v) {
                    $('#ManagerDrpdwn').append($('<option>', {
                        value: v.Id,
                        text: v.Name
                    }));
                });

                $.each(Source, function (i, v) {
                    $('#SourceDrpdwn').append($('<option>', {
                        value: v.Id,
                        text: v.Name
                    }));
                });
                chatbotconfig();
            } else {
                console.log("status: " + Status + ",message: " + Message + ",Data: " + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

function GetOthers(type) {
    if (type === 1) {
        var Managerdropdownvalue = $('#ManagerDrpdwn').val();
    } else {
        var Sourcedropdownvalue = $('#SourceDrpdwn').val();
        if (Sourcedropdownvalue === "13" || Sourcedropdownvalue === "21") {
            $('.otherSource').fadeIn(1000);
            if (Sourcedropdownvalue === "21") {
                $('#txtSource').attr("placeholder", "Enter company name");
            } else {
                $('#txtSource').attr("placeholder", "Enter Source");
            }
        } else {
            $('.otherSource').fadeOut(1000);
        }

    }
}


function getPropertyview(response) {
    $('#QviewPropertyImages').html('');
    $('#QviewPropertyImages').owlCarousel('destroy');
    var Status = response.Status,
        Message = response.Message,
        Data = response.Data;
    if (Status === 'success') {
        var strPropImages = '';
        if (Data.Property.length > 0) {
            var PropertyData = Data.Property[0];
            $('#spnQviewPropertyName').html(PropertyData.PropertyName);
            $('#spnQviewPropaddr').html(PropertyData.Landmark);
            $('#spnQviewPropDesc').html(PropertyData.LocationDescription);
            $('#hdnQviewLatLong').val(PropertyData.Latitude + ',' + PropertyData.Longitude);
            var QviewPropertyimagesList = PropertyData.Images;
            if (QviewPropertyimagesList.length > 0) {
                $.each(QviewPropertyimagesList, function (i, v) {
                    strPropImages += "<div class='item'> \
                                <div class='carousel-img' > \
                                    <img src='" + v.DetailedImage + "' alt='" + v.ImageType + "' class='Qviewproperty-img'> \
                                    </div> \
                                </div>";
                });
                $('#QviewPropertyImages').append(strPropImages);
                $('#QviewPropertyImages').owlCarousel({
                    loop: true,
                    margin: 10,
                    nav: true,
                    pagination: true,
                    responsive: {
                        0: {
                            items: 1
                        },
                        600: {
                            items: 1
                        },
                        1000: {
                            items: 1
                        }
                    }
                });

            }
            $(".Qviewproperty-img").on("error", function (e) {
                this.src = "/assets/images/marathalli.jpg";
            });
            GetPropertyAvailablityDetails(PropertyData.PropertyID);
        } else {
            window.location.href = '/';
        }
    } else {

        console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
    }
}

function BindQuickview(obj) {
    var sublink = obj.data('link').replace(/%20/g, "");
    GetPropertyDetailsById(sublink);
    $('#knowMore_button').attr('href', '/property?location=' + sublink);
}

function BindPropertyAvailability_Quickview(response) {
    $('#QviewKeyDetails').html('');
    var Status = response.Status,
        Message = response.Message,
        Data = response.Data;
    if (Status === 'success') {
        var PropertyList = Data,
            CommonDetails = {},
            strKeyDetails = '';
        if (PropertyList.length > 0) {
            CommonDetails = PropertyList[0];
            $.each(PropertyList, function (i, v) {
                strKeyDetails += "<tr> \
                              <td scope='row'> \
                               " + returnSharingTypes(v.BedCount) + " \
                              </td> \
                             <td>" + v.RoomSubType + "</td> \
                             <td> \
                             <div class='feature-svg'> \
                               " + returnAmenitiesImageDetails(v.Images) + " \
                      </div> \
                  </td> \
          <td>₹ " + ConverToRupees(v.PricePerMonth) + "</td> \
         </tr> ";
            });
            $('#QviewKeyDetails').append(strKeyDetails);
            $('#spnQviewDepositDuration').html(returnwithmonths(CommonDetails.DepositInMonthPropertyLevel));
            $('#spnQviewNoticeDuration').html(returnwithmonths(CommonDetails.NoticePeriodPropertyLevel));
            $('#spnQviewlockinDuration').html(returnwithmonths(CommonDetails.LockinPeriodPropertyLevel));
            $('[data-toggle="tooltip"]').tooltip();
        } else {
            $('#RoomDetails').hide();
        }
    } else {
        console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
    }
}

function validateCoupon() {
    var btntext = $('#btnPromoApply').val();
    var _roomid = '', _bookingtype = 2;
    if (btntext === "Apply") {

        if ($('#txtCoupon').val() === "") {
            Toast('Please enter a valid coupon !');
            return;
        }
        if ($('#hdnIsBulkBooking').val() == "1") {
            _roomid = $('.radiorooms:checked').data('roomid');
            _bookingtype = 1;
        }
        else {
            _roomid = $('.radioBeds:checked').data('roomid');
            _bookingtype = 2;
        }

        var input = {
            OfferCode: $('#txtCoupon').val(),
            RoomID: _roomid,
            CustomerID: $('#hdnCustomerId').val(),
            BookingType: _bookingtype
        };

        var url = '/api/MyAccount/ValidateCoupon';
        APICall(url, input)
            .then(responseData => {
                var response = responseData;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === 'success') {
                    var CouponList = Data.CouponValidation;
                    if (CouponList.length > 0) {
                        var CouponData = CouponList[0];
                        if (CouponData.ValidationStatus === 1) {
                            $('#btnPromoApply').val('Cancel');
                            $('#txtCoupon').addClass('success');
                            $('#hdnCouponID').val(CouponData.CouponId);
                            $('#txtCoupon').attr('disabled', 'true');
                            rentCalculationForBooking(input.OfferCode, CouponData.CouponId, $('#hdnIsBulkBooking').val());
                        } else {
                            Toast('Please enter a valid coupon !');
                            $('#txtCoupon').val("");
                            $('#btnPromoApply').val("Apply");
                            $('#txtCoupon').removeClass('success');
                        }
                    } else {
                        Toast('Please enter a valid coupon !');
                        $('#txtCoupon').val("");
                        $('#btnPromoApply').val("Apply");
                        $('#txtCoupon').removeClass('success');
                    }
                } else {
                    Toast('Please enter a valid coupon !');
                    $('#txtCoupon').val("");
                    $('#btnPromoApply').val("Apply");
                    $('#txtCoupon').removeClass('success');
                    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                }
            }, errorMsg => { console.log(errorMsg.Message); })
            .catch(ex => { console.log('Exception: ' + ex.message); })
            .finally(() => { $(".se-pre-prop").fadeOut("slow"); });
    } else {
        $('#txtCoupon').val('');
        $('#spnCouponMsg').html('');
        $('#spnCouponMsg').fadeOut();
        setTimeout(function () { $('#hdnCouponID').val(0); }, 1000);
        $('#txtCoupon').removeAttr('disabled');
        $("#btnPromoApply").val("Apply");
        $('#txtCoupon').removeClass('success');
        rentCalculationForBooking("", 0, $('#hdnIsBulkBooking').val());
    }
}

function validateReferralCode() {
    var btntext = $('#btnReferralApply').val();
    if (btntext === "Apply") {
        if ($('#TxtReferral').val() === "") {
            Toast('Please enter a valid referral code.');
            return;
        }
        var input = {
            ReferralCode: $('#TxtReferral').val(),
            CustomerID: $('#hdnCustomerId').val()
        };
        var url = '/api/MyAccount/ValidateReferralCode';
        APICall(url, input)
            .then(responseData => {
                var response = responseData;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === 'success') {
                    var referralList = Data.ReferralCodeValidation;
                    if (referralList.length > 0) {
                        var referralDetails = referralList[0];
                        if (referralDetails.ValidationStatus === 1) {
                            $('#SpnReferralMsg').fadeIn();
                            $('#SpnReferralMsg').html(referralDetails.ValidationMessage);
                            $('#hdnReferralCode').val(referralDetails.ReferralCode);
                            $('#TxtReferral').prop("disabled", true);
                            $('#btnReferralApply').val('Cancel');
                        } else {
                            Toast(referralDetails.ValidationMessage);
                            $('#TxtReferral').val("");
                            $('#hdnReferralCode').val(0);
                            $('#TxtReferral').prop("disabled", false);
                        }
                    } else {
                        Toast('Please enter a valid referral code');
                        $('#TxtReferral').val("");
                        $('#hdnReferralCode').val(0);
                        $('#TxtReferral').prop("disabled", false);
                    }
                } else {
                    Toast('Please enter a valid referral code');
                    $('#TxtReferral').val("");
                    $('#hdnReferralCode').val(0);
                    $('#TxtReferral').prop("disabled", false);
                    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                }
            }, errorMsg => { console.log(errorMsg.Message); })
            .catch(ex => { console.log('Exception: ' + ex.message); });
    } else {
        $('#TxtReferral').val('');
        $('#SpnReferralMsg').html('');
        $('#SpnReferralMsg').fadeOut();
        $('#btnReferralApply').val('Apply');
        $('#hdnReferralCode').val(0);
        $('#TxtReferral').prop("disabled", false);
    }
}


function bookingInsert() {
    var _propertyid = '', _roomTypeId = '', _roomSubTypeId = '', _roomClassId = '', _roomIDs = ''; _bookingtype = 2, _bulkBookingKeys = '';

    if ($('#ChkAgree').prop('checked') === false) {
        Toast("Kindly agree to the terms and conditions!");
    } else if ($('#ManagerDrpdwn').val() == 0) {
        Toast("Please select sales manager");
    } else if ($('#SourceDrpdwn').val() == 0) {
        Toast("Please select source");
    } else if ($('#ManagerDrpdwn').val() == -1 && $('#txtManagerName').val() == "") {
        Toast("Please enter manager name");
    } else if ($('#SourceDrpdwn').val() == 13 && $('#txtSource').val() == "") {
        Toast("Please enter source");
    } else if ($('#SourceDrpdwn').val() == 21 && $('#txtSource').val() == "") {
        Toast("Please enter company name");
    } else {
        if ($('#hdnIsBulkBooking').val() === "0") {
            _propertyid = $('.radioBeds:checked').data('propertyid');
            _roomTypeId = $('.radioBeds:checked').data('share');
            _roomSubTypeId = $('.radioBeds:checked').data('type');
            _roomClassId = $('.radioBeds:checked').data('bath');
            _roomIDs = $('.radioBeds:checked').data('roomid');
            _bookingtype = 2;
        }
        else {
            _propertyid = $('.radiorooms:checked').data('propertyid');
            _roomTypeId = $('.radiorooms:checked').data('share');
            _roomSubTypeId = $('.radiorooms:checked').data('type');
            _roomClassId = $('.radiorooms:checked').data('bath');
            _roomIDs = $('.radiorooms:checked').data('roomid');
            _bookingtype = 1;
            _bulkBookingKeys = $('.radiorooms:checked').data('bedkeysid');
        }
        var checkinDate = new Date($('#txtMoveinDate').val());
        var _reservationAmountType = 0;

        if ($('#chkProratedRent').is(':checked') === true && $('#rdoTotalDeposit').is(':checked') === true) {
            /*Check-In */
            _reservationAmountType = 2;
            $('#paymentContentPR').text("( Pay from the day you choose to stay & unlock Colive benefits.)");
        } else if ($('#chkProratedRent').is(':checked') === false && $('#rdoTotalDeposit').is(':checked') === true) {
            /*Reservation*/
            _reservationAmountType = 1;
        }
        else if ($('#rdoEMIDeposit').is(':checked') === true && $('#chkProratedRent').is(':checked') === false) {

            /*Reservation*/
            _reservationAmountType = 3;
        }
        else if ($('#rdoEMIDeposit').is(':checked') === true && $('#chkProratedRent').is(':checked') === true) {
            /* Check-In */
            _reservationAmountType = 4;
        }

        var input = {
            CustomerID: $('#hdnCustomerId').val(),
            CreatedBy: 21,
            BookingID: 0,
            BookingFrom: formatDate(checkinDate),
            TentativeCheckinDate: formatDate(checkinDate),
            BookingTo: formatDate(new Date(parseInt(checkinDate.getFullYear()) + 1, checkinDate.getMonth(), checkinDate.getDate())),
            BookingIP: "",
            BookingStatusId: 2,
            IsFromWebsite: false,
            PropertyID: _propertyid,
            CheckInTime: $('#slTimeSlots').val(),
            RoomTypeId: _roomTypeId,
            RoomSubTypeId: _roomSubTypeId,
            RoomClassId: _roomClassId,
            RoomIDs: _roomIDs,
            CouponId: $('#hdnCouponID').val(),
            OfferCode: $("#txtCoupon").val(),
            ManagerID: $('#ManagerDrpdwn').val(),
            BookingType: _bookingtype,
            BedKeysId: _bulkBookingKeys,
            OtherManagerName: "",
            SourceID: $('#SourceDrpdwn').val(),
            OtherSource: $('#txtSource').val() == "" ? "" : $('#txtSource').val(),
            SourceType: 1,
            CustomerDetails: {
                IsReservation: true,
                IsAdvanceBooking: true,
                IsWaivedOff: false,
                ADCReceiptNumber: "testFromARC",
                ModeOfPayment: "CCAvenue",
                PaymentStatusId: 1,
                IsConfirming: false,
                ADCProof: "",
                IsToGateway: true,
                PreviousDue: 0,
                AdditionalCharges: []
            },
            ImageUploadList: [],
            ReferralCode: $('#hdnReferralCode').val() == 0 ? "" : $('#hdnReferralCode').val(),
            PaymentApp: 4,
            ReservationAmountType: _reservationAmountType,
        };

        var url = '/api/MyAccount/ReservationConfirmation';
        APICall(url, input, true)
            .then(responseData => {
                var response = responseData;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status == 'success') {
                    var ConfirmationDetails = Data;
                    if (ConfirmationDetails.AddressFilled === 5) {
                        if (ConfirmationDetails.IsNewPay === undefined) {
                            var paymentGateway = ConfirmationDetails.StrEncRequest;
                            var strRedirectLink = ConfirmationDetails.RedirectURL;
                            RedirectToPaymentGateway(strRedirectLink, paymentGateway);
                        }
                        else if (Data.IsNewPay === 1) {
                            $('#OrderId').val(ConfirmationDetails.OrderId);
                            $("#fmPayment").submit();
                        }
                    } else {
                        Toast('Please Fill Your Address Details!');
                    }
                } else {
                    Toast('Booking failed! Kindly try again later!');
                    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                }
            }, errorMsg => { console.log(errorMsg.Message); })
            .catch(ex => { console.log('Exception: ' + ex.message); })
            .finally(() => { $('#AjaxLoader').fadeOut(500); });
    }
}


function RedirectToPaymentGateway(strRedirectLink, paymentGateway) {
    var input = {
        LocationLink: strRedirectLink,
        paymentGateway: paymentGateway
    };
    var url = '/api/MyAccount/PaymentGatewayRedirection';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                window.location = "/pay/ccavRequestHandler.aspx";
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                Toast('Payment Failed ! Please try again later');
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

function cancelBookingRequest() {

    if ($('#hdnTransferStatusId').val() === "0") {
        $('.radioBeds').removeAttr('disabled');
        $('#txtMoveinDate').val(formatDate(new Date));
        $('.radioBeds').prop('checked', false);
        $('.radiorooms').prop('checked', false);
        $('.radioBeds').first().prop('checked', true);
        $('.radiorooms').first().prop('checked', true);
        $('#chkAgree').prop('checked', false);
        $('#PrivateSharecontainer').show(100);
        $('#Bookinginfo').show(100);
        $('#KeysContainer').slideDown(500);
        $('#ReservationPayment').slideUp(500);
        $('#txtCoupon').val('');
        $('#spnCouponMsg').html('');
        $('#hdnCouponID').val('');
        $('#hdnRoomId').val('0');
        $('#hdnBedKeyIds').val('');
        $('#txtCoupon').removeAttr('disabled');
        $("#btnPromoApply,#btnReferralApply").val('Apply');
        $('.otherSource').fadeOut(1000);
        $("#ManagerDrpdwn").val($("#ManagerDrpdwn option:first-child").val());
        $("#SourceDrpdwn").val($("#SourceDrpdwn option:first-child").val());
        $('#txtSource').val("");
        $('#ancChooseRoom').attr('href', 'javascript:cancelBookingRequest();');
        if (Windowidth > 727) {
            $('#ReservationFilter').removeClass('fadeOutLeft').addClass('fadeInLeft').show();
        }
        if (Windowidth < 727) {
            $('#myFilterBtn').show();
        }
        $('#dvReservationDetails').removeClass('container').addClass('container-fluid');
        $('#dvCheckinDetails').addClass('col-lg-9 col-md-9').removeClass('p-0');
        $('#Keydetails .card,#bookingTab,#Bookinginfo').removeClass('fadeOutRight').addClass('fadeInUp');

        clearfilter();
        scrollTop(1000);
    }
    else {
        $('#hdnTransferStatusId').val("0");
        window.location.href = '/Dashboard';
    }
}

// CustomerMapping
function reponseFromSocialMedia(resp, openSignup) {
    var input = {
        FirstName: resp.given_name,
        LastName: resp.family_name,
        EmailId: resp.email
    };
    var url = '/api/MyAccount/CustomerMapping';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                //Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var social = Data;
                if (social.length > 0) {
                    var loginDetails = social[0];
                    if (loginDetails.Status == true) {
                        var input = {
                            Email: resp.email,
                            IsSocialLogin: true
                        };
                        loginAPICall(input);
                    } else if (openSignup == false) {
                        $('#first-name').val(resp.given_name);
                        $('#last-name').val(resp.family_name);
                        $('.firstname').val($('#first-name').val() + ' ' + $('#last-name').val());
                        $('#signup-phone').val('');
                        $('#signup-email').val(resp.email);
                        $('#signup-password').val('');
                        $('#signup-password').val('1');
                        $('#signup-password').attr('disabled', 'disabled');
                        $('#password-confirmation').val('1');
                        $('#password-confirmation').attr('disabled', 'disabled');
                    } else {
                        Toast('Sorry, we are unable to match your record in our system');
                        setTimeout(function () { window.location = '/signup'; }, 3000);
                    }
                }
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

function BindcustomerDetails() {
    var url = '/api/MyAccount/GetLoginDetails';
    APICall(url, null)
        .then(responseData => {
            var response = responseData;
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
                $('#hdnBookingId').val(CustomerDetails.BookingID);
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
                switch ($('title').data('desc')) {
                    case "factsheet":
                        GetTransferDetails(1);
                        if (CustomerDetails.IsCoTenant) {
                            $('#ancBooknow,#book-first').hide();
                            $('#ancBooknow,#schedule-btn').hide();
                            $('#hdnCustomerId').val(CustomerDetails.CustomerID);
                            $('#PropertyControls').css('display', 'none');
                            //PropertyControls
                            //$('#schedule-btnheader').prop('disabled', true);
                        }
                        break;
                    case "dashboard":
                        if (CustomerDetails.IsCoTenant) {
                            $('#ulDashboardTabs li').not('#liBookings,#liServiceRequests').hide();
                        }
                        break;
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
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

function UserLogout() {
    var url = '/api/MyAccount/UserLogout';
    APICall(url, null)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                BindcustomerDetails();
                window.location.href = '/';
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}



function BindCustomerBookingHistory() {
    $('#ReservationCardContainer,#CurrentBookingsContainer,#MoveinContainer,#PreviousBookingContainer,#servicerequestcard').html('');
    var input = {
        CustomerID: $('#hdnCustomerId').val()
    };
    var url = '/api/MyAccount/BindCustomerBookingHistory';
    APICall(url, input, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var CurrentList = Data.Current;
                var PreviousList = Data.Previous;
                var CheckoutList = PreviousList.filter(function (List) { return List.BookingStatusId === 6; });
                if (CurrentList.length > 0) {
                    var Reservlist = CurrentList.filter(function (List) { return List.BookingStatusId === 2; });
                    var Currlist = CurrentList.filter(function (List) { return List.BookingStatusId === 1 && (List.KeyReceivedStatus === -1 || List.KeyReceivedStatus === 1); });
                    var MoveInlist = CurrentList.filter(function (List) { return List.BookingStatusId === 1 && List.KeyReceivedStatus === 0; });
                    BindReservation(Reservlist);
                    BindCurrentBookingHistory(Currlist);
                    BindMoveInHistory(MoveInlist);
                } else {
                    $('#ReservationCardContainer').append('<div class="Nobookings"><img src="/assets/images/dashboard-bookings/apartment.svg" /><h6>No Reservations Found</h6></div >');
                    $('#CurrentBookingsContainer').append('<div class="Nobookings"><img src="/assets/images/dashboard-bookings/apartment.svg" /><h6>No Check-in\'s Found</h6></div>');
                    $('#MoveinContainer').append('<div class="Nobookings"><img src="/assets/images/dashboard-bookings/apartment.svg" /><h6>No Move-in\'s Found</h6></div>');
                }
                BindPreviousBookingList(PreviousList);
                BindBookingDetailsForServiceRequest(CurrentList, 1);
                BindBookingDetailsForServiceRequest(CheckoutList, 2);
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}


function BindReservation(Reservlist) {
    var StrReservation = '';
    if (Reservlist.length > 0) {
        $.each(Reservlist, function (i, v) {
            StrReservation += "<div class='col-lg-6 col-md-6 col-12 pl-0'> \
                             <div class='card-wrap'> \
                                 <div class='card-img'> \
                                     <img src='" + v.PropertyImage + "' class='property-img'  alt='" + v.PropertyName + "'> \
                                     <p class='date-on-hover'>" + v.CheckinDate + ", " + v.CheckinTime + " </p> \
                                 </div> \
                                 <div class='card-info'> \
                                     <div class='card-detail'> \
                                         <div class='card-title'> \
                                             <p>" + v.PropertyName + "</p> \
                                             <span> \
                                                 <img src='/assets/images/location.png' alt=''>" + v.Address + "</span> \
                                         </div> \
                                         <div class='like-share'> \
                                             <img src='/assets/images/share.png'> \
                                             <i class='fa fa-heart-o'></i> \
                                         </div> \
                                     </div> \
                                     <div class='pricing-rating'> \
                                         <div class='price'> \
                                             <p>Starting price</p> \
                                             <p>₹ " + ConverToRupees(v.Rent) + "</p> \
                                         </div> \
                                         <div class='rating' > \
                                         <p>3.5/5</p> \
                                         <p class='stars'> \
                                                 <i class='fa fa-star' aria-hidden='true'></i> \
                                                 <i class='fa fa-star' aria-hidden='true'></i> \
                                                 <i class='fa fa-star' aria-hidden='true'></i> \
                                                 <i class='fa fa-star' aria-hidden='true'></i> \
                                                 <i class='fa fa-star' aria-hidden='true'></i> \
                                             </p>  \
                                         </div> \
                                     </div>\
                                     <div class='cancel-request request-checkin'> \
                                         <input type='button' class='reschedule' id='btnBookingId_" + v.BookingID + "' value='Check-in' onclick='GetcheckinDetails(\"" + v.BookingID + "\",\"0\",undefined,1);' style='display: " + (v.IsCotenant === false ? 'block' : 'none')+"' /> \
                                         <span class='NoticeperiodKey' style='display: " + (v.IsDonePreviousBookingCheckout === true ? 'block' : 'none') + "'>Key will be available from " + v.NoticePeriodEndDate + "</span> \
                                     </div> \
                                 </div> \
                             </div> \
                         </div>";
        });
        $('#ReservationCardContainer').append(StrReservation);
        $(".property-img").on("error", function (e) {
            this.src = "/assets/images/marathalli.jpg";
        });
    } else {
        $('#ReservationCardContainer').append('<div class="Nobookings"><img src="/assets/images/dashboard-bookings/apartment.svg" /><h6>No Reservations Found</h6></div >');
    }
}


function GetcheckinDetails(bookingID, CouponID, PaymentDate,IsReservation = 0,PayableOptionTypeId) {
    var _reservationAmountType = "5";
    $('#hdnBookingIdchk').val(bookingID);
    $('#hdnCouponID').val(CouponID);
    $('#spnPropertyName,#spnPropertyAddress,#spnRoomName,#spnBedkey,#spnSharingType').html('');
    $('#paymentDetailsContainer').html('');
    $('#btnDepostiEMI').css("display", "none");
    $('#tacDepositemi').css("display", "none");
    if (PayableOptionTypeId == "0") {
          /*EMi Option Commented start*/
        //Oringal change 
        $('#checkInDepositEMI').css('display', 'block');
            //$('#checkInDepositEMI').css('display', 'none');
         /*EMi Option Commented End*/
        $("#rdoTotalDeposit").removeAttr('disabled');
        $("#rdoEMIDeposit").removeAttr('disabled');

        if ($('#rdoTotalDeposit').is(':checked') === false && $('#rdoEMIDeposit').is(':checked') === false) {
            $("#rdoTotalDeposit").prop('checked', true);
        }
        if ($('#rdoTotalDeposit').is(':checked') === true) {
            _reservationAmountType = 5;
        }
         /*EMi Option Commented start*/
        else if ($('#rdoEMIDeposit').is(':checked') === true) {
            _reservationAmountType = 6;
            $('#btnDepostiEMI').css("display", "contents");
            $('#tacDepositemi').css("display", "block");
        }
         /*EMi Option Commented End*/
    } else {
        $("#rdoTotalDeposit").prop('checked', false);
        $("#rdoEMIDeposit").prop('checked', false);

        $('#checkInDepositEMI').css('display', 'none');
        $("#rdoTotalDeposit").attr('disabled', 'true');
        $("#rdoEMIDeposit").attr('disabled', 'true');
        $('#hdnPayableOptionTypeId').val(PayableOptionTypeId);
    }
    var input = {
        BookingId: $('#hdnBookingIdchk').val(),
        DiscountValue: "0",
        PaymentFrom: (PaymentDate === undefined) ? "" : PaymentDate,
        IsConfirming: true,
        CouponId: CouponID,
        ReservationAmountType: _reservationAmountType
    };
    var url = '/api/MyAccount/GetCustomerCheckinDetails';
    APICall(url, input, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var SummaryList = Data.BookingSummary;
                if (SummaryList.length > 0) {
                    var SummaryDetails = SummaryList[0];
                    $('#spnPropertyName').html(SummaryDetails.PropertyName);
                    $('#spnPropertyAddress').html(SummaryDetails.PropertyAddress);
                    $('#spnRoomName').html(SummaryDetails.RoomName);
                    $('#spnBedkey').html(SummaryDetails.BedKey.replace(/,/g, " ,<br/>"));
                    $('#spnSharingType').html(returnSharingTypes(SummaryDetails.RoomTypeId));
                    $('#spnlockinPeriod').html(returnwithmonths(SummaryDetails.LockinPeriod));
                    $('#spnNoticePeriod').html(returnwithmonths(SummaryDetails.NoticePeriod));
                    $('#hdnRoomId').val(SummaryDetails.RoomID);
                    $('#PropImg').attr("src", SummaryDetails.PropertyImage);
                    $('#hdnRoomId').val(SummaryDetails.RoomID);
                    $('#hdnBookingType').val(SummaryDetails.BookingType);
                    $('#hdnPropertyID').val(SummaryDetails.LocationId);
                    if (SummaryDetails.DepositOS == 0.0) {
                        $('#dvCoupon').hide();
                    } else {
                        $('#dvCoupon').show();
                    }
                    BindCheckinPaymentDetails(Data.CustomerCheckInPaymentDetails);
                    BindEMIOptions(Data.EMIOptions);
                    if (PaymentDate === undefined) {
                        if (SummaryDetails.IsKYCFilled !== true) {
                            $('#btnKycRedirect').attr('onclick', 'window.location.href="/customerprofile?rid=' + bookingID + '"');
                            $('#btnKycRedirect').show();
                            $('#btnCheckinConfirmation').hide();
                            Toast('Please complete your KYC Before Proceed further !');
                        } else if (SummaryDetails.IsCoTenantAvailable === true) {
                            if (SummaryDetails.IsStayingAlone === "0") {
                                if (SummaryDetails.AddedCoTenant=== 0) {
                                    $('#btnCheckinConfirmation').hide();
                                    Toast('You have selected to be moving with someone...Please add your cotenants !');
                                    redirect = "/dashboard?addcotenant=" + $('#hdnBookingIdchk').val();
                                    setTimeout(function () { window.location.href = redirect; }, 1500);
                                } else if (SummaryDetails.IsCoTenantKYCFilled !== true) {
                                    $('#btnCheckinConfirmation').hide();
                                    Toast('Please ask your cotenants to complete the KYC to proceed further !');
                                }
                            } else if (SummaryDetails.IsStayingAlone === "" && IsReservation === 1) {
                                $("#ancNotAlone").data("bookingid", $('#hdnBookingIdchk').val());
                                $("#ancYesAlone").data("bookingid", $('#hdnBookingIdchk').val());                                
                                $('#AddCotenant').modal('show');
                            }
                        } 
                        $('#dtMoveinDate').val(SummaryDetails.TentativeCheckin);
                        $('#dtMoveinDate').dcalendarpicker({ format: 'dd-mmm-yyyy' });
                        $('#dtMoveinDate').data().dcalendar.minDate = new Date(SummaryDetails.TentativeCheckin);
                        $('#slMoveInTime').append('<option value="' + SummaryDetails.TentativeCheckinTimeId + '">' + SummaryDetails.TentativeCheckinTime + '</option>');
                        $('#hdnCheckinDate').val(SummaryDetails.TentativeCheckin);
                        $('#hdnCheckinTime').val(SummaryDetails.TentativeCheckinTime);
                        $('#hdnCheckInTimeId').val(SummaryDetails.TentativeCheckinTimeId);
                        $('#ReservationCardContainer').fadeOut(1000);
                        $('#checkinContainer').fadeIn(1000);
                        $("#booking .nav-tabs").fadeOut(1000);
                        scrollTop(1000);
                    }
                }
                $(".property-img").on("error", function (e) {
                    this.src = "/assets/images/marathalli.jpg";
                });
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}


function CheckinCancellation() {
    $('#ReservationCardContainer').fadeIn(1000);
    $('#checkinContainer').fadeOut(1000);
    $("#booking .nav-tabs").fadeIn(1000);
    scrollTop(1000);
    $('#chkterms').prop('checked', false);
    $('#btnCheckinConfirmation').prop('disabled', false);
    ClearDashboardhiddenFields();
}


function BindCheckinPaymentDetails(PaymentComponentList) {
    strpaymentDetails = "";
    if (PaymentComponentList.length > 0) {
        $.each(PaymentComponentList, function (i, v) {
            strpaymentDetails += "<div class='row'> \
                                  <div class='col-sm col-4'> \
                                      <div class='custom-control form-control-lg custom-checkbox lblComponent'> \
                                          <label>" + v.Component + "</label> \
                                      </div> \
                                  </div> \
                                  <div class='col-sm col-4'> \
                                      <p class='amount'>" + ConverToRupees(v.ActualAmount) + "</p> \
                                  </div> \
                                  <div class='col-sm col-4'> \
                                      <p class='Bed-Key'>" + ConverToRupees(v.Amount) + "</p> \
                                  </div> \
                              </div> \
                             <hr class='dash'/>";
        });
    }
    $('#paymentDetailsContainer').append(strpaymentDetails);
}

function BindEMIOptions(EMiOptions) {
    strEMiOptions = "";
    $('#CheckInEMIOptions').append("");
    if (EMiOptions.length > 0) {
        $.each(EMiOptions, function (i, v) {
            strEMiOptions += "<tr> \
                              <td scope='row'> \
                               " + v.Months + " \
                              </td>\
                                <td>₹ " + v.EMI + "</td> \
                              <td>₹ " + ConverToRupees(v.OverallEMI) + "</td> \
                             </tr> ";
        });
    }
    $('#CheckInEMIOptions').html(strEMiOptions);
}

function validateCheckInCoupon() {
    if ($("#txtCoupon").val() === "") {
        Toast('Please enter a valid coupon');
        return;
    }

    if ($('#btnCheckinPromoApply').val() === "Remove") {
        RemoveCheckInCoupon();
    } else {

        _bookingtype = $('#hdnBookingType').val()
        var input = {
            OfferCode: $("#txtCoupon").val(),
            RoomID: $('#hdnRoomId').val(),
            CustomerID: $('#hdnCustomerId').val(),
            BookingType: _bookingtype,
            BookingFrom : $('#dtMoveinDate').val()
        };

        var url = '/api/MyAccount/CouponValidationCheckin';
        APICall(url, input)
            .then(responseData => {
                var response = responseData;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === 'success') {
                    if (Data === null) {
                        Toast('Please enter a valid coupon');
                        $("#txtCoupon").val("");
                    } else {
                        var CouponList = Data.CouponValidation;
                        if (CouponList.length > 0) {
                            var CouponDetails = CouponList[0];
                            if (CouponDetails.ValidationStatus) {
                                var valCouponId = CouponDetails.CouponId;
                                $('#hdnCouponID').val(valCouponId);
                                $("#txtCoupon").attr('disabled', 'true');
                                Toast($("#txtCoupon").val() + ' Applied Successfully !');
                                $('#btnCheckinPromoApply').val("Remove");
                                GetcheckinDetails($('#hdnBookingIdchk').val(), valCouponId, $('#dtMoveinDate').val());
                            } else {
                                Toast('Please enter a valid coupon');
                                $("#txtCoupon").val("");
                            }
                        }
                    }
                } else {
                    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                }
            }, errorMsg => { console.log(errorMsg.Message); })
            .catch(ex => { console.log('Exception: ' + ex.message); });
    }
}


function RemoveCheckInCoupon() {
    $("#txtCoupon").val('');
    $('#hdnCouponID').val('0');
    $("#txtCoupon").removeAttr('disabled');
    $("#btnCheckinPromoApply").val("Apply");
    Toast("Coupon Removed Successfully !");
    GetcheckinDetails($('#hdnBookingIdchk').val(), '0', $('#dtMoveinDate').val());
}

//GetNewsCoverage API
function NewsCoverage() {
    $("#PressCoverageCard").html('');
    var url = 'api/Colive/GetNewsCoverage';
    APICall(url, {})
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var NewsList = Data;
                if (NewsList.length > 0) {
                    $.each(NewsList, function (i, v) {
                        $("#PressCoverageCard").append('<div class="col-12 col-md-6">\
                        <div class= "card" >\
                        <div class="card-horizontal">\
                            <div class="card-body">\
                                <div class="NewsLogoalt">\
                                <img src="' + v.LogoLink + '" class="NewsCoverageImg"/>\
                                </div>\
                                    <p class="text-card" title="' + v.Headline + '">"' + v.Headline + '"</p>\
                                </div>\
                                <div class="sub-content">\
                                    <p class="number">' + v.NewsDate + '</p>\
                                    <a target="_blank" href="' + v.NewsLink + '" class="more" rel="nofollow noopener noreferrer">Read More</a>\
                                </div>\
                            </div>\
                        </div>\
                    </div>');
                    });
                    $(".NewsCoverageImg").on("error", function (e) {
                        this.src = "/assets/images/logo-colive.png";
                    });
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

//GetCustomerDetails
function GetCustomerkycDetails() {
    var url = 'api/MyAccount/GetCustomerkycDetails';
    APICall(url, {}, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var CustomerList = Data.CustomerDetails;
                var CustomerAddressDetailList = Data.CustomerAddressDetail;
                var PanProofList = Data.PanProof;
                var CustomerEmergenctDetailList = Data.CustomerEmergenctDetail;
                var CustomerBankDetailsList = Data.CustomerBankDetails;
                var CustomerQualificationInsertList = Data.CustomerQualificationInsert;
                var IdProofList = Data.IdProof;
                var CustomerOtherDetailsList = Data.CustomerOtherDetails_GetAllByCustomerId;
                var CustomerAddressProof = Data.CustomerAddressProof;

                if (CustomerList.length > 0) {
                    var CustomerDetails = CustomerList[0];
                    $('#txtFirstName').val(CustomerDetails.FirstName);
                    $('#txtLastName').val(CustomerDetails.LastName);
                    $('#ddlGender').val(CustomerDetails.Gender);
                    $('#txtMobile').val(CustomerDetails.Mobile);
                    $('#txtDob').val(CustomerDetails.DOB);
                    //EmailVerification Changes By Shilpa
                    if (CustomerDetails.IsEmailVerified === true) {
                        $('#txtEmail').val(CustomerDetails.EmailID);
                        $('#txtEmail').attr("disabled", "disabled");
                        $('#imgWarning').css("display", "none");
                        $('#lblMailId').css("display", "none");
                    }
                    else {
                        $('#txtEmail').val(CustomerDetails.EmailID);
                    }
                    if (CustomerDetails.Photo.toString().trim() != "") {
                        $('#ProfileImg').attr('src', CustomerDetails.Photo);
                        $('#ProfileImg').show();
                        $('#filePhoto').hide();
                        $("#ProfileImg").on("error", function (e) {
                            $('#ProfileImg').hide();
                            $('#filePhoto').show();
                        });
                    }
                }

                if (CustomerAddressDetailList.length > 0) {
                    BindCountryDropdown();
                    var CustomerAddressDetail = CustomerAddressDetailList[0];
                    $('#txtHouseNumber').val(CustomerAddressDetail.HouseNo.trim());
                    $('#txtStreet').val(CustomerAddressDetail.Street.trim());
                    $('#txtCity').val(CustomerAddressDetail.City);
                    $('#txtState').val(CustomerAddressDetail.State);
                    $('#txtCountry').val(CustomerAddressDetail.Country);
                    $('#txtPincode').val(CustomerAddressDetail.Pincode);
                    if (CustomerAddressDetail.Country !== "" || CustomerAddressDetail.Country !== null) {
                        setTimeout(function () {
                            $('#ddlCountry option').each(function () {
                                if ($(this).text().trim().toLowerCase() === CustomerAddressDetail.Country.trim().toLowerCase()) {
                                    $(this).prop('selected', true);
                                    return false;
                                }
                            });
                            setTimeout(function () { $('#ddlCountry').trigger('change'); }, 500);
                        }, 500);

                    }

                    if (CustomerAddressDetail.State !== "" || CustomerAddressDetail.State !== null) {
                        setTimeout(function () {
                            $('#ddlstate option').each(function () {
                                if ($(this).text().trim().toLowerCase() === CustomerAddressDetail.State.trim().toLowerCase()) {
                                    $(this).prop('selected', true);
                                    var dropdownoptions = {
                                        input: '<input type="text" class="form-control kyc_formBorder" placeholder="Search your State">',
                                        searchNoData: 'No States Found !'
                                    };
                                    var statesDropdown = $('#dvState').data('dropdown');
                                    statesDropdown.destroy();
                                    $('#dvState').dropdown(dropdownoptions);
                                    $('#ddlstate').trigger('change');
                                    return false;
                                }
                            });
                        }, 1500);

                    }

                    if (CustomerAddressDetail.City !== "" || CustomerAddressDetail.City !== null) {
                        var dropdownoptions = {
                            input: '<input type="text" class="form-control kyc_formBorder" placeholder="Search your Cities">',
                            searchNoData: 'No Cities Found !'
                        };
                        setTimeout(function () {
                            var CityDropdown = $('#dvCity').data('dropdown');
                            $('#ddlCity option').each(function () {
                                if ($(this).text().trim().toLowerCase() === CustomerAddressDetail.City.trim().toLowerCase()) {
                                    $(this).prop('selected', true);
                                    $('#ddlCity').trigger('change');
                                    $('#txtCity').hide();
                                    return false;
                                } else {
                                    $('#ddlCity').val("-1");
                                    $('#txtCity').val(CustomerAddressDetail.City).show();
                                    return true;
                                }
                            });
                            if (CityDropdown != undefined) { CityDropdown.destroy(); }
                            $('#dvCity').dropdown(dropdownoptions);
                        }, 2000);
                    }
                } else {
                    DefaultAddressConfig();
                }

                if (PanProofList.length > 0) {
                    var PanProof = PanProofList[0];
                    if (PanProof.IsSubmitted) {
                        $('#txtPANCardHolderName').attr('readonly', true);
                        $('#txtPANNumber').attr('readonly', true);
                        $("#PanImg").prop("onclick", false);
                    }
                    $('#txtPANCardHolderName').val(PanProof.PanHolderName);
                    $('#txtPANNumber').val(PanProof.PanNumber);
                    if (PanProof.IDProofImage.toString().trim() != "") {
                        $('#PanImg').attr('src', PanProof.IDProofImage);
                        $('#PanImg').show();
                        $('#panphoto').hide();
                        $("#panphoto").on("error", function (e) {
                            $('#PanImg').hide();
                            $('#panphoto').show();
                        });
                    }
                }

                if (CustomerEmergenctDetailList.length > 0) {
                    var CustomerEmergenctDetail = CustomerEmergenctDetailList[0];
                    $('#txtGuardianName').val(CustomerEmergenctDetail.GuardianName);
                    if (CustomerEmergenctDetail.Relationship !== "" || CustomerEmergenctDetail.Relationship !== null) {
                        $('#ddlRelationship option').each(function () {
                            if ($(this).text().trim().toLowerCase() === CustomerEmergenctDetail.Relationship.trim().toLowerCase()) {
                                $(this).prop('selected', true);
                            }
                        });
                    }
                    $('#txtGuardianPhone').val(CustomerEmergenctDetail.Mobile);
                    $('#txtPermananentAddress').val(CustomerEmergenctDetail.Address);
                }

                if (CustomerBankDetailsList.length > 0) {
                    var CustomerBankDetails = CustomerBankDetailsList[0];
                    if (CustomerBankDetails.IsSubmitted) {
                        $('#txtAccountHolderName').attr('readonly', true);
                        $('#txtBankName').attr('readonly', true);
                        $('#txtAccountNumber').attr('readonly', true);
                        $('#txtIFSCCode').attr('readonly', true);                        
                        $('#bankphoto').attr('disabled', 'disabled');
                    }

                    $('#txtAccountHolderName').val(CustomerBankDetails.HolderName);
                    $('#txtBankName').val(CustomerBankDetails.BankName);
                    $('#txtAccountNumber').val(CustomerBankDetails.AccountNumber);
                    $('#txtIFSCCode').val(CustomerBankDetails.IFSC_Code);
                    if (CustomerBankDetails.Image.toString().trim() != "") {
                        $('#BankImg').attr('src', CustomerBankDetails.Image);
                        $('#BankImg').show();
                        $('#bankphoto').hide();
                        $("#BankImg").on("error", function (e) {
                            $('#BankImg').hide();
                            $('#bankphoto').show();
                        });
                    }
                }

                if (CustomerQualificationInsertList.length > 0) {
                    var CustomerQualificationDetails = CustomerQualificationInsertList[0];
                    $("input:radio[name='employment'][value='" + CustomerQualificationDetails.EmployementId + "']").prop('checked', 'checked');
                    $("input:radio[name='education'][value='" + CustomerQualificationDetails.QualifyID + "']").prop('checked', 'checked');
                    if (CustomerQualificationDetails.EmployementId === 1) {
                        $('.hdntxtcompany').fadeIn();
                        $('#txtOrganization').val(CustomerQualificationDetails.Company);
                        $('#txtDesignation').val(CustomerQualificationDetails.Designation);
                    }
                }

                if (IdProofList.length > 0) {
                    var IdProofDetails = IdProofList[0];
                    $("input:radio[name='idproof'][value='" + IdProofDetails.ID + "']").prop('checked', 'checked');
                    if (IdProofDetails.Image.toString().trim() != "") {
                        $('#Imgproof').attr('src', IdProofDetails.Image);
                        $('#Imgproof').show();
                        $('#idproofprofile').hide();
                        $("#Imgproof").on("error", function (e) {
                            $('#Imgproof').hide();
                            $('#idproofprofile').show();
                        });
                    }
                }

                if (CustomerAddressProof.length > 0) {
                    var CustomerAddressProofDetails = CustomerAddressProof[0];

                    if (CustomerBankDetails.IsSubmitted) {
                        $("input:radio[name='idproof']").attr('disabled', true);
                        $('#txtIDHolderName').attr('readonly', true);
                        $('#txtIDNumber').attr('readonly', true);                        
                        $('#Imgproof').prop("onclick", false);
                    }

                    $("input:radio[name='idproof'][value='" + CustomerAddressProofDetails.AddressID + "']").prop('checked', 'checked');
                    $('#txtIDHolderName').val(CustomerAddressProofDetails.IDName);
                    $('#txtIDNumber').val(CustomerAddressProofDetails.IDNumber);
                }

                if (CustomerOtherDetailsList.length > 0) {
                    var objCustomerOtherDetails = CustomerOtherDetailsList[0];
                    $('#ddlBloodGroup').val(objCustomerOtherDetails.BloodGroup);
                    $('#ddlAgeGroup').val(objCustomerOtherDetails.AgeGroup);
                    $('#txtMedicalHistory').val(objCustomerOtherDetails.MedicalHistory);
                    $('#txtLanguagesSpeak').val(objCustomerOtherDetails.LanguagesSpeak);
                    $('#txtInterestsHobbies').val(objCustomerOtherDetails.InterestsHobbies);
                    $('#ddlMaritalStatus').val(objCustomerOtherDetails.MaritalStatus);
                    $('#txtCollegeAlumni').val(objCustomerOtherDetails.CollegeAlumni);
                    $('#ddlIncomeRange').val(objCustomerOtherDetails.IncomeRange);
                    $('#txtAllergicTo').val(objCustomerOtherDetails.AllergicTo);
                    $('#ddlOwnVehicle').val(objCustomerOtherDetails.OwnVehicle);
                    if (objCustomerOtherDetails.OwnVehicle === '2 wheeler') {
                        $('#lbl4WheelerNumber').css("display", "none");
                        $('#txt4WheelerNumber').css("display", "none");

                        $('#lbl2WheelerNumber').css("display", "block");
                        $('#txt2WheelerNumber').css("display", "block");
                        $('#txt2WheelerNumber').val(objCustomerOtherDetails.TwoWheelerNumber);
                    } else if (objCustomerOtherDetails.OwnVehicle === '4 wheeler') {
                        $('#lbl2WheelerNumber').css("display", "none");
                        $('#txt2WheelerNumber').css("display", "none");

                        $('#lbl4WheelerNumber').css("display", "block");
                        $('#txt4WheelerNumber').css("display", "block");
                        $('#txt4WheelerNumber').val(objCustomerOtherDetails.FourWheelerNumber);
                    } else if (objCustomerOtherDetails.OwnVehicle === 'Both') {
                        $('#lbl2WheelerNumber').css("display", "block");
                        $('#txt2WheelerNumber').css("display", "block");
                        $('#txt2WheelerNumber').val(objCustomerOtherDetails.TwoWheelerNumber);
                        $('#lbl4WheelerNumber').css("display", "block");
                        $('#txt4WheelerNumber').css("display", "block");
                        $('#txt4WheelerNumber').val(objCustomerOtherDetails.FourWheelerNumber);
                    } else {
                        $('#lbl2WheelerNumber').css("display", "none");
                        $('#txt2WheelerNumber').css("display", "none");
                        $('#lbl4WheelerNumber').css("display", "none");
                        $('#txt4WheelerNumber').css("display", "none");
                    }

                    $("input:radio[name='vegeterian'][value='" + objCustomerOtherDetails.Vegeterian + "']").prop('checked', 'checked');
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => {
            var mobile = $('#txtMobile').val();
            if (mobile !== '')
                CheckCustomerWhatsAppOptIn(mobile, 0, "");
            $('#AjaxLoader').fadeOut(500);
        });
}

function ProceedTocheckin() {
    if ($('#chkterms').prop('checked') === false) {
        Toast("Please agree to the terms and conditions !");
    }
    else if ($('#ChkDepositemiAgree').prop('checked') === false) {
            Toast("Please agree to the EMI terms and conditions !");
    }
    else if ($('#ChkDepositemiAgree').prop('checked') === false) {
        Toast("Please agree to the terms and conditions !");
    } else {
        GetCheckinPaymentDetails($('#hdnBookingIdchk').val());
    }
}

function GetCheckinPaymentDetails(BookingId) {
    var input = {
        BookingID: BookingId
    };
    var url = '/api/MyAccount/GetCheckinPaymentDetails';
    APICall(url, input, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var MyDueList = Data.MyDue;
                if (MyDueList.length > 0) {
                    var CheckinDetails = MyDueList[0];
                    if (CheckinDetails.IsValid === true) {
                        Toast(CheckinDetails.Message);
                        $('#btnCheckinConfirmation').prop('disabled', true);
                    } else {
                        var _reservationAmountType = "5";
                        if ($('#rdoTotalDeposit').is(':checked') === true) {
                            _reservationAmountType = 5;
                        }
                        else if ($('#rdoEMIDeposit').is(':checked') === true) {
                            _reservationAmountType = 6;
                        }
                        var paymentTo = new Date(CheckinDetails.PaymentTo);
                        var paymentFrom = new Date(CheckinDetails.PaymentFrom);
                        var isOverallDue = 1;
                        var isRent = 0;
                        var isOtherAmount = 0;
                        var inputobj = {
                            CustomerID: $('#hdnCustomerId').val(),
                            CreatedBy: 21,
                            BookingID: CheckinDetails.BookingID,
                            BookingFrom: $('#dtMoveinDate').val(),
                            TentativeCheckinId: $('#slMoveInTime').val(),
                            BookingTo: formatDate(new Date(parseInt(paymentTo.getFullYear()), paymentTo.getMonth(), paymentTo.getDate())),
                            BookingIP: "",
                            BookingStatusId: 1,
                            IsFromWebsite: false,
                            RoomID: CheckinDetails.RoomID,
                            Rent: CheckinDetails.Rent,
                            FixedAmenitiesPricing: CheckinDetails.Maintenance,
                            IsOverallDue: isOverallDue,
                            IsRent: isRent,
                            IsOtherAmount: isOtherAmount,
                            CustomerPaidAmount: parseInt(CheckinDetails.TotalPayable),
                            CustomerDepositOs: parseInt(CheckinDetails.DepositOS),
                            CouponId: $('#hdnCouponID').val(),
                            SourceType: 2,
                            ReservationAmountType: _reservationAmountType,
                            CustomerDetails: {
                                TotalAmount: CheckinDetails.TotalPayable,
                                IsReservation: false,
                                IsAdvanceBooking: false,
                                IsWaivedOff: false,
                                ADCReceiptNumber: "FromCCAvenue",
                                ModeOfPayment: "CCAvenue",
                                PaymentStatusId: 1,
                                IsConfirming: false,
                                ADCProof: "",
                                IsToGateway: true,
                                PreviousDue: CheckinDetails.PreviousDue,
                                PaymentFrom: formatDate(new Date(parseInt(paymentFrom.getFullYear()),
                                    paymentFrom.getMonth(),
                                    paymentFrom.getDate())),
                                PaymentTo: formatDate(
                                    new Date(parseInt(paymentTo.getFullYear()), paymentTo.getMonth(), paymentTo.getDate())),
                                ServiceTax: CheckinDetails.ServiceTax,
                                ServiceTaxValue: CheckinDetails.ServiceTaxValue,
                                AdditionalCharges: []
                            },
                            ImageUploadList: [],
                            PaymentApp: 4
                        };
                        CheckinConfirmation(inputobj);
                    }
                } else {
                    Toast('Payment failed. Please try again later !');
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}

function CheckinConfirmation(inputobj) {

    var url = '/api/MyAccount/CheckinConfirmation';
    APICall(url, inputobj, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                if (Data.IsNewPay === undefined) {
                    var paymentGateway = Data.StrEncRequest;
                    var strRedirectLink = Data.RedirectURL;
                    RedirectToPaymentGateway(strRedirectLink, paymentGateway);
                }
                else if (Data.IsNewPay === 1) {
                    $('#OrderId').val(Data.OrderId);
                    $("#fmPayment").submit();
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}


function BindCurrentBookingHistory(Currlist) {
    var StrCurrBookings = "";
    if (Currlist.length > 0) {
        $.each(Currlist, function (i, v) {
            // Hiding Dues And Payment Section for PaidBy Corporate Customer
            if (v.CorporatePaidBy != '1') {
                $('#Duespayment').attr('style', "display: block");
            }
            StrCurrBookings += "<div class='col-lg-6 col-md-6 col-12 pl-0'> \
                             <div class='card-wrap'> \
                                 <div class='card-img'> \
                                     <img src='" + v.PropertyImage + "' class='property-img'  alt='" + v.PropertyName + "'> \
                                     <p class='date-on-hover'>" + v.CheckinDate + ", " + v.CheckinTime + " </p> \
                                 </div> \
                                 <div class='card-info cancel_request'> \
                                     <div class='card-detail'> \
                                         <div class='card-title'> \
                                             <p>" + v.PropertyName + "</p> \
                                             <span> \
                                                 <img src='/assets/images/location.png' alt='mapicon'>" + v.Address + "</span> \
                                         </div> \
                                         <div class='like-share'> \
                                             <img src='/assets/images/share.png'> \
                                             <i class='fa fa-heart-o'></i> \
                                         </div> \
                                     </div> \
                                     <div class='pricing-rating'> \
                                         <div class='price'> \
                                             <p>Starting price</p> \
                                             <p>₹ " + ConverToRupees(v.Rent) + "</p> \
                                         </div> \
                                         <div class='rating' > \
                                         <p>3.5/5</p> \
                                         <p class='stars'> \
                                                 <i class='fa fa-star' aria-hidden='true'></i> \
                                                 <i class='fa fa-star' aria-hidden='true'></i> \
                                                 <i class='fa fa-star' aria-hidden='true'></i> \
                                                 <i class='fa fa-star' aria-hidden='true'></i> \
                                                 <i class='fa fa-star' aria-hidden='true'></i> \
                                             </p>  \
                                         </div> \
                                     </div>\
                <div style='color: #3085ff; font - size: 14px; font - weight: 600; line - height: 22px; opacity: 0.6000000238418579;margin-top: 1rem; '>\
                <p class='cancel pTransferApproved'  style='display: " + (v.TransferStatusId === 2 ? 'block' : 'none') + "'>Transfer request is approved</p>\
            <p class='cancel pTransferApproved'  style='display: " + (v.IsTransferRequestRejected === true && v.TransferReqId === 0 ? 'block' : 'none') + "'>Transfer Request Rejected</p> \
                <p class='cancel pTransferApproved'  style='display: " + (v.BookingStatusId === 5 && v.CheckoutStatus === false ? 'block' : 'none') + "'><img src='/images/clock.png' alt='clock' class='checkout'>Transfer Requested On " + v.TransferRequestDate + "</p> \
            <p class='cancel pTransferApproved'  style='display: " + (v.TransferStatusId === 1 ? 'block' : 'none') + "'>" + v.TransferStatus + "</p> \
            </div >\
                                     <div class='cancel-request request-checkin'> \
                                         <input type='button' id='dashboard_CancelRequest' style='display: " + (v.CheckoutStatus !== true && v.BookingStatusId === 1 && v.IsCotenant === false && v.TransferReqId === 0 ? 'block' : 'none') + "' class='reschedule' data-property='" + v.PropertyName + "' data-propertyid='" + v.PropertyID + "' \
                                         data-bookingid='" + v.BookingID + "'  data-roomid='" + v.RoomID + "' value = 'Raise Notice Period' onclick = 'BindCustomerRefundDetails($(this));' /> \
                                        <input type='button' "+ (v.TransferReqId !== 0 && v.TransferStatusId === 1 ? ' disabled ' : '') + " style='display: " + (v.InternalTransferEligible === true && v.IsNewBookingTransferred === false && v.BookingStatusId === 1 && v.CheckoutStatus === false && v.BookingType === 2 && v.IsCotenant === false && v.TransferStatusId !== 1 ? 'block' : 'none') + "' class='btnTransferReq reschedule transferRequest' data-property='" + v.PropertyName + "' id='btntransfer_" + v.BookingID + "' data-propertyid='" + v.PropertyID + "' \
                                         data-bookingid='" + v.BookingID + "' data-TransferReqId = '" + v.TransferReqId + "'  data-TransferStatusId = '" + v.TransferStatusId + "'  data-roomid='" + v.RoomID + "'  data-locationlink='" + v.LocationLink + "' value = '" + (v.TransferReqId === 0 ? 'Transfer Request' : v.TransferStatus) + "' onclick= 'BindCustomerTransferDetails($(this));'  /> \
                                        <div class='cancel_rasied_notice'>\
                                         <p class='cancel'  style='display: " + (v.CheckoutStatus === true && v.BookingStatusId === 1 && (v.CorporatePaidBy === "0" || v.CorporatePaidBy ==="2")  ? 'block' : 'none') + "'><img src='/assets/images/clock.png' alt='clock' class='checkout'>Check-out Requested On " + v.CheckoutDateTime + "</p> \
                                         <button type='button' class='cancel_notice_period' style = 'display: " + (v.IsCheckoutCancel === true ? 'block' : 'none') + "' data-toggle='modal' data-bookingid='" + v.BookingID + "' onclick = 'CancelRaisedCheckoutRequest_TnC($(this));' > Cancel Raised Notice</button> \
                                        </div > \
                                     </div> \
                                 </div> \
                             </div> \
                         </div>";
        });
        $('#CurrentBookingsContainer').append(StrCurrBookings);
        $(".property-img").on("error", function (e) {
            this.src = "/assets/images/marathalli.jpg";
        });
    } else {
        $('#CurrentBookingsContainer').append('<div class="Nobookings"><img src="/assets/images/dashboard-bookings/apartment.svg" /><h6>No Check-in\'s Found</h6></div>');
    }
}

function RaiseCheckoutRequest_TnC(obj) {
    $("#btnContinueCheckout").data("property", obj.data('property'));
    $("#btnContinueCheckout").data("roomid", obj.data('roomid'));
    $("#btnContinueCheckout").data("propertyid", obj.data('propertyid'));
    $("#btnContinueCheckout").data("bookingid", obj.data('bookingid'));
    $('#mdlCheckoutModal').modal('show');
}

function RaiseCheckoutRequest(obj) {
    $('#mdlCheckoutModal').modal('hide');
    var Property = obj.data('property');
    $('#hdnRoomId').val(obj.data('roomid'));
    $('#hdnPropertyID').val(obj.data('propertyid'));
    $('#hdnBookingIdchk').val(obj.data('bookingid'));
    $('.ChkoutPropName').html(Property);
    $('#CurrentBookingsContainer').fadeOut(1000);
    $('#checkout_form').fadeIn(1000);
    $("#booking .nav-tabs").fadeOut(1000);
    scrollTop(1000);
    $('#chkoutDate').val();
    $('#chkoutDate').dcalendarpicker({ format: 'dd-mmm-yyyy' });
    $('#chkoutDate').data().dcalendar.minDate = new Date();
}

function checkoutdatechanged() {
    $('#slCheckoutTime').html('');
    if ($('#chkoutDate').val() !== "") {
        var input = {
            Date: $('#chkoutDate').val(),
            PropertyID: $('#hdnPropertyID').val(),
            IsCheckout: true
        };
        var url = '/api/MyAccount/GetMoveinTimeSlots';
        APICall(url, input)
            .then(responseData => {
                var response = responseData;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === "success") {
                    if (Data.length > 0) {
                        for (var i = 0; i < Data.length; i++) {
                            $('#slCheckoutTime').append($('<option>', {
                                value: Data[i].TimeId,
                                text: Data[i].TimeString
                            }));
                        }
                    } else {
                        Toast("Sorry, Please Choose Another Day ! Our Sales Ninjas Too Need A Day Off.");
                    }
                } else {
                    Toast("Sorry, Please Choose Another Day ! Our Sales Ninjas Too Need A Day Off.");
                }
            }, errorMsg => { console.log(errorMsg.Message); })
            .catch(ex => { console.log('Exception: ' + ex.message); });
    }
}

//CancelNotice By Shilpa

function checkoutdatebind() {
    var dtDate = new Date();
    $('#chkoutDate').data().dcalendar.maxDate = dtDate.setDate(dtDate.getDate() + 90);
}

function bookingdatebind() {
    var dtDate = new Date();
    $('#txtMoveinDate').data().dcalendar.minDate = dtDate.setDate(dtDate.getDate() - 1);
    $('#txtMoveinDate').data().dcalendar.maxDate = dtDate.setDate(dtDate.getDate() + 31);
}

function PayDues() {
    $('#mdlPayDueModal').modal('hide');
    $('#ancDuesAndPayment').data('type', '2');
    setTimeout(function () { $('#ancDuesAndPayment').click(); }, 500);
}

function BindCustomerRefundDetails(obj) {
    var input = {
        BookingID: obj.data('bookingid')
    };
    var url = '/api/MyAccount/BindCustomerRefundDetails';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var CustomerRefundDetails = Data;
                if (CustomerRefundDetails.TentativeRefundAmount < 0) {
                    $('#mdlPayDueModal').modal('show');
                    $('#forcancelnotice').val(true);
                }
                else {
                    //BankDetailsCheckout(obj);
                    RaiseCheckoutRequest_TnC(obj);
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}



function BindCustomerChargesForNotice(bookingid, chkoutDate, chkoutTime) {
    var input = {
        BookingID: bookingid,
        Date: chkoutDate,
        CheckOutTime: chkoutTime
    };
    var url = '/api/MyAccount/BindCustomerChargesForNotice';
    APICall(url, input, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var CustomerRefundDetails = Data;
                $('#spnDepositAmount').html(CustomerRefundDetails.ActualSecurityDeposit);
                $('#spnNoticePeriodCharges').html(CustomerRefundDetails.NoticePeriodCharges);
                $('#spnLockInPeriodCharges').html(CustomerRefundDetails.LockInPeriodCharges);
                $('#spnSeparationCharges').html(CustomerRefundDetails.SeparationCharges);
                $('#spnEMIInterestCharges').html(CustomerRefundDetails.DepositEMIInterest);
                $('#spnRefundAmount').html(CustomerRefundDetails.TentativeRefundAmount);
            } else {
                console.log('Request Status: ' + Status + ' Status Text: ' + Message + ' ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}

function CancelRaisedCheckoutRequest_TnC(obj) {
    $("#btnContinueCheckout").data("property", obj.data('property'));
    $("#ancYes").data("bookingid", obj.data('bookingid'));
    $('#cancel_raise_noticed').modal('show');
}

function CancelRaisedCheckoutRequest(obj) {
    var input = {
        BookingID: $("#ancYes").data('bookingid'),
        StatusId: 3,
        FollowupStatusId: 4
    };

    var url = '/api/MyAccount/CancelRaisedCheckoutRequest';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                if (Data === 1) {
                    Toast("Raised Notice Period cancelled Successfully !");
                    $('#cancel_raise_noticed').modal('hide');
                    redirect = "/dashboard?cancelnotice=" + $("#ancYes").data('bookingid');
                    setTimeout(function () { window.location.href = redirect; }, 4000);
                }
                else {
                    setTimeout(function () { Toast("Raised Notice Period cancellation failed !"); }, 3000);
                    $('#cancel_raise_noticed').modal('hide');
                }
            } else {
                setTimeout(function () { Toast("Raised Notice Period cancellation failed !"); }, 3000);
                $('#cancel_raise_noticed').modal('hide');
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

function EditBankDetailsDuringNoticeRaise(obj) {
    if ($('#btnEdit').val() === 'Edit') {
        $('#btnEdit').attr('value', 'Save');
        $("#txtAccountHolderName").attr('disabled', false);
        $("#txtAccountHolderName").addClass('edit');
        $("#txtBankName").attr('disabled', false);
        $("#txtBankName").addClass('edit');
        $("#txtAccountNumber").attr('disabled', false);
        $("#txtAccountNumber").addClass('edit');
        $("#txtIFSCCode").attr('disabled', false);
        $("#txtIFSCCode").addClass('edit');
    }
    else if ($('#btnEdit').val() === 'Save') {
        var strIFSCCode = $('#txtIFSCCode').val().trim().toUpperCase();
        var accountholdername = $('#txtAccountHolderName').val().trim();
        var bankname = $('#txtBankName').val().trim();
        var accountnumber = $('#txtAccountNumber').val().trim();

        var strRegex = new RegExp('^[A-Z]{4}[A-Z0-9]{6,7}$');

        if (accountholdername == '') {
            Toast('Please enter your account holder name !');
            $('#txtAccountHolderName').addClass('customerror');
            $('#txtAccountHolderName').on('focus', function () {
                $('#txtAccountHolderName').removeClass('customerror');
            });
            return;
        }
        if (bankname == '') {
            Toast('Please enter your bank name !');
            $('#txtBankName').addClass('customerror');
            $('#txtBankName').on('focus', function () {
                $('#txtBankName').removeClass('customerror');
            });
            return;
        }
        if (accountnumber == '') {
            Toast('Please enter your account number !');
            $('#txtAccountNumber').addClass('customerror');
            $('#txtAccountNumber').on('focus', function () {
                $('#txtAccountNumber').removeClass('customerror');
            });
            return;
        }

        if (strRegex.test(strIFSCCode)) {
            var input = {
                CustomerID: $('#hdnCustomerId').val(),
                BankName: $('#txtBankName').val().trim(),
                HolderName: $('#txtAccountHolderName').val().trim(),
                AccountNumber: $('#txtAccountNumber').val().trim(),
                IFSC_Code: strIFSCCode,
                CreatedBy: 0
            };

            var url = '/api/MyAccount/SaveBankDetails';
            APICall(url, input, true)
                .then(responseData => {
                    var response = responseData;
                    var Status = response.Status,
                        Message = response.Message,
                        Data = response.Data;
                    if (Status === 'success') {
                        Toast('Bank Details Saved Successfully !');
                        clearBankDetails();
                        BindBankDetails(obj);
                        $('#btnEdit').attr('value', 'Edit');
                    } else {
                        console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                    }
                }, errorMsg => { console.log(errorMsg.Message); })
                .catch(ex => { console.log('Exception: ' + ex.message); })
                .finally(() => { $('#AjaxLoader').fadeOut(500); });
        } else {
            Toast('Enter a valid IFSC Code !');
            $('#txtIFSCCode').addClass('customerror');
            $('#txtIFSCCode').on('focus', function () {
                $('#txtIFSCCode').removeClass('customerror');
            });
        }
    }
}

function clearBankDetails() {
    $("#txtAccountHolderName").attr('disabled', true);
    $("#txtAccountHolderName").removeClass('edit');
    $("#txtBankName").attr('disabled', true);
    $("#txtBankName").removeClass('edit');
    $("#txtAccountNumber").attr('disabled', true);
    $("#txtAccountNumber").removeClass('edit');
    $("#txtIFSCCode").attr('disabled', true);
    $("#txtIFSCCode").removeClass('edit');
    $("#txtEmail").attr('disabled', true);
    $("#txtEmail").removeClass('edit');
}

var current_fs, next_fs, previous_fs; //fieldsets
var left, opacity, scale; //fieldset properties which we will animate
var animating; //flag to prevent quick multi-click glitches
function BankDetailsCheckout(obj) {
    if ($('#chkoutDate').val() === "") {
        Toast("Please Choose Check-out Date !");
        return;
    } else if ($('#slCheckoutTime').val() === "") {
        Toast("Please Choose Check-out Time !");
        return;
    } else {
        var input = {
            BookingID: $('#hdnBookingIdchk').val(),
            Date: $('#chkoutDate').val(),
            CheckOutTime: $('#slCheckoutTime').val()
        };
        var url = '/api/MyAccount/PMAvailabilityForCheckout';
        APICall(url, input, true)
            .then(responseData => {
                var response = responseData;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === 'success') {
                    var TimeSlotsList = Data;
                    if (TimeSlotsList.length > 0) {
                        var TimeSlotDetails = TimeSlotsList[0];
                        if (TimeSlotDetails.CheckoutDate == 'nodata') {
                            //BindBankDetails(obj);
                            NextCheckoutForm(obj);
                            BindCustomerChargesForNotice($('#hdnBookingIdchk').val(), $('#chkoutDate').val(), $('#slCheckoutTime').val());
                        } else if (TimeSlotDetails.CheckoutDate == 'NA') {
                            Toast(TimeSlotDetails.CheckoutMessage);
                        }
                    }
                } else {
                    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                }
            }, errorMsg => { console.log(errorMsg.Message); })
            .catch(ex => { console.log('Exception: ' + ex.message); })
            .finally(() => { $('#AjaxLoader').fadeOut(500); });
    }

}


function BindBankDetails(obj) {
    var input = {
        CustomerID: $('#hdnCustomerId').val()
    };
    var url = '/api/MyAccount/GetCustomerBankDetails';
    APICall(url, input, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var BankList = Data;
                if (BankList.length > 0) {
                    var BankDetails = BankList[0];
                    if (BankDetails.CheckEmailNull === false) {
                        Toast('Please fill your Email ID To proceed !');
                        setTimeout(function () { window.location.href = '/dashboard'; }, 2000);
                    } else if (BankDetails.CheckIsNull === false) {
                        Toast('Please fill your Bank Details To proceed !');
                        setTimeout(function () { window.location.href = '/dashboard'; }, 2000);
                    } else {
                        if (obj.attr('id') !== 'btnEdit')
                            NextCheckoutForm(obj);
                        //CancelNotice By Shilpa

                        $('#txtAccountHolderName').val(BankDetails.HolderName);
                        $('#txtBankName').val(BankDetails.BankName);
                        $('#txtAccountNumber').val(BankDetails.AccountNumber);
                        $('#txtIFSCCode').val(BankDetails.IFSC_Code);
                        $('#txtEmail').val(BankDetails.EmailID);

                    }
                } else {
                    Toast('Please fill your Bank Details To proceed !');
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}


function NextCheckoutForm(obj) {
    if (animating) return false;
    animating = true;

    current_fs = obj.parent();
    next_fs = obj.parent().next();

    //activate next step on progressbar using the index of next_fs
    $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

    //show the next fieldset
    next_fs.show();
    //hide the current fieldset with style
    current_fs.animate({
        opacity: 0
    }, {
        step: function (now, mx) {
            //as the opacity of current_fs reduces to 0 - stored in "now"
            //1. scale current_fs down to 80%
            scale = 1 - (1 - now) * 0.2;
            //2. bring next_fs from the right(50%)
            left = (now * 50) + "%";
            //3. increase opacity of next_fs to 1 as it moves in
            opacity = 1 - now;
            current_fs.css({
                'transform': 'scale(' + scale + ')',
                'position': 'absolute'
            });
            next_fs.css({
                'left': left,
                'opacity': opacity
            });
        },
        duration: 800,
        complete: function () {
            current_fs.hide();
            animating = false;
        },
        //this comes from the custom easing plugin
        easing: 'easeInOutBack'
    });
}


function PreviousCheckoutForm(obj) {
    scrollTop(1000);
    if (animating) return false;
    animating = true;
    current_fs = obj.parent();
    previous_fs = obj.parent().prev();
    //de-activate current step on progressbar
    $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
    //show the previous fieldset
    previous_fs.show();
    //hide the current fieldset with style
    current_fs.animate({
        opacity: 0
    }, {
        step: function (now, mx) {
            //as the opacity of current_fs reduces to 0 - stored in "now"
            //1. scale previous_fs from 80% to 100%
            scale = 0.8 + (1 - now) * 0.2;
            //2. take current_fs to the right(50%) - from 0%
            left = ((1 - now) * 50) + "%";
            //3. increase opacity of previous_fs to 1 as it moves in
            opacity = 1 - now;
            current_fs.css({
                'left': left
            });
            previous_fs.css({
                'transform': 'scale(' + scale + ')',
                'opacity': opacity
            });
        },
        duration: 800,
        complete: function () {
            current_fs.hide();
            animating = false;
        },
        // this comes from the custom easing plugin
        easing: 'easeInOutBack'
    });
}


function ShowEmploytext(obj) {
    if (obj.val() == 1) {
        $('.hdntxtcompany').fadeIn();
    } else {
        $('.hdntxtcompany').fadeOut();
    }
}


function CheckoutFormFinal(obj) {
    if ($('input[name=ServiceRecommend]:checked').length <= 0 || $('input[name=improvements]:checked').length <= 0) {
        Toast('please fill all the details');
    } else if ($('#chkOthers').is(':checked') && $('#txtCommments').val().length === 0) {
        Toast('please enter comments');
    } else {
        CheckoutRequestInsert(obj);
        Feedbacksubmit();
        setTimeout(function () { ClearDashboardhiddenFields(); }, 1500);
    }
}

function Feedbacksubmit() {
    var Details = [];
    $.each($("input[name=improvements]:checked"), function () {
        Details.push($(this).val());
    });
    var comments = $('#txtCommments').val();
    Details.push(comments);

    var input = {
        CustomerID: $('#hdnCustomerId').val(),
        ServiceRecommendation: "" + $('input[name=ServiceRecommend]:checked').val() + "",
        Reason: "" + $('#feedbackReason').find(':selected').text() + "",
        Improvements: Details.join(),
        BookingID: $('#hdnBookingIdchk').val() 
    };
    var url = '/api/MyAccount/FeedbackFormSubmit';
    APICall(url, input, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                setTimeout(function () { Toast("Thanks for your feedback !"); }, 3000);
                if ($('#hdnSourceTypeId').val() === "2" || $('#hdnSourceTypeId').val() === "3") {
                    $('#hdnFeedbackCancel').val('1');
                    setTimeout(function () { window.location.href = "/appview/checkoutfeedback.aspx?res=" + "true"; }, 500);
                }
            } else {
                console.log('Request Status: ' + Status + ' Status Text: ' + Message + ' ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}

function CheckoutRequestInsert(obj) {
    var input = {
        BookingID: $('#hdnBookingIdchk').val(),
        RequestId: 1,
        Date: $('#chkoutDate').val(),
        CheckOutTime: $('#slCheckoutTime').val(),
        StatusId: 1,
        CheckoutFrom: 'Web'
    };
    var url = '/api/MyAccount/CheckoutRequestInsert';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                NextCheckoutForm(obj);
                $('#spnCheckoutDetails').html($('#chkoutDate').val() + ", " + $('#slCheckoutTime').find(':selected').text());
                Toast('Booking Check-out requested successfully!');
                scrollTop(1000);
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}


function ClearDashboardhiddenFields() {
    $('#hdnBookingIdchk,#hdnCouponID,#checkoutTimeId,#hdnPropertyID, \
      #hdnCheckinDate,#hdnCheckinTime,#hdnCheckInTimeId,#hdnRoomId,#hdnSRBookinstatusId').val(0);
}


function CancelCheckout() {
    $('#progressbar li:first-child').addClass('active');
    $('#chkoutDate,#txtCommments').val('');
    $('#slCheckoutTime,#spnHolderName,#spnBankName,#spnEmailId,#spnifscCode').html('');
    $('input[name=ServiceRecommend]').prop('checked', false);
    $('input[name=improvements]').prop('checked', false);
    $('#feedbackReason').prop('selectedIndex', 0);
    $('#CurrentBookingsContainer').fadeIn(1000);
    $('#checkout_form').fadeOut(1000);
    $("#booking .nav-tabs").fadeIn(1000);
    $('#msform fieldset:last-child').hide();
    $('#checkoutrequest').css({
        'display': 'block',
        'opacity': '1',
        'transform': 'scale(1)'
    });
    ClearDashboardhiddenFields();
    BindCustomerBookingHistory();
}


function BindMoveInHistory(MoveinList) {
    var StrMoveinBookings = "";
    if (MoveinList.length > 0) {
        $.each(MoveinList, function (i, v) {
            StrMoveinBookings += "<div class='col-lg-6 col-md-6 col-12 px-2 mb-3'> \
                             <div class='card-wrap'> \
                                 <div class='card-img'> \
                                     <img src='" + v.PropertyImage + "' class='property-img'  alt='" + v.PropertyName + "'> \
                                     <p class='date-on-hover'>" + v.MoveInDate + ", " + v.MoveInTime + " </p> \
                                 </div> \
                                 <div class='card-info'> \
                                     <div class='card-detail'> \
                                         <div class='card-title'> \
                                             <p>" + v.PropertyName + "</p> \
                                             <span> \
                                                 <img src='/assets/images/location.png' alt='mapicon'>" + v.Address + "</span> \
                                         </div> \
                                         <div class='like-share'> \
                                             <img src='/assets/images/share.png'> \
                                             <i class='fa fa-heart-o'></i> \
                                         </div> \
                                     </div> \
                                     <div class='pricing-rating'> \
                                         <div class='price'> \
                                             <p>Starting price</p> \
                                             <p>₹ " + ConverToRupees(v.Rent) + "</p> \
                                         </div> \
                                         <div class='rating' > \
                                         <p>3.5/5</p> \
                                         <p class='stars'> \
                                                 <i class='fa fa-star' aria-hidden='true'></i> \
                                                 <i class='fa fa-star' aria-hidden='true'></i> \
                                                 <i class='fa fa-star' aria-hidden='true'></i> \
                                                 <i class='fa fa-star' aria-hidden='true'></i> \
                                                 <i class='fa fa-star' aria-hidden='true'></i> \
                                             </p>  \
                                         </div> \
                                     </div>\
                                     <div class='cancel-request request-checkin'> \
                                       <input type='button' style = 'display: " + (v.IsCotenant === false ? 'block' : 'none') + "; id='btnMovein_" + v.BookingID + "' class='ml-0 reschedule booking_raise_service' data - property='" + v.PropertyName + "' data - propertyid='" + v.PropertyID + "' \
                                         data-bookingid='" + v.BookingID + "' data-propertyaddress='" + v.Address + "'  data-propimg='" + v.PropertyImage + "'  \
                                         data-moveindate='" + v.MoveInDate + "' data-moveintime='" + v.MoveInTime + "'  data-moveintimeid='" + v.MoveInTimeId + "' data-transferReqId='" + v.TransferReqId + "'  \
                                         value = 'Movein' onclick = 'ShowMoveinDetails($(this));' />\
                                        <input type = 'button' style = 'display: " + (v.IsNewBookingTransferred === true && v.BookingStatusId === 1 && v.CheckoutStatus === false && v.IsCotenant === false && 1===0 ? 'block' : 'none') + ";' class='reschedule transferRequest' data-property='" + v.PropertyName + "' id = 'btntransfer_" + v.BookingID + "' data-propertyid='" + v.PropertyID + "' \
                                        data-bookingid='" + v.BookingID + "'  data-roomid='" + v.RoomID + "'  data-locationlink='" + v.LocationLink + "' data-transferReqId='" + v.TransferReqId + "' value = 'Cancel Transfer Request' onclick = 'CancelTransferRequest($(this));' /> \
                                     </div> \
                                 </div> \
                             </div> \
                         </div>";
        });
        $('#MoveinContainer').append(StrMoveinBookings);
        $(".property-img").on("error", function (e) {
            this.src = "/assets/images/marathalli.jpg";
        });
    } else {
        $('#MoveinContainer').append('<div class="Nobookings"><img src="/assets/images/dashboard-bookings/apartment.svg" /><h6>No Move-in\'s Found</h6></div>');
    }
}

function ShowMoveinDetails(obj) {
    var MoveinDate = obj.data('moveindate');
    var MoveinTime = obj.data('moveintime');
    var MoveinTimeId = obj.data('moveintimeid');
    var transferReqId = obj.data('transferreqid');

    var dtMovein = new Date(obj.data('moveindate'));
    $('#spnMoveinPropAddress').html(obj.data('propertyaddress'));
    $('#spnMoveinPropName').html(obj.data('property'));
    $('#hdnBookingIdchk').val(obj.data('bookingid'));
    $('#ImgMoveinProp').attr('src', obj.data('propimg'));
    $('#MoveinContainer').fadeOut(1000);
    $("#booking .nav-tabs").fadeOut(1000);
    $('#MoveinSection').fadeIn(1000);
    $('#spnMoveinDetails').html(MoveinDate + ', ' + MoveinTime);
    $('#hdnPropertyID').val(obj.data('propertyid'));
    $('#MoveinDate').val(MoveinDate);
    $('#MoveinDate').dcalendarpicker({ format: 'dd-mmm-yyyy' });
    $('#MoveinDate').data().dcalendar.minDate = new Date(dtMovein.getFullYear(), dtMovein.getMonth(), dtMovein.getDate());
    if (transferReqId > 0) {
        var dtDate = new Date();
        $('#MoveinDate').data().dcalendar.maxDate = dtDate.setDate(dtDate.getDate() + 7);
    }
    $('#MoveInTime').append('<option value="' + MoveinTimeId + '">' + MoveinTime + '</option>');
    scrollTop(1000);
    $(".property-img").on("error", function (e) {
        this.src = "/assets/images/marathalli.jpg";
    });
}


function MoveinDateChange() {
    $('#MoveInTime').find('option').remove().end();
    var input = {
        date: $('#MoveinDate').val(),
        PropertyID: $('#hdnPropertyID').val()
    };
    var url = '/api/MyAccount/GetMoveinTimeSlots';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                if (Data.length > 0) {
                    for (var i = 0; i < Data.length; i++) {
                        $('#MoveInTime').append($('<option>', {
                            value: Data[i].TimeId,
                            text: Data[i].TimeString
                        }));
                    }
                } else {
                    Toast("Sorry, Please Choose Another Day ! Our Sales Ninjas Too Need A Day Off.");
                    $('#MoveinDate').val('');
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}


function ChangeMoveinDetails() {
    if ($('#MoveinDate').val() === null) {
        Toast('Please choose Move-In Time To Proceed');
    } else {
        var input = {
            BookingID: $('#hdnBookingIdchk').val(),
            MoveInDate: $('#MoveinDate').val(),
            MoveInTimeId: $('#MoveInTime').val()
        };
        var url = '/api/MyAccount/ChangeMoveinDetails';
        APICall(url, input, true)
            .then(responseData => {
                var response = responseData;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === 'success') {
                    setTimeout(function () { window.location.reload(); }, 1500);
                    Toast('Move-In Details Updated Successfully !');
                    scrollTop(1000);
                } else {
                    Toast('Move-In Details Update Failed !');
                    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                }
            }, errorMsg => { console.log(errorMsg.Message); })
            .catch(ex => { console.log('Exception: ' + ex.message); })
            .finally(() => { $('#AjaxLoader').fadeOut(500); });
    }
}


function ConfirmKeyReceivedStatus() {
    if ($('#chkKeyReceived').prop('checked') === false) {
        Toast('Please confirm that you have received the keys and moved-in to the property');
    } else {
        var input = {
            BookingID: $('#hdnBookingIdchk').val(),
            IsCustomerKeyReceived: $('#chkKeyReceived').prop('checked')
        };
        var url = '/api/MyAccount/ConfirmKeyReceivedStatus';
        APICall(url, input, true)
            .then(responseData => {
                var response = responseData;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === 'success') {
                    setTimeout(function () { window.location.reload(); }, 1500);
                    Toast('Move-In Details Updated Successfully !');
                    scrollTop(1000);
                } else {
                    Toast('Move-In Details Update Failed !');
                    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                }
            }, errorMsg => { console.error(errorMsg); })
            .catch(ex => { console.log('Exception: ' + ex.message); })
            .finally(() => { $('#AjaxLoader').fadeOut(500); });
    }
}


function BindPreviousBookingList(PrevList) {
    var StrPrevBookings = "";
    if (PrevList.length > 0) {
        $.each(PrevList, function (i, v) {
            StrPrevBookings += "<div class='col-lg-6 col-md-6 col-12 pl-0'> \
                             <div class='card-wrap'> \
                                 <div class='card-img'> \
                                     <img src='" + v.PropertyImage + "' class='property-img'  alt='" + v.PropertyName + "'> \
                                     <p class='date-on-hover'>" + v.CheckoutDate + " </p> \
                                 </div> \
                                 <div class='card-info'> \
                                     <div class='card-detail'> \
                                         <div class='card-title'> \
                                             <p>" + v.PropertyName + "</p> \
                                             <span> \
                                                 <img src='/assets/images/location.png' alt='mapicon'>" + v.Address + "</span> \
                                         </div> \
                                         <div class='like-share'> \
                                             <img src='/assets/images/share.png'> \
                                             <i class='fa fa-heart-o'></i> \
                                         </div> \
                                     </div> \
                                     <div class='pricing-rating'> \
                                         <div class='price'> \
                                             <p>Starting price</p> \
                                             <p>₹ " + ConverToRupees(v.Rent) + "</p> \
                                         </div> \
                                         <div class='rating' > \
                                         <p>3.5/5</p> \
                                         <p class='stars'> \
                                                 <i class='fa fa-star' aria-hidden='true'></i> \
                                                 <i class='fa fa-star' aria-hidden='true'></i> \
                                                 <i class='fa fa-star' aria-hidden='true'></i> \
                                                 <i class='fa fa-star' aria-hidden='true'></i> \
                                                 <i class='fa fa-star' aria-hidden='true'></i> \
                                             </p>  \
                                         </div> \
                                     </div> \
                                  </div> \
                             </div> \
                         </div>";
        });
        $('#PreviousBookingContainer').append(StrPrevBookings);
        $(".property-img").on("error", function (e) {
            this.src = "/assets/images/marathalli.jpg";
        });
    } else {
        $('#PreviousBookingContainer').append('<div class="Nobookings"><img src="/assets/images/dashboard-bookings/apartment.svg" /><h6>No Previous Booking\'s Found</h6></div>');
    }
}


function BindCustomerPayementHistory(CustomerId) {
    var input = {
        CustomerID: CustomerId === undefined ? $('#hdnCustomerId').val() : CustomerId
    };
    var url = '/api/MyAccount/GetCustomerPayementHistory';
    APICall(url, input, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var DuesList = Data.MyDue;
                var SummaryList = Data.Summary;
                var HistoryList = Data.History;
                var Notes = Data.Notes[0];
                BindCustomerDuesDetails(DuesList);
                BindCustomerInvoiceDetails(SummaryList);
                BindCustomerPaymentDetails(HistoryList);
                GetCustomerAccountStatement();
                BindCEONotes(Notes.CEONotes);
                BindPMNotes(Notes.PMNotes);
            } else {
                console.log('Request Status: ' + Status + ' Status Text: ' + Message + ' ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}


function BindCustomerDuesDetails(DuesList) {
    var strDuesSummary = "";
    if (DuesList.length > 0) {
        $.each(DuesList, function (i, v) {
            strDuesSummary += "<div class='card'> \
                <div class='no-gutters'> \
                    <div class='card-body next-month-rent'> \
                        <div class='akdj next-rent'> \
                            <h5 class='card-title'>" + (v.InvoiceType === 1 ? 'Rent' : 'Deposit') + " Invoiced | " + v.PaymentFrom + " - " + v.PaymentTo + "</h5> \
                            <button class='btn btn-primary' data-invoicetype = '"+ v.InvoiceType+"' data-rent='" + v.Rent + "' data-minamount='" + v.MinAmount + "' data-bookingid='" + v.BookingID + "' \
                             data-depositos='" + v.DepositOS + "' data-totalrenttopay='" + v.TotalRentToPay + "'  data-maintenance='" + v.Maintenance + "' data-totalpayable='" + v.TotalPayable + "' \
                             data-roomid='" + v.RoomID + "'   data-paymentto='" + v.PaymentTo + "' data-paymentfrom='" + v.PaymentFrom + "' \
                             data-previousdue='" + v.PreviousDue + "' id='btnShowDueTypes" + i + "' data-servicetax='" + v.ServiceTax + "' \
                             data-servicetaxvalue='" + v.ServiceTaxValue + "' onclick='ShowDuePaymentTypes($(this));'>Pay now</button > \
                        </div> \
                        <p class='card-text'>Rs. " + v.TotalPayable + "</p> \
                        <div class='invoice_card'>\
                            <p class='invoice-details'>Invoice Details</p> \
                            " + BindInvoiceSplitDetails(v.InvoiceSplit) + "  \
                        </div>\
                    </div> \
                 </div> \
             </div>";
        });
        $('#DuesSection').append(strDuesSummary);
    } else {
        $('#DuesSection').append('<div class="Nobookings"><img src="/assets/images/cash.svg" /><h6>No Dues Found</h6></div>');
    }
}

function ShowDuePaymentTypes(obj) {
    $('#spnOverallDues').html(obj.data('totalpayable'));
    $('#spnOverallRent').html(obj.data('totalrenttopay'));
    $('#btnDuesConfirm').data('buttonid', obj[0].id);
    $('#DuesModal').modal('show');
    if ($('#hdnCancelNotice').val() === 'forcancelnotice') {
        $('#ChoosePay').attr('style', "display: none");
        $('#ChooseRent').attr('style', "display: none");
    }
}


function BindInvoiceSplitDetails(SplitList) {
    var strDuesSplitDetails = "";
    if (SplitList.length > 0) {
        $.each(SplitList, function (i, v) {
            var strinfo = "";
            if (v.Description !== "" && v.Description !== undefined) {
                strinfo = "<a class='info_symbol'><i class='fa fa-info-circle' aria-hidden='true'></i></a><span class='tooltip_hover'><i class=' arrow left'></i>" + v.Description + "</span>";
            }
            strDuesSplitDetails += "<div class='list-state'> \
                <div class='inside-list-state'>\
                    <p class='diposit'>" + v.Name + "&nbsp;" + strinfo + "</p><p class='cmposission'>₹ " + ConverToRupees(v.Value) + "</p> \
                </div>\
                "+ BindDepositSplitDetails(v.DepositSplit) + "  \
         </div > ";
        });
    }
    return strDuesSplitDetails;
}

function BindDepositSplitDetails(PrevSplitList) {
    var strDepositSplitDetails = "";
    if (PrevSplitList.length > 0) {
        strDepositSplitDetails += "<div class='inside-list-view'> \
                    <div class='invoice_card' style='border: none;'>\
        <div class='next_month_card p'>";
        $.each(PrevSplitList, function (i, v) {
            strDepositSplitDetails += "<div class='list-state'> \
                                                              <p class='diposit'>"+ v.Name + "</p><p class='cmposission'>₹ " + ConverToRupees(v.Value) + "</p> \
                                                   </div>";
    });
        strDepositSplitDetails += " </div >\
       </div></div>";
    }
    return strDepositSplitDetails;
}


function BindPreviousSplitDetails(PrevSplitList) {
    var strPrevDuesSplitDetails = "";
    if (PrevSplitList.length > 0) {
        strPrevDuesSplitDetails += "<div class='inside-list-view'> \
                    <div class='invoice_card' style='border: none;'>"
        $.each(PrevSplitList, function (i, v) {
            strPrevDuesSplitDetails += "<div class='next_month_card p'>\
           <p class='invoice-details'>" + v.Name + "</p><p class='cmposission'></p> \
                "+ BindPreviousSplitComponentsDetails(v.PreviousDuesComponentWise) + "</div >";
        });
        strPrevDuesSplitDetails += "</div></div>";
    }
    return strPrevDuesSplitDetails;
}


function BindPreviousSplitComponentsDetails(PrevSplitComponentWise) {
    var strPrevSplitComponentListDetails = "";
    if (PrevSplitComponentWise.length > 0) {
        $.each(PrevSplitComponentWise, function (i, v) {

            strPrevSplitComponentListDetails += "<div class='list-state'> \
                                                              <p class='diposit'>"+ v.Name + "</p><p class='cmposission'>₹ " + ConverToRupees(v.Value) + "</p> \
                                                   </div>";
        });
    }
    return strPrevSplitComponentListDetails;
}




function PayDuePayment(obj) {
    var chkPaymentType = $('input[name=PaymentType]:checked').val();
    if (chkPaymentType === undefined) {
        Toast('Please Select the Transaction Type !');
        return;
    }
    if (chkPaymentType === "3" && $('#txtOtherPayment').val() === '') {
        Toast('Please Enter Any Transaction Amount!');
        return;
    }
    var ButtonId = obj.data('buttonid');
    var OtherAmount = $('#txtOtherPayment').val();
    var TotalPayable = $('#' + ButtonId + '').data('totalpayable');
    var DepositOs = $('#' + ButtonId + '').data('depositos');
    var InvoiceType = $('#' + ButtonId + '').data('invoicetype');
    var OverallRent = parseInt(TotalPayable) - parseInt(DepositOs);
    if (chkPaymentType === "3" && OtherAmount < 1) {
        Toast('Transaction Amount should not be less than Rs. 1 !');
        return;
    }

    var paymentTo = new Date($('#' + ButtonId + '').data('paymentto'));
    var paymentFrom = new Date($('#' + ButtonId + '').data('paymentfrom'));
    var isOverallDue = 0;
    var isRent = 0;
    var isOtherAmount = 0;
    var custPaidAmount = 0;
    if (chkPaymentType === "1") {
        isOverallDue = 1;
        isRent = 0;
        isOtherAmount = 0;
        custPaidAmount = TotalPayable;
    }
    if (chkPaymentType === "2") {
        isOverallDue = 0;
        isRent = 1;
        isOtherAmount = 0;
        custPaidAmount = OverallRent;
    }
    if (chkPaymentType === "3") {
        isOverallDue = 0;
        isRent = 0;
        isOtherAmount = 1;
        custPaidAmount = OtherAmount;
    }

    var inputobj = {
        CustomerID: $('#hdnCustomerId').val(),
        CreatedBy: 21,
        BookingID: $('#' + ButtonId + '').data('bookingid'),
        BookingFrom: "",
        BookingTo: formatDate(new Date(parseInt(paymentTo.getFullYear()), paymentTo.getMonth(), paymentTo.getDate())),
        BookingIP: "",
        BookingStatusId: 1,
        IsFromWebsite: false,
        RoomID: $('#' + ButtonId + '').data('roomid'),
        Rent: $('#' + ButtonId + '').data('rent'),
        FixedAmenitiesPricing: $('#' + ButtonId + '').data('maintenance'),
        IsOverallDue: isOverallDue,
        IsRent: isRent,
        IsOtherAmount: isOtherAmount,
        CustomerPaidAmount: parseInt(custPaidAmount),
        CustomerDepositOs: parseInt(DepositOs),
        SourceType: 3,
        InvoiceType: InvoiceType,
        CustomerDetails: {
            TotalAmount: TotalPayable,
            IsReservation: false,
            IsAdvanceBooking: false,
            IsWaivedOff: false,
            ADCReceiptNumber: "FromCCAvenue",
            ModeOfPayment: "CCAvenue",
            PaymentStatusId: 1,
            IsConfirming: false,
            ADCProof: "",
            IsToGateway: true,
            PreviousDue: $('#' + ButtonId + '').data('previousdue'),
            PaymentFrom: formatDate(new Date(parseInt(paymentFrom.getFullYear()), paymentFrom.getMonth(), paymentFrom.getDate())),
            PaymentTo: formatDate(new Date(parseInt(paymentTo.getFullYear()), paymentTo.getMonth(), paymentTo.getDate())),
            ServiceTax: $('#' + ButtonId + '').data('servicetax'),
            ServiceTaxValue: $('#' + ButtonId + '').data('servicetaxvalue'),
            PaymentApp: parseInt($('#hdnSourceTypeId').val()),
            AdditionalCharges: []
        },
        ImageUploadList: []
    };
    DuesConfirmation(inputobj);
}


function DuesConfirmation(input) {
    var url = '/api/MyAccount/DuesConfirmation';
    APICall(url, input, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                if (Data.IsNewPay === undefined) {
                    var paymentGateway = response.Data.StrEncRequest;
                    var strRedirectLink = response.Data.RedirectURL;
                    RedirectToPaymentGateway(strRedirectLink, paymentGateway);
                }
                else if (Data.IsNewPay === 1) {
                    $('#OrderId').val(Data.OrderId);
                    $("#fmPayment").submit();
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}


function CancelDuesTransaction() {
    $('#btnDuesConfirm').data('buttonid', 0);
    $('input[name=PaymentType]:checked').prop('checked', false);
    $('#txtOtherPayment').val('');
    $('#spnOverallDues,#spnOverallRent').html('');
    ClearDashboardhiddenFields();
}

function BindCustomerInvoiceDetails(SummaryList) {
    var strinvoiceDetails = "";
    if (SummaryList.length > 0) {
        $.each(SummaryList, function (i, v) {
            strinvoiceDetails += "<div class='adj-conetnt'> \
            <div class='list-state'> \
                <h5 class='card-title'>Invoiced | " + v.Particulars + " - " + (v.InvoiceType === 1 ? 'Rent' : 'Deposit') + "</h5> \
                <button class='btn btn-primary' onclick ='sendInvoiceEmailByInvoiceId(" + v.InvoiceID + "," + v.InvoiceType +");'>Email</button>\
            </div> \
            <div class='list-state'> \
            <h5 class='invoice-no'>Invoice No</h5> \
            <p class='pgup'>" + v.InvoiceID + "</p> \
        </div> \
            <div class='list-state'> \
                <h5 class='invoice-no'>Invoice Date</h5> \
                <p class='pgup'>" + v.BillDate + "</p> \
            </div> \
            <div class='list-state d-none'> \
                <h5 class='invoice-no'>Rent</h5> \
                <p class='pgup'>₹ " + ConverToRupees(v.Amount) + "</p> \
            </div> \
            <div class='list-state d-none'> \
                <h5 class='invoice-no'>Maintenance</h5> \
                <p class='pgup'>₹ " + ConverToRupees(v.FixedAmenitiesPricing) + "</p> \
            </div> \
            <div class='list-state'> \
                <h5 class='invoice-no'>Property name</h5> \
                <p class='pgup'>" + v.PropertyName + "</p> \
            </div> \
            <div class='list-state d-none'> \
                <h5 class='invoice-no'>Adjustment No</h5> \
                <p class='pgup'>" + v.Adjustment + "</p> \
            </div> \
            <div class='list-state'> \
                <h5 class='invoice-no'>"+(v.InvoiceType === 1 ? 'Residential Rent':'Deposit Amount')+ " </h5> \
                <p class='pgup'>₹ " + ConverToRupees(v.TotalAmount) + "</p> \
            </div> \
            <div class='list-state'> \
                <h5 class='invoice-no'>Due Date</h5> \
                <p class='pgup'>" + v.DueDate + "</p> \
            </div> \
         </div>";
        });
        $('#InvoiceContainer').append(strinvoiceDetails);

    } else {
        $('#InvoiceContainer').append('<div class="Nobookings"><img src="/assets/images/cash.svg" /><h6>No Invoice\'s Found</h6></div>');
    }
}


function sendInvoiceEmailByInvoiceId(invoiceid,invoicetype) {
    var input = {
        InvoiceId: invoiceid,
        InvoiceDifferentiateType: invoicetype,
        UserID: 21
    };
    var url = '/api/MyAccount/SendInvoiceMail';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                Toast("Invoice Email has been sent successfully!");
            } else {
                Toast("Invoice Email sending failed! Kindly check the EmailID registered !");
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}


function BindCustomerPaymentDetails(HistoryList) {
    var strReceiptDetails = "";
    if (HistoryList.length > 0) {
        $.each(HistoryList, function (i, v) {
            if (SourceTypeId !== 2 && SourceTypeId !== 3) {
                strReceiptDetails += "<tr> \
            <td scope='row'>" + v.PropertyName + "</td> \
            <td>" + v.PaymentDate + "</td> \
            <td>" + v.ADCReceiptNumber + "</td> \
            <td>₹ " + ConverToRupees(v.PaidAmount) + "</td> \
            <td><button id='btnRecepit" + i + "' onclick='sendReceiptEmailByPaymentId(" + v.PaymentId + ")'>Email</button></td> \
            </tr>";
            } else {
                strReceiptDetails += "<div class='adj-conetnt'> \
            <div class='list-state'> \
                <h5 class='card-title'>&nbsp;</h5> \
                <button class='btn btn-primary' onclick=sendReceiptEmailByPaymentId(" + v.PaymentId + ");>Email</button>  \
            </div> \
            <div class='list-state'> \
            <h5 class='invoice-no'>Property</h5> \
            <p class='pgup'>" + v.PropertyName + "</p> \
        </div> \
            <div class='list-state'> \
                <h5 class='invoice-no'>Transaction Date</h5> \
                <p class='pgup'>" + v.PaymentDate + "</p> \
            </div> \
            <div class='list-state'> \
                <h5 class='invoice-no'>Reference ID</h5> \
                <p class='pgup'>" + v.ADCReceiptNumber + "</p> \
            </div> \
            <div class='list-state'> \
                <h5 class='invoice-no'>Amount</h5> \
                <p class='pgup'>₹ " + ConverToRupees(v.PaidAmount) + "</p> \
            </div> \
         </div>";

            }
        });
        if (SourceTypeId !== 2 && SourceTypeId !== 3) {
            $('#ReceiptSection').append(strReceiptDetails);
            $('#dvReceipt').show();
            $('#dvReceiptApp').hide();
        } else {
            $('#dvReceiptApp').show();
            $('#dvReceipt').hide();
            $('#ReceiptContainer').append(strReceiptDetails);
        }
    } else {
        if (SourceTypeId !== 2 && SourceTypeId !== 3) {
            $('#dvReceipt').show();
            $('#dvReceiptApp').hide();
            $('#ReceiptSection').append('<div class="Nobookings"><img src="/assets/images/cash.svg" /><h6>No Payments Found</h6></div>');
        } else {
            $('#dvReceiptApp').show();
            $('#dvReceipt').hide();
            $('#ReceiptContainer').append('<div class="Nobookings"><img src="/assets/images/cash.svg" /><h6>No Payments Found</h6></div>');
        }
    }
}


function sendReceiptEmailByPaymentId(PaymentId) {
    var input = {
        PaymentId: PaymentId
    };
    var url = '/api/MyAccount/SendReceiptMail';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                Toast("Receipt Email has been sent successfully !");
            } else {
                Toast("Receipt Email sending failed! Kindly check the EmailID registered !");
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

function BindBookingDetailsForServiceRequest(CurrentList, type) {
    var StrCurrBookings = "";
    if (CurrentList.length > 0) {
        $.each(CurrentList, function (i, v) {
            StrCurrBookings += "<div class='col-lg-6 col-md-6 col-12'> \
            <div class='card-wrap'> \
                <div class='card-img'> \
                    <img src='" + v.PropertyImage + "' class='property-img'  alt='" + v.PropertyName + "'> \
                    <p class='date-on-hover'>" + v.CheckinDate + ", " + v.CheckinTime + " </p> \
                </div> \
                <div class='card-info'> \
                    <div class='card-detail'> \
                        <div class='card-title'> \
                            <p>" + v.PropertyName + "</p> \
                            <span> \
                                <img src='/assets/images/location.png' alt='mapicon'>" + v.Address + "</span> \
                        </div> \
                        <div class='like-share'> \
                            <img src='/assets/images/share.png'> \
                            <i class='fa fa-heart-o'></i> \
                        </div> \
                    </div> \
                    <div class='pricing-rating'> \
                        <div class='price'> \
                            <p>Starting price</p> \
                            <p>₹ " + ConverToRupees(v.Rent) + "</p> \
                        </div> \
                        <div class='rating' > \
                        <p>3.5/5</p> \
                        <p class='stars'> \
                                <i class='fa fa-star' aria-hidden='true'></i> \
                                <i class='fa fa-star' aria-hidden='true'></i> \
                                <i class='fa fa-star' aria-hidden='true'></i> \
                                <i class='fa fa-star' aria-hidden='true'></i> \
                                <i class='fa fa-star' aria-hidden='true'></i> \
                            </p>  \
                        </div> \
                    </div>\
                    <div class='cancel-request request-checkin'> \
                        <input type='button' class='reschedule' data-property='" + v.PropertyName + "' data-propertyid='" + v.PropertyID + "'  \
                        data-bookingid='" + v.BookingID + "'  data-roomid='" + v.RoomID + "' data-bookingstatusid='" + v.BookingStatusId + "' data-servicetype='" + type + "'  data-bookingtype='" + v.BookingType + "' value='Raise service request' onclick='RaiseServiceRequest($(this));' /> \
                    </div> \
                </div> \
            </div> \
        </div>";
        });
        $('#servicerequestcard').append(StrCurrBookings);
        $(".property-img").on("error", function (e) {
            this.src = "/assets/images/marathalli.jpg";
        });
    }

}


function RaiseServiceRequest(obj) {
    // Service request disabled by ashwin on 20-09-2019 instructed by siva and manoj as it was affecting the expert appointment flow 
    // Service request enabled by ashwin on 06-12-2019 for checked out customers instructed by siva 
    var type = obj.data('servicetype');
    if (type === 1) {
        $('#Playstore').show();
    } else {
        $('#servicerequestcard').fadeOut(1000);
        $('#ServiceRequestForm').fadeIn(1000);
        $('#spnSRProperty').html(obj.data('property'));
        $('#spnBookingId').html(obj.data('bookingid'));
        $('#hdnBookingIdchk').val(obj.data('bookingid'));
        $('#hdnRoomId').val(obj.data('roomid'));
        $('#hdnBookingType').val(obj.data('bookingtype'));
        $('#hdnSRBookinstatusId').val(obj.data('bookingstatusid'));
        BindServiceRequestMasters(0);
        scrollTop(1000);
    }
}

function BindServiceRequestMasters(type) {
    $('#SlServiceRequestCategory,#SlSRSubCategory').html('');
    var input = {
        BookingStatusId: $('#hdnSRBookinstatusId').val()
    };
    var url = '/api/MyAccount/BindServiceRequestMasters';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var CategoryList = Data;
                if (CategoryList.length > 0) {
                    if (type === 0) {
                        $.each(CategoryList, function (i, v) {
                            $('#SlServiceRequestCategory').append($('<option>', {
                                value: v.CategoryID,
                                text: v.Category
                            }));
                            if (i === 0) {
                                var SubCategory = v.Requests;
                                if (SubCategory.length > 0) {
                                    $.each(SubCategory, function (j, t) {
                                        $('#SlSRSubCategory').append($('<option>', {
                                            value: t.Id,
                                            text: t.Request
                                        }));
                                    });
                                }
                            }
                        });

                    } else {
                        $('#SlSRSubCategory').html('');
                        var MasterCategoryList = CategoryList.filter(function (ArrList) { return ArrList.CategoryID == type; });
                        if (MasterCategoryList.length > 0) {
                            var SubCategoryList = MasterCategoryList[0].Requests;
                            if (SubCategoryList.length > 0) {
                                $.each(SubCategoryList, function (j, t) {
                                    $('#SlSRSubCategory').append($('<option>', {
                                        value: t.Id,
                                        text: t.Request
                                    }));
                                });
                            }
                        }
                    }
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}


function CancelServiceRequest() {
    $('#servicerequestcard').fadeIn(1000);
    $('#ServiceRequestForm').fadeOut(1000);
    $('#spnSRProperty,#spnBookingId').html('');
    $('#txtSRDescription').val('');
    ClearDashboardhiddenFields();
}


function SendServiceRequest() {
    if ($('#txtSRDescription').val() === '') {
        Toast('Please enter Description !');
        return;
    }

    var input = {
        CustomerID: $('#hdnCustomerId').val(),
        RoomID: $('#hdnRoomId').val(),
        BookingType: $('#hdnBookingType').val(),
        SRSubMasterId: $('#SlSRSubCategory').val(),
        Description: $('#txtSRDescription').val(),
        RequestDate: formatDate(new Date()),
        StatusId: 1,
        CreatedBy: 0,
        ImageUploadList: [{
            Path: 'ServiceTicketChat',
            base64: $('#hdnSRImageBinary').val(),
            FileName: $('#hdnSRImageFile').val()
        }]
    };
    var url = '/api/MyAccount/SendServiceRequest';
    APICall(url, input, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                CancelServiceRequest();
                GetServiceRequestHistory();
                ClearDashboardhiddenFields();
                Toast(Message);
                scrollTop(1000);
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}


function GetServiceRequestHistory() {
    var input = {
        CustomerID: $('#hdnCustomerId').val()
    };
    var url = '/api/MyAccount/GetServiceRequestHistory';
    APICall(url, input, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                BindServiceRequestHistory(Data);
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}


function BindServiceRequestHistory(HistoryList) {
    var strServiceRequest = "";
    if (HistoryList.length > 0) {
        $.each(HistoryList, function (i, v) {
            var strClass = "";
            switch (v.StatusId) {
                case 1:
                    strClass = "active-service";
                    break;
                case 2:
                    strClass = "closed-service";
                    break;
                default:
                    strClass = "closed-service";
            }
            strServiceRequest += " <div class='col-lg-6 col-md-6 col-12'> \
            <div class='service-card-wrap'> \
                <div class='service-card-title'> \
                    <p> \
                        " + v.LocationName + " <span class='" + strClass + "'>" + v.Status + "</span> \
                    </p> \
                </div> \
                <div class='body-button-wrap'> \
                    <div class='service-card-body'> \
                        <div class='raised-on'> \
                            <p>Raised on</p> \
                            <p>" + v.RequestDate + "</p> \
                        </div> \
                        <div class='request-for'> \
                            <p>Request for " + v.Catogories + "</p> \
                            <p>" + v.SubCatogories + "</p> \
                        </div> \
                        <div class='comments d-none'> \
                            <p>Comments</p> \
                            <p>" + v.Comments + "</p> \
                        </div> \
                    </div> \
                    <div class='buttons'> \
                    </div> \
                </div> \
            </div> \
          </div>";
        });
        $('#ServiceRequestHistory').html(strServiceRequest);
    } else {
        $('#ServiceRequestHistory').html("<div class='Nobookings'><img src='/assets/images/girl.svg'><h6>No Service Request's Found</h6></div>");
    }

}


function BookingAddressDetailsInsert() {
    var rgx = new RegExp('^[1-9][0-9]{5}$');
    if ($("#permanentaddress1").valid()) {
        if (rgx.test($('#txtPincode1').val())) {
            var input = {
                CustomerID: $('#hdnCustomerId').val(),
                Address: $('#txtHouseNumber1').val() + ', ' + $('#txtStreet1').val(),
                City: $('#txtCity1').val(),
                State: $('#txtState1').val(),
                Country: $('#txtCountry1').val(),
                Pincode: $('#txtPincode1').val(),
                CreatedBy: 0
            };
            SavePermanentAddressDetails(input, 1);
        } else {
            $('#txtPincode1').addClass('customerror');
            Toast('Enter a valid Pincode !');
            $('#txtPincode1').on('focus', function () {
                $('#txtPincode1').removeClass('customerror');
            });
        }
    }
}



function ScheduleDatechanged() {
    $('#slVisitSlots').find('option').remove().end();
    $('#slVisitSlots').append('<option disabled selected value="">Choose Time</option>');
    var input = {
        Date: $('#ScheduleDate').val(),
        PropertyID: $('#hdnLocationId').val()
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
                    for (var i = 0; i < TimslotList.length; i++) {
                        $('#slVisitSlots').append($('<option>', {
                            value: TimslotList[i].TimeId,
                            text: TimslotList[i].TimeString
                        }));
                    }
                } else {
                    Toast("Oops! No time slots available for the day.Please select a slot for the next day.");
                    $('#ScheduleDate').val('');
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}


function redirectschedulevisit() {
    window.location.href = "/schedulevisit.html?loc=" + $('#hdnLocationLink').val();
}


function GetLocationDetails(response) {
    var Status = response.Status,
        Message = response.Message,
        Data = response.Data;
    if (Status === 'success') {
        var PropertyList = Data.Property;
        if (PropertyList.length > 0) {
            var PropertyDetails = PropertyList[0];
            $('#hdnLocationId').val(PropertyDetails.PropertyID);
            $('#hdnLocationName').val(PropertyDetails.PropertyName);
            $('#hdnSubLocation').val(PropertyDetails.SubLocation);
        } else {
            //  window.history.back();
        }
    } else {
        console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
    }
}

function Schedulevisit(Type) {
    if ($('#schedulevisitform').valid()) {
        var strmobile = $("#PhoneNumber").val().trim();
        if (IsValidMobile(strmobile)) {
            $('#schedule-btn').attr('disabled', true);
            var input = {
                Name: $("#CustomerName").val().trim(),
                LocationId: $('#hdnLocationId').val(),
                Phone: strmobile,
                Email: $("#CustomerEmailId").val().trim(),
                PickupDate: $("#ScheduleDate").val().trim(),
                PickupTimeId: $("#slVisitSlots").val(),
                LeadApiSuccess: false,
                LocationName: $('#hdnSubLocation').val(),
                LeadSource: "Website",
                VisitTime: $("#slVisitSlots option:selected").text().trim(),
                PropertyName: $('#hdnLocationName').val()
            };
            var url = '/api/Colive/PropertyScheduleVisitInsert';
            APICall(url, input)
                .then(responseData => {
                    var response = responseData;
                    var Status = response.Status,
                        Message = response.Message,
                        Data = response.Data;
                    if (Status === 'success') {
                        if (Type === 1) {
                            Toast("Your visit is scheduled successfully !");
                            setTimeout(function () { window.location.href = "/"; }, 1500);
                        } else {
                            $('#schedule-first').fadeOut();
                            $('#spnScheduleDetails').html(input.PickupDate + "<br>" + input.VisitTime);
                            $('#ScheduleComplete').fadeIn();
                        }
                        //WhatsApp Template By Shilpa
                        CheckCustomerWhatsAppOptIn(strmobile, 1, 0);
                    } else {
                        console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                    }
                }, errorMsg => { console.log(errorMsg.Message); })
                .catch(ex => { console.log('Exception: ' + ex.message); });
        }
    }
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

    var url = '/api/Colive/CheckCustomerWhatsAppOptIn';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
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
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

function WhatsappPopDisappear() {
    $('#whatsappOptin').hide();
}

function WhatsAppCustomerOptIn() {
    $('#whatsappOptin').css('display', 'none');
    var requestFrom = $('#WhatsappYes').data('requestfrom');
    var mobile = $('#WhatsappYes').data('mobile');
    var input = {
        Mobile: $('#WhatsappYes').data('mobile'),
        RequestFrom: $('#WhatsappYes').data('requestfrom'),
        BookingID: $('#WhatsappYes').data('bookingid'),
        OptInFlag: true
    };
    var url = '/api/Colive/WhatsAppCustomerOptIn';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success' && requestFrom === 1) {
                SendWhatsAppMessage(mobile, requestFrom);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

function WhatsAppCustomerOptOut() {
    var input = {
        Mobile: $('#WhatsappYes').data('mobile'),
        Mob2: $("#mobilenumber").val().trim()
    };
    var url = '/api/Colive/WhatsAppCustomerOptOut';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

function SendWhatsAppMessage(Mobile, RequestFrom) {
    var input = {
        Mobile: Mobile,
        RequestFrom: RequestFrom
    };
    var url = '/api/Colive/SendWhatsAppMessage';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

function ForgotPassoword() {
    if ($("#forgotPassword").valid()) {
        var input = {
            Email: $('#CustEmailID').val()
        };
        var url = '/api/MyAccount/SendResetPasswordLink';
        APICall(url, input)
            .then(responseData => {
                var response = responseData;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === 'success') {
                    $('#FPForm').fadeOut();
                    $('#spnCustEmailid').html($('#CustEmailID').val());
                    $('#FPSucceess').fadeIn();
                } else {
                    Toast(Message);
                    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                }
            }, errorMsg => { console.log(errorMsg.Message); })
            .catch(ex => { console.log('Exception: ' + ex.message); });
    }
}


function ResetPassword() {
    if ($("#FmResetPassword").valid()) {
        if ($('#newpassword').val() !== $('#cnfnewpassword').val()) {
            Toast("New password and confirm password should be the same !");
            return;
        }
        var input = {
            EncCustomerId: getQueryStringValues()["uid"],
            NewPassword: $('#newpassword').val()
        };
        var url = '/api/MyAccount/UpdateNewPasswordFromLink';
        APICall(url, input)
            .then(responseData => {
                var response = responseData;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === 'success') {
                    Toast(Message);
                    setTimeout(function () { window.location.href = '/login'; }, 1500);
                } else {
                    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                }
            }, errorMsg => { console.log(errorMsg.Message); })
            .catch(ex => { console.log('Exception: ' + ex.message); });
    }
}


function ChangePassword() {
    if ($("#fmChangePassword").valid()) {

        if ($('#CurrPassword').val() === $('#NewPassword').val()) {
            Toast("Current Password and New Password Cannot be Same !");
            return;
        }

        if ($('#NewPassword').val() !== $('#ConfirmPassword').val()) {
            Toast("New Password and Confirm Password Do Not Match !");
            return;
        }

        var input = {
            CustomerID: $('#hdnCustomerId').val(),
            OldPassword: $('#CurrPassword').val().trim(),
            NewPassword: $('#NewPassword').val().trim()
        };
        var url = '/api/MyAccount/UpdatePassword';
        APICall(url, input)
            .then(responseData => {
                var response = responseData;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === 'success') {
                    if (Data === 1) {
                        $('#rwpasswordForm').fadeOut();
                        $('#fmPasswordSuccess').fadeIn();
                    } else {
                        Toast(Message);
                    }
                } else {
                    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                }
            }, errorMsg => { console.log(errorMsg.Message); })
            .catch(ex => { console.log('Exception: ' + ex.message); });
    }
}


function FilterConfiguration(Filterobject) {
    var objFilter = Filterobject;
    var PriceRangeList = objFilter.PriceRange;
    var RoomTypeList = objFilter.RoomType;
    var RoomClassList = objFilter.RoomClass;
    var IsFilterLoaded = $('#hdnFilterLoaded').val();
    var objPriceRange = PriceRangeList[0];
    var AmentiesList = objFilter.Amenities;
    var LocationList = objFilter.Locations;
    var LanguagesList = Filterobject.Additional.Languages;
    var HobbiesList = Filterobject.Additional.Hobbies;
    var FoodHabitsList = Filterobject.Additional.FoodHabits;

    if (IsFilterLoaded == "0") {
        $('#hdnFilterLoaded').val("1");
        $('#hdnInitialMinValue').val(objPriceRange.MinPrice);
        $('#hdnInitialMaxValue').val(objPriceRange.MaxPrice);
        if (getQueryStringValues().length >= 4) {
            $('#hdnQueryString').val(window.location.search);
        }
        if (PriceRangeList.length > 0) {
            $('#chkPriceAny').data('value', objPriceRange.MinPrice + ',' + objPriceRange.MaxPrice);
            $('#chkPriceLess').data('value', objPriceRange.MinPrice + ',7000');
            $('#chkPriceGreater').data('value', '11000,' + objPriceRange.MaxPrice);
        }

        //if (RoomTypeList.length > 0) {
        //    var strRoomType = "";
        //    $.each(RoomTypeList, function (i, v) {
        //        strRoomType += "<li> \
        //            <div class='custom-control form-control-lg custom-checkbox'> \
        //                    <input type='checkbox' class='custom-control-input' id='Room_Type" + v.Id + "' onchange='DisableCheckbox($(this));' name='Room_Type' value='" + v.Id + "' " + (i === 0 ? 'checked' : '') + "> \
        //                    <label class='custom-control-label' for='Room_Type" + v.Id + "'>" + v.Name + "</label> \
        //                </div> \
        //            </li>";
        //    });
        //    $('#divRoomType').html(strRoomType);

        //    if (RoomTypeList.length > 5) {
        //        $('#sharingtype > ul > li').last().html('<span id="filterInput" onclick="ShowAllItems($(this));"  class="apply_show" data-count="' + (RoomTypeList.length - 5) + '">' + (RoomTypeList.length - 5) + ' more</span>');
        //    }
        //}


        if (RoomClassList.length > 0) {
            var strRoomClasType = "";
            $.each(RoomClassList, function (i, v) {
                strRoomClasType += "<li> \
                    <div class='custom-control form-control-lg custom-checkbox'> \
                            <input type='checkbox' class='custom-control-input' id='roomClasstype_" + v.Id + "' onchange='DisableCheckbox($(this));' name='room_Class' value='" + v.Id + "' " + (i === 0 ? 'checked' : '') + "> \
                            <label class='custom-control-label' style='width: 100%' for='roomClasstype_" + v.Id + "'>" + v.Name + "</label> \
                           </div> \
                            </li>";
            });
            $('#divRoomClass').html(strRoomClasType);

            if (RoomClassList.length > 5) {
                $('#RoomClass > ul > li').last().html('<span id="filterInput" onclick="ShowAllItems($(this));" class="apply_show" data-count="' + (RoomClassList.length - 5) + '">' + (RoomClassList.length - 5) + ' more</span>');
            }
        }

        if (AmentiesList.length > 0) {
            var strAmenities = "";
            $.each(AmentiesList, function (i, v) {
                strAmenities += "<li> \
                    <div class='custom-control form-control-lg custom-checkbox'> \
                            <input type='checkbox' class='custom-control-input' id='Amenities_" + v.Id + "' onchange='DisableCheckbox($(this));' name='chkAmenities' value='" + v.Id + "' " + (i === 0 ? 'checked' : '') + "> \
                            <label class='custom-control-label' style='width: 100%' for='Amenities_" + v.Id + "'>" + v.Name + "</label> \
                           </div> \
                            </li>";
            });
            $('#divAmenities').html(strAmenities).listfilter({
                'filter': $('#txtSearchAmen'),
                'clearlink': $('#CloseBtnAmen'),
                'alternate': false
            });

            if (AmentiesList.length > 5) {
                $('#Amenities > ul > li').last().html('<span id="filterInput" onclick="ShowAllItems($(this));" class="apply_show" data-count="' + (AmentiesList.length - 5) + '">' + (AmentiesList.length - 5) + ' more</span>');
            }

        }

        if (LocationList.length > 0) {
            var CityList = LocationList.filter(function (obj) { return obj.ParentMenuId === 0 && obj.IsMenuEnabled === true; });
            var AreaList = LocationList.filter(function (obj) { return ((obj.MenuLevel === 2 || obj.MenuLevel === 3) && obj.IsMenuEnabled === true); });
            var location = window.location.pathname;
            if (CityList.length > 0) {
                var strCity = '';
                $.each(CityList, function (i, v) {
                    var strChecked = location.split('/').length > 2 ? location.split('/')[1].toLowerCase() === v.Menu.toLowerCase() ? 'checked' : getQueryStringValues["loc"] === v.Menu.toLowerCase() ? 'checked' : '' : '';
                    strCity += '<li class="radioInputGroup"> \
                                <div class="filtercitySelect"> \
                                <input class="radio-custom" id="rd_City'+ v.MenuId + '" ' + strChecked + '  name="rdCity" type="radio" data-menuid="' + v.MenuId + '" value="' + v.URL + '" onchange="GetLocationsbyCity(2);"> \
                                <label class="radio-custom-label" for="rd_City'+ v.MenuId + '">' + v.Menu + '</label> \
                               </div> \
                               </li>';
                });
                strCity += '<li></li>';
                $('#ulCityList').append(strCity);
                GetLocationsbyCity(1);
            }
        }

        if (LanguagesList.length > 0) {
            var strLanguages = "";
            $.each(LanguagesList, function (i, v) {
                strLanguages += "<li> \
                    <div class='custom-control form-control-lg custom-checkbox'> \
                            <input type='checkbox' class='custom-control-input' id='Languages_" + v.Id + "' onchange='DisableCheckbox($(this));' name='chkLanguages' value='" + v.Id + "' " + (i === 0 ? 'checked' : '') + "> \
                            <label class='custom-control-label' for='Languages_" + v.Id + "'>" + v.Name + "</label> \
                        </div> \
                    </li>";
            });
            $('#divLanguages').html(strLanguages).listfilter({
                'filter': $('#txtSearchLanguages'),
                'clearlink': $('#CloseBtnLanguage')
            });

            if (LanguagesList.length > 5) {
                $('#Languages > ul > li').last().html('<span id="filterInput" onclick="ShowAllItems($(this));"  class="apply_show" data-count="' + (LanguagesList.length - 5) + '">' + (LanguagesList.length - 5) + ' more</span>');
            }
        }

        if (HobbiesList.length > 0) {
            var strHobbies = "";
            $.each(HobbiesList, function (i, v) {
                strHobbies += "<li> \
                    <div class='custom-control form-control-lg custom-checkbox'> \
                            <input type='checkbox' class='custom-control-input' id='Hobbies_" + v.Id + "' onchange='DisableCheckbox($(this));' name='chkHobbies' value='" + v.Id + "' " + (i === 0 ? 'checked' : '') + "> \
                            <label class='custom-control-label' for='Hobbies_" + v.Id + "'>" + v.Name + "</label> \
                        </div> \
                    </li>";
            });
            $('#divhobbies').html(strHobbies).listfilter({
                'filter': $('#txtSearchHobbies'),
                'clearlink': $('#CloseBtnHobbies')
            });

            if (HobbiesList.length > 5) {
                $('#Hobbies > ul > li').last().html('<span id="filterInput" onclick="ShowAllItems($(this));"  class="apply_show" data-count="' + (HobbiesList.length - 5) + '">' + (HobbiesList.length - 5) + ' more</span>');
            }
        }

        if (FoodHabitsList.length > 0) {
            var strFoodHabits = '';
            $.each(FoodHabitsList, function (i, v) {
                strFoodHabits += '<li class="radioInputGroup"> \
                                <div class="filtercitySelect"> \
                                <input class="radio-custom" id="rd_FoodHabits'+ v.Id + '"  name="rdFoodHabits" type="radio" value="' + v.Id + '" ' + (i === 0 ? "checked" : '') + ' onchange="FoodhabitsChanged(2);"> \
                                <label class="radio-custom-label" for="rd_FoodHabits'+ v.Id + '">' + v.Name + '</label> \
                               </div> \
                               </li>';
            });
            $('#ulFoodhabits').append(strFoodHabits);
        }
    }
}


function ApplySearchFilter(flag) {
    var RoomTypeIds = [], RoomType = [];
    $('input[name="Room_Type"]').each(function () {
        if ($(this).prop('checked')) {
            if ($(this).val() === "0") {
                RoomTypeIds = [];
                RoomType = [];
                return false;
            } else {
                RoomTypeIds.push($(this).val());
                RoomType.push($(this).next().text().replace(/ /g, ''));
            }
        }
    });


    var AmenityIds = [], Amenity = [];
    $('input[name="chkAmenities"]').each(function () {
        if ($(this).prop('checked')) {
            if ($(this).val() === "0") {
                AmenityIds = [];
                return false;
            } else {
                AmenityIds.push($(this).val());
                Amenity.push($(this).next().text().replace(/ /g, ''));
            }
        }
    });

    var PriceTypeIds = [];
    $('input[name="chkPrice"]').each(function () {
        if ($(this).prop('checked')) {
            if ($(this).data('value') === "0") {
                PriceTypeIds.push($(this).data('value').split(',')[0]);
                PriceTypeIds.push($(this).data('value').split(',')[1]);
                return false;
            } else {
                PriceTypeIds.push($(this).data('value').split(',')[0]);
                PriceTypeIds.push($(this).data('value').split(',')[1]);
            }
        }
    });


    var LanguagesIds = [], Languages = [];
    $('input[name="chkLanguages"]').each(function () {
        if ($(this).prop('checked')) {
            if ($(this).val() === "0") {
                LanguagesIds = [];
                Languages = [];
                return false;
            } else {
                LanguagesIds.push($(this).val());
                Languages.push($(this).next().text().replace(/ /g, ''));
            }
        }
    });

    var HobbiesIds = [], Hobbies = [];
    $('input[name="chkHobbies"]').each(function () {
        if ($(this).prop('checked')) {
            if ($(this).val() === "0") {
                HobbiesIds = [];
                Hobbies = [];
                return false;
            } else {
                HobbiesIds.push($(this).val());
                Hobbies.push($(this).next().text().replace(/ /g, ''));
            }
        }
    });


    var Location = '', SearchType = 0;
    if ($('input[name="rdLocations"]:checked').length >= 1) {
        SearchType = 1;
        Location = $('input[name="rdLocations"]:checked').val();
        $('.TitleCity').html($('input[name="rdLocations"]:checked').next().text());
        $('title').html('PG Accommodation, Furnished Rooms for Rent in' + $('input[name="rdLocations"]:checked').next().text() + ' Near You: Colive');
        $('#hdnQueryString').val("");
    } else if ($('input[name="rdCity"]:checked').length >= 1) {
        SearchType = 1;
        Location = $('input[name="rdCity"]:checked').val();
        $('.TitleCity').html($('input[name="rdCity"]:checked').next().text());
        $('title').html('PG Accommodation, Furnished Rooms for Rent in' + $('input[name="rdCity"]:checked').next().text() + ' Near You: Colive');
        $('#hdnQueryString').val("");
    } else {
        SearchType = 0;
        let CurrQuery = getQueryStringValues();
        Location = CurrQuery["loc"];
        $('.TitleCity').html(Location);
        $('title').html('PG Accommodation, Furnished Rooms for Rent in' + Location + ' Near You: Colive');
    }


    var input = GetSearchInput(SearchType);
    input.RoomTypeIds = RoomTypeIds.length > 0 ? RoomTypeIds.join(',') : '';
    input.AmenityIds = AmenityIds.length > 0 ? AmenityIds.join(',') : '';
    input.LanguagesIds = LanguagesIds.length > 0 ? LanguagesIds.join(',') : '';
    input.HobbyIds = HobbiesIds.length > 0 ? HobbiesIds.join(',') : '';
    input.FoodHabitsIds = $('input[name="rdFoodHabits"]:checked').val() === "0" ? '' : $('input[name="rdFoodHabits"]:checked').val();
    input.MinValue = PriceTypeIds[0];
    input.MaxValue = PriceTypeIds[PriceTypeIds.length - 1];
    input.LocationName = Location === '' ? input.LocationName : Location;

    let SEOObject = {
        SharingType: RoomType,
        Amenities: Amenity,
        Languages: Languages,
        Hobbies: Hobbies,
        PriceRange: PriceTypeIds[0] + ',' + PriceTypeIds[PriceTypeIds.length - 1],
        URL: Location === '' ? input.LocationName : Location,
        FoodHabits: $('input[name="rdFoodHabits"]:checked').val() === "0" ? '' : $('input[name="rdFoodHabits"]:checked').next().text(),
        Type: SearchType
    };
    bindPropertyDetails(input);
    ChangeURLForSEO(SEOObject);
}


function ResetSearchFilter() {
    $('input[name="chkPrice"],input[name="Room_Type"],input[name="chkAmenities"],input[name="rdCity"], \
       input[name="rdLocations"], input[name="chkLanguages"], input[name="chkHobbies"],  \
       input[name="rdFoodHabits"]').prop('checked', false);
    $('input[name="chkPrice"]').first().prop('checked', true);
    $('input[name="Room_Type"]').first().prop('checked', true);
    $('input[name="chkAmenities"]').first().prop('checked', true);
    $('input[name="rdCity"]').first().prop('checked', true);
    GetLocationsbyCity(0);
    $('input[name="chkLanguages"]').first().prop('checked', true);
    $('input[name="chkHobbies"]').first().prop('checked', true);
    $('input[name="rdFoodHabits"]').first().prop('checked', true);
    $('#txtSearchFilter,.filter-search-visible').val('').trigger('keyup');
    if (Windowidth > 787) {
        ApplySearchFilter(0);
    }
}

function BindReferralDetails() {
    var input = {};
    var url = '/api/MyAccount/GetLoginDetails';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var CustomerDetails = Data;
                $('#Imgreferral').attr('src', CustomerDetails.ReferralImage);
                $('#spnReferral').html(CustomerDetails.ReferralDescription);
                $('#txtReferralCode').val(CustomerDetails.ReferralCode);
                GetReferralHistory();
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

//Website SmartLock
function ShowHideancSmartLock() {
    var url = '/api/MyAccount/GetLoginDetails';
    APICall(url, null)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var CustomerDetails = Data;
                if (CustomerDetails.SmartLockStatus) {
                    $('#ancSmartLock').css('display', 'block');
                }
                else {
                    $('#ancSmartLock').css('display', 'none');
                }
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}



function BindSmartLockDetails() {
    var input = {};
    var url = '/api/MyAccount/GetLoginDetails';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var CustomerDetails = Data;
                $('#spnSmartLock').html(CustomerDetails.CustomerName);
                $('#spnLocName').html(CustomerDetails.SmartLockLocationName);
                $('#spnRoomCode').html(CustomerDetails.SmartLockRoomCode);
                $('#hdnBookingId').val(CustomerDetails.SmartLockBookingId);
                GenerateAccessCode($('#hdnBookingId').val());
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

function GenerateAccessCode(hdnBookingIdchk) {
    var input = { BookingID: hdnBookingIdchk };
    var url = '/api/MyAccount/GenerateAccessCode';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                if (Data.VendorID === 1)
                    $("#txtSmartLock").val(Data.UnLockOAC);
                else if (Data.VendorID === 2)
                    $("#txtSmartLock").val(Data.UnLockPinCode);
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

function DeactivateActivate(hdnBookingIdchk) {
    var input = { BookingID: hdnBookingIdchk, isForceRefresh: true };
    var url = '/api/MyAccount/GenerateAccessCode';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                if (Data.VendorID === 1)
                    $("#txtSmartLock").val(Data.UnLockOAC);
                else if (Data.VendorID === 2)
                    $("#txtSmartLock").val(Data.UnLockPinCode);
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

function RenderDashboard(List) {
    if (List.length > 0) {
        switch (List[0]) {
            case "opn":
                if (List.opn == 'service') {
                    setTimeout(function () { $('#ancServiceRequest').click(); }, 1500);
                } else if (List.opn == 'dues') {
                    setTimeout(function () { $('#ancDuesAndPayment').click(); }, 1500);
                }
                break;
            case "movein":
                setTimeout(function () {
                    $('#ancbooking').click();
                    $('#nav-bookings-Movein').click();
                }, 1500);
                setTimeout(function () { $('#btnMovein_' + List.movein + '').click(); }, 2000);
                break;
            case "rid":
                setTimeout(function () {
                    $('#ancbooking').click();
                    $('#nav-bookings-Reservation').click();
                }, 1500);
                setTimeout(function () { $('#btnBookingId_' + List.rid + '').click(); }, 2000);
                break;
            case "cancelnotice":
                setTimeout(function () {
                    $('#ancbooking').click();
                    $('#nav-bookings-Current').click();
                }, 1500);
                break;
            case "addcotenant":
                CotenantResponse(List.addcotenant, true, false);
                setTimeout(function () {
                    $('#ancCoTenant').click();
                }, 1500);
                setTimeout(function () {
                    ScrollByElement($('#dvCotenant_' + List.addcotenant + ''), 1000);
                    $('#CoTenantName_' + List.addcotenant + '').focus();
                    $('#TenantForm_' + List.addcotenant + ' [type="radio"]').prop('checked', false); 
                    $("input:radio[data-type='rdContenantNo_" + List.addcotenant + "']").prop('checked', 'checked');
                    $('#CoTenantMobile_' + List.addcotenant + ',#CoTenantEmail_' + List.addcotenant + ',#CoTenantName_' + List.addcotenant + ',#btnAddCotenant_' + List.addcotenant + '').prop('disabled', false);
                }, 2000); 
                break;
            default:
        }
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


function EditMoveInDetails(btnelement) {
    if (btnelement.val() === "Edit") {
        btnelement.val("Cancel");
        $('#dtMoveinDate,#slMoveInTime').prop('disabled', false);
    } else {
        btnelement.val("Edit");
        $('#dtMoveinDate,#slMoveInTime').prop('disabled', true);
        $('#dtMoveinDate').val($('#hdnCheckinDate').val());
        $('#slMoveInTime').html('');
        $('#slMoveInTime').append('<option value="' + $('#hdnCheckInTimeId').val() + '">' + $('#hdnCheckinTime').val() + '</option>');
               $("#txtCoupon").val('');
        $('#hdnCouponID').val('0');
        $("#txtCoupon").removeAttr('disabled');
        $("#btnCheckinPromoApply").val("Apply");
        GetcheckinDetails($('#hdnBookingIdchk').val(), $('#hdnCouponID').val(), $('#hdnCheckinDate').val());
    }
}


function DisableCheckbox(obj) {
    if (obj.length >= 0) {
        var element = obj[0];
        if (element.value != 0) {
            $('input[name="' + element.name + '"]').first().prop('checked', false);
        } else {
            $('input[name="' + element.name + '"]').prop('checked', false);
            $('input[name="' + element.name + '"]').first().prop('checked', true);
        }
    }
    if (Windowidth > 787) {
        ApplySearchFilter(0);
    }
}

function BindHeaderLinksForSiteMap() {
    var _CurrDate = new Date();
    var _date = _CurrDate.getFullYear().toString() + (_CurrDate.getMonth() + 1).toString() + _CurrDate.getDate().toString();
    var url = '/api/Colive/LoadHeaderLocationMenu';
    APICall(url, {})
        .then(responseData => {
            var response = JSON.parse(responseData);
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            var NewData = '';
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
                $('#SitemapCityList').html(NewData);
            }
        }, errorMsg => {
            alert('Failed');
            console.log(errorMsg.Message);
        })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}


function showModal(obj) {
    $('#PropertyFrame').attr('src', obj.data('frameurl'));
    $('.PropertyModalWrapper').slideDown();
}

function RemoveEmptyTags(Arr, toplen) {
    var length = (toplen == undefined) ? Arr.Length : toplen;
    var ArrCount = 0;
    var strContent = '';
    $.each(Arr, function (i, v) {
        if (ArrCount != length) {
            var htmlContent = v.innerHTML.replace("<br>", "");
            if (v.innerText != "") {
                strContent += htmlContent;
                ArrCount++;
            }
        }
    });
    htmlContent = '';
    return strContent;
}


function BindCustomerAccountStatement(CustomerID) {
    var input = {
        CustomerID: CustomerID
    };
    var url = '/api/MyAccount/BindCustomerAccounts';
    APICall(url, input, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            var strAccountsTable = '';
            if (Status === 'success') {
                var ArrCustomerStatementReport = Data.CustomerStatementReport;
                strAccountsTable += '<div class="AccountCol firstCol txt_c">S.No</div>\
                                     <div class="AccountCol secondCol txt_c">Month</div>\
                                     <div class="AccountCol thirdCol txt_c"> Dues</div >\
                                     <div class="AccountCol fourthCol txt_c">Paid</div>\
                                     <div class="AccountCol fifthCol txt_c">OS</div>';
                if (ArrCustomerStatementReport.length > 0) {
                    $.each(ArrCustomerStatementReport, function (i, v) {
                        strAccountsTable += '<div class="AccountRow SNo txt_c">' + (i + 1) + '</div>\
                                             <div class="AccountRow Month txt_c">' + v.DueDate + '</div>\
                                             <div class="AccountRow Dues txt_r">' + v.DueAmount + '</div>\
                                             <div class="AccountRow Paid txt_r">' + v.PaidAmount + '</div>\
                                             <div class="AccountRow OutStanding txt_r">' + v.Outstanding + '</div>';
                    });
                    $('#AccountsTable').append(strAccountsTable);
                } else {
                    $('#AccountsTable').fadeOut();
                    $('#EmptyAccountRecords').fadeIn();
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}

function Contactus() {
    if ($("#touchwithus").valid()) {
        var input = {
            Name: $("#name").val().trim(),
            Mobile: $("#mobilenumber").val().trim(),
            Email: $('#email').val(),
            Message: $("#message").val().trim(),
            ContactusType: $("#ddlleadtype").val(),
            Source: "ColiveWebsite"
        };
        var url = '/api/Colive/ContactUsInsert';
        APICall(url, input, true)
            .then(responseData => {
                var response = responseData;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === 'success') {
                    $("#name,#mobilenumber,#email,#message,#ddlleadtype").val('');
                    Toast("Contactus saved successfully !");
                } else {
                    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                }
            }, errorMsg => { console.log(errorMsg.Message); })
            .catch(ex => { console.log('Exception: ' + ex.message); })
            .finally(() => { $('#AjaxLoader').fadeOut(500); });
    }
}

function ReturnUtilityDetails(Utilitylist) {
    var strUtilityItems = '';
    if (Utilitylist.length > 0) {
        $.each(Utilitylist, function (i, v) {
            strUtilityItems += " <div class='amenity'><div class='amenityServiceImage'><img src='" + v.Image + "' alt='" + v.AmenityName + "'></div><span>" + v.AmenityName + "</span></div>";
        });
    }
    return strUtilityItems;
}

function ReturnOfferDetails(OfferList) {
    var strOfferItems = '';
    if (OfferList.length > 0) {
        $.each(OfferList, function (i, v) {
            strOfferItems += " <div class='amenity OfferSec_Align'><div class='amenityServiceImage'><img src='/assets/images/pink-tick.svg'></div><div class='amentiesOfferSecDesign'> " + v.Description + " </div></div>";
        });
    }
    return strOfferItems;
}

function GetUtilityImage(UtilityType) {
    var src = '';
    switch (UtilityType) {
        case 'Style':
            src = '/assets/images/about/about-style.svg';
            break;
        case 'Safety':
            src = '/assets/images/about/about-safety.svg';
            break;
        case 'Service':
            src = '/assets/images/about/about-service.svg';
            break;
        case 'Savings':
            src = '/assets/images/about/about-savings.svg';
            break;
        case 'Smart':
            src = '/assets/images/about/about-smart.svg';
            break;
        case 'Social':
            src = '/assets/images/about/about-social.svg';
            break;
        default:
            src = '/assets/images/about/about-style.svg';
            break;
    }
    return src;
}

function ToggleAmenities(obj) {
    obj.parent().find('.adjustheight').slideToggle(800);
    obj.toggleClass("CollapseIcon");
    obj.toggleClass("active");
}

function ReferralInsert() {
    if ($("#ReferralForm").valid()) {
        var input = {
            ReferralCode: $("#txtReferralCode").val().trim(),
            ReferralName: $("#ReferralName").val().trim(),
            ReferralMobile: $('#ReferralMobile').val()
        };
        var url = '/api/MyAccount/ReferralInsert';
        APICall(url, input, true)
            .then(responseData => {
                var response = responseData;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === 'success') {
                    $("#ReferralName,#ReferralMobile").val('');
                    Toast(Message);
                    GetReferralHistory();
                } else {
                    Toast(Message);
                    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                }
            }, errorMsg => { console.log(errorMsg.Message); })
            .catch(ex => { console.log('Exception: ' + ex.message); })
            .finally(() => { $('#AjaxLoader').fadeOut(500); });
    }
}

function GetReferralHistory() {
    var input = {
        CustomerID: $('#hdnCustomerId').val()
    };
    var url = '/api/MyAccount/GetReferralHistory';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var ReferralList = Data.Search;
                var strReferral = '';
                if (ReferralList.length > 0) {
                    $.each(ReferralList, function (i, v) {
                        strReferral += '<tr><td>' + (i + 1) + '</td ><td>' + v.ReferralName + '</td><td>' + v.Status + '</td><td>' + (v.IsOfferAvailed === true ? "<i class='fa fa-check-circle' aria-hidden='true'></i>" : "<i class='fa fa-times-circle' aria-hidden='true'></i >") + '</td></tr>';
                    });
                    $('#ReferralSection').append(strReferral);
                } else {
                    $('#tbReferral').hide();
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

//EmailVerification Changes By Shilpa
function SaveKycBasicDetails(obj) {
    if ($("#personaldetails").valid()) {
        let age = getAge($("#txtDob").val());
        if (age >= 16) {

            if ($('#ProfileImg').attr('src') !== "") {
                var input = {
                    CustomerID: $('#hdnCustomerId').val(),
                    FirstName: $('#txtFirstName').val().trim(),
                    //LastName: $('#txtLastName').val().trim(),
                    Mobile: $('#txtMobile').val().trim(),
                    DOB: $('#txtDob').val(),
                    Email: $('#txtEmail').val().trim(),
                    ImageUploadList: [{
                        Path: 'customerphoto',
                        base64: $('#hdnProfileImageBinary').val(),
                        FileName: $('#hdnProfileImageFile').val()
                    }],
                    Gender: $("#ddlGender").val(),
                    CreatedBy: 0
                };
                if (obj["prevObject"][0].id === "lnkVerifyMail") {
                    $('#hdnLink').val("1");
                }
                SaveCustomerKycBasicDetails(input);
                if (obj["prevObject"][0].id !== "lnkVerifyMail") {
                    setTimeout(function () {
                        if ($('#hdnRequestStatusId').val() === "1") {
                            showNextForm(obj);
                        }
                    }, 800);
                }
            } else {
                Toast('Please upload the profile picture to proceed further !');
            }
        } else {
            Toast("Age should not be less than 16 years");
        }
    }
}

function SaveCustomerKycBasicDetails(inputJson) {
    var url = '/api/MyAccount/SaveKycDetails';
    APICall(url, inputJson)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                BindcustomerDetails();
                if ($('#hdnLink').val() === "0")
                    Toast('Basic Details saved successfully!');
                else
                    VerifyMailId();
            } else {
                $('#hdnRequestStatusId').val("0");
                Toast(Message);
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}



function SaveCustomerBasicDetails(inputJson, type) {
    var url = '/api/MyAccount/SignUp';
    APICall(url, inputJson)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                if (type === 1) {
                    GenerateOTP(4, inputJson.Mobile, SignUpOTPVerify);
                } else {
                    BindcustomerDetails();
                }
            } else {
                if (type === 2) {
                    $('#hdnRequestStatusId').val("0");
                }
                Toast(Message);
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}


function SaveKYCPermanentAddress(obj) {
    var rgx = new RegExp('^[1-9][0-9]{5}$');
    if ($("#permanentaddress").valid()) {
        if (rgx.test($('#txtPincode').val())) {
            var input = {
                CustomerID: $('#hdnCustomerId').val(),
                Address: $('#txtHouseNumber').val() + ', ' + $('#txtStreet').val(),
                City: $('#txtCity').val(),
                State: $('#txtState').val(),
                Country: $('#txtCountry').val(),
                Pincode: $('#txtPincode').val(),
                CreatedBy: 0
            };
            SavePermanentAddressDetails(input, 2);
            setTimeout(function () { showNextForm(obj); }, 800);
        } else {
            $('#txtPincode').addClass('customerror');
            Toast('Enter a valid Pincode !');
            $('#txtPincode').on('focus', function () {
                $('#txtPincode').removeClass('customerror');
            });
        }
    }
}


function SavePermanentAddressDetails(inputJson, Type) {
    var url = '/api/MyAccount/AddressDetailsInsert';
    APICall(url, inputJson, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                Toast('Permanent Address Details saved successfully!');
                if (Type === 1) {
                    $('#addressmodal').modal('hide');
                    GetCustomerkycDetails();
                    $('#btnRentCalculation').click();

                }
            } else {
                Toast('Permanent Address Details save failed!');
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}


function SavePanDetails(obj) {
    var regexPan = new RegExp('[A-Z]{5}[0-9]{4}[A-Z]{1}');
    var PanNumber = $('#txtPANNumber').val().trim().toUpperCase();
    if ($("#pandetails").valid()) {
        if (regexPan.test(PanNumber)) {
            if ($('#PanImg').attr('src') !== "") {
                var input = {
                    CustomerID: $('#hdnCustomerId').val(),
                    Name: $('#txtPANCardHolderName').val(),
                    IDProofMasterId: 5,
                    IDNumber: PanNumber,
                    ImageUploadList: [{
                        Path: 'customerproof',
                        base64: $('#hdnPanImageBinary').val(),
                        FileName: $('#hdnPanImageFile').val()
                    }],
                    IsDocumentPending: false,
                    ProofTypeID: 3,
                    CreatedBy: 0
                };
                SaveCustomerProofDetails(input, 1);
                setTimeout(function () { showNextForm(obj); }, 800);
            } else {
                Toast('Please upload the PAN card image to proceed further !');
            }
        } else {
            $('#txtPANNumber').addClass('customerror');
            Toast('Please enter a valid PAN number !');
            $('#txtPANNumber').on('focus', function () {
                $('#txtPANNumber').removeClass('customerror');
            });
        }
    }
}

function SaveCustomerProofDetails(inputJson, type) {
    var url = '/api/MyAccount/SaveCustomerProofDetails';
    APICall(url, inputJson)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                switch (type) {
                    case 1:
                        Toast('PAN details saved successfully !');
                        break;
                    case 2:
                        Toast('ID proof details saved successfully !');
                        break;
                    default:
                        Toast('Proof details saved successfully !');
                        break;
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

function SaveEmergencyDetailsInsert(obj) {
    var strMobile = $('#txtGuardianPhone').val();
    if ($("#emergdetails").valid()) {
        if (IsValidMobile($('#txtGuardianPhone').val())) {
            var inputJson = {
                CustomerID: $('#hdnCustomerId').val(),
                GardianName: $('#txtGuardianName').val(),
                Relationship: $('#ddlRelationship').val(),
                Mobile: strMobile,
                Address: $('#txtPermananentAddress').val(),
                CreatedBy: 0
            };
            var url = '/api/MyAccount/SaveEmergencyDetailsInsert';
            APICall(url, inputJson)
                .then(responseData => {
                    var response = responseData;
                    var Status = response.Status,
                        Message = response.Message,
                        Data = response.Data;
                    if (Status === 'success') {
                        Toast('Emergency Details Saved Successfully !');
                        setTimeout(function () { showNextForm(obj); }, 800);
                    } else {
                        console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                    }
                }, errorMsg => { console.log(errorMsg.Message); })
                .catch(ex => { console.log('Exception: ' + ex.message); });
        }

    }
}

function SaveBankDetails(obj) {
    if ($("#bankinfo").valid()) {
        var strIFSCCode = $('#txtIFSCCode').val().trim().toUpperCase();
        var strRegex = new RegExp('^[A-Z]{4}[A-Z0-9]{6,7}$');
        if (strRegex.test(strIFSCCode)) {
            var input = {
                CustomerID: $('#hdnCustomerId').val(),
                BankName: $('#txtBankName').val().trim(),
                HolderName: $('#txtAccountHolderName').val().trim(),
                AccountNumber: $('#txtAccountNumber').val().trim(),
                IFSC_Code: strIFSCCode,
                ImageUploadList: [{
                    Path: 'customerproof',
                    base64: $('#hdnbankImageBinary').val(),
                    FileName: $('#hdnbankImageFile').val()
                }],
                CreatedBy: 0
            };
            var url = '/api/MyAccount/SaveBankDetails';
            APICall(url, input)
                .then(responseData => {
                    var response = responseData;
                    var Status = response.Status,
                        Message = response.Message,
                        Data = response.Data;
                    if (Status === 'success') {
                        Toast('Bank Details Saved Successfully !');
                        setTimeout(function () { showNextForm(obj); }, 800);
                    } else {
                        console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                    }
                }, errorMsg => { console.log(errorMsg.Message); })
                .catch(ex => { console.log('Exception: ' + ex.message); });
        } else {
            Toast('Enter a valid IFSC Code !');
            $('#txtIFSCCode').addClass('customerror');
            $('#txtIFSCCode').on('focus', function () {
                $('#txtIFSCCode').removeClass('customerror');
            });
        }
    }
}

function SaveEmployementDetails(obj) {
    if ($("#employinfo").valid()) {
        if ($('#Iamemployed').prop('checked')) {
            if ($('#txtOrganization').val().trim() === "" || $('#txtDesignation').val().trim() === "") {
                Toast("Please Enter Organization and Designation !");
                return;
            }
        }

        var inputjson = {
            CustomerID: $('#hdnCustomerId').val(),
            EMP_infoID: $("input:radio[name='employment']:checked").val(),
            QualifyID: $("input:radio[name='education']:checked").val(),
            Designation: ($("input:radio[name='employment']:checked").val() === "1") ? $('#txtDesignation').val().trim() : "",
            CompanyName: ($("input:radio[name='employment']:checked").val() === "1") ? $('#txtOrganization').val().trim() : ""
        };

        var url = '/api/MyAccount/SaveQualificationDetails';
        APICall(url, inputjson)
            .then(responseData => {
                var response = responseData;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === 'success') {
                    Toast('Qualification Details Saved Successfully !');
                    setTimeout(function () { showNextForm(obj); }, 800);
                } else {
                    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                }
            }, errorMsg => { console.log(errorMsg.Message); })
            .catch(ex => { console.log('Exception: ' + ex.message); });
    }
}


function SaveResidentKYC(obj) {
    var IDNumber = $('#txtIDNumber').val().trim();
    var regexID = new RegExp('^[a-zA-Z ]*$');
    if ($("#idprrof").valid()) {
        if (regexID.test($('#txtIDHolderName').val())) {
            if ($('#Imgproof').attr('src') !== "") {
                var input = {
                    CustomerID: $('#hdnCustomerId').val(),
                    Name: $('#txtIDHolderName').val(),
                    IDProofMasterId: $("input:radio[name='idproof']:checked").val(),
                    IDNumber: IDNumber,
                    ImageUploadList: [{
                        Path: 'customerproof',
                        base64: $('#hdnidproofImageBinary').val(),
                        FileName: $('#hdnidproofImageFile').val()
                    }],
                    IsDocumentPending: false,
                    ProofTypeID: 2,
                    CreatedBy: 0
                };
                SaveCustomerProofDetails(input, 2);
                setTimeout(function () { showNextForm(obj); }, 800);
            } else {
                $('#txtIDNumber').addClass('customerror');
                Toast('Please enter a valid ID number !');
                $('#txtPANNumber').on('focus', function () {
                    $('#txtIDNumber').removeClass('customerror');
                });
                Toast('Please upload the ID Proof image to proceed further !');
            }
        } else {
            Toast('Please enter only alphabets for ID holder name !');
        }
    }
}


function SaveOtherDetails(type = 0) {
    if ($("#otherinfo").valid()) {
        var input = {
            CustomerID: $('#hdnCustomerId').val(),
            AgeGroup: $('#ddlAgeGroup').val(),
            BloodGroup: $('#ddlBloodGroup').val(),
            LanguagesSpeak: $('#txtLanguagesSpeak').val(),
            MaritalStatus: $('#ddlMaritalStatus').val(),
            InterestsHobbies: $('#txtInterestsHobbies').val(),
            CollegeAlumni: $('#txtCollegeAlumni').val(),
            IncomeRange: $('#ddlIncomeRange').val(),
            OwnVehicle: $('#ddlOwnVehicle').val(),
            AllergicTo: $('#txtAllergicTo').val(),
            Vegeterian: $("input:radio[name='vegeterian']:checked").val(),
            MedicalHistory: $('#txtMedicalHistory').val(),
            CreatedBy: 0,
            Mobile: $('#txtMobile').val(),
            IsOptIn: $('#ChkOn:checked').val() ? true : false,
            TwoWheelerNumber: $('#txt2WheelerNumber').val(),
            FourWheelerNumber: $('#txt4WheelerNumber').val()
        };

        var url = '/api/MyAccount/SaveOtherDetails';
        APICall(url, input)
            .then(responseData => {
                var response = responseData;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === 'success') {
                    if (type == 1) {
                        $('#kycmodal').modal('hide');
                        Toast('Kyc completed Successfully!');
                        $('#btnReservationConfirmation').show();
                    } else {
                        if (getQueryStringValues()["rid"] === undefined) {
                            setTimeout(function () { window.location.href = '/dashboard'; }, 2000);
                        } else {
                            setTimeout(function () { window.location.href = '/dashboard?rid=' + getQueryStringValues()["rid"] + ''; }, 2000);
                        }
                    }
                } else {
                    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                }
            }, errorMsg => { console.log(errorMsg.Message); })
            .catch(ex => { console.log('Exception: ' + ex.message); });
    }
}




function EquipMyProfileForm() {
    $("#personaldetails").validate({
        rules: {
            firstname: "required",
            lastname: "required",
            gender: "required",
            profiledob: {
                required: true,
                date: true
            },
            mobilenumber: {
                required: true,
                number: true,
                maxlength: 10,
                minlength: 10
            },
            emailid: {
                required: true,
                email: true
            }
        },
        messages: {
            firstname: "Please enter your firstname",
            lastname: "Please enter your lastname",
            gender: "Please select your gender",
            mobilenumber: "Please enter a valid mobile number",
            emailid: "Please enter a valid email id",
            profiledob: "Please choose your date of birth"
        }
    });

    $("#pandetails").validate({
        rules: {
            panholdername: "required",
            panname: "required"
        },
        messages: {
            panholdername: "Please enter your PAN holder name",
            panname: "Please enter your PAN Number"
        }
    });

    $("#emergdetails").validate({
        rules: {
            guardianname: "required",
            guardianrelation: "required",
            guardianphone: {
                required: true,
                number: true,
                minlength: 10,
                maxlength: 10
            },
            permananentadd: "required"
        },
        messages: {
            guardianname: "Please enter guardian name",
            guardianrelation: "Please enter your guardian relationship",
            guardianphone: "Please enter a valid phone number",
            permananentadd: "Please enter the address"

        }
    });

    $("#bankinfo").validate({
        rules: {
            accholdername: "required",
            bankname: "required",
            accnumber: "required",
            ifsccode: {
                required: true,
                minlength: 11,
                maxlength: 11
            }
        },
        messages: {
            accholdername: "Please enter your account holder name",
            bankname: "Please enter your bank name",
            accnumber: "Please select your account number",
            ifsccode: "Please enter a valid IFSC code"
        }
    });

    $("#employinfo").validate({
        rules: {
            employment: "required",
            education: "required"
        },
        messages: {
            employment: "Please choose your employment type",
            education: "Please choose your education type"

        }
    });

    $("#idprrof").validate({
        rules: {
            idproof: "required",
            IDNumber: "required",
            IDname: "required"
        },
        messages: {
            idproof: "Please choose your ID Proof",
            IDNumber: "Please enter ID Number",
            IDname: "Please enter your name"
        }
    });

    $("#otherinfo").validate({
        rules: {
            bloodgroup: "required",
            agegroup: "required",
            hobbies: "required",
            alumni: "required",
            WheelerNumber: "required"
        },
        messages: {
            bloodgroup: "Please choose your bloodgroup",
            agegroup: "Please choose your age",
            hobbies: "Please enter your hobbies",
            alumni: "please enter when is your alumni",
            WheelerNumber: "Please enter your vehiclenumber"
        }
    });
    EnableAddressFormValidators();
    BindEmergencyRelationshipMasters();
    $('#txtDob').dcalendarpicker({
        format: 'dd-mmm-yyyy'
    });
    var dtDate = new Date();
    $('#txtDob').data().dcalendar.maxDate = dtDate.setDate(dtDate.getDate() - 1);
    setTimeout(function () { GetCustomerkycDetails(); }, 500);
}

function showNextForm($currentForm) {
    var currentFormStep = parseInt($currentForm.attr('data-step')) || false;
    var $NextForm = $('.js-form-step[data-step="' + (currentFormStep + 1) + '"]');
    $body.addClass('freeze');
    $('html, body').animate({ scrollTop: $('.As-part').offset().top }, 'fast');
    $NextForm.addClass('waiting coming').removeClass('leaving hidden');
    $currentForm.removeClass('waiting coming').addClass('leaving hidden');
    setTimeout(function () { $currentForm.removeClass('leaving'); }, 1000);
    $('.form-progress').find('.form-progress-indicator.active').next('.form-progress-indicator').addClass('active');
    $progressBar.val(parseInt($progressBar.val() + 33));
}

function showPrevForm($currentForm) {
    var currentFormStep = parseInt($currentForm.attr('data-step')) || false;
    var $PrevForm = $('.js-form-step[data-step="' + (currentFormStep - 1) + '"]');
    $body.addClass('freeze');
    $('html, body').animate({ scrollTop: $('.As-part').offset().top }, 'fast');
    $PrevForm.addClass('waiting coming').removeClass('leaving hidden');
    $currentForm.removeClass('waiting coming').addClass('leaving hidden');
    setTimeout(function () { $currentForm.removeClass('leaving'); }, 1000);
    $('.form-progress').find('.form-progress-indicator.active').removeClass('active').prev('.form-progress-indicator').addClass('active');
    $progressBar.val(parseInt($progressBar.val() - 33));
}

function GetEvents(EventCode) {
    var Input = {
        EventCode: EventCode === undefined ? "" : EventCode
    };
    var url = '/api/Colive/GetEvents';
    APICall(url, Input, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                if (EventCode === undefined) {
                    BindEventList(Data);
                } else {
                    BindEventDetails(Data);
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}

function BindEventList(Data) {
    var UpComingEvents = [],
        HiddenEvents = [];
    var EventList = Data;
    if (EventList.length > 0) {
        EventList.sort(function (a, b) { var tdDate = new Date(); var Eventdate = new Date(b.EventDate); return tdDate - Eventdate; });
        var ActiveUpcoming = EventList.filter(function (List) { return List.IsPastEvent === false; });
        var CompletedEvents = EventList.filter(function (List) { return List.IsPastEvent === true; });
        if (EventList.length > 3) {
            UpComingEvents = ActiveUpcoming.slice(0, 3);
            HiddenEvents = ActiveUpcoming.slice(3, ActiveUpcoming.length);
        } else {
            UpComingEvents = EventList;
        }
        if (UpComingEvents.length > 0) { $('#upComingEvents').append(GetEventsCards(UpComingEvents)); } else { $('#upComingEvents').hide(); }
        if (HiddenEvents.length > 0) { $('#Events').append(GetEventsCards(HiddenEvents)); $('#btnExplore').show(); } else { $('#Events,#btnExplore').hide(); }
        if (CompletedEvents.length > 0) { $('#dvPastEvents').append(GetEventsCards(CompletedEvents)); $('#btnExplore').show(); } else { $('#txtpastevents,#hrevents').hide(); }
        $(".events-img").on("error", function () { this.src = "/assets/images/marathalli.jpg"; });
        $('[data-toggle="tooltip"]').tooltip();
    } else {
        $('#dvEventsContainer').hide();
    }
}


function GetEventsCards(EventList) {
    var StrEvents = '';
    if (EventList.length > 0) {
        $.each(EventList, function (i, v) {
            //  Removed BlurClass on 2019-11-05
            //  var BlurClass = v.IsPastEvent === true ? 'blur' : '';
            StrEvents += "<div class='col-md-4 eventFormCard'><div class='card'> \
                <a href= '" + v.EventLink + "'> \
                <div class='card-thumbnail-image'> \
                    <img class='card-img-top events-img' src='" + v.TitleImgFileName + "' alt='" + v.HeadLine + "'> \
                    <a href= '" + v.EventLink + "' class='quick'>" + v.HeadLine + "</a> \
                </div> \
                </a> \
                <div class='card-body'> \
                    <a href= '" + v.EventLink + "'><h5 class='commnity_card-title'>" + v.LocationName + "</h5> </a>\
                    <div class='community_cord mt-3 mb-1'> \
                        <i class='fa fa-map-marker' aria-hidden='true'></i> \
                        <p class='hennur mx-2' data-toggle='tooltip' data-placement='bottom' data-original-title='" + v.Venue + "'>" + ReturnWithDotsBylength(v.Venue, 25) + "</p> \
                    </div> \
                    <div> \
                        <i class='fa fa-calendar' aria-hidden='true'></i> \
                        <p class='Party_colive mx-1'>" + v.EventDate + "</p> \
                    </div> \
                    <i class='fa fa-clock-o' aria-hidden='true'></i> \
                    <p class='Party_colive mx-1'>" + v.StartTime + " - " + v.EndTime + "</p> \
                </div> \
                <div class='knowMoreBtn'> \
                    <a class='btn btn-primary' href= '" + v.EventLink + "'> Know More </a>\
                </div> \
           </div></div>";
        });

    }
    return StrEvents;
}

function BindEventDetails(List) {
    var EventList = List;
    if (EventList.length > 0) {
        var EventDetails = EventList[0];
        var EventCommentsList = EventDetails.Comments;
        var EventImagesList = EventDetails.Images;
        $('#spnEventName').html(EventDetails.HeadLine);
        $('#imgEvntImg').attr('src', EventDetails.TitleImgFileName);
        $('#imgEvntImg').attr('alt', EventDetails.HeadLine);
        $('#spnPropertyName').html(EventDetails.LocationName);
        $('#spnEventVenue').html(EventDetails.Venue);
        $('#spnEventDate').html(EventDetails.EventDate);
        $('#spnEventTime').html(EventDetails.StartTime + " - " + EventDetails.EndTime);
        $('#spnEventDesc').html(EventDetails.Description);
        $('#hdnLatLng').val(EventDetails.Latitude + "," + EventDetails.Longitude);
        $(".events-img").on("error", function () { this.src = "/assets/images/marathalli.jpg"; });

        if (EventImagesList.length > 0) {
            var strImages = '';
            $.each(EventImagesList, function (i, v) {
                strImages += "<div class='item'><img src='" + v.ImageName + "' alt='" + v.EventCode + "' /></div>";
            });
            $('#Eventmasonry').html(strImages);
            $('#EventGallery').show();
        } else {
            $('#EventGallery').hide();
        }

        if (EventCommentsList.length > 0) {
            var strComments = '';
            $.each(EventCommentsList, function (i, v) {
                strComments += "<div class='col-lg-6 col-md-12 col-12 MarginTB'> \
                                <div class='feedback_sec'> \
                                    <div class='FeedBack_img'> \
                                        <div class='FeedBackImgSec'>\
                                        <img src='"+ v.CustomerPhoto + "' class='feedbackuser' alt='" + v.CustomerName + "'> \
                                        </div>\
                                        <div class='FeedBack_OwnerDetails'> \
                                        <p class='Opacity_Content'>"+ v.CustomerName + "</p> \
                                        <p class='Designation_OwnerFeedback d-none'>Co-founder of Watsi</p> \
                                        </div> \
                                    </div> \
                                    <div class='FeedBack_Comments'> \
                                        <p class='CommentOfFeedback'>“ "+ v.Comment + " ”</p> \
                                    </div> \
                                </div> \
                            </div>";
            });
            $(".feedbackuser").on("error", function (e) { this.src = "/assets/images/user.png"; });
            $('#CommentCards').html(strComments);
            $('#EventFeedback').show();
        } else {
            $('#EventFeedback').hide();
        }
        initEventMap();
    } else {
        window.history.forward();
    }
}


function GetDirections() {
    if ($('#hdnNavUrl').val() != "") {
        window.open($('#hdnNavUrl').val(), '_blank', 'noreferrer');
        $('#txtEventSearch').val('');
    } else {
        Toast('Please enter your location !');
    }
}


function GetCustomerAccountStatement() {
    var input = {
        CustomerID: $('#hdnCustomerId').val()
    };
    var url = '/api/MyAccount/BindCustomerAccounts';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            var strAccountsTable = '';
            if (Status === 'success') {
                var ArrCustomerStatementReport = Data.CustomerStatementReport;
                if (ArrCustomerStatementReport.length > 0) {
                    $.each(ArrCustomerStatementReport, function (i, v) {
                        if (SourceTypeId !== 2 && SourceTypeId !== 3) {
                            strAccountsTable += '<div class="card"> \
                            <div class="card-header" id="headingOne"> \
                                <h5 class="mb-0"> \
                                    <span class="col-lg-2 col-12 text-center">' + (i + 1) + '</span> \
                                    <span class="col-lg-2 col-12 text-center">' + v.DueDate + '</span> \
                                    <span class="col-lg-2 col-12 ' + (v.DueAmount === "0" ? 'text-center' : 'text-right') + '">' + (v.DueAmount !== "0" ? '₹ ' + v.DueAmount : '-') + '</span> \
                                    <span class="col-lg-2 col-12 ' + (v.PaidAmount === "0" ? 'text-center' : 'text-right') + '">' + (v.PaidAmount !== "0" ? '₹ ' + v.PaidAmount : '-') + '</span> \
                                    <span class="col-lg-2 col-12 ' + (v.Outstanding === "0" ? 'text-center' : 'text-right') + '">' + (v.Outstanding !== "0" ? '₹ ' + v.Outstanding : '-') + '</span> \
                                </h5> \
                                </div> \
                                </div>';
                        } else {
                            strAccountsTable += "<div class='row border-full border-top'> \
                                                     <div class='col-lg-2 col-4 text-center pad0  border-right pad5'> \
                                                         <p class='pgup'>" + v.DueDate + "</p> \
                                                     </div> \
                                                     <div class='col-lg-2 col-3 text-right pad0  border-right pad5'> \
                                                         <p class='pgup text-right'>" + (v.DueAmount !== "0" ? '₹ ' + v.DueAmount : '-') + "</p> \
                                                     </div> \
                                                     <div class='col-lg-2 col-3 text-right pad0  border-right pad5'> \
                                                         <p class='pgup text-right'>" + (v.PaidAmount !== "0" ? '₹ ' + v.PaidAmount : '-') + "</p> \
                                                     </div> \
                                                     <div class='col-lg-2 col-2 text-right pad0 pad5'> \
                                                         <p class='pgup text-right'>" + (v.Outstanding !== "0" ? '₹ ' + v.Outstanding : '-') + "</p> \
                                                     </div> \
                                                  </div>";
                        }
                    });

                    if (SourceTypeId !== 2 && SourceTypeId !== 3) {
                        $('#accordionExample').append(strAccountsTable);
                        $('#dvStatements').show();
                        $('#dvStatementsApp').hide();
                    } else {
                        $('#dvStatements').hide();
                        $('#dvStatementsApp').show();
                        $('#StatementsApp').append(strAccountsTable);
                    }

                } else {

                    if (SourceTypeId !== 2 && SourceTypeId !== 3) {
                        $('#accordionExample').append('<div class="Nobookings"><img src="/assets/images/cash.svg"><h6>No Statements Found</h6></div></div>');
                        $('#dvStatements').show();
                        $('#dvStatementsApp').hide();
                    } else {
                        $('#dvStatements').hide();
                        $('#dvStatementsApp').show();
                        $('#StatementsApp').append('<div class="Nobookings"><img src="/assets/images/cash.svg"><h6>No Statements Found</h6></div></div>');
                        $('#statement_app').hide();
                    }
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}


//function GetCompatibilityMetrics(MetricList) {
//    var strCompatibilty = '';
//    if (MetricList.length > 0) {
//        $.each(MetricList, function (i, v) {
//            strCompatibilty += '<li class="CompactUlli colive-fa-i" data-toggle="tooltip" data-placement="left" title="' + v.QuestionnaireTagName + '"><img src="https://www.colive.in/favicon.png" class="Compatibility-img-before" /><span class="CompactFav">' + ReturnWithDotsBylength(v.QuestionnaireTagName, 15) + '</span><span class="CompactValues">' + v.Percentage + '%</span></li>';
//        });
//    }
//    return strCompatibilty;
//}

function GetCompatibilityMetrics(MetricList) {
    var strCompatibilty = '';
    if (MetricList.length > 0) {
        $.each(MetricList, function (i, v) {
            strCompatibilty += '<div class="Flatmates_Card_Values"><p class="pull-left Flatmates_Card_Value_Div"> ' + v.QuestionnaireTagName + ' <span>' + v.Percentage + '%</span></p><div class="w3-container p-0" ><div class="w3-green-grey"><div class="bar-color-theme bar-style" style="width: ' + v.Percentage+'%;"></div></div></div ></div>';
        });
    }
    return strCompatibilty;
}


function AnimateCompatibility() {
    $('#Section_4,#Section_3').addClass('fadeInDown');
    $('#Section_2').addClass('fadeInLeft');
    $('#Section_-1').addClass('fadeIn');
    $('#Section_1').addClass('fadeInRight');
    $('#Section_6,#Section_5').addClass('fadeInUp');
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

function VerifyExistingCustomer(strMobile) {
    var input = {
        Mobile: strMobile
    };
    var url = '/api/MyAccount/CustomerDetailsByMobile';
    APICall(url, input, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var CustomerList = Data.CustomerDetails;
                if (CustomerList.length > 0) {
                    var UserName = CustomerList[0].CustomerName;
                    $('#hdnUserName').val(UserName);
                    GenerateOTP(3, $('#hdnMobile').val(), ShowVerifyOTP);
                }
            } else {
                ShowSignUp();
            }
        }, errorMsg => { console.log(errorMsg); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}


function GenerateOTP(OTPTypeId, strMobile, callbackfunction) {
    var input = {
        TypeId: OTPTypeId,
        Mobile: strMobile
    };
    var url = '/api/MyAccount/GenerateOTP';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                callbackfunction();
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

function VerifyOTP(OTPElement, callbackFunction) {
    var RgxOTP = new RegExp('[0-9]');
    var OTPValue = OTPElement.val();
    if (OTPValue.length === 5 && RgxOTP.test(OTPValue)) {
        var input = {
            OTP: OTPValue
        };
        var url = '/api/MyAccount/VerifyOTP';
        APICall(url, input)
            .then(responseData => {
                var response = responseData;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === 'success') {
                    callbackFunction();
                } else {
                    Toast(Message);
                    OTPElement.val('');
                    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                }
            }, errorMsg => { console.log(errorMsg.Message); })
            .catch(ex => { console.log('Exception: ' + ex.message); });
    } else {
        Toast('Please enter a valid OTP !');
    }
}



function GenerateOTPLogin() {
    if ($("#loginForm").valid()) {
        var Mobile = $('#customermobile').val();
        if (IsValidMobile(Mobile)) {
            $('#hdnMobile').val(Mobile);
            VerifyExistingCustomer(Mobile);
        }
    }
}

function ShowVerifyOTP() {
    $('#loginotp-template').addClass('fadeOut').hide();
    $('#loginotpVerifytemplate').show().addClass('fadeInRight');
    $('#spnUserName').html($('#hdnUserName').val());
    $('#txtotp').focus();
    $('#timer').startTimer({
        onComplete: function (element) {
            $('#timer').addClass('flipOutX').removeClass('flipInX').hide();
            $('#ResendContainer').show().addClass('slideInDown');
        }
    }).trigger('start').addClass('flipInX');
}

function SignUpOTPVerify() {
    $('#signupotp-template').addClass('fadeOut').hide();
    $('#loginotpVerifytemplate').show().addClass('fadeInRight');
    $('#spnUserName').html($('#txtUserName').val());
    $('#timer').startTimer({
        onComplete: function (element) {
            $('#timer').addClass('flipOutX').removeClass('flipInX').hide();
            $('#ResendContainer').show().addClass('slideInDown');
        }
    }).trigger('start').addClass('flipInX');
}

function ResentOTP() {
    GenerateOTP(3, $('#hdnMobile').val(), () => {
        $('#timer').trigger('resetime').show().addClass('flipInX').removeClass('flipOutX').trigger('start');
        $('#ResendContainer').addClass('slideInUp').hide();
    });
}


function ShowSignUp() {
    $('#loginotp-template').addClass('fadeOut').hide();
    $('#signupotp-template').show().addClass('fadeInRight');
    $('#txtUserMobile').val($('#hdnMobile').val());
    $('#txtUserName').focus();
}


function SignUpOtp() {
    if ($("#signupForm").valid()) {
        var mobile = $('#txtUserMobile').val();
        if (IsValidMobile(mobile)) {
            var objPropertyDto = {
                FirstName: $('#txtUserName').val(),
                Mobile: $('#txtUserMobile').val(),
                Email: $('#txtUserMail').val(),
                SignedUpFrom: 5
            };
            SaveCustomerBasicDetails(objPropertyDto, 1);
        }
    }
}


function initEventMap() {
    var options = {
        componentRestrictions: {
            country: "in"
        }
    };
    var mapOptions = {
        center: new google.maps.LatLng(parseFloat($('#hdnLatLng').val().split(',')[0]), parseFloat($('#hdnLatLng').val().split(',')[1])),
        zoom: zoomlevel,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        zoomControl: true,
        mapTypeControl: false,
        scaleControl: false,
        streetViewControl: false,
        rotateControl: true,
        fullscreenControl: false
    };
    var autocomplete = new google.maps.places.Autocomplete(document.getElementById('txtEventSearch'), options);
    var map = new google.maps.Map(document.getElementById('dvEvent'), mapOptions);
    var directionsDisplay = new google.maps.DirectionsRenderer;
    var directionsService = new google.maps.DirectionsService;
    google.maps.event.addListener(autocomplete, 'place_changed', function () {
        var place = autocomplete.getPlace();
        add_comp = place.address_components;
        $('#hdnNavUrl').val("https://www.google.com/maps/dir/?api=1&origin=" + place.geometry.location.lat() + "," + place.geometry.location.lng() + "&destination=" + $('#hdnLatLng').val() + "&travelmode=driving");
        var Destmarker = new google.maps.Marker({
            position: new google.maps.LatLng(parseFloat($('#hdnLatLng').val().split(',')[0]), parseFloat($('#hdnLatLng').val().split(',')[1])),
            map: map,
            animation: google.maps.Animation.DROP,
            icon: '/assets/images/home_marker.png'
        });
        var Originmarker = new google.maps.Marker({
            position: new google.maps.LatLng(parseFloat(place.geometry.location.lat()), parseFloat(place.geometry.location.lng())),
            map: map,
            animation: google.maps.Animation.DROP,
            icon: '/assets/images/originMarker.png'
        });
        GetDirectionByMap(directionsService, directionsDisplay, place.geometry.location.lat() + "," + place.geometry.location.lng());
    });
    directionsDisplay.setOptions({
        suppressMarkers: true,
        polylineOptions: {
            strokeColor: '#bd1261'
        }
    });


    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(parseFloat($('#hdnLatLng').val().split(',')[0]), parseFloat($('#hdnLatLng').val().split(',')[1])),
        map: map,
        animation: google.maps.Animation.DROP,
        icon: '/assets/images/home_marker.png'
    });
    directionsDisplay.setMap(map);
}

function GetDirectionByMap(directionsService, directionsDisplay, end) {
    directionsService.route({
        origin: new google.maps.LatLng(parseFloat($('#hdnLatLng').val().split(',')[0]), parseFloat($('#hdnLatLng').val().split(',')[1])),
        destination: new google.maps.LatLng(parseFloat(end.split(',')[0]), parseFloat(end.split(',')[1])),
        travelMode: 'DRIVING'
    },
        function (response, status) {
            if (status === 'OK') {
                directionsDisplay.setDirections(response);
            } else {
                window.alert('Directions request failed due to ' + status);
            }
        });
}


//function BindCompatibilityDetails(locationid) {
//    if (locationid !== undefined) {
//        var input = {
//            LocationID: locationid
//        };
//        var url = '/api/Colive/CompatibilityDetailsByLocationId';
//        APICall(url, input)
//            .then(responseData => {
//                var response = responseData;
//                var Status = response.Status,
//                    Message = response.Message,
//                    Data = response.Data;
//                if (Status === 'success') {
//                    var CharectersRepresentation = Data.CharacterRepresentation;
//                    if (CharectersRepresentation.length > 0) {
//                        $.each(CharectersRepresentation, function (i, v) {
//                            if (v.CategoryID !== -1) {
//                                $('#spnCategory_' + v.CategoryID).html(v.CategoryTagName);
//                                $('#ulCompatibility_' + v.CategoryID).html(GetCompatibilityMetrics(v.QuestionnaireDetails));
//                            } else {
//                                var QuestionnaireList = v.QuestionnaireDetails;
//                                if (QuestionnaireList.length > 0) {
//                                    $.each(QuestionnaireList, function (j, t) {
//                                        var dvcontent = '';
//                                        if (t.QuestionnaireTagName.toLowerCase() === 'female') {
//                                            dvcontent = '<div class="leftImgPart"><img src="/assets/images/compactimages/tmpLeft.png" /><div class="PercentageOfCompact">' + t.Percentage + '%</div></div>';
//                                        } else {
//                                            dvcontent = '<div class="rightImgPart"><img src="/assets/images/compactimages/tmpright].png" /><div class="PercentageOfCompact">' + t.Percentage + '%</div></div>';
//                                        }
//                                        $('#dvCompatibility_' + v.CategoryID).append(dvcontent);
//                                    });
//                                }
//                            }
//                        });
//                        $('[data-toggle="tooltip"]').tooltip();
//                        AnimateCompatibility();
//                        $('.hexagonwrap').css('visibility', 'visible');
//                    } else {
//                        $('#CharacterSection').hide();
//                    }
//                } else {
//                    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
//                }
//            })
//            .catch(ex => { console.log('Exception: ' + ex.message); });
//    } else {
//        $('#CharacterSection').hide();
//    }
//}

function BindCompatibilityDetails(locationid) {
    if (locationid !== undefined) {
        var input = {
            LocationID: locationid
        };
        var url = '/api/Colive/CompatibilityDetailsByLocationId';
        APICall(url, input)
            .then(responseData => {
                var response = responseData;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === 'success') {
                    var CharectersRepresentation = Data.CharacterRepresentation;
                    console.log(CharectersRepresentation, 'CharectersRepresentation');
                    if (CharectersRepresentation.length > 0) {
                        $.each(CharectersRepresentation, function (i, v) {
                            if (v.CategoryID !== -1) {
                                $('#spnCategory_' + v.CategoryID).html(v.CategoryTagName);
                                $('#ulCompatibility_' + v.CategoryID).html(GetCompatibilityMetrics(v.QuestionnaireDetails));
                            }
                            else {
                                $('#spnCategory_7').html(CharectersRepresentation[6].CategoryTagName);
                                $('#pCategory_7_1').html(CharectersRepresentation[6].QuestionnaireDetails[0].QuestionnaireTagName + ' ' + '<span>' + CharectersRepresentation[6].QuestionnaireDetails[0].Percentage + '%</span>');
                                $('#pCategory_7_2').html(CharectersRepresentation[6].QuestionnaireDetails[1].QuestionnaireTagName + ' ' + '<span>' + CharectersRepresentation[6].QuestionnaireDetails[1].Percentage + '%</span>');
                                $('#spnCategory_7_bar').width(CharectersRepresentation[6].QuestionnaireDetails[0].Percentage + '%');
                            }
                        });
                    } else {
                        $('#CharacterSection').hide();
                    }
                } else {
                    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                }
            })
            .catch(ex => { console.log('Exception: ' + ex.message); });
    } else {
        $('#CharacterSection').hide();
    }
}


function BindPartners() {
    var input = {
        CustomerID: $('#hdnCustomerId').val()
    };
    var url = '/api/Colive/BindPartners';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var PartnersList = Data.PartnerDetails;
                if (PartnersList.length > 0) {
                    var strPartners = '';
                    (PartnersList.length > 8 ? $('#btnExplore').show() : $('#btnExplore').hide());
                    $.each(PartnersList, function (i, v) {
                        strPartners += "<div class='col-6 col-md-3'> \
                                      <div class='partner-logo'> \
                                       <img src='"+ v.PartnerLogo + "' onclick='ShowPartnersPopup($(this))' data-campaign='" + v.CampaignName + "' \
                                        data-description='" + v.Description + "' data-eligibilitydescription='" + v.EligibilityDescription + "' \
                                        data-hasbooking='" + v.HasBooking + "' data-offercode='" + v.OfferCode + "' \
                                        data-partnername='" + v.PartnerName + "' data-validfrom='" + v.ValidFrom + "' \
                                        data-validto='" + v.ValidTo + "' \
                                        class='w3-hover-opacity partnerimg' id = 'PartnerLogo_" + v.PartnerID + "' > \
                                      </div> \
                                    </div>";
                    });
                    $('#dvPartners').html(strPartners);
                    $(".partnerimg").on("error", function () { this.src = "/assets/images/favicon.png"; });
                } else {
                    $('#dvourpartners').hide();
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}


function ShowPartnersPopup(element) {
    $("#imgPartners").attr('src', element.attr("src"));
    $('#PartnerTitle').html(element.data('partnername'));
    $("#p_OfferDescription").html(element.data('description'));
    $('#dvoffercode').html(element.data('offercode'));
    $('#spnValidityDuration').html(" valid from " + element.data('validfrom') + " to " + element.data('validto'));
    $('#dvoffercode').html(element.data('offercode'));
    $('#CampaignName').html(element.data('campaign'));
    if (element.data('hasbooking') === false) { $('#dvoffercode').addClass('blur_high'); }
    $('#p_OfferTerms').html(element.data('eligibilitydescription'));
    $("body").css('overflow', 'hidden');
    $("#Partnersmodal").show();
}

function ClosePartnersPopup() {
    $('#Partnersmodal').fadeOut();
    $("body").css('overflow', 'scroll');
}


function EquipScheduleVisitForm() {
    $('#CustomerName,#PhoneNumber,#CustomerEmailId').val('');
    $('#schedule-btn').attr('disabled', false);
    $("#schedulevisitform").validate({
        rules: {
            CustomerName: "required",
            CustomerNumber: {
                required: true,
                number: true,
                maxlength: 10,
                minlength: 10
            },
            CustomerEmailId: {
                required: true,
                email: true
            },
            ScheduleDate: "required",
            slVisitSlots: "required"
        },
        messages: {
            CustomerName: "Please enter your name !",
            CustomerNumber: "Please enter a valid mobile number !",
            CustomerEmailId: "Please enter a valid e-mailid !",
            ScheduleDate: "Please select a valid Schedule Date !",
            slVisitSlots: "Please select a Time slot !"
        }
    });
    $('#ScheduleDate').dcalendarpicker({
        format: 'dd-mmm-yyyy'
    });
    var dtDate = new Date();
    $('#ScheduleDate').data().dcalendar.minDate = dtDate.setDate(dtDate.getDate() - 1);
    $('#ScheduleDate').val(formatDate(new Date())).trigger("change");
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
                    $('#CustomerName').val(CustomerDetails.CustomerName);
                    $('#PhoneNumber').val(CustomerDetails.Mobile);
                    $('#CustomerEmailId').val(CustomerDetails.EmailID);
                    $('#spnSchUserName').html("Hi, " + CustomerDetails.CustomerName);
                }
            }, errorMsg => { console.log(errorMsg.Message); })
            .catch(ex => { console.log('Exception: ' + ex.message); });
    } else {
        $('#spnSchUserName').html("Hi,");
    }
}


function chatbotconfig() {
    var QueryString = getQueryStringValues()["src"];
    if (QueryString !== undefined && QueryString.toLowerCase() === "chatbot") {
        $('#ManagerDrpdwn').val(40817).prop('selected', true).trigger('change');
        $('#SourceDrpdwn').val(22).prop('selected', true).trigger('change');
        $("#ManagerDrpdwn,#SourceDrpdwn").prop('disabled', true);
    } else {
        $("#ManagerDrpdwn,#SourceDrpdwn").prop('disabled', false);
        $("#ManagerDrpdwn,#SourceDrpdwn").prop('selectedIndex', 0).trigger('change');
    }
}

function BindCountryDropdown(type = 0) {
    var dropdownoptions = {
        input: '<input type="text" class="form-control kyc_formBorder" placeholder="Search your Countries">',
        searchNoData: 'No Countries Found !'
    };
    var url = '/api/MyAccount/GetAllCountries';
    APICall(url, {})
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var CountryList = Data;
                if (type == 1) {
                    FillDropdown($('#ddlCountry1'), CountryList);
                    if ($('#dvCountry1 .dropdown-display').length === 0) {
                        $('#dvCountry1').dropdown(dropdownoptions);
                    } else {
                        var CountryDropdown = $('#dvCountry1').data('dropdown');
                        CountryDropdown.destroy();
                        $('#dvCountry1').dropdown(dropdownoptions);
                    }
                } else {
                    FillDropdown($('#ddlCountry'), CountryList);
                    if ($('#dvCountry .dropdown-display').length === 0) {
                        $('#dvCountry').dropdown(dropdownoptions);
                    } else {
                        var CountryDropdown = $('#dvCountry').data('dropdown');
                        CountryDropdown.destroy();
                        $('#dvCountry').dropdown(dropdownoptions);
                    }
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

function FillDropdown(element, ArrayList) {
    element.html('');
    if (ArrayList.length > 0) {
        for (var i = 0; i < ArrayList.length; i++) {
            element.append($('<option>', {
                value: ArrayList[i].Id,
                text: ArrayList[i].Name
            }));
        }
    }
}

function BindStates(obj, type = 0) {
    var CountryValue = obj.val();
    if (type == 1) {
        $('#txtCountry1').val($('#ddlCountry1 option:selected').text().trim());
    } else {
        $('#txtCountry').val($('#ddlCountry option:selected').text().trim());
    }
    var input = {
        CountryID: CountryValue
    };
    var dropdownoptions = {
        input: '<input type="text" class="form-control kyc_formBorder" placeholder="Search your State">',
        searchNoData: 'No States Found !'
    };

    var url = '/api/MyAccount/GetAllStatesByCountryID';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var stateList = Data;
                if (stateList.length > 0) {
                    if (type == 1) {
                        FillDropdown($('#ddlstate1'), stateList);
                        if ($('#dvState1 .dropdown-display').length === 0) {
                            $('#dvState1').dropdown(dropdownoptions);
                        } else {
                            var statesDropdown = $('#dvState1').data('dropdown');
                            statesDropdown.destroy();
                            $('#dvState1').dropdown(dropdownoptions);
                        }
                        $('#txtState1,#txtCity1').hide();
                        $('#dvState1,#dvCity1').show();
                    } else {
                        FillDropdown($('#ddlstate'), stateList);
                        if ($('#dvState .dropdown-display').length === 0) {
                            $('#dvState').dropdown(dropdownoptions);
                        } else {
                            var statesDropdown = $('#dvState').data('dropdown');
                            statesDropdown.destroy();
                            $('#dvState').dropdown(dropdownoptions);
                        }
                        $('#txtState,#txtCity').hide();
                        $('#dvState,#dvCity').show();
                    }

                } else {
                    if (type == 1) {
                        $('#txtState1,#txtCity1').show().val('');
                        $('#dvState1,#dvCity1').hide();
                    } else {
                        $('#txtState,#txtCity').show().val('');
                        $('#dvState,#dvCity').hide();
                    }
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}


function BindCities(obj, type = 0) {
    var StateID = obj.val();
    if (type == 1) {
        $('#txtState1').val($('#ddlstate1 option:selected').text().trim());
    } else {
        $('#txtState').val($('#ddlstate option:selected').text().trim());
    }

    var input = {
        StateId: StateID
    };
    var dropdownoptions = {
        input: '<input type="text" class="form-control kyc_formBorder" placeholder="Search your Cities">',
        searchNoData: 'No Cities Found !'
    };
    var url = '/api/MyAccount/GetCitiesByStateID';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var CityList = Data;
                if (CityList.length > 0) {
                    if (type == 1) {
                        FillDropdown($('#ddlCity1'), CityList);
                        if ($('#dvCity1 .dropdown-display').length === 0) {
                            $('#dvCity1').dropdown(dropdownoptions);
                        } else {
                            var CityDropdown = $('#dvCity1').data('dropdown');
                            if (CityDropdown != undefined) { CityDropdown.destroy(); }
                            $('#dvCity1').dropdown(dropdownoptions);
                        }
                        $('#txtCity1').hide();
                        $('#dvCity1').show();
                        $('#ddlCity1').trigger('change');
                    } else {
                        FillDropdown($('#ddlCity'), CityList);
                        if ($('#dvCity .dropdown-display').length === 0) {
                            $('#dvCity').dropdown(dropdownoptions);
                        } else {
                            var CityDropdown = $('#dvCity').data('dropdown');
                            if (CityDropdown != undefined) { CityDropdown.destroy(); }
                            $('#dvCity').dropdown(dropdownoptions);
                        }
                        $('#txtCity').hide();
                        $('#dvCity').show();
                        $('#ddlCity').trigger('change');
                    }

                } else {
                    if (type == 1) {
                        $('#txtCity1').show().val('');
                        $('#dvCity1').hide();
                    } else {
                        $('#txtCity').show().val('');
                        $('#dvCity').hide();
                    }
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}



function DefaultAddressConfig(type = 0) {
    if (type == 1) {
        BindCountryDropdown(1);
        setTimeout(function () { $('#ddlCountry1').trigger('change'); }, 500);
        setTimeout(function () { $('#ddlstate1').trigger('change'); }, 1000);
        setTimeout(function () { $('#ddlCity1').trigger('change'); }, 1500);
    } else {
        BindCountryDropdown();
        setTimeout(function () { $('#ddlCountry').trigger('change'); }, 500);
        setTimeout(function () { $('#ddlstate').trigger('change'); }, 1000);
        setTimeout(function () { $('#ddlCity').trigger('change'); }, 1500);
    }
}


function EnableAddressFormValidators(type = 0) {
    if (type == 1) {
        $("#permanentaddress1").validate({
            rules: {
                housenumber: "required",
                streetlocality: "required",
                city: "required",
                state: "required",
                country: "required",
                pincode: "required"
            },
            messages: {
                housenumber: "Please enter your housenumber",
                streetlocality: "Please enter your street",
                city: "Please select your city",
                country: "Please enter your state",
                pincode: "Please enter your pincode"
            }
        });
    } else {
        $("#permanentaddress").validate({
            rules: {
                housenumber: "required",
                streetlocality: "required",
                city: "required",
                state: "required",
                country: "required",
                pincode: "required"
            },
            messages: {
                housenumber: "Please enter your housenumber",
                streetlocality: "Please enter your street",
                city: "Please select your city",
                country: "Please enter your state",
                pincode: "Please enter your pincode"
            }
        });
    }


}

function CityChanged(type = 0) {
    if (type == 1) {
        var strcity = $('#ddlCity1 option:selected').text().trim();
        var strcityVal = $('#ddlCity1 option:selected').val();
        if (strcityVal === "-1") {
            $('#txtCity1').val('').show().focus();
        } else {
            $('#txtCity1').val(strcity).hide();
        }
    } else {
        var strcity = $('#ddlCity option:selected').text().trim();
        var strcityVal = $('#ddlCity option:selected').val();
        if (strcityVal === "-1") {
            $('#txtCity').val('').show().focus();
        } else {
            $('#txtCity').val(strcity).hide();
        }
    }
}


function BindEmergencyRelationshipMasters() {
    var input = {};
    var url = '/api/MyAccount/GetRelationShipMasters';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var RelationList = Data;
                if (RelationList.length > 0) {
                    $.each(RelationList, function (i, v) {
                        $('#ddlRelationship').append($('<option>', {
                            value: v.Name,
                            text: v.Name
                        }));
                    });
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

function GetFeedbackMasterDetails() {
    var input = {
        SourceID: $('#hdnTypeId').val(),
        FeedbackForId: $('#hdnTypeId').val() === "2" || $('#hdnTypeId').val() === "3" ? "0" : $('#hdnFeedackForId').val(),
        BookingID: $('#hdnTypeId').val() === "2" || $('#hdnTypeId').val() === "3" ? $('#hdnFeedackForId').val() : "0",
        OrderID: $('#hdnOrderId').val()
    };
    var url = '/api/Colive/GetFeedbackMasterDetails';
    APICall(url, input, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var Source = Data.Source[0];
                $('#hdnRatingMaster').val(JSON.stringify(Data.Rating));
                $('#NegativeQuestion').html(Source.NegativeQuestion);
                $('#PositiveQuestion').html(Source.PositiveQuestion);
                $('#hdnFoodPQuestion').html(Source.PositiveQuestion);
                $('#hdnSuccessMessage').val(Source.SuccessMessage);
                $('#spnFeedbackType').html(Source.Source);
                $('.spnTitle').show();
                var NegativeRating = Data.NegativeRating;
                if (NegativeRating.length > 0) {
                    var strNegative = '';
                    $.each(NegativeRating, function (i, v) {
                        var strcssClass = i === 0 ? 'active' : '';
                        strNegative += '<img src="' + v.Image + '" class="img-fluid msg-box-img ' + strcssClass + '" onclick="IconsChanged($(this));" data-description="' + v.Description + '" data-toggle="tooltip" data-placement="bottom" title="' + v.Description + '" />';
                    });
                    $('#NegativeOptions').html(strNegative);
                    $('#NegativeOptions img').first().click();
                    $('[data-toggle="tooltip"]').tooltip();
                }
                if (Data.FeedBackDetails.length > 0) {
                    $('#dvThankyou').show().addClass('flipInX');
                    $('#NegContainer,#feedbackComment,#dvRating').fadeOut();
                    $('#btnSubmit').hide();
                } else {
                    $('#dvRating').show().addClass('flipInX');
                    $('#FeedbackQuestion').html(Source.FeedbackQuestion);
                    $('#rating').rating().trigger('change');
                    $('#btnSubmit').show();
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}


function RatingChanged() {
    var value = parseInt($('#rating').val());
    var RatingMaster = JSON.parse($('#hdnRatingMaster').val());
    var FeedBackTypeId = $('#hdnTypeId').val();
    if (RatingMaster.length > 0) {
        $.each(RatingMaster, function (i, v) {
            if (v.RatingID === value) {
                $('#RatingMsg').html(v.Name);
            }
        });
    }

    if (value <= 3) {
        if (FeedBackTypeId === "5") {
            $('#txtComments').val('');
            $('#txtComments').show(); 
            $('#feedbackComment').removeClass('fadeOutRight').show().addClass('fadeInLeft');
            $('#PositiveQuestion').html($('#NegativeQuestion').text()); 
        }
        else {
            $('#feedbackComment').removeClass('fadeInLeft').addClass('fadeOutRight').hide();
            $('#NegContainer').removeClass('fadeOutRight').show().addClass('fadeInLeft');
        } 
        
    } else {
        $('#txtComments').val('');
        $('#feedbackComment').removeClass('fadeOutRight').show().addClass('fadeInLeft');
        $('#NegContainer').removeClass('fadeInLeft').addClass('fadeOutRight').hide();
        if (FeedBackTypeId === "5") { $('#PositiveQuestion').html($('#hdnFoodPQuestion').text());  }
        
    }
}


function IconsChanged(obj) {
    $('.msg-box-img').removeClass('active');
    obj.addClass('active');
    $('#txtComments').val(obj.data('description'));
}


function SaveFeedbackForm() {
    var input = {
        Rating: $('#rating').val(),
        FeedbackForId: $('#hdnTypeId').val() === "2" || $('#hdnTypeId').val() === "3" ? "0" : $('#hdnFeedackForId').val(),
        Comments: $('#txtComments').val(),
        SourceID: $('#hdnTypeId').val(),
        BookingID: $('#hdnTypeId').val() === "2" || $('#hdnTypeId').val() === "3" ? $('#hdnFeedackForId').val() : "0",
        OrderID: $('#hdnOrderId').val()

    };
    var url = '/api/Colive/SaveFeedbackDetails';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                $('#Feedbackmsg').html($('#hdnSuccessMessage').val());
            } else {
                $('#Feedbackmsg').html("Something Went Wrong. <br> Please try again later !");
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
            $('#btnSubmit').prop('disabled', true).hide();
            $('#dvRating').removeClass('flipInX').addClass('fadeOutLeftBig').hide();
            $('#feedbackComment').removeClass('fadeOutRight fadeInLeft').addClass('fadeOutRight').hide();
            $('#NegContainer').removeClass('fadeOutRight fadeInLeft').addClass('fadeInLeft').hide();
            $('#dvThankyou').show().addClass('flipInX');
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

function BindCEONotes(strNotes) {
    if (strNotes !== "") {
        $('#dvCEONotes').html(strNotes);
        $('#dvCEODetails').show();
    } else {
        $('#nav-CEONotes-tab').hide();
        $('#nav-dues-tab').click();
        $('#dvCEODetails').hide();
    }
}

function BindPMNotes(strNotes) {
    if (strNotes !== "") {
        $('#dvPMNotes').html(strNotes);
    } else {
        $('#nav-PMNotes-tab').hide();
    }
}


function GetEventCollage() {
    var input = {};
    var hardcodedImages = '<div class="item"><img src="/assets/images/community/IMG_4092-01.jpg" alt="EventImages"></div>,<div class="item"><img src="/assets/images/community/IMG_4092-02.jpg" alt="EventImages"></div>,<div class="item"><img src="/assets/images/gallery/Bitmap (10).png" alt="EventImages"></div>,<div class="item"><img src="/assets/images/community/IMG_4092-03.jpg" alt="EventImages"></div>,<div class="item"><img src="/assets/images/community/IMG_4092-04.jpg" alt="EventImages"></div>,<div class="item"><img src="/assets/images/community/IMG_4092-05.jpg" alt="EventImages"></div>';
    var url = '/api/Colive/GetEventCollage';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var arrCollage = Data;
                var strImages = '';
                var CollageCount = arrCollage.length;
                if (CollageCount > 0) {
                    $.each(arrCollage, function (i, v) {
                        strImages += '<div title="' + v.EventName + '" class="item"><img src="' + v.ImageName + '" alt="' + v.EventName + '"></div>';
                    });
                    var HardCodedCount = hardcodedImages.split(',').length - CollageCount;
                    if (HardCodedCount > 0) {
                        for (i = 0; i <= HardCodedCount; i++) {
                            if (CollageCount >= 4) {
                                break;
                            } else {
                                CollageCount += 1;
                                strImages += hardcodedImages.split(',')[i];
                            }
                        }
                    }
                } else {
                    strImages += hardcodedImages.split(',').join(' ');
                }
                $('#dvEventCollage').html(strImages);
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

function EquipCorporateForm() {
    var dtDate = new Date();
    $('#txtCompanyName,#txtEnvoyName,#txtDesignation,#txtCopEmailID,#txtCopMobile,#txtCompanyAddress').val('');
    $('#txtAppointmentDate').dcalendarpicker({ format: 'dd-mmm-yyyy' });
    $('#txtAppointmentDate').data().dcalendar.minDate = dtDate.setDate(dtDate.getDate() - 1);
    $('#txtAppointmentDate').val(formatDate(new Date()));
    $("#CorporateForm").validate({
        rules: {
            CompanyName: "required",
            EnvoyName: "required",
            Designation: "required",
            CompanyAddress: "required",
            corporateHR: "required",
            corporateMin: "required",
            corporatemeridiem: "required",
            CopMobile: {
                required: true,
                number: true,
                maxlength: 10,
                minlength: 10
            },
            CopEmailID: {
                required: true,
                email: true
            }
        },
        messages: {
            CompanyName: "Please enter your company name",
            EnvoyName: "Please enter your envoy name",
            Designation: "Please enter your designation",
            CompanyAddress: "Please enter your address",
            corporateHR: "Please select a Hour",
            corporateMin: "Please select the Minutes",
            corporatemeridiem: "Please select a Meridiem",
            CopMobile: "Please enter a valid mobile number",
            CopEmailID: "Please enter a valid email id"
        }
    });
}


function CorporateFormInsert() {
    if ($("#CorporateForm").valid()) {
        var scheduletime = $('#ddlHour').val() + ":" + $('#ddlMinutes').val() + " " + $('#ddlMeridiem').val();
        var scheduledate = $('#txtAppointmentDate').val();
        var input = {
            CompanyName: $('#txtCompanyName').val(),
            Name: $('#txtEnvoyName').val(),
            Desgination: $('#txtDesignation').val(),
            ScheduleDateTime: scheduledate + " " + scheduletime,
            Email: $('#txtCopEmailID').val(),
            Phone: $('#txtCopMobile').val(),
            Address: $('#txtCompanyAddress').val(),
            Description: $('#txtCompanyAddress').val(),
            LeadSource: $('#hdnLeadSource').val(),
            ScheduleTime: scheduletime,
            ScheduleDate: scheduledate
        };
        var url = '/api/Colive/SaveLeadDetails';
        APICall(url, input, true)
            .then(responseData => {
                var response = responseData;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === 'success') {
                    Toast('Thank you for reaching out to us, <br /> we will get back to you shortly');
                    ResetCorporateForm();
                } else {
                    ResetCorporateForm();
                    Toast('Something Went Wrong. Please try again later !');
                    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                }
            }, errorMsg => { console.log(errorMsg.Message); })
            .catch(ex => { console.log('Exception: ' + ex.message); });
    }
}

function ResetCorporateForm() {
    $('#txtCompanyName,#txtEnvoyName,#txtDesignation,#txtCopEmailID,#txtCopMobile,#txtCompanyAddress').val('');
    $('#txtAppointmentDate').val(formatDate(new Date()));
    $('#ddlHour,#ddlMinutes,#ddlMeridiem').prop('selectedIndex', 0);
}

function PaymentTypeChanged(type) {
    if (type === 1) {
        $('#txtOtherPayment').val('').prop('disabled', true);
    } else {
        $('#txtOtherPayment').val('').prop('disabled', false).focus();
    }
}

function BindPropertyRating(Rating, ReviewersCount) {
    var MeterRating = ((Rating * 2) * 0.1);
    $('.second.circle').circleProgress({
        value: MeterRating,
        startAngle: -Math.PI / 6 * 3,
        animation: { duration: 3000, easing: "circleProgressEasing" }
    }).on('circle-animation-progress', function (event, progress) {
        $(this).find('strong').html(Rating.toString());
    });
    var imgtags = $('.property_Rating_image img');
    var loopCount = 5 - parseInt(Rating);
    Array.prototype.reverse.call(imgtags);
    if (loopCount !== 0) {
        $.each(imgtags, function (i, v) {
            if (i < loopCount) {
                $(this).addClass('property_image_opacity');
            }
        });
    }
    $('#spnReviewersCount').html(ReviewersCount + (ReviewersCount <= 1 ? " Customer" : " Customers"));
    $('#PropertyRatings').show();
}


function GetDisplayNameByPath(strlocation) {
    var pathlist = strlocation.split('/');
    var StrLocation = '';
    if (pathlist.length >= 3) {
        StrLocation = pathlist[2] + ", " + pathlist[0];
    } else {
        StrLocation = Array.prototype.reverse.call(pathlist).join(", ");
    }
    return StrLocation.replace(/-/g, ' ');
}


function GetSearchInput(type = 0) {
    var QueryString = getQueryStringValues();
    var location = window.location.pathname;

    location = location.replace('/pg-rooms-for-rent', '').substr(1, location.length); // Remove first slash 
    location = (location.length === location.lastIndexOf('/') + 1) ? location.substr(0, location.lastIndexOf('/')) : location; // if slash is present in last character remove it
    var Searchtext = GetDisplayNameByPath(location); // To Display Search location along with the City in various content of the page
    if (type === 0) {
        $('.spnCity').html(Searchtext === 'search' ? QueryString.loc : Searchtext);
    }
    var Heading = location.slice(location.lastIndexOf('/') + 1, location.length).replace(/-/g, ' '); // To display only search location in heading
    if (type === 0) {
        $('.TitleCity').html(Heading === 'search' ? QueryString.loc.replace(/-/g, ' ') : Heading);
    }
    var input = {};
    if (QueryString.length >= 1) {
        var minPrice = "";
        var maxPrice = "";
        var RoomShareCategoryId = "";

        if (QueryString.budget !== undefined) {
            minPrice = QueryString.budget.split('-')[0];
            maxPrice = QueryString.budget.split('-')[1];
        }

        if (QueryString.space !== undefined) {
            if (QueryString.space === undefined || QueryString.space === "")
                QueryString.space = "2";
            switch (QueryString.space) {
                case '1':
                    RoomShareCategoryId = "1";
                    break;
                case '2':
                    RoomShareCategoryId = "2";
                    break;
                case '3':
                    RoomShareCategoryId = "1";
                    break;
            }
        }

        if (QueryString.rad !== undefined) {
            if (QueryString.rad === 1)
                zoomlevel = 11;
            else if (QueryString.rad === 2)
                zoomlevel = 12;
            else
                zoomlevel = 12;
        }

        input = {
            Date: formatDate(new Date()),
            LocationName: location === 'search' ? QueryString.loc : location,
            OfferId: QueryString.OfferId === undefined ? 0 : QueryString.OfferId,
            RoomTypeIds: QueryString.share === undefined ? '' : QueryString.share,
            RoomSubTypeIds: '',
            RoomClassIds: '',
            FurnishStatusIds: '',
            Latitude: QueryString.lat === undefined ? '' : type === 1 ? '' : QueryString.lat,
            Longitude: QueryString.long === undefined ? '' : type === 1 ? '' : QueryString.long,
            Distance: QueryString.rad === undefined ? '' : QueryString.rad,
            RoomShareCategory: RoomShareCategoryId,
            MinValue: minPrice,
            MaxValue: maxPrice
        };
    }
    return input;
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


function EquipReservationFilter(FilterList, ReservationType) {
    if (ReservationType === 1) {
        $('#ulFloorFilter').html(GetInputFilters(FilterList.RoomFloor, 'FloorType', ReservationType));
        $('#ulSharingFilter').html(GetInputFilters(FilterList.RoomType, 'SharingType', ReservationType));
        $('#ulRoomFilter').html(GetInputFilters(FilterList.PropertyType, 'RoomType', ReservationType));
        $('#ulBalconyFilter').html(GetInputFilters(FilterList.BalconyType, 'BalconyType', ReservationType));
        $('#ulBathFilter').html(GetInputFilters(FilterList.RoomClass, 'BathType', ReservationType));
        $('#my-list').collapsibleList('.header', { search: true, animate: true });
     //   setTimeout(function () { $('.header').click(); }, 300); // Removed Default Collapse on 24-02-2020
    } else {
        $('#ulFloorFilter_Private').html(GetInputFilters(FilterList.RoomFloor, 'FloorType', ReservationType));
        $('#ulSharingFilter_Private').html(GetInputFilters(FilterList.RoomType, 'SharingType', ReservationType));
        $('#ulRoomFilter_Private').html(GetInputFilters(FilterList.PropertyType, 'RoomType', ReservationType));
        $('#ulBalconyFilter_Private').html(GetInputFilters(FilterList.BalconyType, 'BalconyType', ReservationType));
        $('#ulBathFilter_Private').html(GetInputFilters(FilterList.RoomClass, 'BathType', ReservationType));
        $('#my-list-Private').collapsibleList('.privateheader', { search: true, animate: true });
      //  setTimeout(function () { $('.privateheader').click(); }, 300); // Removed Default Collapse on 24-02-2020
    }
}

function GetInputFilters(List, type, ReservationType) {
    var strInput = '';
    var strType = ReservationType === 1 ? 'Share' : 'Private';
    if (List.length > 0) {
        $.each(List, function (i, v) {
            strInput += '<li> \
                        <div class="custom-control form-control-lg custom-checkbox custom-li-ul"> \
                        <input type="checkbox" name="'+ strType + '' + type + '" ' + (i === 0 ? 'checked' : '') + ' class="custom-control-input" onchange="ReserveFilterChanged($(this));" value="' + v.Id + '" id="' + strType + '' + type + '_' + i + '"> \
                        <label class="custom-control-label wifi" for="' + strType + '' + type + '_' + i + '">' + v.Name + '</label> \
                        </div> \
                        </li>';
        });
    }
    return strInput;
}

function ReserveFilterChanged(obj) {
    if (((obj.val() === "0") && (obj[0].name !== "ShareBalconyType" || obj[0].name !== "ShareBalconyType")) || obj.val() === "-1") {
        $('input[name="' + obj[0].name + '"]').prop('checked', false);
        $('input[name="' + obj[0].name + '"]').first().prop('checked', true);
    } else {
        $('input[name="' + obj[0].name + '"]').first().prop('checked', false);
    }
    if (Windowidth > 727) {
        ApplyReservationFilter();
    }
}


function ApplyReservationFilter() {
    var inputcontrol = $('#my-list').hasClass('active') ? 'Share' : 'Private';
    var FloorTypeIds = [];
    $('input[name="' + inputcontrol + 'FloorType"]').each(function () {
        if ($(this).prop('checked')) {
            if ($(this).val() === "0") {
                FloorTypeIds = [];
            } else {
                FloorTypeIds.push($(this).val());
            }
        }
    });

    var RoomTypeIds = [];
    $('input[name="' + inputcontrol + 'SharingType"]').each(function () {
        if ($(this).prop('checked')) {
            if ($(this).val() === "0") {
                RoomTypeIds = [];
            } else {
                RoomTypeIds.push($(this).val());
            }
        }
    });

    var PropertyTypeIds = [];
    $('input[name="' + inputcontrol + 'RoomType"]').each(function () {
        if ($(this).prop('checked')) {
            if ($(this).val() === "0") {
                PropertyTypeIds = [];
            } else {
                PropertyTypeIds.push($(this).val());
            }
        }
    });

    var BathTypeIds = [];
    $('input[name="' + inputcontrol + 'BathType"]').each(function () {
        if ($(this).prop('checked')) {
            if ($(this).val() === "0") {
                BathTypeIds = [];
            } else {
                BathTypeIds.push($(this).val());
            }
        }
    });

    var BalconyTypeIds = [];
    $('input[name="' + inputcontrol + 'BalconyType"]').each(function () {
        if ($(this).prop('checked')) {
            if ($(this).val() === "-1") {
                BalconyTypeIds = [];
            } else {
                BalconyTypeIds.push($(this).val());
            }
        }
    });

    var input = {
        PropertyID: $('#hdnLocationId').val(),
        FloorIds: FloorTypeIds.length > 0 ? FloorTypeIds.join(',') : '',
        RoomTypeIds: RoomTypeIds.length > 0 ? RoomTypeIds.join(',') : '',
        PropertyTypeIds: PropertyTypeIds.length > 0 ? PropertyTypeIds.join(',') : '',
        RoomClassIds: BathTypeIds.length > 0 ? BathTypeIds.join(',') : '',
        BalconyTypeIds: BalconyTypeIds.length > 0 ? BalconyTypeIds.join(',') : ''
    };

    if ($('#my-list').hasClass('active')) {
        BindPropertyAvailability_Booking(input, 2);
    } else {
        BindPropertyAvailability_PrivateBooking(input, 2);
    }
}

function clearfilter() {
    $.each($('#my-list input[type="checkbox"]'), function (i, v) {
        if (($(this).val() === "0" && $(this)[0].name !== "BalconyType") || $(this).val() === "-1") {
            $(this).prop('checked', true);
        } else {
            $(this).prop('checked', false);
        }
    });

    $.each($('#my-list-Private input[type="checkbox"]'), function (i, v) {
        if (($(this).val() === "0" && $(this)[0].name !== "BalconyType") || $(this).val() === "-1") {
            $(this).prop('checked', true);
        } else {
            $(this).prop('checked', false);
        }
    });

    $('.collapsible-search').val('').trigger('keyup');
    ApplyReservationFilter();
}

function SharingBedKeyChange() {
    var enddate = $('.radioBeds:checked').data('noticeperiodenddate');
    if (enddate !== undefined) {
        if (enddate === "") {
            $('#txtMoveinDate').data().dcalendar.minDate = new Date();
            $('#txtMoveinDate').val(formatDate(new Date()));
        } else {
            var now = new Date(enddate);
            $('#txtMoveinDate').data().dcalendar.minDate = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            $('#txtMoveinDate').val(enddate);
            Toast("Room will be available to checkin from - " + enddate);
            scrollTop(1000);
        }
        var RoomId = $('.radioBeds:checked').data('roomid');
        $('.tdRoomselect').html('<div style="width:231px;"></div>');
        $('#selectkey_' + RoomId + '').html("<button id='btnRentCalculation_" + RoomId + "' onclick='rentCalculationForBooking(\"\", 0, 0);' type='button' class='continue-btn'>Continue</button>");
        MoveinDatechanged();
    }
}

function TransferBedKeyChange() {
    var enddate = $('.radioBeds:checked').data('noticeperiodenddate');
    var dtDate = new Date();
    if (enddate !== undefined) {
        if (enddate === "") {
            $('#txtMoveinDate').data().dcalendar.minDate = new Date();
            $('#txtMoveinDate').data().dcalendar.maxDate = dtDate.setDate(dtDate.getDate() + 7);
            $('#txtMoveinDate').val(formatDate(new Date()));
        } else {
            var now = new Date(enddate);
            if (now < dtDate) {
                $('#txtMoveinDate').data().dcalendar.minDate = new Date();
                $('#txtMoveinDate').data().dcalendar.maxDate = dtDate.setDate(dtDate.getDate() + 7);
                $('#txtMoveinDate').val(formatDate(new Date()));
            }
            else {
                $('#txtMoveinDate').data().dcalendar.minDate = new Date(now.getFullYear(), now.getMonth(), now.getDate());
                $('#txtMoveinDate').data().dcalendar.maxDate = now.setDate(now.getDate() + 7);
                $('#txtMoveinDate').val(enddate);
            }
            Toast("Room will be available to checkin from - " + enddate);
            scrollTop(1000);
        }
        var RoomId = $('.radioBeds:checked').data('roomid');
        $('.tdRoomselect').html('<div style="width:231px;"></div>');
        $('#selectkey_' + RoomId + '').html("<button id='btnRentCalculation_" + RoomId + "' onclick='ShowCheckoutModal();' type='button' class='continue-btn'>Continue</button>");
        MoveinDatechanged();
    }
}
function PrivateRoomChange() {
    if ($('.radiorooms').length > 0) {
        var enddate = $('.radiorooms:checked').data('noticeperiodenddate');
        if (enddate === "") {
            $('#txtMoveinDate').data().dcalendar.minDate = new Date();
            $('#txtMoveinDate').val(formatDate(new Date()));
        } else {
            var now = new Date(enddate);
            $('#txtMoveinDate').data().dcalendar.minDate = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            $('#txtMoveinDate').val($('.radiorooms:checked').data('noticeperiodenddate'));
            Toast("Room will be available to checkin from - " + $('.radiorooms:checked').data('noticeperiodenddate'));
            scrollTop(1000);
        }
        var RoomId = $('.radiorooms:checked').data('roomid');
        $('.tdRoomselect').html('<div style="width:231px;"></div>');
        $('#selectkeyprivate_' + RoomId + '').html("<button id='btnRentCalculationprivate_" + RoomId + "' onclick='rentCalculationForBooking(\"\", 0, 1);' type='button' class='continue-btn'>Continue</button>");
        MoveinDatechanged();
    }
    else {
        $('#txtMoveinDate').data().dcalendar.minDate = new Date();
        $('#txtMoveinDate').val(formatDate(new Date()));
    }
}



function ShowFilter() {
    if (Windowidth < 727) {
        if ($('#ReservationFilter').css('display') === 'block') {
            $('#ReservationFilter').slideUp(1000);
        } else {
            $('#ReservationFilter').slideDown(1000);
        }
    }
}



function GetBedkeySummary() {
    var strBtnName = $('#my-list').hasClass('active') ? 'radioBeds' : 'radiorooms';
    var strAmenity = $('#my-list').hasClass('active') ? 'RoomAmenities_' : 'RoomPrivate_';
    var strDetails = '';
    var objElement = $('.' + strBtnName + ':checked')[0].dataset;
    strDetails += '<tr> \
                      <td scope="row"> \
                      '+ returnSharingTypes(parseInt(objElement.bedcount)) + ' \
                      </td>   \
                      <td> \
                      <div class="feature-svg"> \
                        '+ $('#' + strAmenity + '' + objElement.roomid).html() + ' \
                      </div> \
                      </td>  \
                      <td>₹ '+ ConverToRupees(objElement.rent) + ' <br>  \
                      </td>\
                      </tr>';
    return strDetails;
}


function BindBookingTransferDetails(transferreqid) {
    var input = {
        TransferReqId: transferreqid
    };
    var url = '/api/MyAccount/GetTransferDetails';
    APICall(url, input, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var BookingDetails = Data[0];
                //var input = {
                //    BookingFrom: BookingDetails.CheckInDate,
                //    BookingTo: BookingDetails.BookingTo,
                //    RoomIDs: BookingDetails.RoomId,
                //    CouponId: BookingDetails.CouponId,
                //    CustomerID: BookingDetails.CustomerId,
                //    BookingType: BookingDetails.BookingType
                //};
                $('#hdnCouponID').val(BookingDetails.CouponId);
                $('#txtMoveinDate').val(BookingDetails.CheckInDate);
                // MoveinDatechangedTransfer(1);
                $('#chkoutDate').val(BookingDetails.CheckOutDate);
                transfercheckoutdatechanged();
                $("input[value='" + BookingDetails.RoomId + "']").prop("checked", true);
                $("#slTimeSlots").val(BookingDetails.CheckInTimeId);
                $("#slCheckoutTime").val(BookingDetails.CheckOutTimeId);
                $('#hdnRoomId').val(BookingDetails.RoomId);
                $('#txtMoveinDate').attr("disabled", "disabled");
                $('#txtMoveinDate').next().css('display', 'none');
                $("#sharing *").prop('disabled', true);
                $('#AjaxLoader').fadeOut(500);
                $('#hdnTransferStatusId').val("1");
                //setTimeout(function () {
                //    rentCalculationForTransfer('', BookingDetails.CouponId, 0);
                //}, 1000);

                $('#ReservationFilter').hide(100);
                $('#Keydetails .card,#bookingTab,#Bookinginfo').removeClass('fadeInUp').addClass('fadeOutRight');
                $('#myFilterBtn').hide(100);
                $('#RoomDetails').hide(100);
                $('#KeysContainer').hide(100);
                $('#PrivateSharecontainer').hide();
                $('#dvCheckinDetails').hide();
                $('#btnReservationConfirmation').hide();
                $('#Bookinginfo').hide(100);
                $("#btnReservationConfirmation").html("Pay");
                $('#btnPromoApply').hide();
                GetTransferBookingDetails();
                //setTimeout(function () {

                //}, 2000);

                $('#btnPromoApply').attr('disabled', 'true');
                $('#txtCoupon').attr('disabled', 'true');
                $('#ChkAgree').attr('checked', true);

                $('#CheckoutDetails').modal('hide');



            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log(ex); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}

function BindCustomerTransferDetails(obj) {
    var input = {
        BookingID: obj.data('bookingid'),
        RoomID: obj.data('roomid'),
        PropertyID: obj.data('propertyid'),
        LocationLink: obj.data('locationlink'),
        TransferReqId: obj.data('transferreqid')
    };
    var url = '/api/MyAccount/BindCustomerTransferDetails';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                if (obj.data('transferreqid') === 0) {
                    $("#sameProperty").prop("checked", true);
                    $('#mdlTransferModal').modal('show');
                    $('#btnTransferContinue').data('link', input.LocationLink);
                }
                else {

                    window.location.href = '/transfer?L=' + obj.data('locationlink') + '&T=' + obj.data('transferreqid') + '';
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log(ex); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}

function TransferContinue() {
    var URL = '';
    localStorage.setItem("transferKey", "1");
    if ($('input[name="rdtransfer"]:checked').val() === "1") {
        URL = '/transfer?L=' + $('#btnTransferContinue').data('link');
    } else {
        URL = $('#SlClusters').val();
    }
    window.location.href = URL;

}

function rdtransferchanged() {
    if ($('input[name="rdtransfer"]:checked').val() === "2") {
        APICall('/api/Colive/LoadHeaderLocationMenu', {}, true)
            .then(result => {
                var response = JSON.parse(result);
                var NewData = '';
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === 'success') {
                    var MenuList = Data;
                    MenuList = MenuList.filter(function (object) { return object.IsMenuEnabled === true; });
                    var CityList = MenuList.filter(function (object) { return object.MenuLevel === 1; });
                    var strCities = '';
                    $.each(CityList, function (i, v) {
                        strCities += '<option value="' + v.MenuId + '">' + v.Menu + '</option> ';
                    });
                    $('#SlCity').html(strCities).trigger('change');
                    $('#TransfersLocations').slideDown();
                } else {
                    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                }
            }, errorMsg => { console.log(errorMsg.Message); })
            .catch(ex => { console.log(ex); })
            .finally(() => { $('#AjaxLoader').fadeOut(500); });
    } else {
        $('#TransfersLocations').slideUp();
    }
}

function BindClusters() {
    APICall('/api/Colive/LoadHeaderLocationMenu', {}, true)
        .then(result => {
            var response = JSON.parse(result);
            var NewData = '';
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var MenuList = Data;
                MenuList = MenuList.filter(function (object) { return object.IsMenuEnabled === true; });
                var ClusterList = MenuList.filter(function (object) { return object.MenuLevel === 2 && object.ParentMenuId === parseInt($('#SlCity').val()); });
                var strClusters = '';
                $.each(ClusterList, function (i, v) {
                    strClusters += '<option value="' + v.URL + '">' + v.Menu + '</option> ';
                });
                $('#SlClusters').html(strClusters);
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log(ex); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}

function MoveInCancellation() {
    $('#MoveinContainer').fadeIn(1000);
    $('#MoveinSection').fadeOut(1000);
    $("#booking .nav-tabs").fadeIn(1000);
    scrollTop(1000);
    $('#chkKeyReceived').prop('checked', false);
    //$('#btnCheckinConfirmation').prop('disabled', false);
    ClearDashboardhiddenFields();
}

function GetTransferBookingDetails() {
    var checkout = new Date($('#chkoutDate').val());
    var chekin = new Date($('#txtMoveinDate').val());
    var _class = "";
    var _TransferCalculatedDetails = "";
    var input = {
        BookingID: $('#hdnTransferBookingId').val(),
        RoomID: $('#hdnRoomId').val(),
        BookingFrom: formatDate(chekin),
        CheckOutDate: formatDate(checkout),
        CouponId: $('#hdnCouponID').val()
    };
    var url = '/api/MyAccount/GetTransferBookingDetails';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var BookingDetails = Data.BookingDetails[0];

                $('#spnFromBookingPropertyName').html(BookingDetails.PropertyName);
                $('#dvFromBookingPropertyName').html(BookingDetails.PropertyName);
                $('#spnFromBookingBedKey').html(BookingDetails.RoomName);
                $('#dvFromBookingBedKey').html(BookingDetails.RoomName);
                $('#spnFromBookingLockIn').html(BookingDetails.OldLockinPeriod + " Months");
                $('#spnFromBookingCheckOutDate').html(formatDate(checkout) + " " + $("#slCheckoutTime :selected").text());

                $('#spnToBookingPropertyName').html(BookingDetails.NewPropertyName);
                $('#dvToBookingPropertyName').html(BookingDetails.NewPropertyName);
                $('#spnToBookingBedKey').html(BookingDetails.NewRoomName);
                $('#dvToBookingBedKey').html(BookingDetails.NewRoomName);
                $('#spnToBookingLockIn').html(BookingDetails.NewLockInPeriodDays);
                $('#spnToBookingCheckInDate').html(formatDate(chekin) + " " + $("#slTimeSlots :selected").text());

                var _FromBooking = '', _ToBooking = '', _balance = '';
                $.each(Data.BookingA, function (i, v) {
                    if (v.Type !== "2") {
                        _FromBooking += ' <div class="col-12 Div_PropCalc_Align">\
                        <div class="pull-left Icon_InfoALign">'+ v.Narration + '<div class="Info_Work"><span class="material-icons" style="display:' + (v.Description === "" ? 'none' : 'block') +'">info</span><span class="Info_Content_Text">' + v.Description + '</span></div></div>\
                        <div class="pull-right red-text">Rs. '+ ConverToRupees_V2(v.OutStanding) + '</div>\
                         </div>';
                    }
                });

                $.each(Data.BookingB, function (i, v) {
                    // _class = v.Type === "2" ? "bg-grey" : "";
                    if (v.Type !== "2") {
                        _TransferCalculatedDetails = v.IsStrikeTagApply === true ? "<strike style='color:#f00;'>Rs." + ConverToRupees_V2(v.ActualAccruedAmount) + "</strike >&nbsp; Rs. " + ConverToRupees_V2(v.OutStanding) + "" : "Rs. " + ConverToRupees_V2(v.OutStanding);

                        _ToBooking += ' <div class="col-12 Div_PropCalc_Align">\
                        <div class="pull-left Icon_InfoALign">'+ v.Narration + '<div class="Info_Work"><span class="material-icons" style="display:' + (v.Description === "" ? 'none' : 'block') +'">info</span><span class="Info_Content_Text">' + v.Description + '</span></div></div>\
                        <div class="pull-right green-text">'+ _TransferCalculatedDetails + '</div>\
                         </div>';
                    }

                });

                $.each(Data.Balance, function (i, v) {
                    // _class = v.Type === "2" ? "bg-grey" : "";
                    if (v.Type !== "2") {
                        _balance += ' <div class="col-12 Div_PropCalc_Align">\
                         <div class="text-center m-text-right">Rs. '+ ConverToRupees_V2(v.OutStanding) + '</div>\
                         </div>';
                    }

                });

                if (BookingDetails.IsCheckinCouponApplied === true || BookingDetails.IsReservationCouponApplied === true) {
                    $('#txtCoupon').addClass('success');
                    $('#txtCoupon').val(BookingDetails.CouponName);
                    $('#txtCoupon').attr('disabled', 'true');
                    $('#btnPromoApply').show();
                    $('#btnPromoApply').val('Applied').addClass('success');
                }



                $('#paymentDetailsContainerOld').html(_FromBooking);
                $('#paymentDetailsContainerNew').html(_ToBooking);
                $('#paymentDetailsContainerbalance').html(_balance);

                $('#spnTotalPayable').html('Rs. ' + ConverToRupees_V2(BookingDetails.TotalPayable));
                $('#dvTotalPayable').html('Rs. ' + ConverToRupees_V2(BookingDetails.TotalPayable));
                $('#hdnPaidAmount').val(BookingDetails.TotalPayable);

                if (parseInt(BookingDetails.TotalPayable) <= 0) {
                    $("#btnReservationConfirmation").html("Continue");
                }

                $('#btnReservationConfirmation').show();
                $('#ReservationPayment').slideDown(500);
                $('#TrnasferDetails').slideDown(500);
                $('#dvReservationDetails').removeClass('container-fluid').addClass('container');
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log(ex); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}

function transfermoveintimeChanged(obj) {
    var chekin = new Date($('#txtMoveinDate').val());
    $('#spnToBookingCheckInDate').html(formatDate(chekin) + " " + $("#slTimeSlots :selected").text());
}

function Transferbooking() {
    if ($('#ChkAgree').prop('checked') === false) {
        Toast("Please agree to the terms and conditions !");
    } else {

        if ($("#btnReservationConfirmation").html() === "Transfer Request") {
            $('#mdlTransferconfirm').modal('show');
        }
        else {
            TransferAndPay();
        }
    }
}

function TransferAndPay() {
    var chekin = new Date($('#txtMoveinDate').val());
    var chekout = new Date($('#chkoutDate').val());
    var input = {
        BookingID: $('#hdnTransferBookingId').val(),
        RoomID: $('#hdnRoomId').val(),
        BookingFrom: formatDate(chekin),
        BookingTo: formatDate(new Date(parseInt(chekin.getFullYear()) + 1, chekin.getMonth(), chekin.getDate())),
        BookingIP: "::2",
        ModifiedBy: 7,
        TentativeCheckinDate: formatDate(chekin),
        TentativeCheckinId: $("#slTimeSlots").val(),
        CouponId: $('#hdnCouponID').val(),
        CheckOutDate: formatDate(chekout),
        CheckOutTime: $("#slCheckoutTime").val(),
        PaidAmount: $('#hdnPaidAmount').val(),
        BookingType: 2,
        PaymentApp: 4,
        TransferReqId: $('#hdnTransferReqId').val()
    };
    var url = '/api/MyAccount/Transferbooking';
    APICall(url, input, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var BookingDetails = Data;
                if (BookingDetails.OrderID !== "") {
                    if (parseInt($('#hdnPaidAmount').val()) > 0) {
                        $('#OrderId').val(BookingDetails.OrderID);
                        $('#amountType').val("1");
                        $("#fmPayment").submit();
                    }
                    else {
                        $('#order_id').val(BookingDetails.OrderID);
                        $('#amountType').val("2");
                        $("#frmCompletion").submit();
                    }
                }
                else {
                    $('#mdlTransferconfirm').modal('hide');
                    $('#TransferPopup').show();

                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log(ex); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}

function TransferRequestPopupRedirect() {
    localStorage.setItem("transferKey", "0");
    window.location.href = "/dashboard";
}

function ShowCheckoutModal() {
    if ($('#txtMoveinDate').val() === '') {
        Toast("Kindly choose the Check-in date!");
        scrollTop(1000);
        $('#txtMoveinDate').focus();
    } else if ($('#slTimeSlots').val() === null) {
        Toast("Please select the move-in Time");
        scrollTop(1000);
        $('#slTimeSlots').focus();
    } else {
        var dtDate = new Date();
        $('#CheckoutDetails').modal('show');
        $('#spnCheckoutPropertyName').html($("#spnPropertyName").text());
        $('#hdnRoomId').val($('.radioBeds:checked').data('roomid'));
        $('#chkoutDate').dcalendarpicker({ format: 'dd-mmm-yyyy' });
        $('#chkoutDate').data().dcalendar.minDate = new Date();
        $('#chkoutDate').data().dcalendar.maxDate = dtDate.setDate(dtDate.getDate() + 7);
        $('#chkoutDate').val($('#txtMoveinDate').val());
        $('#chkoutDate').dcalendarpicker().trigger('change');
    }
}

function rentCalculationForTransfer(valOfferCode, valCouponId, isbulkbooking) {
    var _roomid = '', _bookingtype = '';
    if (isbulkbooking === "1") {
        _roomid = $('.radiorooms:checked').data('roomid');
        _bookingtype = 1;
    }
    else {
        _roomid = $('.radioBeds:checked').data('roomid');
        _bookingtype = 2;
    }

    if ($('#txtMoveinDate').val() === '') {
        Toast("Kindly choose the Check-in date!");
        scrollTop(1000);
        $('#txtMoveinDate').focus();
    } else if ($('#slTimeSlots').val() === null) {
        Toast("Please select the move-in Time");
        scrollTop(1000);
        $('#slTimeSlots').focus();
    } else {
        var checkinDate = new Date($('#txtMoveinDate').val());
        var input = {};
        if (valOfferCode === '' && valOfferCode === 0) {
            input = {
                BookingFrom: formatDate(checkinDate),
                BookingTo: formatDate(new Date(parseInt(checkinDate.getFullYear()) + 1, checkinDate.getMonth(), checkinDate.getDate())),
                RoomIDs: _roomid,
                CouponId: valCouponId,
                CustomerID: $('#hdnCustomerId').val(),
                BookingType: _bookingtype
            };
        } else {
            input = {
                OfferCode: valOfferCode,
                BookingFrom: formatDate(checkinDate),
                BookingTo: formatDate(new Date(parseInt(checkinDate.getFullYear()) + 1, checkinDate.getMonth(), checkinDate.getDate())),
                RoomIDs: _roomid,
                CouponId: valCouponId,
                CustomerID: $('#hdnCustomerId').val(),
                BookingType: _bookingtype
            };
        }

        var url = '/api/MyAccount/RentCalculationForBooking';
        APICall(url, input)
            .then(responseData => {
                var response = responseData;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                var Sharingtype = '';
                var BookingList = Data;
                if (BookingList.length > 0) {
                    var BookingDetails = BookingList[0];
                    if (BookingDetails.AddressFilled === 5) {
                        GetTransferBookingDetails();
                        $('#CheckoutDetails').modal('hide');
                        var ActualRent = (parseFloat(BookingDetails.ActualPricePerMonth) + parseFloat(BookingDetails.ActualFixedAmenitiesPricing) + parseFloat(BookingDetails.ActualPestControl));
                        $('#ancChooseRoom').attr('href', 'javascript:cancelBookingRequest();');
                        $('#spnRent').html('Rs. ' + ActualRent.toString());
                        $('#spnMaintenance').html(BookingDetails.FixedAmenitiesPricing);
                        $('#spnAdvance').html('Rs. ' + BookingDetails.Advance);
                        $('#spnDiscount').html(BookingDetails.DiscountValue);

                        $('#spnReservation').html('Rs. ' + BookingDetails.ReservationAmount);
                        $('#spnLockinPeriod').html(returnwithmonths(BookingDetails.Lockinperiod));
                        $('#spnNoticePeriod').html(returnwithmonths(BookingDetails.NoticePeriod));
                        $('#spnRoomNumber').html(BookingDetails.RoomName);
                        $('.radioBeds').attr('disabled', 'true');
                        $('#referheader').html(BookingDetails.ReferralTitle);
                        $('#spnreferralDesc').html(BookingDetails.ReferralDescription);
                        $('#ReservationFilter').addClass('fadeOutLeft').hide(1000);
                        $('#Keydetails .card,#bookingTab,#Bookinginfo').removeClass('fadeInUp').addClass('fadeOutRight');
                        $('#myFilterBtn').hide();
                        setTimeout(function () {
                            $('#Bookinginfo').hide(100);
                            $('#KeysContainer').slideUp(500);
                            $('#PrivateSharecontainer').hide(100);
                            $('#ReservationPayment').slideDown(500);
                            $('#TrnasferDetails').slideDown(500);
                            $('#dvReservationDetails').removeClass('container-fluid').addClass('container');
                            $('#dvCheckinDetails').removeClass('col-lg-9 col-md-9').addClass('p-0');
                        }, 1000);
                        if ($('#hdnCouponID').val() === "0") {
                            scrollTop(1000);
                        }
                        var valDefaultCouponAmount = 0;
                        if (parseInt(BookingDetails.DefaultCouponId) > 0) {
                            valDefaultCouponAmount = BookingDetails.DefaultCouponAmount;
                        }
                        var iHTML = "";
                        if (valOfferCode == '' && valOfferCode == 0) {
                            if (isbulkbooking == "0") {
                                $("#SelectedBed").html(GetBedkeySummary());
                            }
                            else {
                                $("#SelectedBed").html(GetBedkeySummary());
                            }

                            if (parseInt(BookingDetails.DefaultCouponId) > 0) {
                                let newRent = parseFloat(BookingDetails.RentWithUtility) - parseFloat(valDefaultCouponAmount);
                                iHTML = iHTML + "<strike style='color:#f00;'>Rs." + parseFloat(BookingDetails.RentWithUtility) + "</strike> &nbsp;Rs." + newRent + "";
                                $('#ulSelectedBeds .bedsRent').html(iHTML);
                                $('#spnRent').html('');
                                ActualRent = parseFloat(ActualRent) - parseFloat(valDefaultCouponAmount);
                                $('#spnRent').html(iHTML);
                            }
                        } else {
                            if (isbulkbooking == "0") {
                                $("#SelectedBed").html(GetBedkeySummary());
                            }
                            else {
                                $("#SelectedBed").html(GetBedkeySummary());
                            }

                            let newRent = parseFloat(BookingDetails.RentWithUtility) - parseFloat(BookingDetails.CouponAmount) - parseFloat(valDefaultCouponAmount);
                            iHTML = iHTML + "<strike style='color:#f00;'>Rs." + parseFloat(BookingDetails.RentWithUtility) + "</strike> &nbsp;Rs." + newRent + "";
                            $('#ulSelectedBeds .bedsRent').html(iHTML);
                            $('#spnRent').html('');
                            ActualRent = parseFloat(ActualRent) - parseFloat(BookingDetails.CouponAmount) - parseFloat(valDefaultCouponAmount);
                            $('#spnRent').html(iHTML);
                            /*Double Deducation Secutiry Deposit*/
                            if (parseInt(BookingDetails.DepositCouponAmount) > 0) {
                                var sdHTML = "";
                                let newSecuityDeposit = parseFloat(BookingDetails.Advance) - parseFloat(BookingDetails.DepositCouponAmount);
                                sdHTML = sdHTML + "<strike style='color:#f00;'>Rs." + parseFloat(BookingDetails.Advance) + "</strike> &nbsp;Rs." + newSecuityDeposit;
                                $('#spnAdvance').html(sdHTML);
                            }
                        }
                        if (valOfferCode !== '') {
                            if (valCouponId === 32) {
                                $("#btnRemove").show();
                                $('#spnCouponMsg').html('Promo Applied Successfully').fadeIn();
                                $('#btnPromoApply').val('Cancel').addClass('success');
                            } else if (valCouponId === 55) {
                                $("#btnRemove").show();
                                $('#spnCouponMsg').html('*47% off on your colive home 2nd month rent. Applicable only if you move-in to your colive home on or before 18th Aug').fadeIn();
                                $('#btnPromoApply').val('Cancel').addClass('success');
                            } else {
                                if (BookingDetails.CouponAmount > 0) {
                                    $('#btnPromoApply').val('Cancel').addClass('success');
                                    $('#spnCouponMsg').html('Discount of Rs.' + BookingDetails.CouponAmount + ' Applied Successfully').fadeIn();
                                } else {
                                    $('#txtCoupon').val("");
                                    $("#btnPromoApply").html("Apply").removeClass('success');
                                    $("#btnRemove").hide();
                                    $('#txtCoupon').removeAttr('disabled');
                                    $('#spnCouponMsg').html('Invalid Coupon').fadeIn();
                                }
                            }
                        }
                    } else {
                        DefaultAddressConfig();
                        EnableAddressFormValidators();
                        $('#txtPincode,#txtStreet,#txtHouseNumber').val('');
                        $('#addressmodal').modal('show');
                    }
                } else {
                    alert('Booking Failed !');
                }

            }, errorMsg => { console.log(errorMsg.Message); })
            .catch(ex => { console.log('Exception: ' + ex.message); })
            .finally(() => { $(".se-pre-prop").fadeOut("slow"); });
        // rentCalculationForTransferAPI(input, valOfferCode, valCouponId, isbulkbooking);
    }
}

function transfercheckoutdatechanged() {
    $('#slCheckoutTime').html('');

    var checkout = new Date($('#chkoutDate').val());
    $('#txtMoveinDate').val(formatDate(checkout));
    $('#txtMoveinDate').data().dcalendar.minDate = checkout.setDate(checkout.getDate());
    var dtDate = new Date();
    $('#txtMoveinDate').data().dcalendar.maxDate = dtDate.setDate(dtDate.getDate() + 7);
    if ($('#chkoutDate').val() !== "") {
        var input = {
            Date: $('#chkoutDate').val(),
            PropertyID: $('#hdnPropertyID').val(),
            IsCheckout: true
        };

        $.ajax({
            type: "post",
            url: '/api/MyAccount/GetMoveinTimeSlots',
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(input),
            success: function (data) {
                var response = data;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === "success") {
                    if (Data.length > 0) {
                        for (var i = 0; i < Data.length; i++) {
                            $('#slCheckoutTime').append($('<option>', {
                                value: Data[i].TimeId,
                                text: Data[i].TimeString
                            }));
                        }
                    } else {
                        Toast("Sorry, Please Choose Another Day ! Our Sales Ninjas Too Need A Day Off.");
                    }
                } else {
                    Toast("Sorry, Please Choose Another Day ! Our Sales Ninjas Too Need A Day Off.");
                }
            },
            error: function (xhr) {
                console.log('Request Status: ' + xhr.status + ' Status Text: ' + xhr.statusText + ' ' + xhr.responseText);
            }
        });

    }
}

function validateCouponforTransfer() {
    var btntext = $('#btnPromoApply').val();
    var _roomid = '', _bookingtype = 2;
    if (btntext === "Apply") {

        if ($('#txtCoupon').val() === "") {
            Toast('Please enter a valid coupon !');
            return;
        }
        if ($('#hdnIsBulkBooking').val() == "1") {
            _roomid = $('#hdnRoomId').val();
            _bookingtype = 1;
        }
        else {
            _roomid = $('#hdnRoomId').val();
            _bookingtype = 2;
        }

        var input = {
            OfferCode: $('#txtCoupon').val(),
            RoomID: _roomid,
            CustomerID: $('#hdnCustomerId').val(),
            BookingType: _bookingtype
        };
        $.ajax({
            url: '/api/MyAccount/ValidateCoupon',
            type: 'post',
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(input),
            success: function (data) {
                var response = data;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === 'success') {
                    var CouponList = Data.CouponValidation;
                    if (CouponList.length > 0) {
                        var CouponData = CouponList[0];
                        if (CouponData.ValidationStatus === 1) {
                            $('#btnPromoApply').val('Cancel');
                            $('#txtCoupon').addClass('success');
                            $('#hdnCouponID').val(CouponData.CouponId);
                            $('#txtCoupon').attr('disabled', 'true');
                            GetTransferBookingDetails();
                            // rentCalculationForTransfer(input.OfferCode, CouponData.CouponId, $('#hdnIsBulkBooking').val());
                        } else {
                            Toast('Please enter a valid coupon !');
                            $('#txtCoupon').val("");
                            $('#btnPromoApply').val("Apply");
                            $('#txtCoupon').removeClass('success');
                        }
                    } else {
                        Toast('Please enter a valid coupon !');
                        $('#txtCoupon').val("");
                        $('#btnPromoApply').val("Apply");
                        $('#txtCoupon').removeClass('success');
                    }
                } else {
                    Toast('Please enter a valid coupon !');
                    $('#txtCoupon').val("");
                    $('#btnPromoApply').val("Apply");
                    $('#txtCoupon').removeClass('success');
                    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                }
            },
            error: function (xhr) {
                console.log('Request Status: ' + xhr.status + ' Status Text: ' + xhr.statusText + ' ' + xhr.responseText);
            },
            complete: function () {
                $(".se-pre-prop").fadeOut("slow");
            }
        });
    } else {
        $('#txtCoupon').val('');
        $('#spnCouponMsg').html('');
        $('#spnCouponMsg').fadeOut();
        setTimeout(function () { $('#hdnCouponID').val(0); }, 1000);
        $('#txtCoupon').removeAttr('disabled');
        $("#btnPromoApply").val("Apply");
        $('#txtCoupon').removeClass('success');
        $('#hdnCouponID').val('0');
        GetTransferBookingDetails();
    }
}

function BindTransferDetails() {
    if ($('#chkoutDate').val().length <= 0) {
        Toast('Please select checkout date to proceed further !');
    } else if ($('#slCheckoutTime').val() === null) {
        Toast('Please select checkout time to proceed further !');
    } else {
        $('#ReservationFilter').addClass('fadeOutLeft').hide(1000);
        $('#Keydetails .card,#bookingTab,#Bookinginfo').removeClass('fadeInUp').addClass('fadeOutRight');
        $('#myFilterBtn').hide();
        setTimeout(function () {
            $('#Bookinginfo').hide(100);
            $('#KeysContainer').slideUp(500);
            $('#PrivateSharecontainer').hide(100);
            $('#TrnasferDetails').slideDown(500);
            $('#dvReservationDetails').removeClass('container-fluid').addClass('container');
            $('#dvCheckinDetails').removeClass('col-lg-9 col-md-9').addClass('p-0');
        }, 1000);
        GetTransferBookingDetails();
        $('#CheckoutDetails').modal('hide');
    }
}

function CancelTransferRequest(e) {
    $('#hdnTransferReqId').val(e[0].dataset.transferreqid);
    $('#mdlTransferCancel').modal('show');
}

function CancelTransfer() {
    var input = {
        ReqId: $('#hdnTransferReqId').val()
    }
    APICall('/api/MyAccount/CancelTransferRequest', input)
        .then(result => {
            let response = result;
            let Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                $('#mdlTransferCancel').modal('hide');
                Toast("Transfer request has been successfully cancelled, you have retained your existing booking. The refund will be adjusted in next month's invoice.");
                BindCustomerBookingHistory();
            } else {
                $('#mdlTransferCancel').modal('hide');
                Toast("Transfer request has been failed.");
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log(ex); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}

function MoveinDatechangedTransfer() {
    var _propertyid = '';
    var text = $('#txtMoveinDate').val();
    $('#slTimeSlots').html('');

    if (text !== "") {
        if ($('#hdnIsBulkBooking').val() === "0") {
            _propertyid = $('.radioBeds:checked').data('propertyid');
        }
        else {
            _propertyid = $('.radiorooms:checked').data('propertyid');
        }
        var input = {
            date: text,
            PropertyID: "" + _propertyid + ""
        };

        $.ajax({
            type: "post",
            url: '/api/MyAccount/GetMoveinTimeSlots',
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(input),
            success: function (data) {
                var response = data;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === "success") {
                    if (Data.length > 0) {
                        for (var i = 0; i < Data.length; i++) {
                            $('#slTimeSlots').append($('<option>', {
                                value: Data[i].TimeId,
                                text: Data[i].TimeString
                            }));
                        }
                    } else {
                        Toast("Sorry, Please Choose Another Day ! Our Sales Ninjas Too Need A Day Off.");
                    }
                    GetTransferBookingDetails();

                } else {
                    Toast("Sorry, Please Choose Another Day ! Our Sales Ninjas Too Need A Day Off.");
                }
            },
            error: function (xhr) {
                console.log('Request Status: ' + xhr.status + ' Status Text: ' + xhr.statusText + ' ' + xhr.responseText);
            }
        });
    }
}

function validateCouponTransfer() {
    var btntext = $('#btnPromoApply').val();
    var _roomid = '', _bookingtype = 2;
    if (btntext === "Apply") {

        if ($('#txtCoupon').val() === "") {
            Toast('Please enter a valid coupon !');
            return;
        }
        if ($('#hdnIsBulkBooking').val() == "1") {
            _roomid = $('.radiorooms:checked').data('roomid');
            _bookingtype = 1;
        }
        else {
            _roomid = $('.radioBeds:checked').data('roomid');
            _bookingtype = 2;
        }

        var input = {
            OfferCode: $('#txtCoupon').val(),
            RoomID: _roomid,
            CustomerID: $('#hdnCustomerId').val(),
            BookingType: _bookingtype
        };
        $.ajax({
            url: '/api/MyAccount/ValidateCoupon',
            type: 'post',
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(input),
            success: function (data) {
                var response = data;
                var Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === 'success') {
                    var CouponList = Data.CouponValidation;
                    if (CouponList.length > 0) {
                        var CouponData = CouponList[0];
                        if (CouponData.ValidationStatus === 1) {
                            $('#btnPromoApply').val('Cancel');
                            $('#txtCoupon').addClass('success');
                            $('#hdnCouponID').val(CouponData.CouponId);
                            $('#txtCoupon').attr('disabled', 'true');

                        } else {
                            Toast('Please enter a valid coupon !');
                            $('#txtCoupon').val("");
                            $('#btnPromoApply').val("Apply");
                            $('#txtCoupon').removeClass('success');
                        }
                    } else {
                        Toast('Please enter a valid coupon !');
                        $('#txtCoupon').val("");
                        $('#btnPromoApply').val("Apply");
                        $('#txtCoupon').removeClass('success');
                    }
                } else {
                    Toast('Please enter a valid coupon !');
                    $('#txtCoupon').val("");
                    $('#btnPromoApply').val("Apply");
                    $('#txtCoupon').removeClass('success');
                    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                }
            },
            error: function (xhr) {
                console.log('Request Status: ' + xhr.status + ' Status Text: ' + xhr.statusText + ' ' + xhr.responseText);
            },
            complete: function () {
                $(".se-pre-prop").fadeOut("slow");
            }
        });
    } else {
        $('#txtCoupon').val('');
        $('#spnCouponMsg').html('');
        $('#spnCouponMsg').fadeOut();
        setTimeout(function () { $('#hdnCouponID').val(0); }, 1000);
        $('#txtCoupon').removeAttr('disabled');
        $("#btnPromoApply").val("Apply");
        $('#txtCoupon').removeClass('success');
    }
}

function GetTransferDetails(type) {
    APICall('/api/MyAccount/GetCustomerTransferDetails', {})
        .then(result => {
            let response = result;
            let Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                let objtransfer = Data;
                switch (type) {
                    case 1:
                        if (localStorage.getItem("transferKey") === "1") {
                            $('#ancTransfer,#three-tab').css('display', 'block');
                            $('#ancTransfer,#one-tab').css('display', 'none');
                            $('#ancTransfer,#two-tab').css('display', 'none');

                            $('#PropertyControls, #ancBooknow, #CustomerControls').css('display', 'none');

                            $('#three-tab').click();
                            $('#ancTransfer').css('display', 'block');
                        }
                        else {
                            $('#ancTransfer,#three-tab').css('display', 'none');
                        }
                        break;
                    case 2:
                        $('#hdnTransferBookingId').val(objtransfer.BookingID);
                        $('#hdnTransferReqId').val(objtransfer.TransferReqId);
                        break;
                    default:
                        break;
                }
                //localStorage.setItem("transferKey", "0");

            } else {
                switch (type) {
                    case 1:
                        $('#ancTransfer,#three-tab').css('display', 'none');
                        $('#three-tab').click();
                        break;
                    case 2:
                        Toast("You don't have any active transfer requests !");
                        setTimeout(function () { window.location.href = '/property?location=' + getQueryStringValues()["L"]; }, 1000);
                        break;
                    default:
                        break;
                }
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log(ex); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}

function VerifyCustomerEmail(Verificationlink, mailid) {
    var input = {
        EncCustomerId: Verificationlink,
        Email: mailid
    };
    var url = '/api/MyAccount/VerifyCustomerEmail';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                if (Data.retVal === 1) {
                    $('#spnCustomerName').html(Data.customerObj.CustomerDetails[0].CustomerName);
                    $('#spnEmailVerification').html('Thanks, your e-mail address has been validated!');
                }
                else if (Data.retVal === 2) {
                    $('#spnCustomerName').html(Data.customerObj.CustomerDetails[0].CustomerName);
                    $('#spnEmailVerification').html('Thanks, your e-mail address has been already validated!');
                }
                else {
                    $('#spnCustomerName').html(Data.customerObj.CustomerDetails[0].CustomerName);
                    $('#spnEmailVerification').html('Thanks, your e-mail address validation failed!');
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}



function VerifyMailId() {
    var input = {
        EmailID: $('#txtEmail').val(),
        CustomerID: $('#hdnCustomerID').val()
    };
    var url = '/api/MyAccount/SendMailForVerification';
    APICall(url, input, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                Toast("Mail sent successfully for verification");
                $('#txtEmail').attr("disabled", "disabled");
                $('#imgWarning').css("display", "none");
                $('#lblMailId').css("display", "none");
                $('#hdnLink').val("0");
                $('#hdnRequestStatusId').val("1");
            } else {
                Toast("Mail sending failed for verification");
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}

function BindcustomerDetailsForEmailIdChange(Verificationlink) {
    var input = {
        EncCustomerId: Verificationlink
    };
    var url = '/api/MyAccount/BindcustomerDetailsForEmailIdChange';
    APICall(url, input, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                $('#txtCustomerName').val(Data.CustomerDetails[0].CustomerName);
                $('#txtMobileNumber').val(Data.CustomerDetails[0].Mobile);
                $('#txtEmail').val(Data.CustomerDetails[0].EmailID);
                $('#hdnCustomerID').val(Data.CustomerDetails[0].CustomerID);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}

function VerifySaveEmailId() {
    var input = {
        CustomerID: $('#hdnCustomerID').val(),
        Email: $('#txtEmail').val()
    };
    var url = '/api/MyAccount/VerifySaveEmailId';
    APICall(url, input, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                Toast("Email saved successfully !");
                VerifyMailId();
            }
            else if (Status === 'failed' && Data === 2)
                Toast("EmailId is already registered !");
            else
                Toast("Saving emailId failed !");

        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}

function CheckEmailVerified(obj) {
    var input = {
        CustomerID: $('#hdnCustomerId').val()
    };
    var url = '/api/MyAccount/BindcustomerDetailsForEmailIdChange';
    APICall(url, input, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                if (Data.CustomerDetails[0].IsEmailVerified === true && Data.CustomerDetails[0].EmailID !== $('#txtEmail').val().trim()) {
                    Toast("Email address already verified couldn't save updated mail address!");
                    $('#txtEmail').val(Data.CustomerDetails[0].EmailID);
                    $('#txtEmail').attr("disabled", "disabled");
                    $('#imgWarning').css("display", "none");
                    $('#lblMailId').css("display", "none");
                }
                else {
                    SaveKycBasicDetails(obj);
                }
            }
            else {
                Toast("Saving emailId failed !");
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}

function ShowAllItems(element) {
    if (element.val() === "show") {
        element.val("hide");
        element.prev().css('visibility', 'hidden');
        element.html('' + element.data('count') + ' More');
        element.parent().prev().find('.ul-height-limit').animate({ scrollTop: 0 }, 2000).toggleClass('active');
        element.toggleClass('active');
    } else {
        element.prev().css('visibility', 'visible');
        element.val("show");
        element.html('Less');
        element.parent().prev().find(".ul-height-limit").toggleClass('active');
        element.toggleClass('active');
    }


}

function PropertySorting(element) {
    var elementdata = element[0].dataset;
    if (elementdata.order === "2") {
        SortHtmlElements('data-price', '#PropListCards', 'div', 'desc');
        SortHtmlElements('data-price', '#PropMapCards', 'a', 'desc');
        SortHtmlElements('data-price', '#TrendingPropertiesCards', 'div', 'desc');
        SortHtmlElements('data-price', '#SimilarPropListCards', 'div', 'desc');
    } else if (elementdata.order === "1") {
        SortHtmlElements('data-price', '#PropListCards', 'div', 'asc');
        SortHtmlElements('data-price', '#PropMapCards', 'a', 'asc');
        SortHtmlElements('data-price', '#TrendingPropertiesCards', 'div', 'asc');
        SortHtmlElements('data-price', '#SimilarPropListCards', 'div', 'asc');
    } else {
        SortHtmlElements('data-order', '#PropListCards', 'div', 'asc');
        SortHtmlElements('data-order', '#PropMapCards', 'a', 'asc');
        SortHtmlElements('data-order', '#TrendingPropertiesCards', 'div', 'asc');
        SortHtmlElements('data-order', '#SimilarPropListCards', 'div', 'asc');
    }
    $('.sort-list li').removeClass('active');
    element.parent().addClass('active');
    $('#currsort').html(element.text());
    $("a#trigger").trigger('mouseenter');
    $('.property-sorting').hide();
}


function SortHtmlElements(arg, sel, elem, order) {
    var $selector = $(sel),
        $element = $selector.children(elem);
    $element.sort(function (a, b) {
        var an = parseInt(a.getAttribute(arg)),
            bn = parseInt(b.getAttribute(arg));
        if (order == "asc") {
            if (an > bn)
                return 1;
            if (an < bn)
                return -1;
        } else if (order == "desc") {
            if (an < bn)
                return 1;
            if (an > bn)
                return -1;
        }
        return 0;
    });
    $element.detach().appendTo($selector);
}


function GetLocationsbyCity(type) {
    var count = 0, CityMenuId = '';

    if ($('input[name="rdCity"]:checked').val() === undefined && window.location.pathname !== "/search") {
        $.each($('input[name="rdCity"]'), function () {
            let windowpath = window.location.pathname;
            if (windowpath.split('/').length >= 2) {
                if (windowpath.split('/')[1].toLowerCase() === $(this).val().toLowerCase()) {
                    $(this).prop('checked', true);
                }
            }
        });
    }
    CityMenuId = $('input[name="rdCity"]:checked').data('menuid') === undefined ? 1 : $('input[name="rdCity"]:checked').data('menuid');
    APICall('/api/Colive/LoadHeaderLocationMenu', {})
        .then(result => {
            var response = JSON.parse(result);
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var MenuList = Data;
                MenuList = MenuList.filter(function (object) { return object.IsMenuEnabled === true; });
                var ClusterList = MenuList.filter(function (object) { return (object.MenuLevel === 2 && object.ParentMenuId === parseInt(CityMenuId)); });
                var strArea = '';
                $.each(ClusterList, function (i, v) {
                    if (parseInt(CityMenuId) === v.ParentMenuId) {
                        strArea += '<li class="radioInputGroup"> \
                                <div class="filtercitySelect"> \
                                <input class="radio-custom" id="rd_City'+ v.MenuId + '"  name="rdLocations" type="radio"  value="' + v.URL + '" onchange="ClusterChanged();"> \
                                <label class="radio-custom-label" for="rd_City'+ v.MenuId + '">' + v.Menu + '</label> \
                               </div> \
                               </li>';
                        count += 1;
                    }
                    var LocationList = MenuList.filter(function (object) { return (object.MenuLevel === 3 && object.ParentMenuId === v.MenuId); });

                    $.each(LocationList, function (Area_i, Area_Val) {
                        if (v.MenuId === Area_Val.ParentMenuId && parseInt(CityMenuId) === v.ParentMenuId) {
                            count += 1;
                            strArea += '<li class="radioInputGroup"> \
                                <div class="filtercitySelect"> \
                                <input class="radio-custom" id="rd_City'+ Area_Val.MenuId + '"  name="rdLocations" type="radio"  value="' + Area_Val.URL + '" onchange="ClusterChanged();"> \
                                <label class="radio-custom-label" for="rd_City'+ Area_Val.MenuId + '">' + Area_Val.Menu + '</label> \
                               </div> \
                               </li>';
                        }
                    });

                    if (count > 5) {
                        setTimeout(function () { $('#location > ul > li').last().html('<span id="filterInput" onclick="ShowAllItems($(this));" class="apply_show" data-count="' + (count - 5) + '">' + (count - 5) + ' more</span>'); }, 1000);
                    } else {
                        $('#location > ul > li').last().html('');
                    }


                });

                if (type === 1) {
                    setTimeout(function () {
                        var PathName = $('.TitleCity').text();
                        var QueryList = MenuList.filter(function (obj) { return obj.Menu.toLowerCase() === PathName.toLowerCase(); });
                        if (QueryList.length > 0) {
                            var objQry = QueryList[0];
                            $('#rd_City' + objQry.MenuId + '').prop('checked', true);
                        }
                    }, 1000);
                }

                if (type === 2) {
                    if (Windowidth > 787) {
                        $('input[name="rdLocations"]').prop('checked', false);
                        ApplySearchFilter(0);
                    }
                }

                $('#ullocation').html(strArea).removeClass('active').listfilter({
                    'filter': $('#txtSearchLoc'),
                    'clearlink': $('#CloseBtnLoc'),
                    'alternate': false
                });

                $('#MRent li,#divRoomType li,#divAmenities li,#ulCityList li,#ullocation li,#divLanguages li,#divhobbies li,#ulFoodhabits li').not('.header').listfilter({
                    'filter': $('#txtSearchFilter'),
                    'clearlink': $('#ClosebtnFilter'),
                    'alternate': false
                });

            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }).catch(ex => { console.log(ex); });
}







function GetPropertyCard(obj, type, iteration = 0) {
    var StrCards = "", url = "";
    switch (type) {
        case 1: // factsheet url formation from  properties of the month          
            if (obj !== null) {
                if (obj.SubLocation === undefined) {
                    url = '/property?location=' + obj.Link;
                } else {
                    url = "/Bangalore/" + replaceFslash(replaceWhiteSpace(obj.SubLocation)) + "/" + replaceWhiteSpace(obj.PropertyName) + "/" + obj.Link + "?location=" + obj.Link;
                }
                StrCards = "<div class='item'> \
                            <a class='property' href='"+ url + "'>\
                            <div class='card'> \
                            <img class='card-img-top propertyBanner property-img' src='" + obj.DetailedImageName + "' alt='" + obj.PropertyName + "'>  \
                            "+ GetTagName(obj.TrendingTagName, obj.TrendingTagDisplay) + " \
                            <div class='card-body'> \
                            <h5 class='card-title'>" + obj.PropertyName + "<i class='fa fa-heart-o'></i></h5> \
                                    <div class='cords' data-toggle='tooltip' data-placement='bottom' data-title='"+ obj.SubLocation + "'><img src='/assets/images/marker.png' alt='marker'>" + ReturnWithDotsBylength(obj.SubLocation === undefined ? obj.LocationName : '', 40) + ", " + obj.City + "</div> \
                                            <div class='row'> \
                                                <div class='col-lg-6 col-md-6 col-6'> \
                                                    <div class='price'> \
                                                        <h6 class='pricing'>Starting price</h6> \
                                                        <p><i class='fa fa-inr' aria-hidden='true'></i>" + ConverToRupees(obj.Price) + "</p>  \
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
                                                <div class='col-lg-6 col-md-6 col-6 PropertyViewDesign' > \
                                                    <span class='property' >View Property</span> \
                                                </div > \
                                            </div> \
                                           <hr class='line' style='width: 306.93px;'> \
                                                  <div class='scheduleFreeVissit'> \
                                                        <span class='property'>Schedule a visit</span> \
                                                </div> \
                                               " + GetVariantsType(obj.PropertyVariantTagName, obj.PropertyVariantsTypeId) + " \
                                                </div> \
                                            </div > \
                                    </div></a>";
            }
            break;
        case 2:
            url = window.location.pathname === "/search" ? "/property?location=" + obj.Link : "/" + window.location.pathname.substr(1).split('/')[0] + '/' + replaceFslash(replaceWhiteSpace(obj.LocationName)) + '/' + replaceWhiteSpace(obj.PropertyName) + '/' + replaceWhiteSpace(obj.Link) + '?location=' + obj.Link + '';
            StrCards = "<div class='col-lg-4 col-md-4 col-12 pod' data-price='" + obj.Price + "' data-order='" + iteration + "'> \
                        <div class='card'>  \
                        <a href='" + url + "'>\
                        <img class='card-img-top property-img' src='" + obj.TileImageName + "' alt='" + obj.PropertyName + "'> \
                          "+ GetTagName(obj.TrendingTagName, obj.TrendingTagDisplay) + "  \
                        <div class='card-body'> \
                        <h5 class='card-title' > " + obj.PropertyName + "<i class='fa fa-heart-o'></i ></h5 >  \
                         <div class='cords' data-toggle='tooltip' data-placement='bottom' data-title='"+ obj.LocationName + "'><img src='/assets/images/marker.png' alt=''>" + ReturnWithDotsBylength(obj.LocationName, 18) + ", " + obj.City + " </div> \
                        <div class='row'> \
                            <div class='col-lg-6 col-md-6 col-6'> \
                                <div class='price'>  \
                                    <h6 class='pricing'>Starting price</h6><br />\
                                    <p><i class='fa fa-inr' aria-hidden='true'></i>&nbsp;" + ConverToRupees(obj.Price) + "</p> \
                                </div> \
                                <div class='rating'> \
                                    <p class='rate'>3.5/5</p> \
                                    <p class='wid'> \
                                        <i class='fa fa-star' aria-hidden='true'></i> \
                                        <i class='fa fa-star' aria-hidden='true'></i> \
                                        <i class='fa fa-star' aria-hidden='true'></i> \
                                        <i class='fa fa-star' aria-hidden='true'></i> \
                                        <i class='fa fa-star' aria-hidden='true'></i> \
                                    </p> \
                                </div> \
                            </div> \
                            <div class='col-lg-6 col-md-6 col-6 PropertyViewDesign'> \
                                <span class='property' >View Property</span> \
                            </div> \
                        </div> \
                        <hr class='line'> \
                        <div class='scheduleFreeVissit'> \
                                <span class='property'>Schedule a visit</span></div> \
                        </div> \
                    </a> \
                    <div class='quick-view'> \
                        <input type='button' value='Quick View' data-toggle='modal' data-target='#QuickviewModal' data-link='" + obj.Link + "' onclick='BindQuickview($(this))' /> \
                    </div> \
                    " + GetVariantsType(obj.PropertyVariantTagName, obj.PropertyVariantsTypeId) + " \
                </div> \
              </div> \
            </div> ";
            break;
        default: // factsheet url formation default
            url = "/property?location=" + obj.Link;
    }
    return StrCards;
}



function ClusterChanged() {
    if (Windowidth > 787) {
        ApplySearchFilter(0);
    }
}

function FoodhabitsChanged() {
    if (Windowidth > 787) {
        ApplySearchFilter(0);
    }
}

function ChangeURLForSEO(object) {
    let SEOURL = object.Type === 1 ? '/' + object.URL + '/pg-rooms-for-rent' : '/search' + $('#hdnQueryString').val();
    SEOURL += object.SharingType.length > 0 ? SEOURL.includes('?') ? '&SharingType=' + object.SharingType.join(',') + '' : '?SharingType=' + object.SharingType.join(',') + '' : '';
    SEOURL += object.Amenities.length > 0 ? SEOURL.includes('?') ? '&Amenities=' + object.Amenities.join(',') + '' : '?Amenities=' + object.Amenities.join(',') + '' : '';
    SEOURL += object.Languages.length > 0 ? SEOURL.includes('?') ? '&Languages=' + object.Languages.join(',') + '' : '?Languages=' + object.Languages.join(',') + '' : '';
    SEOURL += object.Hobbies.length > 0 ? SEOURL.includes('?') ? '&Hobbies=' + object.Hobbies.join(',') + '' : '?Hobbies=' + object.Hobbies.join(',') + '' : '';
    SEOURL += $('#chkPriceAny').prop('checked') ? '' : SEOURL.includes('?') ? '&PriceRange=' + object.PriceRange + '' : '?PriceRange=' + object.PriceRange + '';
    SEOURL += object.FoodHabits === "" ? '' : SEOURL.includes('?') ? '&FoodHabits=' + object.FoodHabits + '' : '?FoodHabits=' + object.FoodHabits + '';
    let state = { Actual: object.LocationName };
    history.pushState(state, $('title').text(), SEOURL);
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
                    if (CustomerDetails.IsCoTenant) {
                        $('#schedule-btnheader').attr('disabled', true);
                    }                    
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
function BindCareerFields(type) {
    APICall('/api/Colive/GetAllCareerMasters', {}, false, 'GET')
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                switch (type) {
                    case 1:
                        FillDropdown($('#ddlCareerlocation'), Data.Location);
                        FillDropdown($('#ddlcareerdepartment'), Data.Department);
                        FillDropdown($('#ddlcareerjobTitle'), Data.Title);
                        $('#ddlCareerlocation').prepend('<option value="0">Select Your Preferred Locations</option>').find('option').first().prop('selected', true);
                        $('#ddlcareerdepartment').prepend('<option value="0">Select Departments</option>').find('option').first().prop('selected', true);
                        $('#ddlcareerjobTitle').prepend('<option value="0">Select Job Title</option>').find('option').first().prop('selected', true);
                        break;
                    case 2:
                        BindGenderAndAge(Data.Gender, Data.AgeRange);
                        break;
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

function GetJobsFromSearch() {
    let input = {
        TitleId: $("#ddlcareerjobTitle").val(),
        DepartmentId: $('#ddlcareerdepartment').val(),
        LocationId: $("#ddlCareerlocation").val()
    };
    GetCareerJobs(input);
}

function GetJobsbyDepartment(intDepartmentId) {
    let input = {
        DepartmentId: intDepartmentId
    };
    GetCareerJobs(input);
}



function GetCareerJobs(input) {
    APICall('/api/Colive/GetCareerJobs', input, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                let CareerList = Data;
                let strList = '';
                if (CareerList.length > 0) {
                    $.each(CareerList, function (i, v) {
                        strList += '<div class="col col-gl-4 col-md-4 col-sm-4 col-12"> \
                                <a class="chooseJobsFields" href="/careers/job?jid='+ v.JobId + '"> \
                                <div class="SelectedJobFields"> \
                                <h1 class="SelectedJobheadTitle">'+ (v.Department === null ? "&nbsp;" : v.Department) + '</h1> \
                                <div class="SelectedJobExp"><i class="fa fa-briefcase"></i>'+ v.Exp + ' yrs</div> \
                                <div class="SelectedJobTitle"><i class="fa fa-id-card"></i>'+ v.Title + '</div> \
                                <div class="SelectedJobLocationSec"><i class="fa fa-map-marker"></i>'+ v.Location + '</div> \
                                </div> \
                                </a> \
                                </div>';
                    });
                    $('#dvJoblisting').html(strList);
                    $('#JobListingSection').show();
                    ScrollByElement($('#JobListingSection'), 1000);
                } else {
                    $('#JobListingSection').hide();
                    EquipCareerFormSearch();
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}


function EquipCareerForm() {
    let CareerId = getQueryStringValues()["jid"];
    $('#hdnJobId').val(CareerId);
    $("#careerenquiry").validate({
        rules: {
            firstname: "required",
            lastname: "required",
            mobilenumber: {
                required: true,
                number: true,
                maxlength: 10,
                minlength: 10
            },
            emailid: {
                required: true,
                email: true
            },
            candidateexpmonths: {
                number: true,
                maxlength: 3,
                minlength: 1
            },
            candidatelnurl: {
                url: true
            },
            candidatetwurl: {
                url: true
            },
            candidategturl: {
                url: true
            },
            candidatepfurl: {
                url: true
            },
            candidatewburl: {
                url: true
            }
        },
        messages: {
            firstname: "Please enter your firstname",
            lastname: "Please enter your lastname",
            mobilenumber: "Please enter a valid mobile number",
            emailid: "Please enter a valid email id",
            candidatelnurl: "Please enter a valid url !",
            candidatetwurl: "Please enter a valid url !",
            candidategturl: "Please enter a valid url !",
            candidatepfurl: "Please enter a valid url !",
            candidatewburl: "Please enter a valid url !",
            candidateexpmonths: "Please enter your experience in months"
        }
    });
    BindCareerFields(2);
    APICall('/api/Colive/GetCareerJobs', { JobID: CareerId })
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                if (Data.length > 0) {
                    let objJobDetails = Data[0];
                    $('#spnJobTitle').html(objJobDetails.Title);
                    $('#spnJobShortDesc').html(objJobDetails.Location + ' - ' + (objJobDetails.Department === null ? "" : objJobDetails.Department));
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}

function BindGenderAndAge(GenderList, AgeList) {
    if (GenderList.length > 0) {
        let strGenderList = '';
        $.each(GenderList, function (i, v) {
            strGenderList += '<div class="radioInputGroup"> \
                              <div class="filtercitySelect"> \
                              <input class="radio-custom" id="rdGender_'+ v.Id + '" name="rdCandidateGender" type="radio" value="' + v.Id + '"> \
                              <label class="radio-custom-label" for="rdGender_'+ v.Id + '">' + v.Name + '</label> \
                              </div>  \
                              </div>';
        });
        $('#GenderSelection').html(strGenderList);
    }
    if (AgeList.length > 0) {
        let strAgeList = '';
        $.each(AgeList, function (i, v) {
            strAgeList += '<div class="radioInputGroup"> \
                              <div class="filtercitySelect"> \
                              <input class="radio-custom" id="rdAge_'+ v.Id + '" name="rdAge" type="radio" value="' + v.Id + '"> \
                              <label class="radio-custom-label" for="rdAge_'+ v.Id + '">' + v.Name + '</label> \
                              </div>  \
                              </div>';
        });
        $('#AgeSelection').html(strAgeList);
    }
}



function CareerJobApply() {
    if ($("#careerenquiry").valid()) {
        if ($('#ResumeUpload')[0].files.length === 1) {
            let input = {
                JobID: $('#hdnJobId').val(),
                FirstName: $('#txtApplicantFirstname').val(),
                LastName: $('#txtApplicantLastname').val(),
                Mobile: $('#txtApplicantPhoneNumber').val(),
                Email: $('#txtApplicantEmail').val(),
                ExpMonth: $('#txtApplicantExperience').val(),
                CurrentCompany: $('#txtApplicantCurrentCompany').val(),
                LinkedInURL: $('#txtApplicantProLinkedIn').val(),
                TwitterURL: $('#txtApplicantProTwitter').val(),
                GitHubURL: $('#txtApplicantProGitHub').val(),
                PortFolioURL: $('#txtApplicantProPortfolio').val(),
                OtherWebsite: $('#txtApplicantProWebsite').val(),
                AdditionalInfo: $('#txtCandidateAdditional').val(),
                GenderId: $('input[name="rdCandidateGender"]:checked').val() === undefined ? 0 : $('input[name="rdCandidateGender"]:checked').val(),
                AgeRangeId: $('input[name="rdAge"]:checked').val() === undefined ? 0 : $('input[name="rdAge"]:checked').val()
            };
            savecandidatedetails(input, 1);
        } else {
            Toast("Please upload your resume !");
        }
    }
}

function savecandidatedetails(input, type) {
    APICall('/api/Colive/CandidateDetailsInsert', input, true)
        .then(responseData => {
            let response = responseData;
            let Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                if (type === 1) {
                    $('#hdnJobId,#txtApplicantFirstname,#txtApplicantLastname,#txtApplicantPhoneNumber,#txtApplicantEmail, \
                       #txtApplicantExperience,#txtApplicantCurrentCompany,#txtApplicantProLinkedIn,#txtApplicantProTwitter, \
                       #txtApplicantProGitHub,#txtApplicantProPortfolio,#txtApplicantProWebsite,#txtCandidateAdditional').val('');
                    $('input[name="rdCandidateGender"],input[name="rdAge"]').prop('checked', false);
                    SendResume(Data, type);
                } else if (type === 2) {
                    SendResume(Data, type);
                    $('#txtApplicantFirstname,#txtApplicantLastname,#txtApplicantPhoneNumber,#txtApplicantEmail,#txtApplicantExperience, \
                       #txtApplicantCurrentCompany').val('');
                    $('#CareerApplicationPopup').modal('hide');
                }
            } else {
                Toast(Message);
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });

}


function SendResume(CandidateId, type) {
    var FileData = new FormData();
    var files = $("#ResumeUpload").get(0).files;
    if (files.length > 0) {
        FileData.append("Resume", files[0]);
    }
    FileData.append("CandidateId", CandidateId);
    SaveDocument(FileData, 1, true).then(responseData => {
        let response = responseData;
        let Status = response.Status,
            Message = response.Message,
            Data = response.Data;
        if (Status === 'success') {
            $('#ThankyouApplicationPopup').modal('show');
            $("#ResumeUpload").val('');
            $('#spnResumeFileName').html('');
            if (type === 1) {
                window.location.href = "/careers";
            }
        }
    }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}


function EquipCareerFormSearch() {
    $("#CareerEnquirySearch").validate({
        rules: {
            firstname: "required",
            lastname: "required",
            mobilenumber: {
                required: true,
                number: true,
                maxlength: 10,
                minlength: 10
            },
            emailid: {
                required: true,
                email: true
            },
            candidateexpmonths: {
                number: true,
                maxlength: 3,
                minlength: 1
            }
        },
        messages: {
            firstname: "Please enter your firstname",
            lastname: "Please enter your lastname",
            mobilenumber: "Please enter a valid mobile number",
            emailid: "Please enter a valid email id",
            candidateexpmonths: "Please enter your experience in months"
        }
    });
    $('#txtApplicantFirstname,#txtApplicantLastname,#txtApplicantPhoneNumber,#txtApplicantEmail, \
       #txtApplicantExperience, #txtApplicantCurrentCompany, #ResumeUpload').val('');
    $('#spnResumeFileName').html('').hide();
    $('#CareerApplicationPopup label.error').hide();
    $('#CareerApplicationPopup').modal('show');
}


function SaveCareerFromSearch() {
    if ($("#CareerEnquirySearch").valid()) {
        if ($('#ResumeUpload')[0].files.length === 1) {
            let input = {
                JobID: 0,
                FirstName: $('#txtApplicantFirstname').val(),
                LastName: $('#txtApplicantLastname').val(),
                Mobile: $('#txtApplicantPhoneNumber').val(),
                Email: $('#txtApplicantEmail').val(),
                ExpMonth: $('#txtApplicantExperience').val(),
                CurrentCompany: $('#txtApplicantCurrentCompany').val(),
                LocationId: $('#ddlCareerlocation').val(),
                DepartmentId: $('#ddlcareerdepartment').val(),
                TitleId: $('#ddlcareerjobTitle').val()
            };
            savecandidatedetails(input, 2);
        } else {
            Toast("Please upload your resume !");
        }
    }
}


function GetJobDetailsByJobId(JobDescId) {
    let input = {
        JobID: JobDescId
    };
    APICall('/api/Colive/GetCareerJobs', input, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                let CareerList = Data;
                if (CareerList.length > 0) {
                    let objCareerDetails = CareerList[0];
                    $('#spnJobTitle_Desc').html(objCareerDetails.Title);
                    $('#spnJobShortDesc_Desc').html(objCareerDetails.Location + ' - ' + (objCareerDetails.Department === null ? "" : objCareerDetails.Department));
                    $('.ancCareerApply').attr('href', '/careers/apply?jid=' + objCareerDetails.JobId);
                    $('#dvJobResponsibility').html(objCareerDetails.Responsibility);
                    $('#dvJobQualification').html(objCareerDetails.Qualification);
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}



function BindAchievements() {
    var url = '/api/Colive/GetAchievements';
    APICall(url, {})
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var n = 0;
                var _Achievements = '';
                if (Data.AchievementsBlogContents.length > 0) {
                    $.each(Data.AchievementsBlogContents, function (i, v) {
                        var _url = '\\awards-recognition\\' + v.AchievementId + '\\' + replaceWhiteSpace(ReplaceSpecialCharacters(v.Heading));
                        n = n + 1;
                        _Achievements += "<div id='achievements_blog_contents' class='achievementBlogWrapper EvenAchievementDiv " + (n % 2 === 0 ? ' cardright' : 'cardleft') + "' >\
                            <div class='col col-lg-8 col-sm-8 col-12 p-0'>\
                                <div class='achievementBlog_contain hovereffect'>\
                                    <div class='achievement_Box'>\
                                        <a href='"+ _url + "' class='ac-item-image-inner'> \
                                            <div class='AchievementBox_Img'> \
                                                <img src='"+ v.Image + "' class='img-fluid'/> \
                                            </div>\
                                        </a>\
                                    </div>\
                                </div>\
                            </div>\
                            <div class='col col-lg-4 col-sm-4 col-12 p-0'>\
                                <div class='achievementBlog_contain'> \
                                    <div class='achievement_Box'> \
                                        <a class='ac-item-image-inner'> \
                                            <div class='AchievementBox_Content'> \
                                                <div class='ac-item-caption'> \
                                                    <a href='"+ _url + "'> \
                                                    <h3 class='achievementTitle_tag'>"+ v.Heading + "</h3> \
                                                    <h4 class='achievementSubTitle_tag'>"+ v.SubHeading + "</h4> \
                                                    </a> \
                                                </div> \
                                            </div> \
                                        </a>\
                                    </div>\
                                </div>\
                            </div>\
                    </div>";
                    });
                    $('#achivementContainer').html(_Achievements);
                } else {
                    $('#achievements_Blog').hide();
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log(ex); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}

function BindAchievementImagesForAchievementId(AchievementId) {
    var input = {
        AchievementId: AchievementId
    };
    var url = '/api/Colive/GetAchievementImagesForAchievementId';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var _AchievementsImage = '';
                $('#achievementsheading').html(Data.AchievementsImageContents[0].Heading);
                $('#achievementsbreadcrumb').html(Data.AchievementsImageContents[0].Heading);
                $('#achievementsSubHeading').html(Data.AchievementsImageContents[0].SubHeading);
                $('#achievementDescription').html(Data.AchievementsImageContents[0].Description);
                $.each(Data.ImgDetails, function (i, v) {
                    _AchievementsImage += '<div class="item">\
                        <div class="achievementImageSlider">\
                            <div class="AchievementSliderImage">\
                                <img src="'+ v.ImgPath + '" class="img-fluid">\
                              </div>\
                            </div>\
                        </div>';
                });
                $('#achievementsImage_blog_contents').html(_AchievementsImage);
                $('#achievementsImage_blog_contents').owlCarousel({
                    loop: true,
                    margin: 10,
                    responsiveClass: true,
                    dots: false,
                    autoHeight: true,
                    nav: true,
                    responsive: {
                        0: {
                            items: 1
                        },
                        600: {
                            items: 1
                        },
                        1000: {
                            items: 1,
                            margin: 20
                        }
                    }
                });
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log(ex); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}

function BindSocialMediaPosts() {
    APICall('/api/Colive/GetSocialMediaPosts', {}, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                if (Data.Categories.length > 0) {
                    $.each(Data.Categories, function (i, v) {
                        $('#social-Buttons').append('<input type="button" class="filter-button" id="btnCategory_' + v.CategoryId + '" data-categoryid="' + v.CategoryId + '" onclick="BindImagesByCategory($(this));" value="' + v.Category + '" />');
                    });
                }
                if (Data.Images.length > 0) {
                    $.each(Data.Images, function (i, v) {
                        $('#SocialMediaImages').append('<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 category_' + v.CategoryId + ' Socialgallery_product filter facebook-view allsocial-view' + (i > 3 ? 'delay-2s' : 'delay-1s') + '" data-categoryid="' + v.CategoryId + '"> \
                            <div class="Colive_SocialGallery"> \
                            <div class="ColiveSocialProduct"> \
                              <a target="_blank" href="'+ v.Url + '" rel="noopener noreferrer"> \
                                <img src="'+ v.ImgPath + '" class="img-fluid"> \
                               </a>  \
                              </div> \
                            </div> \
                          </div>');
                    });
                }

                setTimeout(function () { $('#btnCategory_7').click(); }, 500);
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log(ex); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}


function BindImagesByCategory(ancobject) {
    $('.filter-button').removeClass('SocialNav-Active');
    ancobject.addClass('SocialNav-Active');
    if ($('.filter').filter('.category_' + ancobject.data('categoryid')).length > 0) {
        $('#SocialMediaImages').show();
        $('#SocialMediaNoposts').hide();
        $(".filter").not('.category_' + ancobject.data('categoryid')).hide().removeClass('slideInUp');
        $('.filter').filter('.category_' + ancobject.data('categoryid')).show().addClass('slideInUp');
    } else {
        $('#SocialMediaImages').hide();
        $('#SocialMediaNoposts').show();
    }
}


function GetCorporatePageContent() {
    APICall('/api/Colive/GetCorporatePageContent', {}, true, 'GET')
        .then(result => {
            let response = result;
            let Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                let PartnersImages = Data.Partners;
                let CorporateContent = Data.Content;
                if (PartnersImages.length > 0) {
                    let strPartnersImages = '';
                    $.each(PartnersImages, function (i, v) {
                        strPartnersImages += '<div class="col-6 col-md-3"> \
                                              <div class="partner-logo"> \
                                              <img src="'+ v.Logo + '" alt="' + v.Name + '" class="w3-hover-opacity partnerimg"> \
                                              </div> \
                                              </div>';
                    });
                    $('#dvPartnesImage').html(strPartnersImages);
                } else {
                    $('#dvvalueclients').hide();
                }

                if (CorporateContent.length > 0) {
                    let CorporateDetails = CorporateContent[0];
                    $('#CorporateHeadingOne').html(CorporateDetails.Headline1);
                    $('#CorporateDescOne').html(CorporateDetails.Description1);
                    $('#dvHeadingSecond').html(CorporateDetails.Headline2);
                    $('#dvDescriptionsecond').html(CorporateDetails.Description2);
                    $('#dvHeadingThird').html(CorporateDetails.Headline3);
                    $('#dvDescriptionthird').html(CorporateDetails.Description3);
                } else {
                    $('#CorporateMainWrapper,#CorporateBenefits').hide();
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log(ex); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}

function VerifyRegisteredCustomer() {
    if ($("#offlinePaymentBasic").valid()) {
        var Mobile = $('#customermobile').val();
        if (IsValidMobile(Mobile)) {
            $('#hdnMobile').val(Mobile);
            VerifyExistingCustomerOffline(Mobile);
        }
    }
}


function VerifyExistingCustomerOffline(strMobile) {
    let input = {
        Mobile: strMobile
    };
    var url = '/api/MyAccount/CustomerDetailsByMobile';
    APICall(url, input, true)
        .then(responseData => {
            let response = responseData;
            let Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                let CustomerList = Data.CustomerDetails;
                if (CustomerList.length > 0) {
                    let objCustomerDetails = CustomerList[0];
                    $('#txtUserName').val(objCustomerDetails.CustomerName).prop('disabled', true);
                    $('#txtUserMail').val(objCustomerDetails.EmailID).prop('disabled', true);
                    $('#txtUserMobile').val(objCustomerDetails.Mobile).prop('disabled', true);
                    $('#txtAmount,#PaymentNotes').val('');
                    $('#hdnIsReigisteredCustomer').val("true");
                    $('#hdnPaymentCustomerID').val(objCustomerDetails.CustomerID);
                    ShowOfflinePayment(true);
                }
            } else {
                $('#txtUserName,#txtUserMail,#txtAmount,#PaymentNotes').val('').prop('disabled', false);
                $('#txtUserMobile').val($('#hdnMobile').val()).prop('disabled', true);
                $('#hdnIsReigisteredCustomer').val("false");
                $('#hdnPaymentCustomerID').val(0);
                GenerateOTP(4, input.Mobile, ShowOfflinePayment(false));
            }
        }, errorMsg => { console.log(errorMsg); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}


function ShowOfflinePayment(IsRegistered) {
    $('#OfflineVerifyMobileTemplate').addClass('fadeOut').hide();
    $('#offlinepayment-template').show().addClass('fadeInRight');
    if (IsRegistered === false) {
        $('#timer').startTimer({
            onComplete: function (element) {
                $('#timer').addClass('flipOutX').removeClass('flipInX').hide();
                $('#ResendContainer').show().addClass('slideInDown');
            }
        }).trigger('start').css('display', 'inline-flex').addClass('flipInX');
        $('#dvPaymentOTP').slideDown();
    }

}


function GetOrderIdForOfflinePayments() {
    if ($('#offlinePayment').valid()) {
        if ($('#hdnIsReigisteredCustomer').val() === "true") {
            OfflinePaymentConfirmation($('#hdnPaymentCustomerID').val());
        } else {
            VerifyOTP($('#txtCustomerOTP'), SignUpForOfflinePayment);
        }
    }
}

function OfflinePaymentConfirmation(CustomerID) {
    let input = {
        PaymentApp: 4,
        TotalAmount: $('#txtAmount').val(),
        Notes: $('#PaymentNotes').val(),
        CustomerID: CustomerID,
        SourceType: 6
    };
    APICall('/api/MyAccount/OfflinePaymentConfirmation', input, true)
        .then(responseData => {
            let response = responseData;
            let Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                PaymentGateWayRedirection_V2(Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log(ex); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}

function PaymentGateWayRedirection_V2(OrderId) {
    var strForm = '<form id="fmPayment_' + OrderId + '" name="frmPg" action="/pg/paymentoptions.aspx" method="post" style="display:none;"> \
                      <input type="hidden" value="'+ OrderId + '" id="OrderId" name="OrderId" /> \
                   </form>';
    $('body').append(strForm);
    setTimeout(function () { $('#fmPayment_' + OrderId + '').submit(); }, 500);
}

function SignUpForOfflinePayment() {
    let inputJson = {
        FirstName: $('#txtUserName').val(),
        Mobile: $('#txtUserMobile').val(),
        Email: $('#txtUserMail').val(),
        SignedUpFrom: 5
    };
    APICall('/api/MyAccount/SignUp', inputJson, true)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                OfflinePaymentConfirmation(Message);
            } else {
                Toast(Message);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}

function ResentOTPOfflinePayment() {
    GenerateOTP(4, $('#hdnMobile').val(), () => {
        $('#timer').trigger('resetime').css('display', 'inline-flex').addClass('flipInX').removeClass('flipOutX').trigger('start');
        $('#ResendContainer').addClass('slideInUp').hide();
    });
}


const GetNearByDetailsByLocationID = (PropertyID) => {
    let input = {
        LocationID: PropertyID
    };
    APICall('/api/Colive/GetNearByDetailsByCoordinates', input)
        .then(responseData => {
            let response = responseData;
            let Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                let NearByDetails = Data;
                if (NearByDetails.length > 0) {
                    $('#hdnNearByDetails').val(JSON.stringify(NearByDetails));
                    let BusStops = NearByDetails.filter(function (object) { return object.TypeId === 1; });
                    let Airport = NearByDetails.filter(function (object) { return object.TypeId === 2; });
                    let RailwayStation = NearByDetails.filter(function (object) { return object.TypeId === 3; });
                    let GroceryStores = NearByDetails.filter(function (object) { return object.TypeId === 4; });
                    let Pharmacy = NearByDetails.filter(function (object) { return object.TypeId === 5; });
                    let Hospital = NearByDetails.filter(function (object) { return object.TypeId === 6; });
                    let Restaurant = NearByDetails.filter(function (object) { return object.TypeId === 7; });
                    if (BusStops.length > 0) {
                        let strBusStops = '';
                        $.each(BusStops, function (i, callbackvalue) {
                            strBusStops += GetNearByDetailsHTML(callbackvalue);
                        });
                        $('#locbus_station').html(strBusStops);
                    } else {
                        $('#bus_station').hide();
                    }

                    if (Airport.length > 0) {
                        let strAirport = '';
                        $.each(Airport, function (i, callbackvalue) {
                            strAirport += GetNearByDetailsHTML(callbackvalue);
                        });
                        $('#locairport').html(strAirport);
                    } else {
                        $('#airport').hide();
                    }

                    if (RailwayStation.length > 0) {
                        let strRailwayStation = '';
                        $.each(RailwayStation, function (i, callbackvalue) {
                            strRailwayStation += GetNearByDetailsHTML(callbackvalue);
                        });
                        $('#loctrain_station').html(strRailwayStation);
                    } else {
                        $('#train_station').hide();
                    }

                    if (GroceryStores.length > 0) {
                        let strGroceryStores = '';
                        $.each(GroceryStores, function (i, callbackvalue) {
                            strGroceryStores += GetNearByDetailsHTML(callbackvalue);
                        });
                        $('#locgrocery_or_supermarket').html(strGroceryStores);
                    } else {
                        $('#grocery_or_supermarket').hide();
                    }

                    if (Pharmacy.length > 0) {
                        let strPharmacy = '';
                        $.each(Pharmacy, function (i, callbackvalue) {
                            strPharmacy += GetNearByDetailsHTML(callbackvalue);
                        });
                        $('#locpharmacy').html(strPharmacy);
                    } else {
                        $('#pharmacy').hide();
                    }

                    if (Hospital.length > 0) {
                        let strlochospital = '';
                        $.each(Hospital, function (i, callbackvalue) {
                            strlochospital += GetNearByDetailsHTML(callbackvalue);
                        });
                        $('#lochospital').html(strlochospital);
                    } else {
                        $('#hospital').hide();
                    }

                    if (Restaurant.length > 0) {
                        let strRestaurant = '';
                        $.each(Restaurant, function (i, callbackvalue) {
                            strRestaurant += GetNearByDetailsHTML(callbackvalue);
                        });
                        $('#locrestaurant').html(strRestaurant);
                    } else {
                        $('#restaurant').hide();
                    }
                    NearByMapFunctions.initialize();
                    $('#bus_station').click();
                } else {
                    $('#NearByDetails').hide();
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg); })
        .catch(ex => { console.log(ex); });
};

const GetNearByDetailsHTML = (object) => {
    return '<tr><td data-coords="' + object.Latitude + ',' + object.Longitude + '" onclick="NavigateToPlotters($(this));">' + object.Name + '</td><td>' + object.Distance + '</td></tr>';
};

const NavigateToPlotters = (Element) => {
    NearByMapFunctions.navigate($('#hdnLatLong').val(), Element.data('coords'));
};

function getAge(DOB) {
    var today = new Date();
    var birthDate = new Date(DOB);
    var age = today.getFullYear() - birthDate.getFullYear();
    var m = today.getMonth() - birthDate.getMonth();
    if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
        age--;
    }
    return age;
}

function DisplayKycAge() {
    $("#lblKycAge").html("You are " + getAge($("#txtDob").val()) + " Years old!");
}
const GetCotenantDetails = () => {
    let input = {
        CustomerID: $('#hdnCustomerId').val()
    };
    APICall('/api/MyAccount/GetCotenantDetailsByCustomerID', input, true)
        .then(responseData => {
            let response = responseData;
            let Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                $('#CotenantDetails').html('');
                let CoTenantBookingList = Data;
                if (CoTenantBookingList.length > 0) {
                    let strCoTenantBookings = "";
                    $.each(CoTenantBookingList, function (i, v) {
                        let RandomId = GenerateRandomByLength(5);
                        strCoTenantBookings = '<div class="col-lg-12 col-md-12 col-12" id="dvCotenant_' + v.BookingID + '">  \
                              <div class="white-bg" > \
                                <div class="row CotenantDetails"> \
                                    <div class="col col-lg-8 col-md-8 col-12"> \
                                        <p class="bookingPropName">Property Name: <span class="BookingPropNameD" id="BookingPropNameD">'+ v.PropertyName + '</span></p>\
                                        <p class="bookingPropRoom">Room No: <span class="BookingPropRoomD" id="BookingPropRoomD">'+ v.RoomName + '</span></p> \
                                        <p class="bookingPropBedKey">Bed key: <span class="BookingRoomBedKey" id="BookingRoomBedKey">'+ v.BedKey + '</span></p> \
                                    </div> \
                                    <div class="col col-lg-4 col-md-4 col-12"> \
                                        <p class="PropBedCountDetails">Bed Count</p> \
                                        <p class="bookingTotalBed">Total Bed Count: <span class="BookingTotalBedCount" id="BookingTotalBedCount">'+ v.TotalBedCount + '</span></p> \
                                        <p class="bookingCoTenantBed">Co-Tenant Count: <span class="BookingCoTenantBedCount" id="BookingCoTenantBedCount">'+ v.CoTenants.length + '</span></p> \
                                    </div>\
                                </div> \
                                <div class="CotenantDetails BedDetails"> \
                                <div class="form-wrapper"> \
                                <form class="form" id="TenantForm_'+ v.BookingID + '"> \
                                <div class="row formGRoupRow '+ (v.IsCotenantAvailable === false ? 'd-none' : '') + '"> \
                                <div class="col col-lg-3 col-md-3 col-12 TenantValueStoring"> \
                                <div class="form-group CotenantEntryDetails"> \
                                <input type="text" placeholder="First Name" name="CoTenantName_'+ RandomId + '" class="CoTenantName form-input" id="CoTenantName_' + v.BookingID + '" /> \
                                </div> \
                                </div> \
                                <div class="col col-lg-4 col-md-4 col-12 TenantValueStoring"> \
                                <div class="form-group CotenantEntryDetails"> \
                                <input type="text" placeholder="Email" name="CoTenantEmail_'+ RandomId + '" class="CoTenantEmail form-input" id="CoTenantEmail_' + v.BookingID + '" /> \
                                </div> \
                                </div> \
                                <div class="col col-lg-4 col-md-4 col-12 TenantValueStoring"> \
                                <div class="form-group CotenantEntryDetails"> \
                                <input type="tel" maxlength="10" placeholder="Mobile Number" name="CoTenantMobile_'+ RandomId + '" class="CoTenantMobile form-input" id="CoTenantMobile_' + v.BookingID + '" /> \
                                </div> \
                                </div> \
                                <div class="col col-lg-1 col-md-1 col-12 TenantValueStoring"> \
                                <div class="form-group CotenantaddMore"> \
                                <button type="button" id="btnAddCotenant_'+ v.BookingID + '" data-bookingid="' + v.BookingID + '" onclick="CheckCoTenantDetails($(this));" class="btnAddCoTenant"> \
                                <span><i class="fa fa-plus"></i></span> \
                                </button> \
                                </div> \
                                </div> \
                                </div>  \
                                <div class="row formGRoupRow DetailedDisabled '+ (v.IsCotenantAvailable === false && v.IsCoTenantOpted === false ? 'd-none' : '') + '" style="margin-bottom:0px;"> \
                                    <div class="col col-lg-4 col-md-4 col-12 d-lg-block d-md-block d-sm-block d-none d-xs-none"> \
                                        <div class="CotenantEntryDetails"> \
                                            <label>First Name</label> \
                                        </div> \
                                    </div> \
                                    <div class="col col-lg-4 col-md-4 col-12 d-lg-block d-md-block d-sm-block d-none d-xs-none"> \
                                        <div class="CotenantEntryDetails"> \
                                            <label>Email</label> \
                                        </div> \
                                    </div> \
                                    <div class="col col-lg-4 col-md-4 col-12 d-lg-block d-md-block d-sm-block d-none d-xs-none"> \
                                        <div class="CotenantEntryDetails"> \
                                            <label>Mobile Number</label> \
                                        </div> \
                                    </div> \
                                </div> \
                                <div class="row formGRoupRow DetailedDisabled" style="margin-top:0px;"> \
                                '+ GetCoTenantDetails(v.CoTenants) + ' \
                                 </div> \
                                <div class="CotenantStatying radioInputGroup mt-4" > \
                                <div class="row"> \
                                <div class="DivStaying"> \
                                <div class="DivStayingALone"> \
                                <input class="radio-custom"  data-selection=rdContenantNo data-type="rdContenantYes_'+ v.BookingID + '"  id="rdContenantYes_' + i + '" data-bookingid="' + v.BookingID + '" onchange="TenantOptInChanged($(this));" name="rdCotenantOpted_' + i + '" ' +  (v.IsCoTenantOpted === false ? 'checked' : '') + ' ' + (v.IsCotenantAvailable === false ? 'disabled' : '') + ' type="radio" value="0"> \
                                <label class="radio-custom-label" for="rdContenantYes_'+ i + '">Yes! I am Alone</label> \
                                </div> \
                                </div> \
                                <div class="DivStaying"> \
                                <div class="DivStayingALone"> \
                                <input class="radio-custom"  data-type="rdContenantNo_'+ v.BookingID + '"  id="rdContenantNo_' + i + '" data-bookingid="' + v.BookingID + '" onchange="TenantOptInChanged($(this));" name="rdCotenantOpted_' + i + '" ' + (v.IsCoTenantOpted === true ? 'checked' : '') + ' ' + (v.IsCotenantAvailable === true ? '' : 'disabled') + ' type="radio" value="1"> \
                                <label class="radio-custom-label" for="rdContenantNo_'+ i + '">I am Moving with Someone</label >  \
                                </div> \
                                </div> \
                                </div> \
                                </div>  \
                                </form> \
                                </div> \
                                </div> \
                                </div> \
                                </div>';
                        $('#CotenantDetails').append(strCoTenantBookings);
                        if (v.IsCotenantAvailable === true) {
                            let validationObject = '{'
                                + '"rules": {'
                                + '"CoTenantName_' + RandomId + '" : "required",'
                                + '"CoTenantEmail_' + RandomId + '" :{'
                                + '"required": true,'
                                + '"email": true'
                                + '},'
                                + '"CoTenantMobile_' + RandomId + '" :{'
                                + '"required": true,'
                                + '"number": true,'
                                + '"maxlength": 10,'
                                + '"minlength": 10'
                                + '}'
                                + '},'
                                + '"messages": {'
                                + '"CoTenantName_' + RandomId + '" : "Please enter your Cotenant name !",'
                                + '"CoTenantEmail_' + RandomId + '" : "Please enter a valid e-mailid !",'
                                + '"CoTenantMobile_' + RandomId + '" : "Please enter a valid mobile number !"'
                                + '}'
                                + '}';
                            $('#TenantForm_' + v.BookingID + '').validate(JSON.parse(validationObject));
                        }
if ($("#rdContenantNo" + i + "").is(':checked')) { 
                            $('#CoTenantMobile_' + v.BookingID + ',#CoTenantEmail_' + v.BookingID + ',#CoTenantName_' + v.BookingID + ',#btnAddCotenant_' + v.BookingID + '').prop('disabled', false);
                        } 
                        else if($("#rdContenantYes_" + i + "").is(':checked')) {
                            $('#CoTenantMobile_' + v.BookingID + ',#CoTenantEmail_' + v.BookingID + ',#CoTenantName_' + v.BookingID + ',#btnAddCotenant_' + v.BookingID + '').prop('disabled', true);
                        }

                    });
                } else {
                    $('#CotenantDetails').html('').append('<div class="Nobookings"><img src="/assets/images/dashboard-bookings/apartment.svg" /><h6>No Bookings Found</h6></div >');
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log(ex); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
};

const GetCoTenantDetails = (List) => {
    let strCoTenantDetails = '';
    if (List.length > 0) {
        $.each(List, function (i, v) {
            strCoTenantDetails += '<div class="col col-lg-4 col-md-4 col-12"> \
                                  <div class="CotenantEntryDetails disabledContent"> \
                                  <span class="CoTenantName">'+ v.CustomerName + '</span> \
                                  </div> \
                                  </div> \
                                  <div class="col col-lg-4 col-md-4 col-12"> \
                                  <div class="CotenantEntryDetails disabledContent"> \
                                  <span class="CoTenantName">'+ v.EmailID + '</span> \
                                  </div> \
                                  </div> \
                                  <div class="col col-lg-4 col-md-4 col-12"> \
                                  <div class="CotenantEntryDetails disabledContent"> \
                                  <span class="CoTenantName">'+ v.Mobile + '</span> \
                                  </div> \
                                  </div>';
        });
    }
    return strCoTenantDetails;
};

const CheckCoTenantDetails = (Element) => {
    let ElementData = Element[0].dataset;
    if ($('#TenantForm_' + ElementData.bookingid + '').valid()) {
        let input = {
            Mobile: $('#CoTenantMobile_' + ElementData.bookingid + '').val(),
            Email: $('#CoTenantEmail_' + ElementData.bookingid + '').val(),
            BookingID: Element.data('bookingid')
        };
        APICall('/api/MyAccount/CheckCoTenantDetails', input, true)
            .then(responseData => {
                let response = responseData;
                let Status = response.Status,
                    Message = response.Message,
                    Data = response.Data;
                if (Status === 'success') {
                    let validationDetails = Data;
                    switch (validationDetails.ValidationType) {
                        case 0:
                            Toast(validationDetails.ValidationMessage);
                            SignUpForCotenant(Element.data('bookingid'));
                            break;
                        case 1:
                            Toast(validationDetails.ValidationMessage);
                            $('#CoTenantMobile_' + ElementData.bookingid + ',#CoTenantEmail_' + ElementData.bookingid + ',#CoTenantName_' + ElementData.bookingid + '').val('');
                            break;
                        case 2:
                            Toast(validationDetails.ValidationMessage);
                            $('#CoTenantMobile_' + ElementData.bookingid + ',#CoTenantEmail_' + ElementData.bookingid + ',#CoTenantName_' + ElementData.bookingid + '').val('');
                            break;
                        case 3:
                            $('#CoTenantValidationMessage').html(validationDetails.ValidationMessage);
                            $('#CoTenantMobile_' + ElementData.bookingid + ',#CoTenantEmail_' + ElementData.bookingid + ',#CoTenantName_' + ElementData.bookingid + '').val('');
                            $('#CoTenantImg').attr('src', validationDetails.CustomerPhoto).on("error", function (e) { this.src = "/assets/images/user.png"; });
                            $('#CoTenantDetails_Name').html(validationDetails.CustomerName);
                            $('#CoTenantDetails_Mobile').html(validationDetails.Mobile);
                            $('#CoTenantDetails_Email').html(validationDetails.EmailID);
                            $('#CoTenantDetails_KYC').html("KYC Filled");
                            $('#imgKYCStatus').attr('src', '/assets/images/tick.svg');
                            $('#CoTenantDetails_Bookings').html("Active Bookings Available !");
                            $('#imgBookingStatus').attr('src', '/assets/images/alert.svg');
                            $('#btnAddCoTenant').prop('disabled', true).data('bookingid', '0').data('customerid', '0').data('kycfilled', 'false');
                            $('#mdCoTenantValidation').modal('show');
                            break;
                        case 4:
                            $('#CoTenantValidationMessage').html(validationDetails.ValidationMessage);
                            $('#CoTenantImg').attr('src', validationDetails.CustomerPhoto).on("error", function (e) { this.src = "/assets/images/user.png"; });
                            $('#CoTenantDetails_Name').html(validationDetails.CustomerName);
                            $('#CoTenantDetails_Mobile').html(validationDetails.Mobile);
                            $('#CoTenantDetails_Email').html(validationDetails.EmailID);
                            $('#CoTenantDetails_KYC').html("KYC Filled");
                            $('#imgKYCStatus').attr('src', '/assets/images/tick.svg');
                            $('#CoTenantDetails_Bookings').html("No Bookings !");
                            $('#imgBookingStatus').attr('src', '/assets/images/tick.svg');
                            $('#btnAddCoTenant').prop('disabled', false).data('bookingid', ElementData.bookingid).data('customerid', validationDetails.CustomerID).data('kycfilled', 'true');
                            $('#mdCoTenantValidation').modal('show');
                            break;
                        case 5:
                            $('#CoTenantValidationMessage').html(validationDetails.ValidationMessage);
                            $('#CoTenantImg').attr('src', validationDetails.CustomerPhoto).on("error", function (e) { this.src = "/assets/images/user.png"; });
                            $('#CoTenantDetails_Name').html(validationDetails.CustomerName);
                            $('#CoTenantDetails_Mobile').html(validationDetails.Mobile);
                            $('#CoTenantDetails_Email').html(validationDetails.EmailID);
                            $('#CoTenantDetails_KYC').html("KYC Not Filled");
                            $('#imgKYCStatus').attr('src', '/assets/images/alert.svg');
                            $('#CoTenantDetails_Bookings').html("No Bookings !");
                            $('#imgBookingStatus').attr('src', '/assets/images/tick.svg');
                            $('#btnAddCoTenant').prop('disabled', false).data('bookingid', ElementData.bookingid).data('customerid', validationDetails.CustomerID).data('kycfilled', 'false');
                            $('#mdCoTenantValidation').modal('show');
                            break;
                    }
                } else {
                    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                }
            }, errorMsg => { console.log(errorMsg.Message); })
            .catch(ex => { console.log(ex); })
            .finally(() => { $('#AjaxLoader').fadeOut(500); });
    }
};

const AddCoTenant = () => {
    if ($('#btnAddCoTenant').data('bookingid') !== '0' && $('#btnAddCoTenant').data('customerid') !== '0') {
        MapCoTenant($('#btnAddCoTenant').data('bookingid'), $('#btnAddCoTenant').data('customerid'), $('#btnAddCoTenant').data('kycfilled'));
    }
};


const MapCoTenant = (PrimaryTenantBookingid, CoTenantCustomerID, IsKYCFilled) => {
    let input = {
        TenantTypeId: 2,
        BookingID: PrimaryTenantBookingid,
        CustomerID: CoTenantCustomerID,
        PrimaryCustomerID: $('#hdnCustomerId').val(),
        IsKYCFilled: IsKYCFilled
    };
    APICall('/api/MyAccount/MapCoTenant', input, true)
        .then(responseData => {
            let response = responseData;
            let Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                $('#CoTenantMobile_' + PrimaryTenantBookingid + ',#CoTenantEmail_' + PrimaryTenantBookingid + ',#CoTenantName_' + PrimaryTenantBookingid + '').val('');
                $('#mdCoTenantValidation').modal('hide');
                Toast("CoTenant Added Successfully !");
                GetCotenantDetails();
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log(ex); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
};


const SignUpForCotenant = (PrimaryTenantBookingid) => {
    let inputJson = {
        FirstName: $('#CoTenantName_' + PrimaryTenantBookingid + '').val(),
        Mobile: $('#CoTenantMobile_' + PrimaryTenantBookingid + '').val(),
        Email: $('#CoTenantEmail_' + PrimaryTenantBookingid + '').val(),
        SignedUpFrom: 5
    };
    APICall('/api/MyAccount/SignUp', inputJson, true)
        .then(responseData => {
            let response = responseData;
            let Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                MapCoTenant(PrimaryTenantBookingid, Message, false);
            } else {
                Toast(Message);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log(ex); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
};

const TenantOptInChanged = (Element) => {
    let elementdata = Element[0].dataset;
    if (Element.val() === "0") {
        CotenantResponse(elementdata.bookingid, true, true);
        $('#CoTenantMobile_' + elementdata.bookingid + ',#CoTenantEmail_' + elementdata.bookingid + ',#CoTenantName_' + elementdata.bookingid + ',#btnAddCotenant_' + elementdata.bookingid + '').prop('disabled', true);
    } else {
        CotenantResponse(elementdata.bookingid, true, false);
        $('#CoTenantMobile_' + elementdata.bookingid + ',#CoTenantEmail_' + elementdata.bookingid + ',#CoTenantName_' + elementdata.bookingid + ',#btnAddCotenant_' + elementdata.bookingid + '').prop('disabled', false);
    }
};
function GetFoodMenuDetails() { 
    var url = '/api/Colive/GetFoodMenuDetails';
    APICall(url, {})
        .then(responseData => {
            let response = responseData;
            let Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === "success") {
                var strPropImages = '';
                var FoodMenuList = Data.FoodMenu;
                if (FoodMenuList.length > 0) {
                    $.each(FoodMenuList, function (i, v) {
                        strPropImages += "<div class='item'> \
                            <div class='carousel-img' > \
                                <img src='" + v.ImageURL + "' alt='" + v.ItemName + "' class='Qviewproperty-img'> \
                                <div class='FoodName'> \
                                    <div class='row'> \
                                        <div class='col-6'> \
                                            <div class='NameofFood'>"+ v.ItemName + "</div> \
                                            <div class='NameofFoodCat'>"+ v.Title + "</div> \
                                        </div> \
                                        <div class='col-6'> \
                                            <div class='FoodCalories'> \
                                                <img src='/assets/images/appteam/gym.png' class='img-fluid'> \
                                                <span class='CaloreisSec'>"+ v.Calories + " Cals</span> \
                                            </div> \
                                        </div> \
                                    </div> \
                                </div > \
                            </div> \
                            <div class='SharingFood mt-4'> \
                                <div class='VEGNvDet'> \
                                    <span class='VefNonVegDes'><img src='/assets/images/appteam/leaf.png' class='img-fluid'> Pure Veg</span> \
                            <span class='SharingCOunterFood'> \
                                 <span></span>\
                             </span>\
                                </div>\
                            </div> \
                            <div class='FoodContentWrapper' > \
                                <div class='FooDCatTitle'> \
                                    <h2 id='NameofFoodDes'>"+ v.ItemName + "</h2> \
                                    <div id='FoodvarityDes' class='Foodvarity'>"+ v.Category + "</div> \
                                </div> \
                                <div class='FoodCatDes'> \
                                    <p id='FoodDescPara'>"+ v.Description + "</p> \
                                </div> \
                            </div> \
                        </div> ";
                    });
                    $('#DivFoodMenu').html(strPropImages);
                    var foodowl = $('#DivFoodMenu');
                    foodowl.owlCarousel({
                        loop: true,
                        margin: 10,
                        nav: false,
                        pagination: true,
                        dots: false,
                        autoplay: true,
                        autoplaySpeed: 1000,
                        responsive: {
                            0: {
                                items: 1
                            },
                            600: {
                                items: 1
                            },
                            1000: {
                                items: 1
                            }
                        }
                    });
                }

            } else {
                console.log('Request Status: ' + responseData.Status + ' Status Text: ' + responseData.Message + ' ' + responseData.Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log(ex); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}
const NearByMapFunctions = (function () {
    var map, myLatlng = {}, marker = {}, markersList = [], directionsService = {}, directionsDisplay = {};

    function InitializeNearByMap() {
        myLatlng = new google.maps.LatLng(parseFloat($('#hdnLatLong').val().split(',')[0]), parseFloat($('#hdnLatLong').val().split(',')[1]));
        directionsService = new google.maps.DirectionsService;
        directionsDisplay = new google.maps.DirectionsRenderer;
        map = new google.maps.Map(document.getElementById('googleMaplocation'), {
            zoom: 15,
            center: myLatlng
        });
        marker = new google.maps.Marker({
            zoom: 19,
            position: myLatlng,
            map: map,
            icon: {
                url: '/assets/images/home_marker.png',
                Size: new google.maps.Size(30, 30)
            }
        });
        markersList.push(marker);
    }

    function PlotNearByMarkers(LocationTypeId) {
        var NearbyResult = JSON.parse($('#hdnNearByDetails').val());
        var NearByList = NearbyResult.filter(function (object) { return object.TypeId === LocationTypeId; });
        if (markersList.length > 0) {
            ClearMapMarkers();
        }
        if (directionsDisplay !== null) {
            directionsDisplay.setMap(null);
        }
        myLatlng = new google.maps.LatLng(parseFloat($('#hdnLatLong').val().split(',')[0]), parseFloat($('#hdnLatLong').val().split(',')[1]));
        marker = new google.maps.Marker({
            zoom: 19,
            position: myLatlng,
            map: map,
            icon: {
                url: '/assets/images/home_marker.png',
                Size: new google.maps.Size(30, 30)
            }
        });
        if (NearByList.length > 0) {
            strItems = '';
            var dirLatLng = $('#hdnLatLong').val();
            $.each(NearByList, function (i, v) {
                strItems += '';
                var iconlocation = {
                    url: v.WebsiteIcon,
                    Size: new google.maps.Size(30, 30)
                };
                marker = new google.maps.Marker({
                    zoom: 14,
                    position: new google.maps.LatLng(v.Latitude, v.Longitude),
                    map: map,
                    icon: iconlocation
                });
                markersList.push(marker);
                var NeighbourhoodOverString = '<div id="content" style="max-width:250px;">' +
                    '<div id="bodyContent"><div class="mappropdetails">' +
                    '<p><span id="pro_type">@NeighbourhoodName@</span></p> ' +
                    '<p><span id="pro_type">@NeighbourhoodAddress@</span></p> </div>' +
                    '</div>' +
                    '</div>';
                var infowindow = new google.maps.InfoWindow({ content: NeighbourhoodOverString });
                google.maps.event.addListener(marker, 'mouseover', function (MouseOverString) {
                    return function () {
                        NeighbourhoodOverString = NeighbourhoodOverString.replace('@NeighbourhoodName@', v.Name);
                        NeighbourhoodOverString = NeighbourhoodOverString.replace('@NeighbourhoodAddress@', v.Vicinity);
                        infowindow.setContent(NeighbourhoodOverString);
                        infowindow.open(map, this);
                    };
                }(NeighbourhoodOverString));

                google.maps.event.addListener(marker, 'mouseout', function () {
                    infowindow.close();
                });

                google.maps.event.addListener(marker, 'clicked', function () {
                    infowindow.close();
                });

                google.maps.event.addListener(marker, "click", function () {
                    latlng = v.Latitude + "," + v.Longitude;
                    GetDirections(dirLatLng, latlng);
                });
            });
        }
    }

    function GetDirections(origincoordinates, destinationcooradinates) {
        directionsDisplay.setMap(null);
        directionsService.route({
            origin: origincoordinates,
            destination: destinationcooradinates,
            travelMode: 'DRIVING'
        }, function (response, status) {
            if (status === 'OK') {
                directionsDisplay.setDirections(response);
                directionsDisplay.setMap(map);
                directionsDisplay.setOptions({
                    suppressMarkers: true,
                    polylineOptions: {
                        strokeColor: '#bd1261'
                    }
                });
            } else {
                directionsDisplay.setMap(null);
                console.log(response);
                window.alert('Directions request failed due to ' + status);
            }
        });
    }

    function ClearMapMarkers() {
        for (var i = 0; i < markersList.length; i++) {
            markersList[i].setMap(null);
        }
    }

    return {
        initialize: function () {
            InitializeNearByMap();
        },
        plotmarkers: function (LocationTypeId) {
            PlotNearByMarkers(LocationTypeId);
        },
        navigate: function (origincoordinates, destinationcooradinates) {
            GetDirections(origincoordinates, destinationcooradinates);
        }
    };
})();

const ShowNearbyCategory = (Element) => {
    if (Element.hasClass('collapsed')) {
        Element.click();
    } else {
        NearByMapFunctions.plotmarkers(Element.data('locationtypeid'));
    }
};

const MapViewMap = (function () {
    var map, markersList = [];

    function InitializeMapViewMap() {
        map = new google.maps.Map(document.getElementById('PropertySearchMap'), {
            zoom: zoomlevel,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            zoomControl: true,
            mapTypeControl: true,
            scaleControl: false,
            streetViewControl: false,
            rotateControl: true,
            fullscreenControl: true
        });

    }

    function PlotMapViewMarkers(markersList) {
        if (markersList.length > 0) {
            map.setCenter(new google.maps.LatLng(markersList[0].lat, markersList[0].lng));
        } else {
            map.setCenter(new google.maps.LatLng(12.989991, 77.645392));
        }
        ClearMapMarkers();
        $.each(markersList, function (i, data) {
            var myLatlng = new google.maps.LatLng(data.lat, data.lng);
            var image;
            image = { url: '/assets/images/location_pin.png' };
            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                title: data.title,
                animation: google.maps.Animation.DROP,
                icon: image
            });
            var infoWindow = new google.maps.InfoWindow();
            markersList.push(marker);

            google.maps.event.addListener(marker, "click", function (e) {
                infoWindow.setContent('<div class="map-card">\
                    <a href="/property?location=' + data.link + '" target="_blank"> \
                        <div class="map-view-card"> \
                            <div class="house-card" style="position: relative"> \
                                <img alt="' + data.title + '" style="" class="mapcard-img property-img" src="' + data.imageName + '"> \
                            </div> \
                            <div class="map-listed-detail"> \
                                <h3 class="ellipsify ng-binding">' + data.title + '</h3> \
                    <i class="fa fa-heart-o"></i>\
                                <p class="card-item ellipsify ng-binding"><img src="/assets/images/marker.png" class="pl-1" alt=""><span class="spanAdditional">' + data.description + '</span></p> \
                                <div class="card-lower-row"> \
                                    <div class="house-rent"> \
                                        <p>Starting price</p><br/>\
                                        <div class="house-rent-value binding"><span class="small-font binding">Rs. ' + data.price + '</span></div> \
                                    </div> <br>\
                                    <div class="view-property"> \
                                       <p><a href="/property?location=' + data.link + '" target="_blank"> View Property</a></p> \
                                    </div> \
                                </div> \
                            </div> \
                        </div> \
                    </a>\
                </div>');
                infoWindow.open(map, marker);
            });

            google.maps.event.addListener(marker, 'mouseout', function () {
                infowindow.close();
            });

        });
    }

    function ClearMapMarkers() {
        for (var i = 0; i < markersList.length; i++) {
            markersList[i].setMap(null);
        }
    }

    return {
        initialize: function () {
            InitializeMapViewMap();
        },
        plotmarkers: function (MarkersList) {
            PlotMapViewMarkers(MarkersList);
        }
    };
})();

$("#ddlOwnVehicle").change(function () {
    var v = $('#ddlOwnVehicle').val();
    if ($('#ddlOwnVehicle').val() === '2 wheeler') {
        $('#lbl2WheelerNumber').css("display", "block");
        $('#txt2WheelerNumber').css("display", "block");
        $('#lbl4WheelerNumber').css("display", "none");
        $('#txt4WheelerNumber').css("display", "none");
        $('#txt4WheelerNumber').val('');
    } else if ($('#ddlOwnVehicle').val() === '4 wheeler') {
        $('#lbl4WheelerNumber').css("display", "block");
        $('#txt4WheelerNumber').css("display", "block");
        $('#lbl2WheelerNumber').css("display", "none");
        $('#txt2WheelerNumber').css("display", "none");
        $('#txt2WheelerNumber').val('');
    } else if ($('#ddlOwnVehicle').val() === 'Both') {
        $('#lbl2WheelerNumber').css("display", "block");
        $('#lbl4WheelerNumber').css("display", "block");
        $('#txt2WheelerNumber').css("display", "block");
        $('#txt4WheelerNumber').css("display", "block");        
    } else if ($('#ddlOwnVehicle').val() === 'None') {
        $('#lbl2WheelerNumber').css("display", "none");
        $('#lbl4WheelerNumber').css("display", "none");
        $('#txt2WheelerNumber').css("display", "none");
        $('#txt4WheelerNumber').css("display", "none");
        $('#txt2WheelerNumber').val('');
        $('#txt4WheelerNumber').val('');
    } 
    
});

function CaptureNoCotenantSelection(obj) {
    if (obj.innerText === undefined) {
        CotenantResponse(obj, true, true);
        $('#cotenantselection').hide();        
    } else {
        CotenantResponse($("#ancYesAlone").data('bookingid'), true, true);
        $('#AddCotenant').modal('hide');
    }
}

function CaptureYesCotenantSelection(obj) {
    if (obj.innerText === undefined) {
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

//function ContestSumbit() {
//    if ($("#touchwithus").valid()) {
//        var input = {
//            FirstName: $("#firstname").val().trim(),
//            LastName: $("#lastname").val().trim(),
//            Mobile: $("#mobilenumber").val().trim(),
//            Email: $('#email').val(),
//            Source: "ColiveWebsite",
//            ImageUploadList: [{
//                Path: 'contest',
//                base64: $('#hdnidcontestImageBinary_0').val() === undefined ? "" : $('#hdnidcontestImageBinary_0').val(),
//                FileName: $('#hdnidcontestImageFile_0').val() === undefined ? "" : $('#hdnidcontestImageFile_0').val(),
//                ImageTypeId: $('#hdnfiletype_0').val() === undefined ? "" : $('#hdnfiletype_0').val()
//            }, {
//                Path: 'contest',
//                base64: $('#hdnidcontestImageBinary_1').val() === undefined ? "" : $('#hdnidcontestImageBinary_1').val(),
//                    FileName: $('#hdnidcontestImageFile_1').val() === undefined ? "" : $('#hdnidcontestImageFile_1').val(),
//                    ImageTypeId: $('#hdnfiletype_1').val() === undefined ? "" : $('#hdnfiletype_1').val()
//            },
//            {
//                Path: 'contest',
//                base64: $('#hdnidcontestImageBinary_2').val() === undefined ? "" : $('#hdnidcontestImageBinary_2').val(),
//                FileName: $('#hdnidcontestImageFile_2').val() === undefined ? "" : $('#hdnidcontestImageFile_2').val(),
//                ImageTypeId: $('#hdnfiletype_2').val() === undefined ? "" : $('#hdnfiletype_2').val()
//            }]
//        };
//        var url = '/api/Colive/ContestInsert';
//        APICall(url, input, true)
//            .then(responseData => {
//                var response = responseData;
//                var Status = response.Status,
//                    Message = response.Message,
//                    Data = response.Data;
//                //if (Status === 'success') {
//                    $("#firstname,#lastname,#mobilenumber,#email,#hdnidcontestImageBinary_0,#hdnidcontestImageBinary_1,#hdnidcontestImageBinary_2,#hdnidcontestImageFile_0,#hdnidcontestImageFile_1,#hdnidcontestImageFile_2").val('');
//                    //Toast("Contest saved successfully !");
//					alert("Contest saved successfully !");
//					 document.getElementById("touchwithus").reset();
//                //} else {
//                //    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
//               // }
//            }, errorMsg => { console.log(errorMsg.Message); })
//            .catch(ex => { console.log('Exception: ' + ex.message); })
//            .finally(() => { $('#AjaxLoader').fadeOut(500); });
//    }
//}

//function handleContestFileImg(obj) {
//    if (parseInt((obj.files[0].size)) <= 4194304) {
//        var id = obj.id;
//        var hdnBinaryId = $('#' + id).data('imagebinaryid');
//        var hdnFileName = $('#' + id).data('filenameid');
//        var lblFileName = $('#' + id).data('labelid');
//        var imgsrc = $('#' + id).data('imgsrc');
//        var hdnFileType = $('#' + id).data('filetype');
//        var reader = new FileReader();
//        var FileName = obj.files[0].name;
//        var idxDot = FileName.lastIndexOf(".") + 1;
//        var extFile = FileName.substr(idxDot, FileName.length).toLowerCase();
//        if (extFile == "jpg" || extFile == "jpeg" || extFile == "png" || extFile == "pdf" || extFile == "docx" || extFile == "doc" || extFile == "xlsx" || extFile == "xls") {

//            if (extFile == "jpg" || extFile == "jpeg" || extFile == "png")
//                $('#' + hdnFileType).val("1");
//            else
//                $('#' + hdnFileType).val("2");

//            $('#' + hdnFileName).val(FileName);
//            $('#' + lblFileName).html(FileName);
//            reader.onload = function () {
//                var binaryValue = this.result.toString().split(',')[1];
//                $('#' + hdnBinaryId).val(binaryValue);
//                $('#' + imgsrc).attr('src', 'data:image/png;base64,' + binaryValue);

//            };
//            reader.readAsDataURL(obj.files[0]);
//        } else {
//            $('#' + hdnBinaryId).val("");
//            $('#' + hdnFileName).val("");
//            $('#' + lblFileName).html("");
//            $('#' + imgsrc).attr('src', '');
//            alert("Only jpg/png/jpeg/pdf/docx/doc/xlsx/xls files are allowed !");
//			document.getElementById("touchwithus").reset();
//        }
//        return true;
//    } else {
//        alert("Maximum File 4MB !");
//		document.getElementById("touchwithus").reset();
//        return false;
//    }
//}

//VirtualReality By Shilpa
function BindVirtualRealityImagesForProperty(PropertyLink) {
    var input = {
        LocationLink: PropertyLink,
        IsFor360URL: false
    };
    var url = '/api/Colive/GetVirtualRealityImagesForProperty';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var _AchievementsImage = '';
                var _VirtualRealityImage = '';
                $.each(Data.ImgDetails, function (i, v) {
                    _VirtualRealityImage += '<div class="Div_slickbinding">\
                        <div class="position-relative DivStaticVal" >\
                        <img src = "' + v.ImgPath + '" class="img-fluid">\
                            <div class="AlbumPropertyDetails">\
                                <div class="AlbumPropOverlay">\
                                    <div class="AlbumPropName">'+ v.Location + ' <div><a class="ViewMore-Toggle album_address_view" href="#collapse' + v.AlbumId + '">View More</a> </div></div>\
                                     <div class="AlbumPropAddress" id="collapse'+ v.AlbumId + '" style="display:none">' + v.Address + '<br> ' + v.City + ', ' + v.State + '\
                                        <div class="WebDetails">Learn More:  <a href="https://www.colive.in/"><strong>https://www.colive.in/</strong></a></div>\
                                    </div>\
                                </div> \
                            </div>\
                        </div>\
                    </div>';

                });
                $('#virtualRealityImage_blog_contents').html(_VirtualRealityImage);
                $('.slider-for').slick({
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    arrows: true,
                    fade: true,
                    asNavFor: '.slider-nav'

                });
                $('.album_address_view').click(function () {
                    var collapse_content_selector = $(this).attr('href');
                    var toggle_switch = $(this);
                    $(collapse_content_selector).toggle(function () {
                        if ($(this).css('display') == 'none') {
                            toggle_switch.html('View More');
                        } else {
                            toggle_switch.html('View Less');
                        }
                    });
                });
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log(ex); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}

function BindVirtualReality360ForProperty(PropertyLink) {
    var input = {
        LocationLink: PropertyLink,
        IsFor360URL: true
    };
    var url = '/api/Colive/GetVirtualRealityImagesForProperty';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var _VirtualReality360 = '';
                _VirtualReality360 += '<iframe src="' + Data.VirtualReality360[0].VirtualRealityURL + '" style="height:100%;width:100%;border: 0px solid orange; " />';
                
                $('#virtualReality360_blog_contents').html(_VirtualReality360);
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log(ex); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}
//Contest Changes By Shilpa
function BindContests() {
    var url = '/api/Colive/BindContests';
    APICall(url, {})
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            if (Status === 'success') {
                var n = 0;
                var _Contests = '';
                var _ContestGames = '';
                if (Data.ContestDetails.length > 0) {
                    $('#hdnContestId').val(Data.ContestDetails[0].ContestId);
                    $('#hdnContestName').val(Data.ContestDetails[0].Contest);
                    $('#contestdescription').html(Data.ContestDetails[0].ContestDescription);
                    $('#conteststartdate').html(Data.ContestDetails[0].StartDate);
                    $('#contestenddate').html(Data.ContestDetails[0].EndDate);
                    $('#contestvenue').html(Data.ContestDetails[0].ContestVenue);
                    $('#contestname1').html(Data.ContestDetails[0].Contest);
                    $('#contestName').html(Data.ContestDetails[0].Contest);
                    _Contests += "<a href=/marketing/contest/foodcontest.html?cid=" + $('#hdnContestId').val() + ">\
                                    <img src='"+ Data.ContestDetails[0].TitleImage + "' class='img - fluid' />\
                                </a>";                    
                }
                if (Data.PreviousContestDetails.length > 0) {                    
                    $.each(Data.PreviousContestDetails, function (i, v) { 
                        n = n + 1;
                        if (n % 2 !== 0) {
                            _ContestGames += "<div class='item' >\
                                <div class='Div_Contest_Game'>\
                                    <img src='"+ v.TitleImage + "' class='img - fluid' />\
                                    <div class='Div_Contest_Game_Title'>"+ v.Contest + "</div >\
                                </div>\
                            </div>";
                        } else {
                            _ContestGames += "<div class='item' >\
                                <div class='Div_Contest_Game'>\
                                    <img src='"+ v.WinnerImage + "' class='img - fluid' />\
                                    <div class='Div_Contest_Game_Title'>"+ v.Contest+" Winner(s)" + "</div >\
                                </div>\
                            </div>";
                        }
                    });                    
                    $('#ContestGames').html(_ContestGames);
                    //$('#Click_ToggleDiv').click(function () {
                    //    $('#Contest_Div_Expand').slideToggle();
                    //});

                    $('#ContestGames').owlCarousel({
                        items: 2,
                        loop: true,
                        nav: true,
                        dots: true,
                        margin: 10,
                        autoplay: true,
                        autoplayTimeout: 5000,
                        autoplayHoverPause: true,
                        responsiveClass: true,
                        responsive: {
                            0: {
                                items: 1,
                                nav: true
                            },
                            600: {
                                items: 3,
                                nav: true
                            },
                            1000: {
                                items: 2,
                                nav: true,
                                loop: false
                            }
                        }
                    });
                } else {
                    $('#ContestGames').hide();
                }
                $('#ContestContainer').html(_Contests);
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log(ex); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}

function BindContestImagesForContestId(ContestId) {
    var input = {
        ContestId: ContestId
    };
    var url = '/api/Colive/BindImagesForContestId';
    APICall(url, input)
        .then(responseData => {
            var response = responseData;
            var Status = response.Status,
                Message = response.Message,
                Data = response.Data;
            $('#contestName').html($('#hdnContestName').val());
            if (Status === 'success') {
                var _ContestImage = '';
                $('#contestName').html(Data.ImgDetails[0].Contest);
                //$('#achievementsbreadcrumb').html(Data.AchievementsImageContents[0].Heading);
                //$('#achievementsSubHeading').html(Data.AchievementsImageContents[0].SubHeading);
                //$('#achievementDescription').html(Data.AchievementsImageContents[0].Description);                
                $.each(Data.ImgDetails, function (i, v) {
                    _ContestImage += "<div class='col col-lg-4 col-md-4 col-sm-4 col-12'>\
                        <div class='Div_ContestListingPage'>\
                            <div class='Div_Contest_Image'>\
                                <figure>\
                                    <img src='"+ v.ImgPath + "' class='img - fluid' style='width: 347px; height: 184px;'/>\
                                </figure>\
                            </div>\
                            <div class='Div_ContestDetailing'>\
                                <div class='Div_Contest_Title'>"+ v.CustomerName+"</div >\</div>\
                        </div>\
              </div >";
                       
                });
                $('#contestImage_blog_contents').html(_ContestImage);                
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log(ex); })
        .finally(() => { $('#AjaxLoader').fadeOut(500); });
}


function ContestSumbit() {
    if ($("#touchwithus").valid()) {
        var strMob = $("#mobilenumber").val().trim();
        if (IsValidMobile(strMob)) {
            var input = {
                ContestId: $('#hdnContestId').val(),
                ContestName: $('#hdnContestName').val(),
                FirstName: $("#firstname").val().trim(),
                LastName: $("#lastname").val().trim(),
                Mobile: $("#mobilenumber").val().trim(),
                Email: $('#email').val(),
                Source: "ColiveWebsite",
                ImageUploadList: [{
                    Path: 'contest',
                    base64: $('#hdnidcontestImageBinary_0').val() === undefined ? "" : $('#hdnidcontestImageBinary_0').val(),
                    FileName: $('#hdnidcontestImageFile_0').val() === undefined ? "" : $('#hdnidcontestImageFile_0').val()
                }, {
                    Path: 'contest',
                    base64: $('#hdnidcontestImageBinary_1').val() === undefined ? "" : $('#hdnidcontestImageBinary_1').val(),
                    FileName: $('#hdnidcontestImageFile_1').val() === undefined ? "" : $('#hdnidcontestImageFile_1').val()
                },
                {
                    Path: 'contest',
                    base64: $('#hdnidcontestImageBinary_2').val() === undefined ? "" : $('#hdnidcontestImageBinary_2').val(),
                    FileName: $('#hdnidcontestImageFile_2').val() === undefined ? "" : $('#hdnidcontestImageFile_2').val()
                }]
            };
            var url = '/api/Colive/ContestInsert';
            APICall(url, input, true)
                .then(responseData => {
                    var response = responseData;
                    var Status = response.Status,
                        Message = response.Message,
                        Data = response.Data;
                    //if (Status === 'success') {
                    $("#firstname,#lastname,#mobilenumber,#email,#heading,#hashtag,#hdnidcontestImageBinary_0,#hdnidcontestImageBinary_1,#hdnidcontestImageBinary_2,#hdnidcontestImageFile_0,#hdnidcontestImageFile_1,#hdnidcontestImageFile_2").val('');
                    $("#fileupload_0").val(null);
                    $("#fileupload_1").val(null);
                    $("#fileupload_2").val(null);

                Toast("Contest saved successfully !");
                //alert("Contest saved successfully !");
                //} else {
                //    console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                // }
            }, errorMsg => { console.log(errorMsg.Message); })
            .catch(ex => { console.log('Exception: ' + ex.message); })
            .finally(() => { $('#AjaxLoader').fadeOut(500); });
        }
    }
}

function handleContestFileImg(obj) {
    if (parseInt((obj.files[0].size)) <= 524288) {
        var id = obj.id;
        var hdnBinaryId = $('#' + id).data('imagebinaryid');
        var hdnFileName = $('#' + id).data('filenameid');
        var lblFileName = $('#' + id).data('labelid');
        var imgsrc = $('#' + id).data('imgsrc');
        var reader = new FileReader();
        var FileName = obj.files[0].name;
        var idxDot = FileName.lastIndexOf(".") + 1;
        var extFile = FileName.substr(idxDot, FileName.length).toLowerCase();
        if (extFile == "jpg" || extFile == "jpeg" || extFile == "png") {
            $('#' + hdnFileName).val(FileName);
            $('#' + lblFileName).html(FileName);
            reader.onload = function () {
                var binaryValue = this.result.toString().split(',')[1];
                $('#' + hdnBinaryId).val(binaryValue);
                $('#' + imgsrc).attr('src', 'data:image/png;base64,' + binaryValue);

            };
            reader.readAsDataURL(obj.files[0]);
        } else {
            $('#' + hdnBinaryId).val("");
            $('#' + hdnFileName).val("");
            $('#' + lblFileName).html("");
            $('#' + imgsrc).attr('src', '');
            $("#fileupload_0").val(null);
            $("#fileupload_1").val(null);
            $("#fileupload_2").val(null);
            Toast("Only jpg/jpeg and png files are allowed !");
        }
        return true;
    } else {
        alert("Maximum File 4MB !");
        return false;
    }
}