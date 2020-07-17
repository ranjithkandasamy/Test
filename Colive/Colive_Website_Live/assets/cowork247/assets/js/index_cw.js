// Ajax Request Handler
$(document).ajaxStart(function () { $('#AjaxLoader').fadeIn(1000); }).ajaxStop(function () { $('#AjaxLoader').fadeOut(2000); });

$(document).ready(function () {
    $("#coworkSchedules").validate({
        rules: {
            firstname: "required", 
            coworklocation: "required",
            email: {
                required: true,
                email: true
            },
            mobilenumber: {
                required: true,
                number: true,
                maxlength: 10,
                minlength:10
            }
        },
        messages: {
            firstname: "Please enter your name",
            coworklocation: 'Please select a location',
            mobilenumber: 'Please enter a valid mobile number',
            email: 'Please enter your email id'
        }
    }); 
    $('#ViewLoca').click(function () { $('html, body').animate({ scrollTop: $('.cowork-places').offset().top }, 1000); });
    $('#VieLocation').click(function () { $('html, body').animate({ scrollTop: $('.cowork-places').offset().top }, 1000); });
    $('#bookFlat').click(function () { $('html, body').animate({ scrollTop: 0 }, 1000); $('#txtCustomerName').focus(); });
    //Cowork Change By Shilpa
    $('#bookTour').click(function () { $('html, body').animate({ scrollTop: 0 }, 1000); $('#txtCustomerName').focus(); });
    
     $('#CoworkLocation_Space').owlCarousel({
        loop: true,
        margin: 10,
        autoplay: true,
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
    })
    
});

function bookspace() { $('html, body').animate({ scrollTop: 0 }, 1000); }

function redirectToProperty(cnt) {
    $('#ddlLocation').val(cnt).prop('selected',true);
    $('html, body').animate({ scrollTop: 0 }, 1000);
} 


function EnquiryFormInsert() {    
    if ($("#coworkSchedules").valid()) {
        var CustomerMobile = $('#txtMobileNumber').val();
        if (IsValidMobile(CustomerMobile)) {
            var input = {
                Name: $('#txtCustomerName').val(),
                Phone: $('#txtMobileNumber').val(),
                Email: $('#txtCustomerEmail').val(),
                PropertyID: $('#ddlLocation').val(),
                LocationName: $('#ddlLocation option:selected').text().trim(),
                LeadSource: "Co-work Landing Page"
            };
            $.ajax({
                url: '/api/CoWork/BookaTour',
                type: 'post',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(input),
                success: function (data) {
                    var response = data;
                    var Status = response.Status,
                        Message = response.Message,
                        Data = response.Data;
                    if (Status === 'success') {                       
                        $('#spnSuccessMsg').html('Thank you for reaching out to us,<br/> we will get back to you shortly');
                        $('#comingsoon_modal').show();
                        $('#txtCustomerName,#txtMobileNumber,#txtCustomerEmail').val('');
                        $('#ddlLocation').val("2").prop('selected', true);
                        gtag_report_conversion();
                    } else {
                        console.log('Error Status: ' + Status + 'Error Message: ' + Message + 'Error Data: ' + Data);
                    }
                },
                error: function (xhr) {
                    console.log('Request Status: ' + xhr.status + ' Status Text: ' + xhr.statusText + ' ' + xhr.responseText);
                }
            }); 
        }
    }
}

