<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Person.aspx.cs" Inherits="RM.Web.User.template.Center.Person" %>


<!DOCTYPE HTML>
<html>
<head>
   <!--#include file="../_meta.html"-->
<![endif]--><title>个人资料</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 个人资料 <span class="c-gray en">&gt;</span> 资料详细 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:loadhtml();" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">



</div>

    <!--_footer 作为公共模版分离出去-->
  <!--#include file="../_footer.html"-->
    <!--/_footer /作为公共模版分离出去-->


    <script>

    


        function bind(a) {

            if (a.res_code == 1) {
                
                $("#RegMoney").text("注册资金："+a.RegMoney+"万元");
                $("#RealName").text(a.RealName);
                $("#Account").text(a.Account);
                $("#Phone").text(a.Phone);
                $("#RecMan").text(a.RecMan);
                $("#RegDate").text(formatDate_S((a.RegDate)));

                $("#BankName").text(a.BankName);
                $("#BankAddress").text(a.BankAddress);
                $("#BankCardNO").text(a.BankCardNO);
                $("#ActiveDate").text(formatDate_S((a.ActiveDate)));
              
                if (a.ISActive == 1) {
                    $("#ISActive").text("已激活");
                } else {
                    $("#ISActive").text("未激活");
                }
                
            } else {
                layer.msg("网络异常！", { icon: 5 });
            }

        }


        function loadhtml() {
            $(".page-container").load("html/Person.html?t=" + Math.random(), function () {
                init();
            });
        }


        function init() {
            ajaxGetCurrentPerson(bind);
        }
    </script>
</body>
</html>
