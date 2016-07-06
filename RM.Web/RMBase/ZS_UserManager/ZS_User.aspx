<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZS_User.aspx.cs" Inherits="RM.Web.RMBase.ZS_UserManager.ZS_User" %>

<%@ Register Src="../../UserControl/PageControl.ascx" TagName="PageControl" TagPrefix="uc1" %>
<%@ Register Src="../../UserControl/LoadButton.ascx" TagName="LoadButton" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>会员列表</title>



<script src="/Themes/Scripts/DatePicker/WdatePicker.js" type="text/javascript"></script>
<link href="/Themes/Styles/Site.css?v=2" rel="stylesheet" type="text/css" />
<script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="/Themes/Scripts/jquery.pullbox.js" type="text/javascript"></script>
<script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>

    <script type="text/javascript" src="/User/lib/layer/2.1/layer.js"></script>

  <script type="text/javascript">
      //回车键

      $(function () {
          $(".div-body").PullBox({ dv: $(".div-body"), obj: $("#table1").find("tr") });
          divresize(120);
         
      })


      //添加
      function add() {
          var url = "/RMBase/ZS_UserManager/ZS_UserForm.aspx";
          top.openDialog(url, 'ZS_UserForm', '空账号 - 添加', 400, 80, 50, 50);
      }


      //授 权
      function accredit() {
          var key = CheckboxValue();
          if (IsEditdata(key)) {
              var parm = 'action=accredit&user_ID=' + key;
              showConfirmMsg('注：您确认要【授 权】当前选中用户吗？', function (r) {
                  if (r) {
                      getAjax('/Ajax/UserInfo.ashx', parm, function (rs) {
                          if (parseInt(rs) > 0) {
                              showTipsMsg("恭喜授权成功！", 2000, 4);
                              windowload();
                          }
                          else {
                              showTipsMsg("<span style='color:red'>授权失败，请稍后重试！</span>", 4000, 5);
                          }
                      });
                  }
              });
          }
      }
      //锁 定
      function lock() {
          var key = CheckboxValue();
          if (IsEditdata(key)) {
              var parm = 'action=lock&user_ID=' + key;
              showConfirmMsg('注：您确认要【锁 定】当前选中用户吗？', function (r) {
                  if (r) {
                      getAjax('/Ajax/UserInfo.ashx', parm, function (rs) {
                          if (parseInt(rs) > 0) {
                              showTipsMsg("锁定成功！", 2000, 4);
                              windowload();
                          }
                          else {
                              showTipsMsg("<span style='color:red'>锁定失败，请稍后重试！</span>", 4000, 5);
                          }
                      });
                  }
              });
          }
      }
     

      function edit() {
          var key = CheckboxValue();
          if (IsEditdata(key)) {
              var url = "/RMBase/ZS_UserManager/ZS_UserModify.aspx?key=" + key;
              top.openDialog(url, 'ZS_UserModify', '账号信息 - 编辑', 450, 240, 50, 50);
          }
      }

      function active_click()
      {
          var key = CheckboxValue();
          if (IsEditdata(key)) {
              var parm = 'action=jihuo&user_ID=' + key;
              showConfirmMsg('注：您确认要【激活】当前选中账户吗？', function (r) {
                  if (r) {
                      getAjax('/Ajax/UserInfo.ashx', parm, function (rs) {
                          rs = eval('(' + rs + ')');
                          if (rs.code == 200) {
                              showTipsMsg("激活成功！", 2000, 4);
                              windowload();
                          }
                          else {
                              showTipsMsg("<span style='color:red'>激活失败 ，" + rs.msg + "</span>", 4000, 5);
                          }
                      });
                  }
              });
          }
      }



      //密码重置
      function reset_pwd() {
          var key = CheckboxValue();
          if (IsEditdata(key)) {
              var parm = 'action=resetpwd&user_ID=' + key;
              showConfirmMsg('注：您确认要【重置密码包括二级密码】当前选中账户吗？', function (r) {
                  if (r) {
                      getAjax('/Ajax/UserInfo.ashx', parm, function (rs) {
                          rs = eval('(' + rs + ')');
                          if (rs.code == 200) {
                              showTipsMsg(rs.msg, 2000, 4);
                              windowload();
                          }
                          else {
                              showTipsMsg("<span style='color:red'>" + rs.msg + "</span>", 4000, 5);
                          }

                      });
                  }
              });
          }
      }


      //删除
      function Delete() {
          var key = CheckboxValue();
          if (IsEditdata(key)) {
              var parm = 'action=del&user_ID=' + key;
              showConfirmMsg('注：您确认要删除当前选中账户吗？', function (r) {
                  if (r) {
                      getAjax('/Ajax/UserInfo.ashx', parm, function (rs) {

                          rs = eval('(' + rs + ')');
                          if (rs.code == 200) {
                              showTipsMsg("删除成功！", 2000, 4);
                              windowload();
                          }
                          else {
                              showTipsMsg("<span style='color:red'>" + rs.msg + "</span>", 4000, 5);
                          }

                      
                      });
                  }
              });
          }

      }

</script>

</head>
<body>
    <form id="form1" runat="server">
    <div class="btnbartitle">
        <div>
            会员列表
        </div>
    </div>
    <div class="btnbarcontetn">
        <div style="float: left;">
              <table>
                  <tr>
                      <td> 会员账号:</td> <td> <input type="text" id="txt_F" class="txt" runat="server" style="width: 110px;" /></td>
                      <td> 手机号:</td> <td> <input type="text" id="Phone" class="txt" runat="server" style="width: 110px;" /></td>
                      <td>  推荐人账号:</td><td> <input type="text" id="RecMan" class="txt" runat="server" style="width: 110px;" /></td>
                      <td> 注册时间:</td><td> <input type="text" id="txtTime" class="txt" runat="server" style="width: 110px;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></td>

                  </tr>
                  <tr>
                      <td>激活状态：</td><td> <select id="SelState" class="select" runat="server" style="width: 110px"><option value="-1" selected="selected">全部</option><option value="1">激活</option><option value="0">未激活</option>
                            </select></td>
                       <td>账号类型：</td><td> <select id="selType" class="select" runat="server" style="width: 110px"><option value="-1" selected="selected">全部</option><option value="1">报单产生</option><option value="2">系统生成</option>
                            </select></td>
 <td>锁定状态：</td><td>  <select id="selISUsed" class="select" runat="server" style="width: 110px"><option value="-1" selected="selected">全部</option><option value="1">正常</option><option value="0">锁定</option>
                            </select></td>
 <td> <asp:LinkButton ID="btnQuery" runat="server" class="button green" OnClick="lbtSearch_Click"  ><span class="icon-botton"
            style="background: url('../../Themes/images/Search.png') no-repeat scroll 0px 4px;">
        </span>查 询</asp:LinkButton></td><td></td>

                  </tr>
              </table>

           
           
           
           
           
            
           
           
           
           
           
           
        </div>
        <div style="text-align: right">
            <uc2:LoadButton ID="LoadButton1" runat="server" />
        </div>
    </div>
    <div class="div-body" >
        <table id="table1" class="grid" singleselect="true" >
            <thead>
                <tr>
                    <td style="width: 20px; text-align: left;">
                        <label id="checkAllOff" onclick="CheckAllLine()" title="全选">
                            &nbsp;</label>
                    </td>
                    <td style="width: 120px; text-align: center;" >账号</td>
                    <td style="width: 120px; text-align: center;" >账号类型</td>
                    <td style="width: 120px; text-align: center;"  >姓名</td>
                    <td style="width: 120px; text-align: center;" >手机号码</td>
                     <td style="width: 120px; text-align: center;" >推荐人</td>
                    <td style= "width: 120px;text-align: center;" >注册金额（元）</td>
                      <td style= "width: 120px;text-align: center;" >可用金额（元）</td>
                    
                    <td style= "width: 120px;text-align: center;"  >直系业绩（元）</td>
                    <td  style= "width: 120px;text-align: center;" >旁系业绩（元）</td>
                    <td style="width: 120px; text-align: center;" >上月业绩（元）</td>
                    <td style="width: 120px; text-align: center;"  >本月业绩（元）</td>
                    <td  style="width: 120px; text-align: center;" >激活状态</td>
                     <td  style="width: 120px; text-align: center;" >锁定状态</td>
                    <td style="width: 120px; text-align: center;" >注册日期</td>
                 
                                            
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rp_Item" runat="server" >
                    <ItemTemplate>
                        <tr>
                            <td style="width: 20px; text-align: left;">
                                <input type="checkbox" value="<%#Eval("ID")%>" name="checkbox" />
                            </td>
                            <td style=" text-align: center;"> <a href="javascript:layer_show('会员信息','UserStatInfo.aspx?ac=<%#Eval("Account")%>')"> <%# DataBinder.Eval(Container.DataItem, "Account")%></a></td>
                               <td  style=" text-align: center;">     <%# Eval("UserType").ToString() == "1" ? "报单产生" : "系统生成"%> </td>
                             <td  style=" text-align: center;"> <%# DataBinder.Eval(Container.DataItem, "RealName")%></td>
                            <td  style=" text-align: center;">     <%# DataBinder.Eval(Container.DataItem, "Phone")%></td>
                            <td  style=" text-align: center;"> <%# DataBinder.Eval(Container.DataItem, "RecMan")%></td>
                            <td  style=" text-align: center;">￥ <%#DataBinder.Eval(Container.DataItem, "RegMoney", "{0:N0}")%></td>
                                   <td  style=" text-align: center;">￥ <%#DataBinder.Eval(Container.DataItem, "usermoney", "{0:N0}")%></td>
                            
                            <td  style= "text-align: center;"> ￥<%# DataBinder.Eval(Container.DataItem, "ZXYJ", "{0:N2}")%></td>
                             <td  style=" text-align: center;">￥<%# DataBinder.Eval(Container.DataItem, "PXYJ", "{0:N2}")%></td>
                            <td  style= "text-align: center;"> ￥<%# DataBinder.Eval(Container.DataItem, "PERYJ", "{0:N2}")%></td>
                             <td  style"= text-align: center;">￥<%# DataBinder.Eval(Container.DataItem, "CURYJ", "{0:N2}")%></td>
                            <td  style=" text-align: center;">     <%# Eval("ISActive").ToString() == "0" ? "未激活" : "激活"%> </td>

                              <td  style=" text-align: center;">     <%# Eval("ISUsed").ToString() == "0" ? "锁定" : "正常"%> </td>

                            <td  ><%#Eval("RegDate")%></td>
                          
                            
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        <% if (rp_Item != null)
                           {
                               if (rp_Item.Items.Count == 0)
                               {
                                   Response.Write("<tr><td colspan='16' style='color:red;text-align:center'>没有找到您要的相关数据！</td></tr>");
                               }
                           } %>
                    </FooterTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
    <uc1:PageControl ID="PageControl1" runat="server" />
   


    </form>
</body>
</html>