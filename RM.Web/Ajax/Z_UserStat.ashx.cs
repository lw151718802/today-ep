using RM.Busines.DAL;
using RM.Busines.IDAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace RM.Web.Ajax
{
    /// <summary>
    /// Z_UserStat 的摘要说明
    /// </summary>
    public class Z_UserStat : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.ContentType = "text/plain";
            context.Response.Buffer = true;
            context.Response.ExpiresAbsolute = DateTime.Now.AddDays(-1.0);
            context.Response.AddHeader("pragma", "no-cache");
            context.Response.AddHeader("cache-control", "");
            context.Response.CacheControl = "no-cache";
            string UserAccount = context.Request["account"].Trim();
            ZS_User_IDAO user_idao = new ZS_User_Dal();

            DataSet ds = user_idao.GetDataSetPR_UserBaseStat(UserAccount);



            var obj = new { lgininfo = ds.Tables[0], relname = UserAccount, t1 = ds.Tables[1], t2 = ds.Tables[2], t3 = ds.Tables[3] };



            context.Response.Clear();
            context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(obj));
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