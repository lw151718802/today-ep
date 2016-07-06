<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZS_UserModify.aspx.cs" Inherits="RM.Web.RMBase.ZS_UserManager.ZS_UserModify" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户信息编辑</title>
    <link href="/Themes/Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/TreeTable/jquery.treeTable.js" type="text/javascript"></script>
    <link href="/Themes/Scripts/TreeTable/css/jquery.treeTable.css" rel="stylesheet"
        type="text/css" />
    <link href="/Themes/Scripts/TreeView/treeview.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/TreeView/treeview.pack.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>


</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" runat="server" id="ISActive" />
    <table border="0" cellpadding="0" cellspacing="0" class="frm">
        <tr>
            <th>
                账号：
            </th>
            <td>
                <input id="Account" runat="server" type="text" class="txt"  disabled="disabled" style="width: 90%"  />
            </td>
        </tr>
        <tr>
            <th>
                真实姓名：
            </th>
            <td>
                <input id="RealName" runat="server" type="text" class="txt" datacol="yes" err="真实姓名"
                    checkexpession="NotNull" style="width: 90%" />
            </td>
        </tr>
        <tr>
            <th>
                手机号码：
            </th>
            <td>
                
             <input id="Phone" runat="server" type="text" class="txt" datacol="yes" err="手机号码"
                    checkexpession="NotNull" style="width: 90%" />
            </td>
        </tr>
       <tr>
            <th>
                身份证号码：
            </th>
            <td>
                
             <input id="IDNO" runat="server" type="text" class="txt" datacol="yes" err="身份证号码"
                    checkexpession="NotNull" style="width: 90%" />
            </td>
        </tr>
        <tr>
            <th>
                邮箱：
            </th>
            <td>
                
             <input id="Email" runat="server" type="text" class="txt" placeholder="@" datacol="yes" err="邮箱"
                   checkexpession="EmailOrNull" />
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
