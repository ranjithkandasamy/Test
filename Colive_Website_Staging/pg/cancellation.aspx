<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cancellation.aspx.cs" Inherits="Colive.Website.pg.cancellation" %>

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
    <link href="/pg/css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="frmCompletionPage" runat="server">
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
                <div id="Div1">
                    <div class="container">
                        <br />
                        <div class="privacypolicy">
                            <div>
                                <asp:Label ID="lblHeader" runat="server" CssClass="headertext" Text="Your Payment has declined."></asp:Label>
                            </div>
                            <br />
                            <div class="large-textcenter">
                                <span>Please note as your payment was not successfully authorised, your transaction has NOT been completed. 
                                    <br />
                                    <br />
                                    Please try again with the correct details.</span>
                            </div>
                            <br />
                            <div class="large-textcenter">
                                <span>Thank You.</span>
                            </div>
                            <br />
                            <br />
                            <div class="large-textcenter">
                                <span>Click <a id="lnkHome" href="/">here</a> to continue</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="fclear"></div>
        </div>
    </form>
    <!-- ./Footer -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
</body>
</html>

