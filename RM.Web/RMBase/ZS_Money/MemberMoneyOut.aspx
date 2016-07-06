<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberMoneyOut.aspx.cs" Inherits="RM.Web.RMBase.ZS_Money.MemberMoneyOut" %>



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
          divresize(100);
          FixedTableHeader("#table1", $(window).height() - 118);
         
      })



</script>

</head>
<body>
    <form id="form1" runat="server">
    <div class="btnbartitle">
        <div>
            支出列表
        </div>
    </div>
    <div class="btnbarcontetn">
        <div style="float: left;">
   <%--101 注册账号扣除  102 提现  103 转出--%>
            <td>会员账号:</td><td><input type="text" id="Account" class="txt" runat="server" style="width: 110px;" /></td>
         
           <td>开始日期:</td> <td><input type="text" id="txtBTime" class="txt" runat="server" style="width: 110px;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></td>
           <td>结束日期:</td> <td><input type="text" id="txtETime" class="txt" runat="server" style="width: 110px;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></td>
            支出类型：<select id="SelState" class="select" runat="server" style="width: 110px">
                <option value="-1" selected="selected">全部</option>
                <option value="101">注册账号扣除</option>
                <option value="102">提现</option>
                <option value="103">转出</option>
                            </select>
            <asp:LinkButton ID="btnQuery" runat="server" class="button green" OnClick="lbtSearch_Click"  ><span class="icon-botton"
            style="background: url('../../Themes/images/Search.png') no-repeat scroll 0px 4px;">
        </span>查 询</asp:LinkButton>
        </div>
        <div style="text-align: right">
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
                    <td style=" text-align: center;" >账号</td>
                    <td style=" text-align: center;"  >金额</td>
                    <td style="text-align: center;" >类型</td>
                     <td style=" text-align: center;" >交易描述</td>
                    <td style=" text-align: center;" >时间</td>
                                            
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rp_Item" runat="server" >
                    <ItemTemplate>
                        <tr>
                            <td style="width: 20px; text-align: left;">
                                <input type="checkbox" value="<%#Eval("ID")%>" name="checkbox" />
                            </td>
                            <td style="text-align: center;"> <%# DataBinder.Eval(Container.DataItem, "Account")%></td>
                             <td  style="text-align: center;"> ￥<%# DataBinder.Eval(Container.DataItem, "U_Money", "{0:N2}")%></td>
                            <td  style=" text-align: center;"> <%# DataBinder.Eval(Container.DataItem, "TypeDesc")%></td>
                            <td  style=" text-align: center;">     <%# DataBinder.Eval(Container.DataItem, "MoneyDesc")%></td>
                            <td  style=" text-align: center;"> <%# DataBinder.Eval(Container.DataItem, "CreateTime")%></td>
                           


                            
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        <% if (rp_Item != null)
                           {
                               if (rp_Item.Items.Count == 0)
                               {
                                   Response.Write("<tr><td colspan='6' style='color:red;text-align:center'>没有找到您要的相关数据！</td></tr>");
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