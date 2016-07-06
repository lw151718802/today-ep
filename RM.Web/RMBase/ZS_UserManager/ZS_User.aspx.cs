using RM.Busines.DAL;
using RM.Busines.IDAO;
using RM.Common.DotNetCode;
using RM.Common.DotNetUI;
using RM.Web.App_Code;
using RM.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using RM.Web.UserControl;

namespace RM.Web.RMBase.ZS_UserManager
{
    public partial class ZS_User : PageBase
    {
        private ZS_User_IDAO member_idao = new ZS_User_Dal();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.PageControl1.pageHandler += new EventHandler(this.pager_PageChanged);
            if (!base.IsPostBack)
            {
              //  CommonData.BindMobileType(this.ddlQueryType);

            }

        }

        #region IListPage 成员


        protected void pager_PageChanged(object sender, EventArgs e)
        {
            this.DataBindGrid();
        }
        private void DataBindGrid()
        {
            int count = 0;
            StringBuilder SqlWhere = new StringBuilder();
            IList<SqlParam> IList_param = new List<SqlParam>();
            if (!string.IsNullOrEmpty(this.txt_F.Value))
            {
                SqlWhere.Append(" and a.Account like @Account ");
                IList_param.Add(new SqlParam("@Account", '%' + this.txt_F.Value.Trim() + '%'));

            }
            if (!string.IsNullOrEmpty(this.txtTime.Value))
            {



                SqlWhere.Append(" and  DATEDIFF(DAY,RegDate, @RegDate)=0 ");
                IList_param.Add(new SqlParam("@RegDate", CommonHelper.GetDateTime(this.txtTime.Value)));
            }


            if (!string.IsNullOrEmpty(this.Phone.Value))
            {
                SqlWhere.Append(" and Phone like @Phone ");
                IList_param.Add(new SqlParam("@Phone", '%' + this.Phone.Value.Trim() + '%'));

            }

            if (!string.IsNullOrEmpty(this.RecMan.Value))
            {
                SqlWhere.Append(" and RecMan like @RecMan ");
                IList_param.Add(new SqlParam("@RecMan", '%' + this.RecMan.Value.Trim() + '%'));

            }



            if (SelState.SelectedIndex > 0)
            {
                SqlWhere.Append(" and ISActive = @ISActive ");
                IList_param.Add(new SqlParam("@ISActive", SelState.Items[SelState.SelectedIndex].Value));
            }

            if (selType.SelectedIndex > 0)
            {
                SqlWhere.Append(" and UserType = @UserType ");
                IList_param.Add(new SqlParam("@UserType", selType.Items[selType.SelectedIndex].Value));
            }
            if (selISUsed.SelectedIndex > 0)
            {
                SqlWhere.Append(" and ISUsed = @ISUsed ");
                IList_param.Add(new SqlParam("@ISUsed", selISUsed.Items[selISUsed.SelectedIndex].Value));
            }


            
            DataTable dt = this.member_idao.GetZS_UserPage(SqlWhere, IList_param, this.PageControl1.PageIndex, this.PageControl1.PageSize, ref count);
            ControlBindHelper.BindRepeaterList(dt, this.rp_Item);
            this.PageControl1.RecordCount = Convert.ToInt32(count);
        }
        protected void lbtSearch_Click(object sender, EventArgs e)
        {
            this.PageControl1.PageIndex = 1;
            this.DataBindGrid();

            this.PageControl1.PageChecking();
        }



        #endregion



        #region 定义方法



        protected override void OnInit(EventArgs e)
        {
            this.rp_Item.ItemDataBound += new RepeaterItemEventHandler(Repeater_ItemDataBound);
            base.OnInit(e);
        }
        protected void Repeater_ItemDataBound(object source, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
             

            }
        }



        #endregion
    }
}



