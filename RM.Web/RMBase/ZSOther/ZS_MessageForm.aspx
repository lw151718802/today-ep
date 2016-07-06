<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZS_MessageForm.aspx.cs" Inherits="RM.Web.RMBase.ZSOther.ZS_MessageForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户信息表单</title>
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
   <script type="text/javascript" src="/Themes/Scripts/ajaxfileupload.js"></script>
   
  <script charset="utf-8" src="/Themes/kindeditor-4.1.10/kindeditor-min.js"></script>
    <script type="text/javascript">
        //返回
        function back() {
            Urlhref('/RMBase/ZSOther/ZS_Message.aspx');
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
  
    <div class="div-frm" >
        <%--基本信息--%>
        <table id="table1" border="0" cellpadding="0" cellspacing="0" class="frm">
             <tr>
                <th>
                    消息标题:
                </th>
                <td colspan="3">
                      <input id="MsgTitle" runat="server" type="text" class="txt"   style="width: 90%"  />
                    
                    </td>
                 </tr>
            <tr>
                <th>
                    消息内容:
                </th>
                <td colspan="3">
                   

                    <textarea id="MsgContent" name="MsgContent" runat="server" style="width:90%;height:600px;"   class="textinput"></textarea>
                         <script type="text/javascript">
                             var editor;
                             KindEditor.ready(function (K) {
                                 editor = K.create('textarea[name="MsgContent"]', {
                                     urlType: 'domain',
                                     allowFileManager: true,
                                     cssPath: '/Themes/kindeditor-4.1.10/plugins/code/prettify.css',
                                     uploadJson: '../../Ajax/upload_json.ashx',
                                     afterBlur: function () { this.sync(); }
                                 });


                             });
                         </script>
                </td>
            </tr>
        </table>
     <div class="frmbottom">
        <asp:LinkButton ID="Save" runat="server" class="l-btn" 
            OnClick="Save_Click"><span class="l-btn-left">
            <img src="/Themes/Images/disk.png" alt="" />保 存</span></asp:LinkButton>
        <a class="l-btn" href="javascript:void(0)" onclick="OpenClose();"><span class="l-btn-left">
            <img src="/Themes/Images/cancel.png" alt="" />关 闭</span></a>
    </div>
    </div>
   
    </form>
</body>
</html>
