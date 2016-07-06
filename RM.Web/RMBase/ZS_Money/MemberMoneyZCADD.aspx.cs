
using RM.Busines;
using RM.Busines.DAL;
using RM.Busines.IDAO;
using RM.Common.DotNetBean;
using RM.Common.DotNetCode;
using RM.Common.DotNetEncrypt;
using RM.Common.DotNetUI;
using RM.Web.App_Code;
using System;
using System.Collections;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
namespace RM.Web.RMBase.ZS_Money
{
    public partial class MemberMoneyZCADD : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Save_Click(object sender, EventArgs e)
        {


           


            ZS_User_IDAO user_idao = new ZS_User_Dal();
            Hashtable ht = new Hashtable();

            string account = this.Account.Value.Trim();

            decimal money = decimal.Parse( this.Money.Value.Trim());


            if (account == "") { ShowMsgHelper.AlertMsg("操作成功！账号不能为空");return; }
            if (money <0) { ShowMsgHelper.AlertMsg("操作成功！充值金额不能小于0"); return; }

            ht["czpwd"] = "";


            ht["account"] = account;
            ht["money"] = money;
            ht["operuser"] = RequestSession.GetSessionUser().UserName;


            ht["OUT_Code"] = "";
            ht["OUT_Msg"] = "";


            Hashtable refht = new Hashtable();
            user_idao.Add_PR_MemberCZByProc(ht, ref refht);


            if (refht["OUT_Code"].ToString() == "200")
            {
                ShowMsgHelper.AlertMsg("充值成功！");
            }
            else
            {
                ShowMsgHelper.Alert_Error("操作失败！原因 ：" + refht["OUT_Msg"].ToString());
            }


        }
    }
}