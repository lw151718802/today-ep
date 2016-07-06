
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using RM.Busines.DAL;
using RM.Busines.IDAO;
using RM.Common.DotNetBean;
using RM.Common.DotNetCode;
using RM.Common.DotNetUI;

namespace RM.Web.App_Code
{
    public class UserPageBase : Page
    {

        private string _UserID = "";
        private string _UserName = "";
        private string _UserAccount = "";
        protected override void OnLoad(EventArgs e)
        {
            if (RequestSession.GetSessionZSUser() == null)
            {



                Response.Write("<script>parent.document.location.href='/User/login.html';</script>");
            }
            else
            {

                _UserID = RequestSession.GetSessionZSUser().UserId.ToString();
                _UserName = RequestSession.GetSessionZSUser().UserName.ToString();
                _UserAccount = RequestSession.GetSessionZSUser().UserAccount.ToString();
            }
            if (null == this.Session["Token"])
            {
                WebHelper.SetToken();
            }
        
            base.OnLoad(e);
        }

        /// <summary>
        /// 当前登录的用户ID
        /// </summary>
        public string UserID
        {
            get { return _UserID; }
        }

        /// <summary>
        /// 当前登录的用户账户
        /// </summary>
        public string UserAccount
        {
            get { return _UserAccount; }
        }

        /// <summary>
        /// 当前登录的用户姓名
        /// </summary>
        public string UserName
        {
            get { return _UserName; }
        }


    }
}