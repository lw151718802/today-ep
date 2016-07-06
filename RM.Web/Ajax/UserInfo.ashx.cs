using RM.Busines;
using RM.Busines.DAL;
using RM.Busines.IDAO;
using RM.Common.DotNetConfig;
using RM.Common.DotNetEncrypt;
using RM.Web.User.Ajax;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RM.Web.Ajax
{
    /// <summary>
    /// UserInfo 的摘要说明
    /// </summary>
    public class UserInfo : HandleAdminBase
    {



        public override void AjaxProcess(HttpContext context)
        {

            string Action = context.Request["action"];
            string user_ID = context.Request["user_ID"];
            Hashtable ht = new Hashtable();
            string text = Action;
            if (text != null)
            {

                if (text == "resetpwd")
                {
                    ResetPwd(context);
                    return;
                }
                if (text == "jihuo")
                {
                    JiHuo(context);
                    return;
                }

                if (text == "del")
                {
                    DelUser(context);
                    return;
                }


                if (!(text == "accredit"))
                {
                    if (text == "lock")
                    {
                        ht["ISUsed"] = 0;
                        int Return = DataFactory.SqlDataBase().UpdateByHashtable("ZS_User", "ID", user_ID, ht);
                        context.Response.Write(Return.ToString());
                    }
                }
                else
                {
                    ht["ISUsed"] = 1;
                    int Return = DataFactory.SqlDataBase().UpdateByHashtable("ZS_User", "ID", user_ID, ht);
                    context.Response.Write(Return.ToString());
                }
            }
        }


        private void ResetPwd(HttpContext context)
        {
            string user_ID = context.Request["user_ID"];

            Hashtable ht = new Hashtable();
            ht["PWDA"] = Md5Helper.MD5(ConfigHelper.GetAppSettings("PWDA"), 32);
            ht["PWDB"] = Md5Helper.MD5(ConfigHelper.GetAppSettings("PWDB"), 32);
            int Return = DataFactory.SqlDataBase().UpdateByHashtable("ZS_User", "ID", user_ID, ht);

            var obj = new { msg = "密码重置成功，登录初始密码"+ ConfigHelper.GetAppSettings("PWDA")+ "二级初始密码" + ConfigHelper.GetAppSettings("PWDB"), code = Return };
            context.Response.Clear();
            context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(obj));
            context.Response.End();
            return;
        }


        private void DelUser(HttpContext context)
        {
            string user_ID = context.Request["user_ID"];


            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("ZS_User", "ID", user_ID);


            string account = ht["Account".ToUpper()].ToString();
            string UserType = ht["UserType".ToUpper()].ToString();
            string ISActive = ht["ISActive".ToUpper()].ToString();

            if (ISActive == "1")
            {
                var obj = new { msg = "该账号已经被激活,不能删除", code = 201 };
                context.Response.Clear();
                context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(obj));
                context.Response.End();
                return;
            }



            Hashtable htP = new Hashtable();


            htP["account"] = account;

            htP["OUT_Code"] = "";
            htP["OUT_Msg"] = "";

            ZS_User_IDAO user_idao = new ZS_User_Dal();
            Hashtable refht = new Hashtable();

            user_idao.DEL_AccountByProc(htP, ref refht);


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

        private void JiHuo(HttpContext context)
        {
            string user_ID = context.Request["user_ID"];


            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("ZS_User", "ID", user_ID);


            string account = ht["Account".ToUpper()].ToString();
            string UserType = ht["UserType".ToUpper()].ToString();
            string ISActive = ht["ISActive".ToUpper()].ToString();

            if (UserType == "2")
            {
                var obj = new { msg ="该账号不能被激活", code = 201 };
                context.Response.Clear();
                context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(obj));
                context.Response.End();
                return;
            }
            if (ISActive == "1")
            {
                var obj = new { msg = "该账号已经被激活", code = 201 };
                context.Response.Clear();
                context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(obj));
                context.Response.End();
                return;
            }
            Hashtable htA = new Hashtable();
            htA["account"] = account;
            DataFactory.SqlDataBase().ExecuteByProc("PR_ForzeRemove", htA);
            var objk = new { msg = "激活成功", code = 200 };
            context.Response.Clear();
            context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(objk));
            context.Response.End();
        }



    }
}