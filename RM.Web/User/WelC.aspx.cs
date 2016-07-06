using RM.Busines;
using RM.Web.App_Code;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RM.Web.User
{
    public partial class WelC : UserPageBase
    {

        protected string _UserName;
        protected string _UserAccount;
        protected string _StateDesc;
        protected void Page_Load(object sender, EventArgs e)
        {
            _UserName = UserName;
            _UserAccount = UserAccount;
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("ZS_User", "Account", UserAccount);

            if (ht["ISActive".ToUpper()].ToString() == "1") { _StateDesc = "激活"; }
            else _StateDesc = "未激活";





        }
    }
}