<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mydues.aspx.cs" Inherits="Colive.Website.myaccount.mydues" %>

<!DOCTYPE html>
<!-- saved from url=(0043)https://www.colive.in/dashboard?opn=service -->
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Colive</title>
    <!-- favicon -->
    <link rel="icon" href="https://www.colive.in/images/favicon.png">
    <!-- bootstrap -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <!-- font family -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- font family ubuntu-->
    <link href="https://fonts.googleapis.com/css?family=Ubuntu&display=swap" rel="stylesheet">
    <!-- custom css -->
    <link rel="stylesheet" href="/assets/css/styles.css?d=20191204">
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            font-family: 'Ubuntu', sans-serif;
        }
        @media (max-width: 767px) {
            .dashboard_wishlist_wrap .main-content nav .nav-tabs .nav-link {
                margin: 5px 9px 5px;
                font-size: 14px;
                background: #F2006C;
                color: #fff;
                white-space: nowrap;
            }
            .dashboard_wishlist_wrap .main-content nav .nav-tabs {
                padding: 0 0px;
                width: 100%;
                overflow: hidden;
                overflow-x: scroll;
                background: #F2006C;
                scroll-behavior: inherit;
                display: flex;
                flex-wrap: nowrap;
                flex-direction: row;
                position: fixed;
                z-index: 100;
                top: 0;
            }
            .dashboard_wishlist_wrap .main-content nav .nav-tabs .nav-link.active {
                border-bottom: 2px solid #ffffff !important;
                font-weight: 600;
            }
            .dashboard_wishlist_wrap #payment .invoice-no {
                font-family: 'Ubuntu', sans-serif;
            }
            .dashboard_wishlist_wrap .main-content #nav-tabContent_dues {
                padding: 0px 0 !important;
                margin-top: 0px;
            }
            .dashboard_wishlist_wrap .main-content #nav-tabContent_dues #CEONotes {
                margin-top: 35px;
            }
            .dashboard_wishlist_wrap .main-content #nav-tabContent_dues #my-dues {
                margin-top: 60px;
            }
            .dashboard_wishlist_wrap .main-content #nav-tabContent_dues #my-invoice {
                margin-top: 50px;
            }
            .dashboard_wishlist_wrap .main-content #nav-tabContent_dues #my-transaction {
                margin-top: 50px;
            }
            .dashboard_wishlist_wrap .main-content #nav-tabContent_dues #my-accounts {
                margin-top: 50px;
            }
            .dashboard_wishlist_wrap .main-content #nav-tabContent_dues #PMNotes {
                margin-top: 55px;
            }
            .invoice_card {
                border: 1px solid rgba(0,0,0,.125);
            }
            .dashboard_wishlist_wrap #payment .list-state {
                border-top: 1px solid rgba(0,0,0,.125);
            }
            .next_month_card {
                border: 1px solid rgba(0,0,0,.125);
            }
            .dashboard_wishlist_wrap #payment .adj-conetnt {
                border: 1px solid rgba(0,0,0,.125);
            }
            .dashboard_wishlist_wrap #payment .next_month_card p.cmposission {
                font-size: 14px;
            }
        }

        @media (min-width: 320px) and (max-width: 500px) {
            .dashboard_wishlist_wrap .main-content nav .nav-tabs .nav-link {
                margin: 5px 9px 5px;
                font-size: 14px;
                background: #F2006C;
                color: #fff;
                white-space: nowrap;
            }
            .paymentType .otherpayment {
                width: 40% !important;
            }
            .dashboard_wishlist_wrap {
                padding-top: 0;
            }
            .dashboard_wishlist_wrap .main-content {
                margin-top: 0;
            }
            #DuesSection .btn-primary:not(:disabled):not(.disabled).active, .btn-primary:not(:disabled):not(.disabled):active, .show > .btn-primary.dropdown-toggle {
                background-color: #ef0073;
                border-color: #ef0073;
            }
            i.fa.fa-inr {
                color: #fff !important;
            }
            .dashboard_wishlist_wrap .main-content nav .nav-tabs .nav-link {
                font-weight: 500;
            }
            .dashboard_wishlist_wrap #payment .bgc {
                box-shadow: 0 0px 0px 0 rgba(0, 0, 0, 0.06);
            }
            #DuesModal {
                top: 70px;
            }
            .loader {
                top: 40px;
            }
            .modal-backdrop {
                top: 37px;
            }
            .dashboard_wishlist_wrap #payment .pgup {
                color: #18283D;
                font-family: 'Ubuntu', sans-serif;
                font-size: 14px;
                font-weight: 400;
                line-height: 20px;
                text-align: left;
                white-space: nowrap;
            }
            .border-full{
                border:1px solid rgba(0,0,0,.125);
            }
            .border-right{
                border-right:1px solid rgba(0,0,0,.125);
            }
            .bg-color-grey {
                background-color: #eee;
            }
            .border-bottom {
                border-bottom: 0px !important;
            }
            .border-top {
                border-top: 0px !important;
            }
            .pad5 {
                padding: 5px;
            }
            .note_contet {
                text-align: left;
                padding-left: 10px;
            }
        }
        @media (max-width:320px ) {
            .dashboard_wishlist_wrap #payment .pgup {
                color: #18283D;
                font-family: 'Ubuntu', sans-serif;
                font-size: 10px;
                font-weight: 400;
                line-height: 20px;
                text-align: left;
                white-space: nowrap;
            }
        }
    </style>
</head>
<body>
    <!-- END of fixed call and chat buttons -->
    <section class="dashboard_wishlist_wrap">
        <div class="container">
            <div class="row tab-layout">
                <!-- Left side Menu -->
                <div class="col-lg-3 col-md-3 col-12 p-0">
                    <div class="sidebar-wrap">
                    </div>
                </div>
                <!-- Right Side content area -->
                <div class="col-lg-8 col-md-8 col-12 offset-lg-2 p-0">
                    <div class="tab-content homepage-card container">

                        <!-- MY DUES & PAYMENT -->
                        <div id="payment" class="tab-pane fade in active show">
                            <div class="main-content">
                                <div class="title d-none">Dues and Payments</div>
                                <div class="row">
                                    <div class="col-12 p-0">
                                        <nav class="d-lg-block d-md-block d-sm-block">
                                            <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                                <a class="nav-item nav-link active show" id="nav-CEONotes-tab" data-toggle="tab" href="#CEONotes" role="tab" aria-controls="nav-home" aria-selected="true" onclick="$('#btnclosePayment').click();">
                                                    <div class="dues&payments_icon"></div>
                                                    From CEO’s Desk</a>
                                                <a class="nav-item nav-link" id="nav-dues-tab" data-toggle="tab" href="#my-dues" role="tab" aria-controls="nav-home" aria-selected="false">
                                                    <div class="dues&payments_icon"></div>
                                                    Dues</a>
                                                <a class="nav-item nav-link" id="nav-invoice-tab" data-toggle="tab" href="#my-invoice" role="tab" aria-controls="nav-profile" aria-selected="false" onclick="$('#btnclosePayment').click();">
                                                    <div class="dues&payments_icon"></div>
                                                    Invoices</a>
                                                <a class="nav-item nav-link" id="nav-transaction-tab" data-toggle="tab" href="#my-transaction" role="tab" aria-controls="nav-home" aria-selected="false" onclick="$('#btnclosePayment').click();">
                                                    <div class="dues&payments_icon"></div>
                                                    Payments</a>
                                                <a class="nav-item nav-link" id="nav-accounts-tab" data-toggle="tab" href="#my-accounts" role="tab" aria-controls="nav-profile" aria-selected="false" onclick="$('#btnclosePayment').click();">
                                                    <div class="dues&payments_icon"></div>
                                                    Statements</a>
                                                <a class="nav-item nav-link" id="nav-PMNotes-tab" data-toggle="tab" href="#PMNotes" role="tab" aria-controls="nav-home" aria-selected="true" onclick="$('#btnclosePayment').click();">
                                                    <div class="dues&payments_icon"></div>
                                                    Your Property at a Glance</a>
                                            </div>
                                        </nav>
                                        <div class="tab-content" id="nav-tabContent_dues">
                                            <div class="tab-pane fade active show" id="CEONotes" role="tabpanel" aria-labelledby="nav-home-tab">
                                                <div class="" id="invoice-first">
                                                    <div class="invoice">
                                                        <div class="container pad0">
                                                            <div class="bgc">
                                                                <div class="col-lg-12 col-md-12 col-12 bkhc" id="dvCEONotes">
                                                                    <!---------------------->
                                                                    <!-- CEO Notes Section -->
                                                                    <!---------------------->
                                                                </div>
                                                                <div class="col-lg-12 col-md-12 col-12 ceo_details" id="dvCEODetails">
                                                                    <div class="ceo_image">
                                                                        <img src="https://www.colive.in/utility/invoice/sureshkumar.jpg" class="img-fluid ceo_images">
                                                                    </div>
                                                                    <div class="ceo_desig">
                                                                        <div class="ceo_name">Suresh Rangarajan</div>
                                                                        <div class="designation">Founder &amp; CEO</div>
                                                                        <div class="ceo_corporate">Colive.</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="my-dues" role="tabpanel" aria-labelledby="nav-home-tab">
                                                <div>
                                                    <div class="invoice">
                                                        <div class="container pad0">
                                                            <div class="bgc">
                                                                <div class="col-lg-12 col-md-12 col-12 bkhc" id="DuesSection">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="my-invoice" role="tabpanel" aria-labelledby="nav-home-tab">

                                                <div class="" id="invoice-second">
                                                    <div class="invoice-deta">
                                                        <div class="container status-mail">
                                                            <div class="detail-status" id="InvoiceContainer">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="my-transaction" role="tabpanel" aria-labelledby="nav-home-tab">
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="table-wrap" id="dvReceipt">
                                                            <table class="table">
                                                                <thead>
                                                                    <tr id="ReceiptDetails">
                                                                        <th scope="col">Property</th>
                                                                        <th scope="col">Transaction Date</th>
                                                                        <th scope="col">Reference ID</th>
                                                                        <th scope="col">Amount</th>
                                                                        <th></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="ReceiptSection"></tbody>
                                                            </table>
                                                        </div>
                                                        <div class="invoice-deta" id="dvReceiptApp">
                                                            <div class="container">
                                                                <div class="detail-status" id="ReceiptContainer">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="my-accounts" role="tabpanel" aria-labelledby="nav-home-tab">
                                                <div class="accounts-wrap" id="dvStatements">
                                                    <div class="accordion-header" id="StatementsHeader">
                                                        <p class="col-lg-2 col-12 text-center">S No</p>
                                                        <p class="col-lg-2 col-12 text-center">Month</p>
                                                        <p class="col-lg-2 col-12 text-center">Dues</p>
                                                        <p class="col-lg-2 col-12 text-center">Paid</p>
                                                        <p class="col-lg-2 col-12 text-center">OS</p>
                                                    </div>
                                                    <div class="accordion" id="accordionExample">
                                                    </div>
                                                </div>
                                                <div class="invoice-deta" id="dvStatementsApp">
                                                    <div class="container">
                                                        <div class="detail-status" id="StatementsApp">
                                                            <div class="row border-full bg-color-grey border-bottom" id="statement_app">
                                                                <div class="col-lg-2 col-4 text-center border-right pad5">Month</div>
                                                                <div class="col-lg-2 col-3 text-center border-right pad5">Dues</div>
                                                                <div class="col-lg-2 col-3 text-center border-right pad5">Paid</div>
                                                                <div class="col-lg-2 col-2 text-center pad5">OS</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade show" id="PMNotes" role="tabpanel" aria-labelledby="nav-home-tab">
                                                <div class="" id="invoice-notes">
                                                    <div class="invoice">
                                                        <div class="container pad0">
                                                            <div class="bgc">
                                                                <div class="col-lg-12 col-md-12 col-12 bkhc" id="dvPMNotes">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- For Mobile View Nav -->
                                            <nav class="d-none">
                                                <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                                    <a class="nav-item nav-link active show" id="nav-CEONotes-tab" data-toggle="tab" href="#CEONotes" role="tab" aria-controls="nav-home" aria-selected="true">CEO Notes</a>
                                                    <a class="nav-item nav-link" id="nav-dues-tab" data-toggle="tab" href="#my-dues" role="tab" aria-controls="nav-home" aria-selected="false">Dues</a>
                                                    <a class="nav-item nav-link" id="nav-invoice-tab" data-toggle="tab" href="#my-invoice" role="tab" aria-controls="nav-profile" aria-selected="false">Invoice</a>
                                                    <a class="nav-item nav-link" id="nav-transaction-tab" data-toggle="tab" href="#my-transaction" role="tab" aria-controls="nav-home" aria-selected="false">Payments</a>
                                                    <a class="nav-item nav-link" id="nav-accounts-tab" data-toggle="tab" href="#my-accounts" role="tab" aria-controls="nav-profile" aria-selected="false">Statements</a>
                                                    <a class="nav-item nav-link" id="nav-PMNotes-tab" data-toggle="tab" href="#PMNotes" role="tab" aria-controls="nav-home" aria-selected="true">PM Notes</a>
                                                </div>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>


    <!-- Dues Modal -->
    <div class="modal fade" id="DuesModal" tabindex="-1" role="dialog" aria-labelledby="DuesModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title font-weight-bold" id="DuesModalLabel">Choose Payment</h5>
                    <button type="button" id="btnclosePayment" class="close" data-dismiss="modal" aria-label="Close" onclick="CancelDuesTransaction();">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12 radioInputGroup">
                    <div class="form-check paymentType">
                        <input class="form-check-input radio-custom" type="radio" id="PaymentTypeOverall" name="PaymentType" value="1" onchange="PaymentTypeChanged(1);">
                        <label class="form-check-label font-weight-normal radio-custom-label" for="PaymentTypeOverall">Overall Due: </label>
                        <label class="font-weight-normal float-right" for="PaymentTypeOverall">₹ <span id="spnOverallDues"></span></label>
                    </div>
                    <div class="form-check paymentType" style="display:none;">
                        <input class="form-check-input" type="radio" id="PaymentTypeRent" name="PaymentType" value="2" onchange="PaymentTypeChanged(1);">
                        <label class="form-check-label font-weight-normal" for="PaymentTypeRent">Rent: </label>
                        <label class="font-weight-normal float-right" for="PaymentTypeRent">₹  <span id="spnOverallRent"></span></label>
                    </div>
                    <div class="form-check paymentType">
                        <input class="form-check-input" type="radio" id="PaymentTypeOthers" onchange="PaymentTypeChanged(2);"  name="PaymentType" value="3">
                        <label class="font-weight-normal form-check-label" for="PaymentTypeOthers">Others : </label>
                        <input id="txtOtherPayment" class="form-control float-right otherpayment" type="number" onkeypress="return NumberOnly();" maxlength="7" placeholder="₹" />
                    </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="CancelDuesTransaction();">Cancel</button>
                    <button type="button" class="btn btn-primary" data-buttonid="0" id="btnDuesConfirm" onclick="PayDuePayment($(this));">Make Payment</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Toast Section(alert popup) -->
    <div class="toastwrap">
        <div class="toast">
            <i class="fa fa-times toastclose" aria-hidden="true" onclick="$('.toastwrap').fadeOut();"></i>
            <span id="ToastMsg" class="ToastMsg"></span>
        </div>
    </div>
    <!-- ./Toast Section(alert popup) -->
    <!-- ./Dues Modal -->
    <!-- hidden fields -->
    <input type="hidden" id="hdnCustomerId" />
    <!-- ./hidden fields -->
    <!-- Payment -->
    <form id="fmPayment" name="frmPg" action="/pg/paymentoptions.aspx" method="post">
        <input type="hidden" value="" id="OrderId" name="OrderId" />
    </form>
    <!-- ./Payment -->
    <div class="CssLoaderStyles" id="AjaxLoader" style="display: none;">
        <div class="CssLoaderAlign">
            <div class="Logo-loader"></div>
            <div class="logoloader"></div>
        </div>
    </div>
    <!-- ./Footer -->
    <input type="hidden" id="hdnSourceTypeId" runat="server" clientidmode="static" value="4" />
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="/assets/js/custom.js?d=20191106"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var querystring = getQueryStringValues();
            var CustomerId = querystring["cid"];
            var Source = querystring["source"] === undefined ? "4" : querystring["source"];
            var TabId = querystring["page"] === undefined ? "0" : querystring["page"];
            ShowTab(TabId);
            SourceTypeId = parseInt(Source);
            $('#hdnSourceTypeId').val(Source);
            setTimeout(function () { BindCustomerPayementHistory(CustomerId); $('#hdnCustomerId').val(CustomerId); }, 1000);
        });

        function ShowTab(TabId) {
            TabId = parseInt(TabId);
            switch (TabId) {
                case 1:
                    $('#nav-CEONotes-tab').click();
                    break;
                case 2:
                    $('#nav-dues-tab').click();
                    break;
                case 3:
                    $('#nav-invoice-tab').click();
                    break;
                case 4:
                    $('#nav-transaction-tab').click();
                    break;
                case 5:
                    $('#nav-accounts-tab').click();
                    break;
                case 6:
                    $('#nav-PMNotes-tab').click();
                    break;
                default:
                    $('#nav-CEONotes-tab').click();
                    break;
            }
        }
    </script>
</body>
</html>
