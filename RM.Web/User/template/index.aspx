﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="RM.Web.User.template.index" %>

<!DOCTYPE HTML>
<html>
<head>
<!--#include file="_meta.html"-->
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title></title>

</head>
<body>
<!--#include file="_header.html"-->
<!--#include file="_menu.html"-->
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active"><span title="我的桌面" data-href="../WelD.aspx">欢迎页</span><em></em></li>
			</ul>
		</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
	</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="../WelD.aspx"></iframe>
		</div>
	</div>
</section>
<!--#include file="_footer.html"-->

<script type="text/javascript">
/*资讯-添加*/
function article_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*图片-添加*/
function picture_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*产品-添加*/
function product_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
</script> 


    <script>
   
        function loadhtml() { }
    $(function () {
 
//获取当前登录用户基本信息GetCurrentPerson
       
        
        $.ajax({
            type: "post",
            timeout: timeout,
            dataType: "json",
            cache: !0,
            url: "/User/Ajax/GetMenu.ashx?t=" + Math.random(),
            data: {
           
            },
            success: function (rs) {

                var count = parseInt(rs);
               
                var html = '';

                if (count > 0) {

                    html+='  <li><a _href="Center/Person.aspx" data-title="个人资料" href="javascript:void(0)">个人资料</a></li>';
                    html+=' <li><a _href="Center/PersonSY.aspx" data-title="个人收益统计" href="javascript:void(0)">个人收益统计</a></li>';
                    html+='  <li><a _href="Center/PersonSC.aspx" data-title="个人总收入统计" href="javascript:void(0)">个人总收入统计</a></li>';
                    html+='  <li><a _href="Center/PersonZC.aspx" data-title="支出统计" href="javascript:void(0)">支出统计</a></li>';
                    html += ' <li><a _href="Center/PersonYJ.aspx" data-title="业绩统计" href="javascript:void(0)">业绩统计</a></li>';

                    $("#activemenu").html(html);
                } else {

                    html += '  <li><a _href="Center/Person.aspx" data-title="个人资料" href="javascript:void(0)">个人资料</a></li>';
                    html += ' <li><a _href="Center/PersonSY.aspx" data-title="个人收益统计" href="javascript:void(0)">个人收益统计</a></li>';
                    html += '  <li><a _href="Center/PersonZC.aspx" data-title="支出统计" href="javascript:void(0)">支出统计</a></li>';

                    $("#activemenu").html(html);
                }
            },
            error: function (a) {
                handlingException(a)
            }
        })
   
     })
   
</script>
</body>
</html>