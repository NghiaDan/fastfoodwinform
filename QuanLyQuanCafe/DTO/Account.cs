using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BanHang.DTO
{
    public class Account
    {
        public Account(int id,string userName, string displayName, int type, string password = null)//int idStaff)
            
        {   
            this.ID=id;
            this.UserName = userName;
            this.DisplayName = displayName;
            this.Type = type;
            this.Password = password;
           // this.IdStaff = idStaff;
            // this.IDStaff = idStaff;
        }

        public Account(DataRow row)
        {
            this.ID = (int)row["ID"];
            this.UserName = row["userName"].ToString();
            this.DisplayName = row["displayName"].ToString();
            this.Type = (int)row["type"];
            this.Password = row["password"].ToString();
           // this.IdStaff = (int)row["idStaff"];
          //  this.IDStaff = (int)row["idStaff"];
        }
        //private int idStaff;
        //public int IdStaff
        //{
        //    get { return idStaff; }
        //    set { idStaff = value; }
        //}

        private int id;
        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        private int type;

        public int Type
        {
            get { return type; }
            set { type = value; }
        }

        private string password;

        public string Password
        {
            get { return password; }
            set { password = value; }
        }

        private string displayName;

        public string DisplayName
        {
            get { return displayName; }
            set { displayName = value; }
        }

        private string userName;
       

        public string UserName
        {
            get { return userName; }
            set { userName = value; }
        }
    }
}
