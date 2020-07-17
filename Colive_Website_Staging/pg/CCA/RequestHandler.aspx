<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RequestHandler.aspx.cs" Inherits="Colive.Website.pg.CCA.RequestHandler" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width,initial-scale=1,,maximum-scale=1,user-scalable=no" />
    <title>Colive | Shared Accommodation,Flats,House On Rent In Bangalore</title>
    <!-- favicon -->
    <link rel="icon" href="https://www.colive.in/favicon.png" type="image/png" />
    <link href="/pg/css/style.css" rel="stylesheet" />
    <script type="text/javascript">window.history.forward();</script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('iframe#paymentFrame').load(function () {
                window.addEventListener('message', function (e) {
                    $("#paymentFrame").css("height", e.data['newHeight'] + 'px');
                }, false);
            });
        });
    </script>
</head>
<body style="text-align: center; margin: 0 auto;">
    <form id="form1" runat="server">
        <iframe scrolling="no" class="paymentIframe" frameborder="0" style="height: 100vh;" id="paymentFrame" src="<%=iframeSrc%>" />
    </form>
    <%--<section class="mt-10">
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
                <div class="payment_processing">Payment Proceeding...</div>
                <div class="payment_msg">
                    Please wait! while we process your transaction.
                    <br />
                    Please <strong>DO NOT</strong> click back button or refresh page.
                </div>
            </div>
        </section>--%>
</body>
</html>
