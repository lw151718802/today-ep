<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Member_Msg.aspx.cs" Inherits="RM.Web.User.template.member.Member_Msg" %>
<!DOCTYPE HTML>
<html>
<head>
   <!--#include file="../_meta.html"-->

    <link href="/User/lib/page.css" rel="stylesheet" />
<title>消息</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统管理 <span class="c-gray en">&gt;</span> 消息通知 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">



</div>
     
  <!--#include file="../_footer.html"-->

<script type="text/javascript" src="/user/lib/js-extend.js"></script>
<script type="text/javascript" src="/user/lib/jquery-ajax-pager.js"></script>
<script type="text/javascript">


    $(function () {
      
    })
    function loadhtml() {
        $(".page-container").load("html/Member_Msg.html?t=" + Math.random(), function () {
            init();
        });
    }
   

    function init()
    {
        divresize(120);
        //FixedTableHeader("#table1", $(window).height() - 151);

        $('#pager').sjAjaxPager({
            url: "/User/Ajax/GetMsgPage.ashx",

            pageSize: 10,
            searchParam: {
                /*
                * 如果有其他的查询条件，直接在这里传入即可
                */
                id: 1,
                name: 'test'
            },
            beforeSend: function () {
            },
            preText: "上一页",
            nextText: "下一页",
            firstText: "首页",
            lastText: "尾页",
            success: function (data) {
                /*
                *返回的数据根据自己需要处理
                */

                var tableStr = "";
                var s = '';
                $.each(data.items, function (i, v) {
                    tableStr += "<tr lass=\"text-c\">";
                    tableStr += "<td>" + formatDate_S((v.CREATEDATE)) + "</td>";
                    tableStr += "<td><a target=\"_blank\" href=\"/User/template/NoticDetail.aspx?key=" + v.ID + "\">" + v.MSGTITLE + "</a></td>";
                   
                    tableStr += "</tr>";

                });
                $('#dataTable').html(tableStr);
            },
            complete: function () {
            }
        });
    }

    $(function () {

       
    })



</script> 
</body>
</html>