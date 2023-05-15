using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BanHang.DTO
{
    public class ImportExport
    {
        public ImportExport(int id, int idIngredient, int quantity, DateTime? DateCheckIn, DateTime? DateCheckOut)
        {
            
            this.ID = id;
            this.IdIngredient = idIngredient;
            this.DaTeCheckIn = DateCheckIn;
            this.DaTeCheckOut = DateCheckOut;
            this.Quantity = quantity;
            
        }

        public ImportExport(DataRow row)
        {
            this.ID = (int)row["id"];
            this.IdIngredient = (int)row["idIngredient"];
            this.DaTeCheckIn = (DateTime?)row["DateCheckIn"];

            var dateCheckOutTemp = row["DateCheckOut"];
            if (dateCheckOutTemp.ToString() != "")
                this.DaTeCheckOut = (DateTime?)dateCheckOutTemp;
            this.Quantity = (int)row["quantity"];
        }

        private int id;

        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        private int idIngredient;

        public int IdIngredient
        {
            get { return idIngredient; }
            set { idIngredient = value; }
        }

        private DateTime? DateCheckOut;

        public DateTime? DaTeCheckOut
        {
            get { return DateCheckOut; }
            set { DateCheckOut = value; }
        }

        private DateTime? DateCheckIn;

        public DateTime? DaTeCheckIn
        {
            get { return DateCheckIn; }
            set { DateCheckIn = value; }
        }
        private int quantity;

        public int Quantity
        {
            get { return quantity; }
            set { quantity = value; }
        }
    }
}
