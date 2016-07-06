<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WelD.aspx.cs" Inherits="RM.Web.User.WelD" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dream</title>
    <!-- Bootstrap Styles-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='http://fonts.useso.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />


    <style>

        .banner {
    width: 100%;
    overflow: hidden;
    background: url(/User/images/conew.jpg) no-repeat center top;
    height: 768px;
}
    </style>
</head>

<body>
     <div class="col-md-12 banner">
                        
                    </div>
    <div id="wrapper">
     
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">


          

           


                <div class="row">


                      <div class="col-md-12 col-sm-12 col-xs-12">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                系统公告
                            </div> 
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width:20%">时间</th>
                                                <th>标题</th>
                                              
                                            </tr>
                                        </thead>
                                        <tbody id="notic">
                                          
                                          
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
              
                 
                </div>
                <!-- /. ROW  -->

                <!-- /. ROW  -->
				
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
    <!-- jQuery Js -->
      <script type="text/javascript" src="/User/lib/jquery/1.9.1/jquery.min.js"></script>
    <!-- Bootstrap Js -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- Metis Menu Js -->
    <script src="assets/js/jquery.metisMenu.js"></script>
    <!-- Morris Chart Js -->
    <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/js/morris/morris.js"></script>
    <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script>
    <script>

      

        $(function () {
            

          ajaxInFo(bindInfo);
        });


        function ajaxInFo(d) {
            $.ajax({
                type: "post",
                timeout: 2000,
                dataType: "json",
                cache: !0,
                url: "/User/Ajax/WelC.ashx?t=" + Math.random(),
                data: {
                },
                success: function (rs) {

                    d(rs);
                },
                error: function (a) {
                   
                }
            })
        }

        function bindInfo(a) {

          
         
          



            var tableStr = "";
            $.each(a.t2, function (i, v) {
                tableStr += "<tr >";
                tableStr += "<td>" + formatDate_S(v.CreateDate) + "</td>";
                tableStr += "<td><a target=\"_blank\" href=\"/User/template/NoticDetail.aspx?key=" + v.ID + "\">" + v.MsgTitle + "</a></td>";
          

                tableStr += "</tr>";

            });

            $('#notic').html(tableStr);
        }

         

        function formatDate_S(date, format) {
            if (!date) return;
            if (!format) format = "yyyy-MM-dd HH:mm:ss";


            switch (typeof date) {
                case "string":
                    date = new Date(date.replace(/-/, "/").replace('T', ' '));
                    break;
                case "number":
                    date = new Date(date);
                    break;
            }
            if (!date instanceof Date) return;
            var dict = {
                "yyyy": date.getFullYear(),
                "M": date.getMonth() + 1,
                "d": date.getDate(),
                "H": date.getHours(),
                "m": date.getMinutes(),
                "s": date.getSeconds(),
                "MM": ("" + (date.getMonth() + 101)).substr(1),
                "dd": ("" + (date.getDate() + 100)).substr(1),
                "HH": ("" + (date.getHours() + 100)).substr(1),
                "mm": ("" + (date.getMinutes() + 100)).substr(1),
                "ss": ("" + (date.getSeconds() + 100)).substr(1)
            };
            return format.replace(/(yyyy|MM?|dd?|HH?|ss?|mm?)/g, function () {
                return dict[arguments[0]];
            });
        }


        function moneyIntFormat(a) {
            if (0 == a) return a;
            if (0 > a) {
                n = 2;
                a = parseFloat((-1 * a + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
                a = a.split(".")[0].split("").reverse();
                var c = "";
                for (i = 0; i < a.length; i++) c += a[i] + (0 == (i + 1) % 3 && i + 1 != a.length ? "," : "");
                return "-" + c.split("").reverse().join("")
            }
            n = 2;
            a = parseFloat((a + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
            a = a.split(".")[0].split("").reverse();
            c = "";
            for (i = 0; i < a.length; i++) c += a[i] + (0 == (i + 1) % 3 && i + 1 != a.length ? "," : "");
            return c.split("").reverse().join("")
        }


    </script>

</body>

</html>