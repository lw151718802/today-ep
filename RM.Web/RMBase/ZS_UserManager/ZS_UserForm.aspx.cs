using RM.Busines;
using RM.Busines.DAL;
using RM.Busines.IDAO;
using RM.Common.DotNetBean;
using RM.Common.DotNetCode;
using RM.Common.DotNetConfig;
using RM.Common.DotNetEncrypt;
using RM.Common.DotNetUI;
using RM.Web.App_Code;
using System;
using System.Collections;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
namespace RM.Web.RMBase.ZS_UserManager
{
    public partial class ZS_UserForm : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Save_Click(object sender, EventArgs e)
        {


            ZS_User_IDAO user_idao = new ZS_User_Dal();
            Hashtable ht = new Hashtable();


          
            ht["RecMan"] = this.RecMan.Value.Trim();


            ht["PWDA"] = Md5Helper.MD5(ConfigHelper.GetAppSettings("PWDA"), 32);
            ht["PWDB"] = Md5Helper.MD5(ConfigHelper.GetAppSettings("PWDB"), 32);

            ht["OUT_UserAccount"] = "";
            ht["OUT_Code"] = "";
            ht["OUT_Msg"] = "";


            Hashtable refht = new Hashtable();
            user_idao.Add_UserBySystemByProc(ht, ref refht);


            if (refht["OUT_Code"].ToString() == "200")
            {
                ShowMsgHelper.AlertMsg("操作成功！账号"+ refht["OUT_UserAccount"].ToString());
            }
            else
            {
                ShowMsgHelper.Alert_Error("操作失败！原因 ："+ refht["OUT_Msg"].ToString());
            }


        }
    }
}