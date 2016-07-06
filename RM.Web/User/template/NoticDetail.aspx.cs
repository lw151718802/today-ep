using RM.Busines;
using RM.Common.DotNetUI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RM.Web.User.template
{
    public partial class NoticDetail : System.Web.UI.Page
    {

        protected string title;
        protected string time;
        protected string content;
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
                title = ht["MsgTitle".ToUpper()].ToString();
                time = ht["CreateDate".ToUpper()].ToString();
                content = ht["MsgContent".ToUpper()].ToString();

             

            }
        }

     
    }
}