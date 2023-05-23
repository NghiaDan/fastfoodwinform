using BanHang.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace BanHang.DAO
{
    public class AccountDAO
    {
        private static AccountDAO instance;

        public static AccountDAO Instance
        {
            get { if (instance == null) instance = new AccountDAO(); return instance; }
            private set { instance = value; }
        }

        private AccountDAO() { }

        public bool Login(string userName, string passWord)
        { 
            string query = "USP_Login @userName , @passWord";
             
            DataTable result = DataProvider.Instance.ExecuteQuery(query, new object[] { userName, passWord /*list*/});

            return result.Rows.Count > 0;
        }


        public bool UpdateAccount(string userName, string displayName, string pass, string newPass)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("exec USP_UpdateAccount @userName , @displayName , @password , @newPassword", new object[]{userName, displayName, pass, newPass});

            return result > 0;
        }

        public DataTable GetListAccount()
        {
            return DataProvider.Instance.ExecuteQuery("SELECT id, UserName, DisplayName, Type, idStaff FROM dbo.Account");
        }

        public List<Account> GetAccount()
        {
            List<Account> accounts = new List<Account>();

            string query = "select * from Account";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow item in data.Rows)
            {
                Account account = new Account(item);
                accounts.Add(account);
            }
            return accounts;
        }
        public Account GetAccountByUserName(string userName)
        {
            DataTable data = DataProvider.Instance.ExecuteQuery("select * from Account  where   userName = '" + userName + "'");
            foreach (DataRow item in data.Rows)
            {
                return new Account(item);
            }

            return null;
        }


        public bool InsertAccount(string name, string displayName,string password, int type,int idStaff)
        {
            string query = string.Format("INSERT dbo.Account (username,displayname,password,type,idStaff ) VALUES ( N'{0}', N'{1}',N'{2}', N'{3}',N'{4}')", name, displayName, "1", type, idStaff);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }
        
        public bool EditAccount(int id,string username, string displayName,string password, int type,int idStaff)
        {
            string query = string.Format("UPDATE dbo.Account SET DisplayName = N'{0}', Type = '{1}',idStaff = N'{2}',username = N'{3}', password = N'{4}'  WHERE id = N'{5}'", displayName, type,idStaff, username,"1", id);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }

        public bool DeleteAccount(int id)
        {
            string query = string.Format("Delete Account where id = N'{0}'", id);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }

        public bool ResetPassword(string name)
        {
            string query = string.Format("update account set password = N'1' where UserName = N'{0}'", name);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }
    }
}
