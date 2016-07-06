using RM.Common.DotNetBean;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RM.Web.User.template
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RequestSession.AddSessionZSUser(null);
            Session.Abandon();
            Session.Clear();
            Response.Write("<script>parent.document.location.href='/User/login.html';</script>");
        }
    }
}