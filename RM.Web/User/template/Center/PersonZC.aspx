<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonZC.aspx.cs" Inherits="RM.Web.User.template.Center.PersonZC" %>

<!DOCTYPE HTML>
<html>
<head>
  <!--#include file="../_meta.html"-->
<!--[if IE 6]>
<script type="text/javascript" src="/User/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>个人收益</title>
</head>
<body>
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 个人资料 <span class="c-gray en">&gt;</span> 支出统计 <span class="c-gray en"></span> <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:loadhtml();" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">

	</div>
<footer class="footer mt-20">
	
</footer>
  <!--#include file="../_footer.html"-->

    <script>
        function loadhtml() {
           
            $(".page-container").load("html/PersonZC.html?t=" + Math.random(), function () {
                init();
            });
        }
        function init() {

            loadInfo();
        }

       function loadInfo() {
            ajaxWelcomeStat(bindInfo);
        }
        function bindInfo(a) {

          


            var tableStr = "";

            $.each(a.t2, function (i, v) {
                tableStr += "<tr lass=\"text-c\">";
                tableStr += "<td>" + v.Qtype + "</td>";
                tableStr += "<td>￥" + moneyIntFormat(v.S_Money) + "</td>";
                tableStr += "<td>￥" + moneyIntFormat(v.TIXIAN) + "</td>";
                tableStr += "<td>￥" + moneyIntFormat(v.ZC) + "</td>";
                tableStr += "<td>￥" + moneyIntFormat(v.ZCZH) + "</td>";

                tableStr += "</tr>";

            });
            $('#t2').html(tableStr);


          
        }

    </script>
</body>
</html>