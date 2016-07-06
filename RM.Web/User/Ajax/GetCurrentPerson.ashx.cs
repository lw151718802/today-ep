

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
    public class GetCurrentPerson : HandleBase
    {



        public override void AjaxProcess(HttpContext context)
        {
            ZS_User_IDAO user_idao = new ZS_User_Dal();
            string account = UserAccount;

            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("ZS_User", "Account", account);
            //Hashtable ht_01 = DataFactory.SqlDataBase().GetHashtableById("ZS_UserAuth", "Account", account);
            Hashtable ht_01 = user_idao.GetZS_UserBankInfo(UserAccount);


            ZS_User _model = new ZS_User();


            string RealName = UserName;
            string BankName = "";
            string BankAddress = "";
            string BankCardNO = "";
            if (ht_01 != null && ht_01.Count > 0)
            {
                RealName = ht_01["RealName".ToUpper()].ToString();
                BankName = ht_01["BankName".ToUpper()].ToString();
                BankAddress = ht_01["BankAddress".ToUpper()].ToString();
                BankCardNO = ht_01["BankCardNO".ToUpper()].ToString();
            }


            if (ht.Count > 0 && ht != null)
            {

                //ht["ISUsed".ToUpper()].ToString()
                _model.RealName = ht["RealName".ToUpper()].ToString();
                _model.ISActive = int.Parse(ht["ISActive".ToUpper()].ToString());
                _model.Account = ht["Account".ToUpper()].ToString();
                _model.RegMoney = int.Parse(ht["RegMoney".ToUpper()].ToString()) / 10000;
                _model.RegDate = DateTime.Parse(ht["RegDate".ToUpper()].ToString());
                _model.RecMan = ht["RecMan".ToUpper()].ToString();
                _model.Phone = ht["Phone".ToUpper()].ToString();
                _model.IDNO = ht["IDNO".ToUpper()].ToString();
                _model.Email = ht["Email".ToUpper()].ToString();

                
                _model.BankName = BankName;
                _model.BankAddress = BankAddress;
                _model.BankCardNO = BankCardNO;
                try
                {
                    _model.ActiveDate = DateTime.Parse(ht["ActiveDate".ToUpper()].ToString());
                }
                catch { }


            }
            else
            {

            }
            context.Response.Clear();
            context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(_model));
            context.Response.End();
        }


    }
}