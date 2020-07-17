<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="paymentoptions.aspx.cs" Inherits="Colive.Website.pg.paymentoptions" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <meta http-equiv="Content-Security-Policy" content="script-src 'self' 'unsafe-inline' https://maps.googleapis.com/ https://code.jquery.com https://colivebot.xyz/files/deploy/ https://cdnjs.cloudflare.com/ajax/libs/popper.js/ https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/ https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/ https://unpkg.com/ionicons@4.5.10-0/" />
    <title>Colive | Shared Accommodation,Flats,House On Rent In Bangalore</title>
    <!-- favicon -->
    <link rel="icon" href="https://www.colive.in/favicon.png" type="image/png" />
    <script type="text/javascript">window.history.forward();</script>
    <!-- favicon -->
    <link rel="icon" href="https://www.colive.in/favicon.png" type="image/png" />
    <!-- bootstrap -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css" />
    <!-- font family -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
    <!-- custom css -->
    <link rel="stylesheet" href="/assets/css/styles.css?_201910231740" />
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="/pg/css/style.css" rel="stylesheet" />
</head>
<body class="">

    <header>
        <!-- site header include -->
        <nav class="navbar navbar-expand-md navbar-toggleable fixed-top static" id="navbar">
            <!-- navbar-expand  -->
            <div class="nav w-100 container justify-content-between align-middle">
                <!-- brand logo -->
                <a class="navbar-brand" href="javascript:void(0);">
                    <img class="img-fluid" alt="Colive" src="/assets/images/logo-colive.png">
                </a>
                <!-- End of collapse div  -->
            </div>
            <!-- navbar-expand end -->
        </nav>
    </header>

    <section class="mt-5 bg-card">
        <div class="container">
            <div class="row">
                <div class="offset-lg-3 col-lg-6 col-md-6 col-12">
                    <div class="boder-box">
                        <h1 class="payment_mode_heading mb-3">Payment Options</h1>
                        <form id="form1" runat="server" method="post">
                            <input type="hidden" runat="server" id="order_id" />
                            <input type="hidden" runat="server" id="pg_method_id" />
                            <input type="hidden" runat="server" id="gateway_id" />
                            <input type="hidden" runat="server" id="RequestURL" />
                            <asp:DataList ID="datalistPgSelection" runat="server" OnItemCommand="datalistPgSelection_ItemCommand">
                                <ItemTemplate>
                                    <div class="payment_option">
                                        <div class="payment_content">
                                            <asp:LinkButton ID="lblDescription" Text='<%# DataBinder.Eval(Container.DataItem, "Description") %>'
                                                runat="server" class="payment_value fa fa-chevron-right" CommandName="paymentmethod"
                                                CommandArgument='<%# DataBinder.Eval(Container.DataItem, "MethodValue")%>'>
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </form>
                        <div class="card-logos mt-4">
                            <img src="img/card-logo.png" />
                        </div>
                    </div>
                    <div class="boder-box mt-3">
                        <div class="bank-logos">
                            <img src="img/banklogos.png" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ./Footer -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
</body>
</html>
