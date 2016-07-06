

using RM.Busines;
using RM.Busines.DAL;
using RM.Busines.IDAO;
using RM.Web.User.Model;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RM.Web.User.Ajax
{
    /// <summary>
    /// GetUserInfo 的摘要说明
    /// </summary>
    public class GetMenu : HandleBase
    {



        public override void AjaxProcess(HttpContext context)
        {

            string account = UserAccount;

            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("ZS_User", "Account", account);

            ZS_User_IDAO user_idao = new ZS_User_Dal();

            int count = user_idao.GetUserLow(int.Parse(ht["ID"].ToString()));
            context.Response.Clear();
            context.Response.Write(count);
            context.Response.End();
        }


    }
}