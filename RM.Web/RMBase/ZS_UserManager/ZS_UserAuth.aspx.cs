﻿
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
    public partial class ZS_UserAuth : PageBase
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
                SqlWhere.Append(" and Account like @Account ");
                IList_param.Add(new SqlParam("@Account", '%' + this.txt_F.Value.Trim() + '%'));

            }
           

            DataTable dt = this.member_idao.GetZS_UserAuthPage(SqlWhere, IList_param, this.PageControl1.PageIndex, this.PageControl1.PageSize, ref count);
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



