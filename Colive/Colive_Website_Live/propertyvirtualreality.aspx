<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="propertyvirtualreality.aspx.cs" Inherits="Colive.Website.propertyvirtualreality" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Colive:  Premium Shared Accommodation on Affordable Rents  </title>
    <!-- favicon -->
    <link rel="icon" href="https://www.colive.in/favicon.png" type="image/png" />
    <style>
        html, body {
            margin: 0;
            padding: 0;
        }

        .iframeborder {
            height: 100vh;
        }
    </style>
    <script>

        function getValueAtIndex(index) { var str = window.location.href.split("/"); if (index < str.length) { return str[index]; } else { return '' } }
        
    </script>
</head>
<body>
    <div class="iframeborder" id="virtualReality360_blog_contents">
        
    </div>
    <script defer src="/assets/js/custom.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script id="rendered-js">        
        $(document).ready(function () {
            var redirect = "/";
            var retVal = getValueAtIndex(6);
            if (retVal == '')
                window.location.href = redirect;
            else
                BindVirtualReality360ForProperty(retVal);                      
        });
    </script>
</body>
</html>
