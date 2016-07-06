using RM.Busines.IDAO;
using RM.Common.DotNetBean;
using RM.Common.DotNetCode;
using RM.Common.DotNetData;
using RM.Common.DotNetEncrypt;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace RM.Busines.DAL
{
    public   class ZS_User_Dal:ZS_User_IDAO
    {

        public DataTable UserLogin(string name, string pwd)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("Select * from ZS_User where ");
            strSql.Append("Account=@User_Account ");
            strSql.Append("and PWDA=@User_Pwd ");
            strSql.Append("and ISUsed = 1 ");
            SqlParam[] para = new SqlParam[]
            {
                new SqlParam("@User_Account", name),
                new SqlParam("@User_Pwd", Md5Helper.MD5(pwd, 32))
            };
            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql, para);
        }


        public DataTable CheckRePWD(string name, string pwd)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("Select * from ZS_User where ");
            strSql.Append("Account=@User_Account ");
            strSql.Append("and PWDB=@User_Pwd ");
            strSql.Append("and ISUsed = 1 ");
            SqlParam[] para = new SqlParam[]
            {
                new SqlParam("@User_Account", name),
                new SqlParam("@User_Pwd", Md5Helper.MD5(pwd, 32))
            };
            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql, para);
        }



        public void SysLoginLog(string SYS_USER_ACCOUNT, string SYS_LOGINLOG_STATUS, string OWNER_address)
        {
            Hashtable ht = new Hashtable();
            ht["SYS_LOGINLOG_ID"] = CommonHelper.GetGuid;
            ht["User_Account"] = SYS_USER_ACCOUNT;
            ht["SYS_LOGINLOG_IP"] = RequestHelper.GetIP();
            ht["OWNER_address"] = OWNER_address;
            ht["SYS_LOGINLOG_STATUS"] = SYS_LOGINLOG_STATUS;
            DataFactory.SqlDataBase().InsertByHashtable("ZS_UserLoginLog", ht);
        }


        public void AddUserByProc(Hashtable ht, ref Hashtable rs)
        {
            DataFactory.SqlDataBase().ExecuteByProcReturn("Add_User", ht, ref rs);
        }

       
      



        //获取用户可用金额
        public decimal GetUserMoeny(StringBuilder sql)
        {
            return  decimal.Parse( DataFactory.SqlDataBase().GetObjectValue(sql).ToString());
        }

        //获取会员
        public DataTable GetZS_UserPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {

            DateTime _now = System.DateTime.Now;
            DateTime _per = System.DateTime.Now.AddMonths(-1);


            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select A.*,dbo.GetUserMoney(a.account) as  usermoney, dbo.GetZXMoney(a.account,0,0)  AS ZXYJ  , dbo.GetPXMoney(a.account,0,0)  AS PXYJ, dbo.GetZXMoney(a.account,"+ _now.Year + ","+ _now.Month + ")  AS CurYJ, dbo.GetZXMoney(a.account," + _per.Year + "," + _per.Month + ") AS PerYJ, B.UpdateTime from ZS_User A left join ZS_UserTrackStat B ON A.Account = b.Account where 1=1");
            strSql.Append(SqlWhere);
           
            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "RegDate", "Desc", pageIndex, pageSize, ref count);
        }


        //获取会员银行卡
        public DataTable GetZS_UserAuthPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select * from ZS_UserAuth where 1=1");
            strSql.Append(SqlWhere);

            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "SubTime", "Desc", pageIndex, pageSize, ref count);
        }
        //电子币账目
        public DataTable GetUserMoneyFlowPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select * from ZS_UserMoneyFlow where 1=1");
            strSql.Append(SqlWhere);

            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "CreateTime", "Desc", pageIndex, pageSize, ref count);
        }


        //用户提现列表
        public DataTable GetZS_UserDrawPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select * from ZS_UserDraw where 1=1");
            strSql.Append(SqlWhere);

            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "DrawTime", "Desc", pageIndex, pageSize, ref count);
        }


        //用户冻结资金
        public DataTable GetZ_UserMoenyForzePage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select *,dateadd(day,7,CreateTime) as YuJi from Z_UserMoenyForze where 1=1");
            strSql.Append(SqlWhere);

            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "CreateTime", "Desc", pageIndex, pageSize, ref count);
        }

        public Hashtable GetZS_UserBankInfo(string account)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select top(1) * from ZS_UserAuth where Account='"+ account + "' and IsDefault = 1");

            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(strSql);
            return DataTableHelper.DataTableToHashtable(dt);
        }
        //添加提现信息
        public void AddUserDrawByProc(Hashtable ht, ref Hashtable rs)
        {
            DataFactory.SqlDataBase().ExecuteByProcReturn("PR_WithDraw", ht, ref rs);
        }
        //添加转账信息
        public void AddPR_TransfByProc(Hashtable ht, ref Hashtable rs)
        {
            DataFactory.SqlDataBase().ExecuteByProcReturn("PR_Transf", ht, ref rs);
        }



        public DataSet GetDataSetPR_UserBaseStat(string useraccount)
        {
            SqlParam[] parmAdd = new SqlParam[]
                                {
                                    new SqlParam("@account",useraccount)
                                };
            return DataFactory.SqlDataBase().ExecuteByProcReturnDataSet("PR_UserBaseStat", parmAdd);
        }


        //完善个人资料
        public void CompleteMemberByProc(Hashtable ht, ref Hashtable rs)
        {
            DataFactory.SqlDataBase().ExecuteByProcReturn("CompleteMember", ht, ref rs);
        }

        //添加空账号
        public void Add_UserBySystemByProc(Hashtable ht, ref Hashtable rs)
        {
            DataFactory.SqlDataBase().ExecuteByProcReturn("Add_UserBySystem", ht, ref rs);
        }


        //充值
        public void Add_PR_MemberCZByProc(Hashtable ht, ref Hashtable rs)
        {
            DataFactory.SqlDataBase().ExecuteByProcReturn("PR_MemberCZ", ht, ref rs);
        }

        //审核 用户提现
        public void CheckMemberDrawByProc(Hashtable ht, ref Hashtable rs)
        {
            DataFactory.SqlDataBase().ExecuteByProcReturn("CheckMemberDraw", ht, ref rs);
        }
        //删除账号
        public void DEL_AccountByProc(Hashtable ht, ref Hashtable rs)
        {
            DataFactory.SqlDataBase().ExecuteByProcReturn("DEL_Account", ht, ref rs);
        }

        

        //获取浮动分红基数数据
        public DataTable GetZS_ActiveRate_List()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM ZS_ActiveRate");
       
            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql);
        }


        //获取基础基数数据
        public DataTable GetZS_Config_List()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM ZS_Config");

            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql);
        }


        public DataTable GetZS_MsgPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select * from ZS_Msg where 1=1");
            strSql.Append(SqlWhere);

            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "CreateDate", "Desc", pageIndex, pageSize, ref count);
        }



        //判断用户有几个下级用户
        public int GetUserLow(int userid)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select count(1) from ZS_User where ParentUserID="+userid);
            return int.Parse(DataFactory.SqlDataBase().GetObjectValue(strSql).ToString());
        }
        


    }
}
