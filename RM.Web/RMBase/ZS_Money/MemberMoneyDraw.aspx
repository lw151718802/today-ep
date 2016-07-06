<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberMoneyDraw.aspx.cs" Inherits="RM.Web.RMBase.ZS_Money.MemberMoneyDraw" %>


<%@ Register Src="../../UserControl/PageControl.ascx" TagName="PageControl" TagPrefix="uc1" %>
<%@ Register Src="../../UserControl/LoadButton.ascx" TagName="LoadButton" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>会员列表</title>



<script src="/Themes/Scripts/DatePicker/WdatePicker.js" type="text/javascript"></script>
<link href="/Themes/Styles/Site.css" rel="stylesheet" type="text/css" />
<script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="/Themes/Scripts/jquery.pullbox.js" type="text/javascript"></script>
<script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>

    <script type="text/javascript" src="/User/lib/layer/2.1/layer.js"></script>

  <script type="text/javascript">
      //回车键

      $(function () {
          $(".div-body").PullBox({ dv: $(".div-body"), obj: $("#table1").find("tr") });
          divresize(110);
        
         
      })

      function dakuan_click() {
          var key = CheckboxValue();
          if (IsEditdata(key)) {
              var parm = 'status=1&id=' + key;
              showConfirmMsg('注：您确认【已打款】当前选中申请吗？', function (r) {
                  if (r) {
                      getAjax('/Ajax/Draw.ashx', parm, function (rs) {
                          rs = eval('(' + rs + ')');
                          if (rs.code == 200) {
                              showTipsMsg("操作成功！", 2000, 4);
                              windowload();
                          }
                          else {
                              showTipsMsg("<span style='color:red'>"+rs.msg+"</span>", 4000, 5);
                          }
                      });
                  }
              });
          }
      }

      function dahui_click() {
          var key = CheckboxValue();
          if (IsEditdata(key)) {
              var parm = 'status=3&id=' + key;
              showConfirmMsg('注：您确认【打回】当前选中申请吗？', function (r) {
                  if (r) {
                      getAjax('/Ajax/Draw.ashx', parm, function (rs) {
                          rs= eval('(' + rs + ')');
                          if (rs.code == 200) {
                              showTipsMsg("操作成功！", 2000, 4);
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


      function exportXls() {
          
           $('#<%=btnExport.ClientID %>').click();
          return true;
      }

</script>

</head>
<body>
    <form id="form1" runat="server">
    <div class="btnbartitle">
        <div>
            收入列表
        </div>
    </div>
    <div class="btnbarcontetn">
        <div style="float: left;">
    <%--        1 充值   2 销售奖励  3 转入  4 服务奖励  5 固定收益 6 浮动分红 7 运营分红 8 福利分红  9
 管理奖金--%>
      
            会员账号:<input type="text" id="Account" class="txt" runat="server" style="width: 110px;" />
         
        开始日期:<input type="text" id="txtBTime" class="txt" runat="server" style="width: 110px;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
           结束日期:<input type="text" id="txtETime" class="txt" runat="server" style="width: 110px;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
         <%--   0 待审核  1 审核通过 3 打回 4 撤销--%>
             提现状态： <select id="DrawStatus" class="select" runat="server" style="width: 110px"><option value="0">待审核</option><option value="1">已打款</option>
                          <option value="3">打回</option>    <option value="4">用户撤销</option> </select>
            <asp:LinkButton ID="btnQuery" runat="server" class="button green" OnClick="lbtSearch_Click"  ><span class="icon-botton"
            style="background: url('../../Themes/images/Search.png') no-repeat scroll 0px 4px;">
        </span>查 询</asp:LinkButton>
        </div>
        <div style="text-align: right">
            <asp:Button  id= "btnExport" runat="server"  Style="display: none" onclick="btnExport_Click"  />
            <uc2:LoadButton ID="LoadButton1" runat="server" />
        </div>
    </div>
    <div class="div-body">
        <table id="table1" class="grid" singleselect="true">
            <thead>
                <tr>
                    <td style="width: 20px; text-align: left;">
                        <label id="checkAllOff" onclick="CheckAllLine()" title="全选">
                            &nbsp;</label>
                    </td>
                    <td style=" text-align: center;" width="50">账号</td>
                    <td style="text-align: center;" width="80">账户名称</td>
                    <td style="text-align: center;" width="80">银行名称</td>
                    <td style="text-align: center;" width="150">支行名称</td>
                    <td style="text-align: center;" width="120">卡号</td>
                    <td style="text-align: center;" width="120">提现金额</td>
                    <td style="text-align: center;" width="120">手续费</td>
                    <td style="text-align: center;" width="120">到账金额</td>
                    <td style="text-align: center;" width="80">状态</td>
                    <td style="text-align: center;" width="120">申请时间</td>
                    <td style="text-align: center;" width="120">处理时间</td>

                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rp_Item" runat="server" >
                    <ItemTemplate>
                        <tr>
                            <td style="width: 20px; text-align: left;">
                                <input type="checkbox" value="<%#Eval("ID")%>" name="checkbox" />
                            </td>
                            <td style="text-align: center;" width="50"> <%# DataBinder.Eval(Container.DataItem, "Account")%></td>
                           
                            <td  style=" text-align: center;" width="80"> <%# DataBinder.Eval(Container.DataItem, "RealName")%></td>
                            <td  style=" text-align: center;" width="80">     <%# DataBinder.Eval(Container.DataItem, "BankName")%></td>
                             <td  style=" text-align: center;" width="150">     <%# DataBinder.Eval(Container.DataItem, "BandAddress")%></td>
                            <td  style=" text-align: center;" width="120"> <%# DataBinder.Eval(Container.DataItem, "BandCardNO")%></td>
                            
                             <td  style="text-align: center;" width="120"> ￥<%# DataBinder.Eval(Container.DataItem, "DrawSumMoney", "{0:N2}")%></td>
                            
                             <td  style="text-align: center;" width="120"> ￥<%# DataBinder.Eval(Container.DataItem, "DrawFeeMoney", "{0:N2}")%></td>
                            
                             <td  style="text-align: center;" width="120"> ￥<%# DataBinder.Eval(Container.DataItem, "DrawRealMoney", "{0:N2}")%></td>
                             <td  style=" text-align: center;" width="80">   <%# DataBinder.Eval(Container.DataItem, "DrawStatusDesc")%> </td>

                             <td  style=" text-align: center;" width="120"> <%# DataBinder.Eval(Container.DataItem, "DrawTime")%></td>
                            <td  style=" text-align: center;" width="120">     <%# DataBinder.Eval(Container.DataItem, "DrawOverTime")%></td>
                          

                            
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        <% if (rp_Item != null)
                           {
                               if (rp_Item.Items.Count == 0)
                               {
                                   Response.Write("<tr><td colspan='12' style='color:red;text-align:center'>没有找到您要的相关数据！</td></tr>");
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