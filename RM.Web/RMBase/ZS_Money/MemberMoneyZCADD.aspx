<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberMoneyZCADD.aspx.cs" Inherits="RM.Web.RMBase.ZS_Money.MemberMoneyZCADD" %>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>添加账号信息</title>
    <link href="/Themes/Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
  
</head>
<body>
    <form id="form1" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" class="frm">
    <tr>
            <th>
                充值账号：
            </th>
            <td>
                <input id="Account" runat="server" type="text" class="txt" datacol="yes" err="充值账号"
                        checkexpession="NotNull" style="width: 200px"
                     />
            </td>
        </tr>
       
         <tr>
            <th>
                充值金额：
            </th>
            <td>
                <input id="Money" runat="server" type="text" class="txt"  datacol="yes" err="充值金额"
                        checkexpession="NumOrNull"  style="width: 200px"  />
            </td>
        </tr>
        
       
    </table>
    <div class="frmbottom">
        <asp:LinkButton ID="Save" runat="server" class="l-btn" OnClientClick="return CheckDataValid('#form1');"
            OnClick="Save_Click"><span class="l-btn-left">
            <img src="/Themes/Images/disk.png" alt="" />保 存</span></asp:LinkButton>
        <a class="l-btn" href="javascript:void(0)" onclick="OpenClose();"><span class="l-btn-left">
            <img src="/Themes/Images/cancel.png" alt="" />关 闭</span></a>
    </div>
    </form>
</body>
</html>