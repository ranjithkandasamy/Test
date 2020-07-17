<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="thankyou.aspx.cs" Inherits="Colive.Website.lp.chennai.thankyou" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="robots" content="noindex, nofollow" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
    <title>Colive | Offers In Chennai</title>
    <!-- favicon -->
    <link rel="icon" href="https://www.colive.in/favicon.png" type="image/png" />
    <meta http-equiv="Content-Security-Policy" content="script-src 'self' 'unsafe-inline' 'unsafe-eval' https://cdnjs.cloudflare.com/ajax/libs/font-awesome/ https://www.googletagmanager.com/ https://www.google-analytics.com/analytics.js https://www.googleadservices.com/pagead/conversion_async.js http://static.hotjar.com/ https://script.hotjar.com/ https://googleads.g.doubleclick.net/pagead/ https://connect.facebook.net/ http://www.googleadservices.com/" />
    
    <link rel="stylesheet" href="/assets/lp/chennai/assets/css/thankyou.css" />
    <script type="text/javascript">window.history.forward();</script>
    <script type="text/javascript" src="/assets/lp/chennai/assets/js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" />
</head>
<body>
    <form runat="server" id="EnquiryForm">
        <div class="navbar">
            <div class="ColiveContainer">
                <a href="/">
                    <img class="Colivelogo" src="/assets/lp/chennai/assets/images/logo/logo-colive.png?d=20191024" />
                </a>
            </div>
        </div>
        <section class="ColiveContainer" style="height: 100vh;display: flex;align-items: center;">
            <div class="ThankyouWrapper">
                <div class="ThankyouContainer">
                    <span class="bg_red  FormsuccessLogo FAlignImage"></span>
                    <h5 class="thakyoutext">Thank you for submitting the form.</h5>
                    <h6 class="thakyouSubtext">Our sales representative will call you shortly.</h6>
                    <asp:Button ID="btnSubmit" runat="server" Text="View Colive Properties" CssClass="buttonCSS btn_blue" OnClick="btnOK_Click" />
                </div>
            </div>
        </section>
    </form>
</body>
</html>