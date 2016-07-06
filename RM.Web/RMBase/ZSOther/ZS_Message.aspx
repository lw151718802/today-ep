<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZS_Message.aspx.cs" Inherits="RM.Web.RMBase.ZSOther.ZS_Message" %>

<%@ Register Src="../../UserControl/PageControl.ascx" TagName="PageControl" TagPrefix="uc1" %>
<%@ Register Src="../../UserControl/LoadButton.ascx" TagName="LoadButton" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>消息列表</title>



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
        

          var url = "/RMBase/ZSOther/ZS_MessageForm.aspx" ;
          Urlhref(url);
      }


     

      function edit() {
         

          var key = CheckboxValue();
          if (IsEditdata(key)) {
              var url = "/RMBase/ZSOther/ZS_MessageForm.aspx?key=" + key;;
              Urlhref(url);
          }
      }

     

</script>

</head>
<body>
    <form id="form1" runat="server">
    <div class="btnbartitle">
        <div>
            消息列表
        </div>
    </div>
    <div class="btnbarcontetn">
        <div style="float: left;">
           
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
                    <td style="width: 120px; text-align: center;" >消息类型</td>
                    <td style="width: 600px; text-align: center;" >消息标题</td>
                    <td style="width: 120px; text-align: center;"  >发送时间</td>
                   
                                            
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rp_Item" runat="server" >
                    <ItemTemplate>
                        <tr>
                            <td style="width: 20px; text-align: left;">
                                <input type="checkbox" value="<%#Eval("ID")%>" name="checkbox" />
                            </td>
                            
                          <td  style=" text-align: center;">     <%# Eval("MsgType").ToString() == "1" ? "系统消息" : "个人消息"%> </td>
                           

                            <td style= text-align: center;" ><%#Eval("MsgTitle")%></td>
                            <td style="width: 120px; text-align: center;" ><%#Eval("CreateDate")%></td>
                            
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        <% if (rp_Item != null)
                           {
                               if (rp_Item.Items.Count == 0)
                               {
                                   Response.Write("<tr><td colspan='4' style='color:red;text-align:center'>没有找到您要的相关数据！</td></tr>");
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