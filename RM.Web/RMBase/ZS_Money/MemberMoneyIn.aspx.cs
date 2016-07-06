
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

namespace RM.Web.RMBase.ZS_Money
{
    public partial class MemberMoneyIn : PageBase
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
            if (!string.IsNullOrEmpty(this.Account.Value))
            {
                SqlWhere.Append(" and Account like @Account ");
                IList_param.Add(new SqlParam("@Account", '%' + this.Account.Value.Trim() + '%'));

            }
       
          


            if (this.txtBTime.Value.Trim() != "")
            {
                SqlWhere.Append(" and CreateTime >= @Btime ");
                IList_param.Add(new SqlParam("@Btime", this.txtBTime.Value.Trim()+ " 00:00:00"));

            }

            if (this.txtETime.Value.Trim() != "")
            {
                SqlWhere.Append(" and CreateTime <= @Etime ");
                IList_param.Add(new SqlParam("@Etime", this.txtETime.Value.Trim() + " 23:59:59"));

            }
            if (SelState.SelectedIndex > 0)
            {
                SqlWhere.Append(" and MoneyType = @MoneyType ");
                IList_param.Add(new SqlParam("@MoneyType", SelState.Items[SelState.SelectedIndex].Value));
            }

            

            SqlWhere.Append(" and U_Money > @U_Money");
            IList_param.Add(new SqlParam("@U_Money", 0));
            DataTable dt = this.member_idao.GetUserMoneyFlowPage(SqlWhere, IList_param, this.PageControl1.PageIndex, this.PageControl1.PageSize, ref count);
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



