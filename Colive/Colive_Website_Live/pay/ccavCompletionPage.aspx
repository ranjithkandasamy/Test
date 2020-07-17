<%@ Page Language="C#" AutoEventWireup="true" Inherits="Colive.Website.CompletionPage" CodeBehind="ccavCompletionPage.aspx.cs" %>

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
                    <div class="logo"><a href="javascript:void(0);">
                        <img src="img/logo.png" alt="" />
                    </a></div>
                </div>
                <div style="display: none;">
                    <asp:Label ID="lblHeader" runat="server" CssClass="headertext" Text="PAYMENT SUCCESS"></asp:Label>
                </div>
                <div id="CheckinSection" runat="server" visible="true">
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
                                            <asp:Label ID="lblPropertyName" runat="server" Text=""></asp:Label></li>
                                        <li>Room:
                                            <asp:Label ID="lblRoom" runat="server" Text=""></asp:Label></li>
                                        <li>Rent: Rs.
                                            <asp:Label ID="lblRent" runat="server" Text=""></asp:Label></li>
                                        <li style="display: none">Total Rent: Rs.
                                            <asp:Label ID="lblTotalRent" runat="server" Text=""></asp:Label></li>
                                        <li>Paid Amount: Rs.
                                            <asp:Label ID="lblPaidAmount" runat="server" Text=""></asp:Label></li>
                                        <li>Deposit : Rs.
                                            <asp:Label ID="lblDeposit" runat="server" Text=""></asp:Label></li>
                                        <li>Lock-in period: 
                                            <asp:Label ID="lbllockinperiod" runat="server" Text=""></asp:Label></li>
                                        <li>Sharing Type: 
                                            <asp:Label ID="lblSharingType" runat="server" Text=""></asp:Label></li>
                                    </ul>
                                </div>
                                <div class="large-textcenter">
                                    <ul>
                                        <li><p>We are excited to have you on-board Colive.</p></li>
                                        <li>For any support and assistance call us on 7676 000 500</li>
                                        <li>In case of any emergencies during your stay at Colive, call the <b>E</b>mergency <b>R</b>esponse <b>T</b>eam at <b>9098 911 911</b></li>                                     
                                        <li>
                                            <br />
                                            <a href="/" class="buttonCSS btn_small"><i class="linear_icon-select"></i><span>Home<span></span></span></a>
                                            <a href="/flipbook/flipbook/index.html" target="_blank" class="buttonCSS btn_small"><i class="linear_icon-select"></i><span>Hand Book<span></span></span></a>
                                            <a href="/faq.html" class="buttonCSS btn_small"><i class="linear_icon-select"></i><span>FAQ<span></span></span></a>
                                            <a href="https://www.colive.in/blog/" class="buttonCSS btn_small"><i class="linear_icon-select"></i><span>Blog<span></span></span></a>
                                            <a href="javascript:void(0);" runat="server" id="ancmovein" class="buttonCSS btn_small"><i class="linear_icon-select"></i><span>Move-In<span></span></span></a>
                                        </li>
                                         <li><p class="headertext">CHECK-OUT PROCESS</p></li>
                                        <li><p>Raise a vacating notice (Check-out request) on 1st date of calendar month  > Check-out will happen on the last date of the same calendar month > Rent should be paid till the last date of the same calendar month</p></li>
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
            </div>
        </div>
        <div class="fclear"></div>

    </form>
</body>
</html>
