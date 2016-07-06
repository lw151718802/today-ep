<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberComplete.aspx.cs" Inherits="RM.Web.User.template.member.MemberComplete" %>


<!DOCTYPE html>

<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
   <!--#include file="../_meta.html"-->
   
</head>
<body>
         <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 会员管理 <span class="c-gray en">&gt;</span> 完善资料 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>

    <div class="page-container">
         <form action="" method="post" class="form form-horizontal" id="form-member-add">
  
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>真实姓名：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="必须填写真实姓名" id="realname" name="realname" datacol="yes" err="真实姓名"
                   checkexpession="ChineseStr">
        </div>
    </div>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>身份证号码：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="请填写身份证号码" id="idno" name="idno" datacol="yes" err="身份证号码"
                   checkexpession="IDCard">
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>银行名称：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="银行名称" id="bankname" name="bankname" datacol="yes" err="银行名称"
                   checkexpession="NotNull">
         </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>开户行：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="请填写开户行" id="bankaddress" name="bankaddress" datacol="yes" err="开户行"
                   checkexpession="NotNull">
        </div>
    </div>


    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>银行卡号：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="请填写银行卡号" id="bankcardno" datacol="yes" err="银行卡号"
                   checkexpession="NotNull">
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">邮箱：</label>
        <div class="formControls col-xs-8 col-sm-9 skin-minimal">
            <input type="text" class="input-text" placeholder="@" name="email" id="email" datacol="yes" err="邮箱"
                   checkexpession="EmailOrNull">
        </div>
    </div>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>手机号码：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="请填写手机号码" class="m-wrap large" id="phone" name="phone" datacol="yes" err="手机号码"
                   checkexpession="Mobile">
        </div>
    </div>

   <div class="row cl">
        <div class="col-xs-8 col-sm-9 col-xs-offset-3 col-sm-offset-2">
            <input class="btn btn-primary radius" type="button" onclick="return submituser();" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
        </div>
    </div>
</form>
    </div>
    <!--_footer 作为公共模版分离出去-->
  <!--#include file="../_footer.html"-->
    <!--/_footer /作为公共模版分离出去-->
    

    <script type="text/javascript">
$(function(){
	

    init();
	
});

function init()
{
    $("#bankcardno").keydown(function (e) {
        if (!isNaN(this.value.replace(/[ ]/g, ""))) {
            this.value = this.value.replace(/\s/g, '').replace(/(\d{4})(?=\d)/g, "$1 ");//四位数字一组，以空格分割
        } else {
            if (e.keyCode == 8) {//当输入非法字符时，禁止除退格键以外的按键输入
                return true;
            } else {
                return false
            }
        }
    });
}

function loadhtml() {
   
}


function submituser()
{
    
    var realname = $("#realname").val();
    var idno = $("#idno").val();
    var bankname = $("#bankname").val();
    var bankaddress = $("#bankaddress").val();
    var bankcardno = $("#bankcardno").val();
    var email = $("#email").val();
    var phone = $("#phone").val();
    //var recman = $("#recman").val();
 

    if (!CheckDataValid('#form-member-add')) {
        return false;
    }
    layer.load(1, { shade: [0.8, '#393D49'] })
    ajaxCompleteUser(realname, idno, bankname, bankaddress, bankcardno, email, phone, bindCompleteUser);
}

function bindCompleteUser(a)
{
    layer.closeAll('loading');
    if (a.res_code == 1) {
        clear();
        
        layer.msg('资料已经完善，请重新登录！', { icon: 6, time: 3000 });
        setInterval(layer_close, 2000);
    } else {
        layer.msg(a.res_msg, { icon: 5 });

    }
    
}


function clear()
{
   $("#realname").val('');
   $("#idno").val('');
   $("#bankname").val('');
   $("#bankaddress").val('');
   $("#bankcardno").val('');
   $("#email").val('');
   $("#phone").val('');
}



</script> 


</body>
</html>