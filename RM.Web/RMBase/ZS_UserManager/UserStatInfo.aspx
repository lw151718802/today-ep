<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserStatInfo.aspx.cs" Inherits="RM.Web.RMBase.ZS_UserManager.UserStatInfo" %>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="/User/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/User/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="/User/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="/User/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="/User/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="/User/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>会员统计信息</title>
</head>
<body>
   
<div class="page-container">
    <p class="f-20 text-success" id="welname">欢迎</p>

<table class="table table-border table-bordered table-bg">
    <thead>
        <tr>
            <th colspan="11" scope="col">收入统计</th>
        </tr>
        <tr class="text-c">
            <th>统计</th>
            <th>总金额</th>
            <th>充值</th>
            <th>固定收益</th>
            <th>浮动收益</th>
            <th>运营分红</th>
            <th>销售奖金</th>
            <th>管理奖金</th>
            <th>服务奖金</th>
            <th>福利分红</th>
            <th>转入</th>
        </tr>
    </thead>
    <tbody id="t1"></tbody>
</table>

<table class="table table-border table-bordered table-bg mt-20">
    <thead>
        <tr>
            <th colspan="5" scope="col">支出统计</th>
        </tr>
        <tr class="text-c">
            <th>统计</th>
            <th>总金额</th>
            <th>提现</th>
            <th>转账</th>
            <th>注册</th>
        </tr>
    </thead>
    <tbody id="t2">
      

    </tbody>
</table>


<table class="table table-border table-bordered table-bg mt-20">
    <thead>
        <tr>
            <th colspan="6" scope="col">业绩统计</th>
        </tr>
        <tr class="text-c">
            <th>统计</th>
            <th>直系业绩</th>
            <th>旁系业绩</th>
            <th>直接销售业绩</th>
            <th>二级分销业绩</th>
            <th>三级分销业绩</th>
        </tr>
    </thead>
    <tbody id="t3"></tbody>
</table>
	</div>
<footer class="footer mt-20">
	
</footer>
    <script type="text/javascript" src="/User/lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="/User/lib/layer/2.1/layer.js"></script>
    <script type="text/javascript" src="/User/lib/icheck/jquery.icheck.min.js"></script>
    <script type="text/javascript" src="/User/lib/jquery.validation/1.14.0/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/User/lib/jquery.validation/1.14.0/validate-methods.js"></script>
    <script type="text/javascript" src="/User/lib/jquery.validation/1.14.0/messages_zh.min.js"></script>
    <script type="text/javascript" src="/User/static/h-ui/js/H-ui.js"></script>
    <script type="text/javascript" src="/User/static/h-ui.admin/js/H-ui.admin.js"></script> 

    <script>
        function GetQueryString(a) {
            a = new RegExp("(^|&)" + a + "=([^&]*)(&|$)");
            a = window.location.search.substr(1).match(a);
            return null != a ? unescape(a[2]) : null
        };

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
        $(function () {

            loadInfo();
          
        });

        var ac = '';

       function loadInfo() {
        
           ac = GetQueryString('ac');
           $.ajax({
               type: "post",
               timeout: 3000,
               dataType: "json",
               cache: !0,
               url: "/Ajax/Z_UserStat.ashx?t=" + Math.random(),
               data: {
                   account:ac
               },
               success: function (rs) {

                   bindInfo(rs);
               },
               error: function (a) {
                 
               }
           })
        }
        function bindInfo(a) {

            var relname = a.relname;
            $("#welname").text(relname)
            


            var tableStr = "";
            $.each(a.t1, function (i, v) {
                tableStr += "<tr lass=\"text-c\">";
                tableStr += "<td>" + v.Qtype + "</td>";
                tableStr += "<td>￥" + moneyIntFormat(v.S_Money) + "</td>";
                tableStr += "<td>￥" + moneyIntFormat(v.CZ) + "</td>";
                tableStr += "<td>￥" + moneyIntFormat(v.GDSY) + "</td>";
                tableStr += "<td>￥" + moneyIntFormat(v.FDFH) + "</td>";
                tableStr += "<td>￥" + moneyIntFormat(v.YYFH) + "</td>";
                tableStr += "<td>￥" + moneyIntFormat(v.XSJL) + "</td>";
                tableStr += "<td>￥" + moneyIntFormat(v.GLJL) + "</td>";
                tableStr += "<td>￥" + moneyIntFormat(v.FWJL) + "</td>";
                tableStr += "<td>￥" + moneyIntFormat(v.FLFH) + "</td>";
                tableStr += "<td>￥" + moneyIntFormat(v.ZJ) + "</td>";
               
                tableStr += "</tr>";

            });
           
            $('#t1').html(tableStr);

             tableStr = "";
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


          

            tableStr = "";
            $.each(a.t3, function (i, v) {
                tableStr += "<tr lass=\"text-c\">";
                tableStr += "<td>" + v.Qtype + "</td>";
               tableStr += "<td>￥" + moneyIntFormat(v.ZXYJ) + "</td>";
                tableStr += "<td>￥" + moneyIntFormat(v.PXYJ) + "</td>";
                tableStr += "<td>￥" + moneyIntFormat(v.DYYJ) + "</td>";
                tableStr += "<td>￥" + moneyIntFormat(v.DEYJ) + "</td>";
                tableStr += "<td>￥" + moneyIntFormat(v.DSYJ) + "</td>";
                tableStr += "</tr>";

            });
            $('#t3').html(tableStr);


  
            if (a.lgininfo.length >= 1) {
                var objlgininfo = a.lgininfo[0];

                var htmls = "";
                htmls += "  <p >登录次数：" + objlgininfo.logincount + " </p>"
                htmls += "  <p >上次登录IP：" + objlgininfo.SYS_LOGINLOG_IP + " 登录地址:" + objlgininfo.OWNER_address + "登录时间:" + formatDate_S((objlgininfo.SYS_LOGINLOG_TIME))+"</p>";
              
                $("#welname").after(htmls);
            }
        }

    </script>
</body>
</html>