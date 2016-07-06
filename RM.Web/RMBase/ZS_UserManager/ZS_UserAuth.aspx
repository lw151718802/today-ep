<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZS_UserAuth.aspx.cs" Inherits="RM.Web.RMBase.ZS_UserManager.ZS_UserAuth" %>


<%@ Register Src="../../UserControl/PageControl.ascx" TagName="PageControl" TagPrefix="uc1" %>
<%@ Register Src="../../UserControl/LoadButton.ascx" TagName="LoadButton" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>会员银行卡信息</title>



<script src="/Themes/Scripts/DatePicker/WdatePicker.js" type="text/javascript"></script>
<link href="/Themes/Styles/Site.css" rel="stylesheet" type="text/css" />
<script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="/Themes/Scripts/jquery.pullbox.js" type="text/javascript"></script>
<script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>



  <script type="text/javascript">
      //回车键

      $(function () {
          $(".div-body").PullBox({ dv: $(".div-body"), obj: $("#table1").find("tr") });
          divresize(100);
          FixedTableHeader("#table1", $(window).height() - 118);
         
      })


      //添加
      function add() {
          var url = "/RMBase/ZS_UserManager/ZS_UserAuthForm.aspx";
          top.openDialog(url, 'ZS_UserForm', '会员银行卡信息 - 添加', 700, 350, 50, 50);
      }
      //修改
      function edit() {
          var key = CheckboxValue();
          if (IsEditdata(key)) {
              var url = "/RMBase/ZS_UserManager/ZS_UserAuthForm.aspx?key=" + key;
              top.openDialog(url, 'ZS_UserForm', '会员银行卡信息 - 编辑', 700, 350, 50, 50);
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
            会员账号:
            <input type="text" id="txt_F" class="txt" runat="server" style="width: 110px;" />
           
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
                    <td style="text-align: center;" >会员账号</td>
                    <td style=" text-align: center;"  >姓名</td>
                    <td style="text-align: center;" >银行名称</td>
                     <td style=" text-align: center;" >开户行</td>
                    <td style="text-align: center;" >卡号</td>
                    <td>提交日期</td>
                    <td>是否默认</td>
                                            
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rp_Item" runat="server" >
                    <ItemTemplate>
                        <tr>
                            <td style="width: 20px; text-align: left;">
                                <input type="checkbox" value="<%#Eval("ID")%>" name="checkbox" />
                            </td>
                            <td style=" text-align: center;"> <%# DataBinder.Eval(Container.DataItem, "Account")%></td>
                            <td  style=" text-align: center;"> <%# DataBinder.Eval(Container.DataItem, "RealName")%></td>
                            <td  style=" text-align: center;">     <%# DataBinder.Eval(Container.DataItem, "BankName")%></td>
                            <td  style=" text-align: center;"> <%# DataBinder.Eval(Container.DataItem, "BankAddress")%></td>
                             <td  style=" text-align: center;">     <%# DataBinder.Eval(Container.DataItem, "BankCardNO")%></td>
                             <td  >     <%# DataBinder.Eval(Container.DataItem, "SubTime")%></td>
                              <td>     <%# Eval("IsDefault").ToString() == "0" ? "非默认" : "默认"%> </td>

                        
                            
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        <% if (rp_Item != null)
                           {
                               if (rp_Item.Items.Count == 0)
                               {
                                   Response.Write("<tr><td colspan='7' style='color:red;text-align:center'>没有找到您要的相关数据！</td></tr>");
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