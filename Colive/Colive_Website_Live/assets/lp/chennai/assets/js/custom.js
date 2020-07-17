/* countdown */
(function ($) {
    $.fn.countdown = function (options) {
        var settings = $.extend({ "seconds": 0, "ongoing": true, "selector-start": "", "selector-pause": "", "prefix-text": "", "stop-text": "00:00", "normal-class": "", "warning-class": "", "stop-class": "", "warning-time": 0 }, options); var timer; var elem = this; var ongoing = settings['ongoing']; function draw() {
            if (settings['seconds'] <= 0) { $(elem).html(settings['stop-text']); $(elem).removeClass(settings['normal-class']).removeClass(settings['warning-class']).addClass(settings['stop-class']); clearInterval(timer); } else {
                if (settings['seconds'] <= settings['warning-time'] && !$(elem).hasClass(settings['warning-class'])) { $(elem).removeClass(settings['normal-class']).addClass(settings['warning-class']); }
                var res = Math.floor(settings['seconds'] / 60) < 10 ? "0" + Math.floor(settings['seconds'] / 60) : Math.floor(settings['seconds'] / 60); res = res + ':' + (settings['seconds'] % 60 < 10 ? "0" + (settings['seconds'] % 60) : settings['seconds'] % 60); $(elem).text(settings['prefix-text'] + res);
            }
        }
        $(settings['selector-start']).bind("click", function () { if (!ongoing) { timer = setInterval(function () { settings['seconds']--; draw(); }, 1000); ongoing = true; } }); $(settings['selector-pause']).bind("click", function () { clearInterval(timer); ongoing = false; }); $(elem).removeClass(settings['stop-class']).removeClass(settings['warning-class']).addClass(settings['normal-class']); draw(); if (ongoing) { timer = setInterval(function () { settings['seconds']--; draw(); }, 1000); }
    };
})(jQuery);


/* manuel initialize*/
$(document).ready(function () {
    var PageLoaded = 0;
    var winHeight = window.innerHeight;
    var winWidth = window.innerWidth;
    var ReviewCardWidth = (winWidth <= 568) ? 245 : 610;
    var ReviewCardHeight = (winWidth <= 568) ? 200 : 225;
    var ArrRedirect = window.location.pathname;
    var Params = ArrRedirect.split("/");
    if (Params.length >= 2) {
        switch (Params[2]) {
            case "apartments":
                break;
            case "flats":
                break;
            case "house":
                break;
            case "hostel":
                break;
            case "rooms":
                break;
            case "pg":
                break;
            default:

        }
    }



    $('#btnShowForm').click(function () {
        $('#formbox').slideDown();
        $('.formbox').slideDown(300);
        $('#btncloseForm').show();
    });

    $('#btncloseForm').click(function () {
        $('#formbox').slideUp(300);
        $('.formbox').slideUp();
        $(this).hide();
    });

    if (winWidth <= 568) {
        $(window).scroll(function () {
            if ($(window).scrollTop() + $(window).height() == $(document).height()) {
                if (PageLoaded === 0) {
                    PageLoaded = 1;
                    $('#formbox').slideDown();
                    $('.formbox').slideDown(300);
                    $('#btncloseForm').show();
                }
            }

        });
    }

});

function settimer() {
    $('#OtpTimer').countdown({
        "seconds": 120
    });
}

function ResendOTP() {
    $('.btnResend').addClass('hideimportant');
    $.ajax({
        url: '/lp/chennai/default.aspx/ResendOTP',
        type: 'get',
        contentType: "application/json; charset=utf-8",
        data: null,
        success: function (data) {
            var response = data.d;
            if (response === 'success') {
                console.log('OTP Sent Successfully !');
            } else {
                console.log('OTP Resending Failed !');
            }
        },
        error: function (xhr) {
            console.log('Request Status: ' + xhr.status + ' Status Text: ' + xhr.statusText + ' ' + xhr.responseText);
        }
    });
}

var prm = Sys.WebForms.PageRequestManager.getInstance();
prm.add_endRequest(function () {
    var winHeight = window.innerHeight;
    var winWidth = window.innerWidth;

    var ReviewCardWidth = (winWidth <= 568) ? 245 : 610;
    var ReviewCardHeight = (winWidth <= 568) ? 200 : 225;

    if (winWidth <= 568) {
        $('#formbox').slideDown();
        $('.formbox').slideDown(300);
        $('#btncloseForm').show();
    }


    $('#btnShowForm').click(function () {
        $('#formbox').slideDown();
        $('.formbox').slideDown(300);
        $('#btncloseForm').show();
    });

    $('#btncloseForm').click(function () {
        $('#formbox').slideUp(300);
        $('.formbox').slideUp();
        $(this).hide();
    });

    if ($('#txtOtp').val() != "") {
        var lbl = $('.lblFloat').css({ 'display': 'none' });
    }

    var objInterval = setInterval(function () {
        var currtime = $('#OtpTimer').text();
        if (currtime === '00:00') {
            $('#OtpTimer').fadeOut();
            $('.btnResend').slideDown();
            $('.btnClick').click(function () {
                $(this).prop('disabled', false);
                ResendOTP();
            });
        }
    }, 1500);

    function successredirection() {
        setTimeout(function () { window.location.href = '/'; }, 2000);
    }

    $('#btnShowForm').click(function () {
        $('#formbox').slideDown();
        $('.formbox').slideDown(300);
        $('#btncloseForm').show();
    });

    $('#btncloseForm').click(function () {
        $('#formbox').slideUp(300);
        $('.formbox').slideUp();
        $(this).hide();
    });

});


function formatDate(dateParam) {
    var m_names = new Array("Jan", "Feb", "Mar",
        "Apr", "May", "Jun", "Jul", "Aug", "Sep",
        "Oct", "Nov", "Dec");

    var curr_date = dateParam.getDate();
    var curr_month = dateParam.getMonth();
    var curr_year = dateParam.getFullYear();
    return curr_date + "-" + m_names[curr_month] + "-" + curr_year;
}

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

function PropertyChange() {
    if ($('#ddlProperty').val() == "0") {
        $('#liScheduleDate').slideUp();
    }
    else {
        $('#liScheduleDate').slideDown();
        $('#ScheduleDate').dcalendarpicker({ format: 'dd-mmm-yyyy' });
        var dtDate = new Date();
        $('#ScheduleDate').data().dcalendar.minDate = dtDate.setDate(dtDate.getDate() - 1);
        $('#ScheduleDate').val(formatDate(new Date())).trigger("change");
    }
}

function ScheduleDatechanged() {
    $('#slVisitSlots').html('');
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
                    alert("Oops! No time slots available for the day.Please select a slot for the next day.");
                    var selDate = new Date($('#ScheduleDate').val()); selDate.setDate(selDate.getDate() + 1);
                    $('#ScheduleDate').val(formatDate(selDate)).trigger("change");
                }
            } else {
                console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
            }
        }, errorMsg => { console.log(errorMsg.Message); })
        .catch(ex => { console.log('Exception: ' + ex.message); });
}
