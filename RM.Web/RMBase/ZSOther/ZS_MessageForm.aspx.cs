using RM.Busines;
using RM.Busines.DAL;
using RM.Busines.IDAO;
using RM.Common.DotNetBean;
using RM.Common.DotNetCode;
using RM.Common.DotNetData;
using RM.Common.DotNetEncrypt;
using RM.Common.DotNetUI;
using RM.Web.App_Code;
using System;
using System.Collections;
using System.Data;
using System.Text;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace RM.Web.RMBase.ZSOther
{
    public partial class ZS_MessageForm : PageBase
    {
        private string _key;
        protected void Page_Load(object sender, EventArgs e)
        {
            this._key = base.Request["key"];

            if (!base.IsPostBack)
            {
                if (!string.IsNullOrEmpty(this._key))
                {
                    this.InitData();
                }
            }

        }


        private void InitData()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("ZS_Msg", "ID", this._key);
            if (ht.Count > 0 && ht != null)
            {
                ControlBindHelper.SetWebControls(this.Page, ht);

            }
        }



        protected void Save_Click(object sender, EventArgs e)
        {


         
            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);
            if (!string.IsNullOrEmpty(this._key))
            {

                
            }
            else
            {
               ht["MsgType"] = 1;
               ht["CreateDate"] =System.DateTime.Now;
               ht["CreateUserId"] = RequestSession.GetSessionUser().UserId;
               ht["CreateUserName"] = RequestSession.GetSessionUser().UserName;
            }
            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("ZS_Msg", "ID", this._key, ht);
            if (IsOk)
            {
                ShowMsgHelper.ShowScript("back();showTipsMsg('操作成功！','2500','4');");
            }
            else
            {
                ShowMsgHelper.Alert_Error("操作失败！");
            }

        }
    }
}