<%@ Page Language="C#" AutoEventWireup="true" Inherits="Colive.Website.SubmitData" CodeBehind="ccavRequestHandler.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link rel="icon" href="https://www.colive.in/favicon.png" type="image/png" />
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
    <title>Colive</title>
    <script type="text/javascript">window.history.forward();</script>
</head>
<body>
    <form id="customerData" runat="server">
        <center>
            <asp:Label ID="lblLink" runat="server"></asp:Label>
            <iframe scrolling="no" frameborder="0" style="height: 100vh; width: 50%" id="paymentFrame" src="<%=iframeSrc%>"></iframe>
        </center>
    </form>
</body>
</html>
