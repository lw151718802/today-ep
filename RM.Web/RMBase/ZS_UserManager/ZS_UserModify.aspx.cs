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

namespace RM.Web.RMBase.ZS_UserManager
{
    public partial class ZS_UserModify : PageBase
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
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("ZS_User", "ID", this._key);
            if (ht.Count > 0 && ht != null)
            {
                ControlBindHelper.SetWebControls(this.Page, ht);
               
            }
        }


        protected void Save_Click(object sender, EventArgs e)
        {


            int isactive =int.Parse( this.ISActive.Value);

            if (isactive != 1)
            {
                ShowMsgHelper.Alert_Error("该账号未被激活,不能修改！");
                return;
            }
            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);
            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("ZS_User", "ID", this._key, ht);
            if (IsOk)
            {
                ShowMsgHelper.AlertMsg("修改成功！");
            }
            else
            {
                ShowMsgHelper.Alert_Error("修改失败！");
            }
           
        }
    }
}