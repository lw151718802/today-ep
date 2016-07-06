


using RM.Busines.DAL;
using RM.Busines.IDAO;
using RM.Common.DotNetBean;
using RM.Common.DotNetUI;
using RM.Web.App_Code;
using RM.Web;
using System;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using RM.Web.UserControl;

namespace RM.Web.RMBase.ZSOther
{
    public partial class ZS_Config : PageBase
    {

        private ZS_User_IDAO member_idao = new ZS_User_Dal();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                this.InitBindData();
            }
        }
        private void InitBindData()
        {
            DataTable dt = this.member_idao.GetZS_Config_List();
            ControlBindHelper.BindRepeaterList(dt, this.rp_Item);
        }
    }
}
