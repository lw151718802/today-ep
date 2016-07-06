<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZS_UserAuthForm.aspx.cs" Inherits="RM.Web.RMBase.ZS_UserManager.ZS_UserAuthForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>银行卡信息编辑</title>
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
                银行名称：
            </th>
            <td>
                
             <input id="BankName" runat="server" type="text" class="txt" datacol="yes" err="银行名称"
                    checkexpession="NotNull" style="width: 90%" />
            </td>
        </tr>
       <tr>
            <th>
                开户行：
            </th>
            <td>
                
             <input id="BankAddress" runat="server" type="text" class="txt" datacol="yes" err="开户行"
                    checkexpession="NotNull" style="width: 90%" />
            </td>
        </tr>
          <tr>
            <th>
                卡号：
            </th>
            <td>
                
             <input id="BankCardNO" runat="server" type="text" class="txt" datacol="yes" err="卡号"
                    checkexpession="NotNull" style="width: 90%" />
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

    <script>


        $(function () {
             $('#<%=BankCardNO.ClientID %>').keydown(function (e) {
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



        });
    </script>
</body>
</html>
