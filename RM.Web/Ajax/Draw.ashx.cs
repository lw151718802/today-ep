using RM.Busines.DAL;
using RM.Busines.IDAO;
using RM.Common.DotNetBean;
using RM.Web.User.Ajax;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RM.Web.Ajax
{
    /// <summary>
    /// Draw 的摘要说明
    /// </summary>
    public class Draw : HandleAdminBase
    {



        public override void AjaxProcess(HttpContext context)
        {

            ZS_User_IDAO user_idao = new ZS_User_Dal();

            int status = int.Parse(context.Request["status"].ToString());
            int id = int.Parse(context.Request["id"].ToString());

            Hashtable ht = new Hashtable();


            ht["ID"] = id;
            ht["DrawStatus "] = status;
            ht["DrawOper"] = RequestSession.GetSessionUser().UserName;
            ht["OUT_Code"] = "";
            ht["OUT_Msg"] = "";


            Hashtable refht = new Hashtable();
            user_idao.CheckMemberDrawByProc(ht, ref refht);


            if (refht["OUT_Code"].ToString() != "200")
            {
                var obj = new { msg = refht["OUT_Msg"].ToString(), code = 201 };
                context.Response.Clear();
                context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(obj));
                context.Response.End();
            }
            else
            {
                var obj = new { msg = refht["OUT_Msg"].ToString(), code = 200 };
                context.Response.Clear();
                context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(obj));
                context.Response.End();
            }

        }


    }
}