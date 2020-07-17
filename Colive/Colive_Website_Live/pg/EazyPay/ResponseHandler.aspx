<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResponseHandler.aspx.cs" Inherits="Colive.Website.pg.EazyPay.ResponseHandler" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width,initial-scale=1,,maximum-scale=1,user-scalable=no" />
    <title>Colive | Shared Accommodation,Flats,House On Rent In Bangalore</title>
    <!-- favicon -->
    <link rel="icon" href="https://www.colive.in/favicon.png" type="image/png" />
    <link href="/pg/css/style.css" rel="stylesheet" />
    <script type="text/javascript">window.history.forward();</script>
</head>
<body>
    <form id="form1" runat="server">
        <section class="mt-10">
            <div class="container text-center" style="text-align: center;">
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
        </section>
    </form>
</body>
</html>