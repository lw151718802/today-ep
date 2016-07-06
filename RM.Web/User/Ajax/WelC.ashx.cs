




using RM.Busines;
using RM.Busines.DAL;
using RM.Busines.IDAO;
using RM.Common.DotNetCode;
using RM.Common.DotNetEncrypt;
using RM.Web.User.Model;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace RM.Web.User.Ajax
{
    /// <summary>
    /// checkaccount 的摘要说明
    /// </summary>
    public class WelC : HandleBase
    {



        public override void AjaxProcess(HttpContext context)
        {
           

            SqlParam[] parmAdd = new SqlParam[]
                                {
                                    new SqlParam("@account",UserAccount)
                                };
           DataSet ds = DataFactory.SqlDataBase().ExecuteByProcReturnDataSet("PR_WelCome", parmAdd);


            var obj = new { t1 = ds.Tables[0], t2 = ds.Tables[1], t3 = ds.Tables[2] };



            context.Response.Clear();
            context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(obj));
            context.Response.End();
        }


    }
}