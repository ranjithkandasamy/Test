<%@ Page Language="C#" AutoEventWireup="true" Inherits="Colive.Website.ResponseHandler" CodeBehind="ccavResponseHandler.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Colive</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,,maximum-scale=1,user-scalable=no" />
    <link href="css/style.css" rel="Stylesheet" />
    <link rel="icon" href="https://www.colive.in/favicon.png" type="image/png" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="content">
            <div class="container box-shadow ">
                <div class="innerWrap" style="padding: 5px 0px;">
                    <div class="logo">
                        <a href="/">
                            <img src="img/logo.png" alt="" />
                        </a>
                    </div>
                </div>
                <div id="Div1">
                    <div style="display: none;">
                        <asp:Label ID="lblHeader" runat="server" Text="PAYMENT SUCCESS"></asp:Label>
                    </div>
                    <div class="container addOnForm">
                        <asp:Label ID="lblInformation" runat="server" ForeColor="Red" Font-Size="14px"></asp:Label>
                        <br />
                        <div class="box">
                            <div style="padding: 0px 0px; text-align: left;">
                                <div class="large-textcenter">
                                    <span class="headertext">Thank you for choosing Colive and welcome to the Colive family!</span>
                                    <p class="funtext">The fun just has started at Colive and we have some exciting things lined-up for you</p>
                                </div>
                                <div class="large-textcenter" id="DetailsContainer" runat="server">
                                    <p><u>Your reservation details</u></p>
                                    <ul>
                                        <li>Your Colive home:                                           
                                            <asp:Label ID="lblPropertyName" runat="server" Text=""></asp:Label>
                                        </li>
                                        <li>Room no:
                                            <asp:Label ID="lblRoom" runat="server" Text=""></asp:Label>
                                        </li>
                                        <li>Total Rent: Rs.
                                            <asp:Label ID="lblRent" runat="server" Text=""></asp:Label></li>
                                        <li style="display: none;">Total Rent: Rs.
                                            <asp:Label ID="lblTotalRent" runat="server" Text=""></asp:Label></li>
                                        <li>Reservation amount paid: Rs.
                                            <asp:Label ID="lblPaidAmount" runat="server" Text=""></asp:Label>
                                        </li>
                                        <li>Deposit: Rs.
                                            <asp:Label ID="lblDeposit" runat="server" Text=""></asp:Label>
                                        </li>
                                        <li>Lock-in period: 
                                            <asp:Label ID="lbllockinperiod" runat="server" Text=""></asp:Label>
                                        </li>
                                        <li>Room Type: 
                                            <asp:Label ID="lblSharingType" runat="server" Text=""></asp:Label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="large-textcenter">
                                    <ul>
                                        <li class="licheckinsteps"><span>Please make sure the KYC process and Check-in is completed 48 hrs before moving into your new home.</span>
                                            <a id="a1" class="buttonCSS btn_small" href="/customerprofile"><i class="linear_icon-select"></i><span>Complete KYC<span></span></span></a>
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
                                    <li><a href="#">Lock-in Period of 2 months for beds/studio & 5 months for full house (1BHK)
                                    </a></li>
                                    <li><a href="#">Rent is due on the 1st of every calendar month
                                    </a></li>
                                    <li><a href="#">Electricity/ Power back-up  Repairs, Gas refilling are on Actuals
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
                </div>
            </div>
            <div class="fclear"></div>
        </div>
    </form>
</body>
</html>
