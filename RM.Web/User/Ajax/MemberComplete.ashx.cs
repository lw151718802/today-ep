using RM.Busines;
using RM.Busines.DAL;
using RM.Busines.IDAO;
using RM.Common.DotNetBean;
using RM.Web.User.Model;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace RM.Web.User.Ajax
{
    /// <summary>
    /// MemberComplete 的摘要说明
    /// </summary>
    public class MemberComplete : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Buffer = true;
            context.Response.ExpiresAbsolute = DateTime.Now.AddDays(-1.0);
            context.Response.AddHeader("pragma", "no-cache");
            context.Response.AddHeader("cache-control", "");
            context.Response.CacheControl = "no-cache";


            string account = RequestSession.GetSessionTAccount();
            if (account == null || account == "")
            {
                context.Response.Write("<script>parent.document.location.href='/User/login.html';</script>");
            }

          
            string realname = context.Request["realname"];
            string idno = context.Request["idno"];
            string bankname = context.Request["bankname"];
            string bankaddress = context.Request["bankaddress"];
            string bankcardno = context.Request["bankcardno"];
            string email = context.Request["email"];
            string phone = context.Request["phone"];

         




            ZS_User_IDAO user_idao = new ZS_User_Dal();
            Hashtable ht = new Hashtable();


         
            ht["Account"] = account;
            ht["RealName"] = realname;
            ht["Phone"] = phone;

            ht["Email"] = email;
            ht["BankName"] = bankname;
            ht["BankAddress"] = bankaddress;
            ht["BankCardNO"] = bankcardno;
            ht["IDNO"] = idno;

            ht["OUT_Code"] = "";
            ht["OUT_Msg"] = "";


            Hashtable refht = new Hashtable();
            user_idao.CompleteMemberByProc(ht, ref refht);




            result model = new result();



            if (refht["OUT_Code"].ToString() == "200")
            {
               
            }
            else
            {
                model.res_code = -101;
                model.res_msg = refht["OUT_Msg"].ToString();
            }




            context.Response.Clear();
            context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(model));
            context.Response.End();

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}