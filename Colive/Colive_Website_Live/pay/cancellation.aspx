<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cancellation.aspx.cs" Inherits="Colive.Website.cancellation" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="icon" href="https://www.colive.in/favicon.png" type="image/png" />
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
        </script>
        <style>
            body {
                font-family: ubuntu-regular,sans-serif;
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
        </style>
        <div id="content">
            <div class="container box-shadow ">
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
                                <span>Click <a href="/">here</a> to continue</span>
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
