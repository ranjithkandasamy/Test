<%@ Page Language="C#" AutoEventWireup="true" Inherits="Colive.Website.RentDueResponseHandler" CodeBehind="ccavRentDueResponseHandler.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="css/style.css?d=20190720" rel="Stylesheet" />
    <link rel="icon" href="https://www.colive.in/favicon.png" type="image/png" />
    <style>
       .homepage-wrap.search-container{width:991px;margin:0 auto;text-align:center;border:1px solid #eee;box-shadow:0 0 1px #eee;margin-top:5%}.StyleCustomWorks .headertext{color:#f0086e;font-family:Montserrat,sans-serif;font-size:25px}.StyleCustomWorks .large-textcenter{text-align:center;padding:10px 0;font-size:20px;opacity:.5;font-weight:600}.HomeredirectionBut{background-color:#ef0073;color:#fff;border:2px solid #ef0073;font-size:15px;font-weight:700;line-height:18px;padding:.375rem .75rem;text-decoration:none}.StyleCustomWorks{padding:10px 0 36px 0}.HomeRedirection{margin-top:24px}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="content">
            <div class="container box-shadow">
                <header>
                    <div class="innerWrap" style="padding: 5px 0px;border-bottom: 1px solid #ddd;">
                        <div class="logo"><a href="/">
                            <img src="img/logo.png" alt="" />
                        </a></div>
                    </div>
                </header>
                <!-- design for payment thank page -->
                <div>
                    <div class="homepage-wrap search-container">
                        <asp:Label ID="lblInformation" runat="server" ForeColor="Red" Font-Size="14px"></asp:Label>
                        <br />
                        <div class="privacypolicy StyleCustomWorks">
                            <div class="successFull">
                                <asp:Label ID="lblHeader" runat="server" CssClass="headertext" Text="PAYMENT SUCCESS"></asp:Label>
                            </div>
                            <div class="large-textcenter">
                                <span>Thank You.</span>
                            </div>
                            <div class="HomeRedirection">
                                <a href="/" class="HomeredirectionBut">Home</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- design for payment thank page end -->
            </div>
            <div class="fclear"></div>
        </div>
    </form>
</body>
</html>
