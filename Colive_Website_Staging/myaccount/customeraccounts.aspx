<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customeraccounts.aspx.cs" Inherits="Colive.Website.myaccount.customeraccounts" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <meta http-equiv="Content-Security-Policy" content="script-src 'self' 'unsafe-inline' https://code.jquery.com https://cdnjs.cloudflare.com/ajax/libs/popper.js/ https://cdnjs.cloudflare.com/ajax/libs/jquery.touchswipe/">
    <link rel="icon" href="https://www.colive.in/favicon.png" type="image/png" />
    <title>Account Details</title>
    <link href="/assets/css/styles.css" rel="stylesheet" />  
</head>
<body>
    <form id="form1" runat="server">
        <div class="AccountsWrapper">
            <h4 class="AccountHeader">Customer Accounts Statement</h4>
            <div class="AccountsContainer" id="AccountsTable">
            </div>
            <div class="EmptyAccountRecords" id="EmptyAccountRecords">
                <span>No Records Found for this Customer</span>
            </div>
        </div>
        <div id='loadingmsg' style="line-height: 0px; display: none" class="hide">
            <div style="position: relative;">
                <img src="/assets/images/loader.gif" />
            </div>
        </div>

        <div id='loadingover' class="hide" style="display: none">
        </div>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/custom.js"></script>
    <script type="text/javascript" defer="defer" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.touchswipe/1.6.4/jquery.touchSwipe.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var querystring = getQueryStringValues();
                if (querystring["cid"] != null) {
                    var Customerid = querystring["cid"];
                    if (Customerid != null || Customerid != undefined) {
                        BindCustomerAccountStatement(Customerid);
                    }
                } else {
                    $('#AccountsTable').fadeOut();
                    $('#EmptyAccountRecords').fadeIn();
                }

            });
        </script>
    </form>
</body>
</html>
