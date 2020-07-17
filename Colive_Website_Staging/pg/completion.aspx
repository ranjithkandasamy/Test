<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="completion.aspx.cs" Inherits="Colive.Website.pg.completion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Colive | Shared Accommodation,Flats,House On Rent In Bangalore</title>
    <!-- favicon --> 
    <link rel="icon" href="https://www.colive.in/favicon.png" type="image/png" />
    <script type="text/javascript" language="javascript">
        function DisableBackButton() { window.history.forward() }
        DisableBackButton(); 
        window.onload = DisableBackButton;
        window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
        window.onunload = function () { void (0) }
    </script>
    <script src="/assets/js/custom.js"></script>
    <link href="/pg/css/style.css" rel="stylesheet" />
</head>
<body> 
    <form id="frmCompletionPage" runat="server">
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('iframe#paymentFrame').load(function () {
                    window.addEventListener('message', function (e) {
                        $("#paymentFrame").css("height", e.data['newHeight'] + 'px');
                    }, false);
                });
            });
            $(document).ready(function () {
                debugger;
                $("#ancCotenantReject").click(function () { 
                    CotenantResponse($('#hdnBookingId').val(), true, true);
                });
            });
        </script>
        <style>
            body {
                font-family: ubuntu-regular,sans-serif;
            }
            .logo img {
                width: 17%;
            }
            .privacypolicy {
                text-align: center;
            }

            .large-textcenter {
                font-size: 16px;
            }

            .headertext {
                font-size: 24px;
                font-weight: bold;
                text-transform: uppercase;
                color: #EC464F;
            }

            footer {
                bottom: 0;
                position: fixed;
                width: 100%;
            }

            .homepage-wrap.search-container {
                width: 991px;
                margin: 0 auto;
                text-align: center;
                border: 1px solid #eee;
                box-shadow: 0 0 1px #eee;
                margin-top: 5%
            }

            .StyleCustomWorks .headertext {
                color: #f0086e;
                font-family: Montserrat,sans-serif;
                font-size: 25px
            }

            .StyleCustomWorks .large-textcenter {
                text-align: center;
                padding: 10px 0;
                font-size: 20px;
                opacity: .5;
                font-weight: 600
            }

            .HomeredirectionBut {
                background-color: #ef0073;
                color: #fff;
                border: 2px solid #ef0073;
                font-size: 15px;
                font-weight: 700;
                line-height: 18px;
                padding: .375rem .75rem;
                text-decoration: none
            }

            .StyleCustomWorks {
                padding: 10px 0 36px 0
            }

            .HomeRedirection {
                margin-top: 24px
            }
            #dvOfflinePaymentSection {
                font-family: Montserrat,sans-serif;
            }
            #dvOfflinePaymentSection .homepage-wrap {
                text-align: left !important;
                padding-left: 15px !important;
                padding-top: 15px;
            }
            #dvOfflinePaymentSection .privacypolicy {
                text-align: left;
                padding-bottom: 23px !important;
            }
            #dvOfflinePaymentSection .privacypolicy div {
                padding: 4px 0px !important;
                font-weight: 600;
            }
            #dvOfflinePaymentSection .homepage-wrap span#lblOfflineSectionInformation {
                font-weight: 800;
                color: #bd1261 !important;
                text-transform: uppercase;
                font-size: 20px !important;
            }

            #dvOfflinePaymentSection .privacypolicy div span {
                font-weight: 500 !important;
                font-size: 16px !important;
                color: #9e8f96 !important;
            }

            .licheckInBoxshadow {
                font-size: 16px;
                font-weight: bold;
                text-transform: unset;
                color: #EC464F;
                margin: 25px 0 10px 0;
                border: 1px solid #dcdcdc;
                padding: 13px 15px 10px 15px;
                background: #efefef;
            }
            .licheckflex {
                margin: 15px 0;
            }
            .btn_blue_large {
                border: 2px solid #bd1261;
                color: #bd1261;
                padding: 7px 15px;
            }
            #Alone.buttonCSS.btn_small {
                border: 2px solid #bd1261;
                margin-right: 15px;
            }
            @media (max-width: 767px) {
                #dvOfflinePaymentSection .homepage-wrap {
                    text-align: left !important;
                    padding-left: 15px !important;
                    padding-top: 15px;
                    width: auto !important;
                }
                .logo img {
                    width: 60% !important;
                }
                .licheckflex {
                    display: flex;
                    flex-wrap: wrap;
                }
                #Alone.buttonCSS.btn_small {
                    margin-right: 0px;
                    width: 100%;
                    margin-bottom: 15px;
                }
                .btn_blue_large {
                    width: 100%;
                }
            }
        </style>
        <div id="content">
            <div class="container">
                <header>
                    <div class="innerWrap" style="padding: 5px 0px; border-bottom: 1px solid #ddd;">
                        <div class="logo">
                            <a href="javascript:void(0);">
                                <img src="img/logo.png" alt="" />
                            </a>
                        </div>
                    </div>
                </header>

                <div runat="server" id="dvHeader" style="display: none">
                    <asp:Label ID="lblCheckinSectionHeader" runat="server" CssClass="headertext" Text="PAYMENT SUCCESS"></asp:Label>
                </div>

                 <div class="container text-center" runat="server" id="dvloader" visible="false" style="text-align: center;">
                <div class="lds-spinner">
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
                <div class="payment_processing">Payment Processing...</div>
                <div class="payment_msg">
                    Please wait! while we process your transaction.
                    <br />
                    Please <strong>DO NOT</strong> click back button or refresh page.
                </div>
            </div>

                <div id="CheckinSection" runat="server" visible="false">
                    <div class="container addOnForm">
                        <asp:Label ID="lblCheckinSectioninformation" runat="server" ForeColor="Red" Font-Size="14px"></asp:Label>
                        <br />
                        <div class="box">
                            <div style="padding: 0px 0px; text-align: left;">
                                <div class="large-textcenter">
                                    <span class="headertext">CHECK-IN CONFIRMATION - WELCOME TO COLIVE</span>
                                    <p class="funtext">Your Colive home is prepped and eagerly waiting for your arrival</p>
                                </div>
                                <div class="large-textcenter" id="DetailsContainer" runat="server">
                                    <ul>
                                        <li>
                                            <p>You Payment is successful !</p>
                                        </li>
                                        <li>Your home details are as below</li>
                                        <li>Property Name:
                                            <asp:Label ID="lblCheckinSectionPropertyName" runat="server" Text=""></asp:Label></li>
                                        <li>Room:
                                            <asp:Label ID="lblCheckinSectionRoom" runat="server" Text=""></asp:Label></li>
                                        <li>Rent: Rs.
                                            <asp:Label ID="lblCheckinSectionRent" runat="server" Text=""></asp:Label></li>
                                        <li style="display: none">Total Rent: Rs.
                                            <asp:Label ID="lblCheckinSectionTotalRent" runat="server" Text=""></asp:Label></li>
                                        <li>Paid Amount: Rs.
                                            <asp:Label ID="lblCheckinSectionPaidAmount" runat="server" Text=""></asp:Label></li>
                                        <li>Deposit : Rs.
                                            <asp:Label ID="lblCheckinSectionDeposit" runat="server" Text=""></asp:Label></li>
                                        <li>Lock-in period: 
                                            <asp:Label ID="lblCheckinSectionlockinperiod" runat="server" Text=""></asp:Label></li>
                                        <li>Sharing Type: 
                                            <asp:Label ID="lblCheckinSectionSharingType" runat="server" Text=""></asp:Label></li>
                                    </ul>
                                </div>
                                <div class="large-textcenter">
                                    <ul>
                                        <li>
                                            <p>We are excited to have you on-board Colive.</p>
                                        </li>
                                        <li>For any support and assistance call us on 7676 000 500</li>
                                        <li>In case of any emergencies during your stay at Colive, call the <b>E</b>mergency <b>R</b>esponse <b>T</b>eam at <b>9098 911 911</b></li>
                                        <li class="payment_button_section">
                                            <br />
                                            <a href="/" class="buttonCSS btn_small"><i class="linear_icon-select"></i><span>Home<span></span></span></a>
                                            <a href="/flipbook/flipbook/index.html" target="_blank" class="buttonCSS btn_small"><i class="linear_icon-select"></i><span>Hand Book<span></span></span></a>
                                            <a href="/faq.html" class="buttonCSS btn_small"><i class="linear_icon-select"></i><span>FAQ<span></span></span></a>
                                            <a href="https://www.colive.in/blog/" class="buttonCSS btn_small"><i class="linear_icon-select"></i><span>Blog<span></span></span></a>
                                            <a href="javascript:void(0);" runat="server" id="ancmovein" class="buttonCSS btn_small"><i class="linear_icon-select"></i><span>Move-In<span></span></span></a>
                                        </li>
                                        <li>
                                            <p class="headertext">CHECK-OUT PROCESS</p>
                                        </li>
                                        <li>
                                            <p>Raise a vacating notice (Check-out request) on 1st date of calendar month  > Check-out will happen on the last date of the same calendar month > Rent should be paid till the last date of the same calendar month</p>
                                        </li>
                                    </ul>
                                </div>
                                <div class="large-textcenter">
                                    <div style='float: left; padding: 10px 0 10px 2%; text-align: center; width: 100%;'>
                                        <a href='https://play.google.com/store/apps/details?id=com.colivecustomerapp.android' target='_blank'>
                                            <img src='https://www.colive.in/utility/invoice/playstore.png' alt='Colive Logo' height='40' />
                                        </a>
                                        <a href='https://itunes.apple.com/in/app/colive/id1341694959?mt=8' style='margin-left: 8px;' target='_blank'>
                                            <img src='https://www.colive.in/utility/invoice/applestore.png' alt='Colive Logo' height='40' />
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- design for rentdue payment thank page -->
                <div id="RentdueSection" runat="server" visible="false">
                    <div class="homepage-wrap search-container payment_success_section">
                        <asp:Label ID="lblRentdueSectionInformation" runat="server" ForeColor="Red" Font-Size="14px"></asp:Label>
                        <br />
                        <div class="privacypolicy StyleCustomWorks">
                            <div class="successFull">
                                <asp:Label ID="lblRentdueSectionHeader" runat="server" CssClass="headertext" Text="PAYMENT SUCCESS"></asp:Label>
                            </div>
                            <div class="large-textcenter">
                                <span>Thank You.</span>
                            </div>
                            <div class="HomeRedirection">
                                <a href="/" id="lnkHome" class="HomeredirectionBut">Home</a>
                            </div>

                            <div class="CancelNoticeRedirection" id="dvCancelNotice" style="margin-top: 48px;">
                                <a href="" runat="server" id="ancCancelNotice" class="HomeredirectionBut">Back</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- design for rentdue payment thank page end -->
                <div id="ReservationSection" class="container addOnForm" runat="server" visible="false">
                    <asp:Label ID="lblReservationSectionInformation" runat="server" ForeColor="Red" Font-Size="14px"></asp:Label>
                    <br />
                    <div class="box">
                        <div style="padding: 0px 0px; text-align: left;">
                            <div class="large-textcenter">
                                <span class="headertext">Thank you for choosing Colive and welcome to the Colive family!</span>
                                <p class="funtext">The fun just has started at Colive and we have some exciting things lined-up for you</p>
                            </div>
                            <div class="large-textcenter" id="Div1" runat="server">
                                <p><u>Your reservation details</u></p>
                                <ul>
                                    <li>Your Colive home:                                           
                                            <asp:Label ID="lblReservationSectionPropertyName" runat="server" Text=""></asp:Label>
                                    </li>
                                    <li>Room no:
                                            <asp:Label ID="lblReservationSectionRoom" runat="server" Text=""></asp:Label>
                                    </li>
                                    <li>Total Rent: Rs.
                                            <asp:Label ID="lblReservationSectionRent" runat="server" Text=""></asp:Label></li>
                                    <li style="display: none;">Total Rent: Rs.
                                            <asp:Label ID="lblReservationSectionTotalRent" runat="server" Text=""></asp:Label></li>
                                    <li id="liAmountPaidCaptions" runat="server">
									</li>
                                    <li>Deposit: Rs.
                                            <asp:Label ID="lblReservationSectionDeposit" runat="server" Text=""></asp:Label>
                                    </li>
                                    <li>Lock-in period: 
                                            <asp:Label ID="lblReservationSectionlockinperiod" runat="server" Text=""></asp:Label>
                                    </li>
                                    <li>Room Type: 
                                            <asp:Label ID="lblReservationSectionSharingType" runat="server" Text=""></asp:Label>
                                    </li>
                                </ul>
                            </div>
                            <div class="large-textcenter">
                                <ul>
                                    <li class="licheckinsteps"><span>Please make sure the KYC process and Check-in is completed 48 hrs before moving into your new home.</span>
                                        <a id="a1" class="buttonCSS btn_small" href="/customerprofile"><i class="linear_icon-select"></i><span>Complete KYC<span></span></span></a>
                                    </li>
                                     
                                    <li class="licheckInBox" runat="server" id="CoTenantSection" visible="true">
                                        <div class="licheckInBoxshadow">
                                        Looks like you're booking more than one bed! Are you Moving-in alone or with co-Tenant?
                                            <div class="licheckflex">
                                                <%--      <a id="ancCotenantReject" runat="server" class="buttonCSS btn_small"><span>Yes! I'am alone</span></a>--%>
                                                <input type="button" value="Yes! I'am alone" class="buttonCSS btn_small" id="ancCotenantReject" />
                                                <a id="ancCotenantAccept" runat="server" class="buttonCSS btn_blue_large"><span>I'm moving in with someone</span></a>
                                                <div id="cotenantDisplayresponse" class="headertext" style="font-size: 16px;color:#bd1261"></div>
                                            </div>
                                        </div>
                                    </li>

                                    <li class="licheckinsteps" runat="server" id="checkinbuttonholder">
                                        <br />
                                        You can now complete the check-in process, which is as easy as mentioned below.
                                            Please click on the check-in button
                                            <a id="anLiveWebsiteCheckInURL" runat="server" class="buttonCSS btn_small"><i class="linear_icon-select"></i><span>Check-in<span></span></span></a>
                                        <p>
                                            <b>Or</b>
                                        </p>
                                    </li>
                                    <li>Download Colive App</li>
                                    <li>Log in with your registered mobile number/registered mail id</li>
                                    <li>Select  My Bookings > Current Booking > Check-in</li>
                                    <li>Select Confirmed Move-in Date</li>
                                    <li>Fill in the KYC details and submit</li>
                                    <li>Pay the remaining amount</li>
                                </ul>
                                <p>
                                    <b>For any queries please contact  7676000500 and press 2.</b>
                                </p>
                            </div>
                        </div>
                        <br />
                        <div class="large-textcenter list-type2">
                            <p>
                                <span style="font-size: 21px; font-weight: bold; color: #EC464F; font-size: 18px;">Terms for Stay</span>
                            </p>
                            <ol>
                                <li><a href="#">Two (2) month Deposit to be paid in 2 equal installments.
                                </a></li>
                                <li><a href="#">Pro-rata rent to be paid at the time of check-in
                                </a></li>
                                <li><a href="#">Rent is due on the 1st of every calendar month
                                </a></li>
                                <li><a href="#">Penalties will be applicable if the rent is not paid on time
                                </a></li>
                                <li><a href="#">Make all your payments online and share the transaction details
                                </a></li>
                                <li><a href="#">The notice to vacate should be given on 1st of the calendar month
                                </a></li>
                                <li><a href="#">The check-out would be processed on the last day of the calendar month post the completion of one (1) month Notice period
                                </a></li>
                                <li><a href="#">Separation Charges of 7 days rent will be deducted from the deposit.
                                </a></li>
                                <li><a href="#">Refunds will be processed on 15th day of the following month of check-out
                                </a></li>
                                <li><a href="#">For all the queries you can raise a service request through Colive App / call us on 7676000500.
                                </a></li>
                            </ol>
                        </div>
                        <br />
                        <div class="large-textcenter" style="display: none;">
                            <span>Click <a id="ancReceiptURL" runat="server" href="javascript:void(0);">here</a> to generate receipt.</span>
                        </div>
                    </div>
                </div>

                <div id="EbBillSection" runat="server" visible="false">
                    <div class="homepage-wrap search-container payment_success_section">
                        <asp:Label ID="lblEbBillSectionInformation" runat="server" ForeColor="Red" Font-Size="14px"></asp:Label>
                        <br />
                        <div class="privacypolicy StyleCustomWorks">
                            <div class="successFull">
                                <asp:Label ID="lblEbBillSectionHeader" runat="server" CssClass="headertext" Text="Transaction Successful"></asp:Label>
                                <div style="padding: 20px;">
                                    <asp:Label ID="lblDisplayDatetime" runat="server" Text="10:20 PM 31 Jan 2020"></asp:Label>
                                </div>
                                <div style="padding: 10px;">
                                    Transaction Id :
                                    <asp:Label ID="lblTransactionId" runat="server" Style="color: black; font-family: Montserrat,sans-serif; font-size: 20px; margin-top: 10px;" Text=""></asp:Label>
                                </div>
                                <div style="padding: 10px;">
                                    Colive Premium Account Recharge :
                                   <asp:Label ID="lblAmount" runat="server" Style="color: black; font-family: Montserrat,sans-serif; font-size: 20px; margin-top: 10px;" Text=" "></asp:Label>
                                </div>


                            </div>
                            <div class="large-textcenter">
                                <span>Thank You.</span>
                            </div>
                            <div class="HomeRedirection">
                                <a href="/" id="lnkHome" class="HomeredirectionBut">Home</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="TransferSection" runat="server" visible="false">
                    <div class="container addOnForm">
                        <asp:Label ID="lblTransferSectionInformation" runat="server" ForeColor="Red" Font-Size="14px"></asp:Label>
                        <br />
                        <div class="box">
                            <div style="padding: 0px 0px; text-align: left;">
                                <div class="large-textcenter">
                                    <span class="headertext">TRANSFER CONFIRMATION - WELCOME TO COLIVE</span>
                                    <p class="funtext">Your Colive home is prepped and eagerly waiting for your arrival</p>
                                </div>
                                <div class="large-textcenter" id="TransferDetailsContainer" runat="server">
                                    <ul>
                                        <li>
                                            <p>You Payment is successful !</p>
                                        </li>
                                        <li>Your home details are as below</li>
                                        <li>Property Name:
                                            <asp:Label ID="lblTransferSectionPropertyName" runat="server" Text=""></asp:Label></li>
                                        <li>Room:
                                            <asp:Label ID="lblTransferSectionRoom" runat="server" Text=""></asp:Label></li>
                                        <li>Rent: Rs.
                                            <asp:Label ID="lblTransferSectionRent" runat="server" Text=""></asp:Label></li>
                                        <li style="display: none">Total Rent: Rs.
                                            <asp:Label ID="lblTransferSectionTotalRent" runat="server" Text=""></asp:Label></li>
                                        <li>Paid Amount: Rs.
                                            <asp:Label ID="lblTransferSectionPaidAmount" runat="server" Text=""></asp:Label></li>
                                        <li>Deposit : Rs.
                                            <asp:Label ID="lblTransferSectionDeposit" runat="server" Text=""></asp:Label></li>
                                        <li>Lock-in period: 
                                            <asp:Label ID="lblTransferSectionlockinperiod" runat="server" Text=""></asp:Label></li>
                                        <li>Sharing Type: 
                                            <asp:Label ID="lblTransferSectionSharingType" runat="server" Text=""></asp:Label></li>
                                    </ul>
                                </div>
                                <div class="large-textcenter">
                                    <ul>
                                        <li>
                                            <p>We are excited to have you on-board Colive.</p>
                                        </li>
                                        <li>For any support and assistance call us on 7676 000 500</li>
                                        <li>In case of any emergencies during your stay at Colive, call the <b>E</b>mergency <b>R</b>esponse <b>T</b>eam at <b>9098 911 911</b></li>
                                        <li class="payment_button_section">
                                            <br />
                                            <a href="/" class="buttonCSS btn_small"><i class="linear_icon-select"></i><span>Home<span></span></span></a>
                                            <a href="/flipbook/flipbook/index.html" target="_blank" class="buttonCSS btn_small"><i class="linear_icon-select"></i><span>Hand Book<span></span></span></a>
                                            <a href="/faq.html" class="buttonCSS btn_small"><i class="linear_icon-select"></i><span>FAQ<span></span></span></a>
                                            <a href="https://www.colive.in/blog/" class="buttonCSS btn_small"><i class="linear_icon-select"></i><span>Blog<span></span></span></a>
                                            <a href="javascript:void(0);" runat="server" id="ancTransfermovein" class="buttonCSS btn_small"><i class="linear_icon-select"></i><span>Move-In<span></span></span></a>
                                        </li>
                                        <li>
                                            <p class="headertext">CHECK-OUT PROCESS</p>
                                        </li>
                                        <li>
                                            <p>Raise a vacating notice (Check-out request) on 1st date of calendar month  > Check-out will happen on the last date of the same calendar month > Rent should be paid till the last date of the same calendar month</p>
                                        </li>
                                    </ul>
                                </div>
                                <div class="large-textcenter list-type2">
                                    <p>
                                        <span style="font-size: 21px; font-weight: bold; color: #EC464F; font-size: 18px;">Terms & Condition</span>
                                    </p>
                                    <ol>
                                        <li><a href="#">Both CheckedIn and reserved customers can raise a Request for Internal Transfers only up to 4 times.</a></li>
                                        <li><a href="#">Customers can raise Request for Internal Transfers only between 2nd day to 7th day from date selected.
                                        </a></li>
                                        <li><a href="#">Only CheckedIn customers can cancel a Request for Internal Transfer.    
                                        </a></li>
                                        <li><a href="#">When a CheckedIn customer cancels the Request for Internal Transfer, the system will retain their previous booking.
                                        </a></li>
                                        <li><a href="#">Charges and dues from existing bookings will be charged in the upcoming month’s invoice.
                                        </a></li>
                                        <li><a href="#">New Lock-In period= Old Lock-In period- Months stayed
                                        </a></li>
                                        <li><a href="#">The bed will be released for sale once a live customer checks out.
                                        </a></li>
                                        <li><a href="#">The bed will be released for sale once a reserved customer confirms the Request for Internal Transfer and completes the payment.
                                        </a></li>
                                        <li><a href="#">Upon cancellation of the Request for Internal Transfer post-payment, cancellation charges will be adjusted in the upcoming invoice.
                                        </a></li>
                                    </ol>
                                </div>
                                <div class="large-textcenter">
                                    <div style='float: left; padding: 10px 0 10px 2%; text-align: center; width: 100%;'>
                                        <a href='https://play.google.com/store/apps/details?id=com.colivecustomerapp.android' target='_blank'>
                                            <img src='https://www.colive.in/utility/invoice/playstore.png' alt='Colive Logo' height='40' />
                                        </a>
                                        <a href='https://itunes.apple.com/in/app/colive/id1341694959?mt=8' style='margin-left: 8px;' target='_blank'>
                                            <img src='https://www.colive.in/utility/invoice/applestore.png' alt='Colive Logo' height='40' />
                                        </a>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <!-- Offline Payment ThankYou Section   -->
                <div id="dvOfflinePaymentSection" runat="server" visible="false">
                    <div class="homepage-wrap search-container payment_success_section">
                        <asp:Label ID="lblOfflineSectionInformation" runat="server" ForeColor="Red" Font-Size="22px"></asp:Label>
                        <br />
                        <div class="privacypolicy StyleCustomWorks">
                            <div class="successFull">
                                <asp:Label ID="lblOfflineTransactionHeader" runat="server" CssClass="headertext" Text=""></asp:Label>
                                <div style="padding: 10px;">
                                    Transaction ID :
                                    <asp:Label ID="lblOfflineTransactionID" runat="server" Style="color: black; font-family: Montserrat,sans-serif; font-size: 20px; margin-top: 10px;" Text=""></asp:Label>
                                </div>     
                                 <div style="padding: 10px;">
                                    Transaction Date :
                                    <asp:Label ID="lblTransactionDate" runat="server" Style="color: black; font-family: Montserrat,sans-serif; font-size: 20px; margin-top: 10px;" Text=""></asp:Label>
                                </div>
                                <div style="padding: 10px;">
                                    Amount :
                                    <asp:Label ID="lblTransactionAmount" runat="server" Style="color: black; font-family: Montserrat,sans-serif; font-size: 20px; margin-top: 10px;" Text=""></asp:Label>
                                </div>   
                            </div>
                            <div class="HomeRedirection">
                                <a href="/" id="lnkOfflineHome" class="HomeredirectionBut">Home</a>
                            </div>
                        </div>
                    </div>
                </div>

                 <%--for Food payments--%>
                <div id="FoodGasmSection" runat="server" visible="false">
                    <div class="homepage-wrap search-container payment_success_section">
                        <asp:Label ID="lblFoodSectionInformation" runat="server" ForeColor="Red" Font-Size="14px"></asp:Label>
                        <br />
                        <div class="privacypolicy StyleCustomWorks">
                            <div class="successFull">
                                <asp:Label ID="lblFoodSectionHeader" runat="server" CssClass="headertext" Text=""></asp:Label>
                                <div style="padding: 20px;">
                                    <asp:Label ID="lblFoodDisplayDatetime" runat="server"  ></asp:Label>
                                </div>
                                <div style="padding: 10px;">
                                    Transaction Id :
                                    <asp:Label ID="lblFoodTransactionId" runat="server" Style="color: black; font-family: Montserrat,sans-serif; font-size: 20px; margin-top: 10px;" Text=""></asp:Label>
                                </div>
                                <div style="padding: 10px;"> 
                                   <asp:Label ID="lblFoodAmount" runat="server" Style="color: black; font-family: Montserrat,sans-serif; font-size: 20px; margin-top: 10px;" Text=" "></asp:Label>
                                </div>
                            </div>
                            <div class="large-textcenter">
                                <span>Thank You.</span>
                            </div>
                            <div class="HomeRedirection">
                                <a href="/" id="lnkHome" class="HomeredirectionBut">Home</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="fclear"></div>
            <asp:HiddenField ID="hdnBookingId" runat="server" />
            <!-- Toast Section(alert popup) -->
            <div class="toastwrap">
                <div class="toast">
                    <i class="fa fa-times toastclose" aria-hidden="true" onclick="$('.toastwrap').fadeOut();"></i>
                    <span id="ToastMsg" class="ToastMsg"></span>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
