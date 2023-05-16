using BanHang.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BanHang.DAO
{
    public class ImportExportDAO
    {
        private static ImportExportDAO instance;

        public static ImportExportDAO Instance
        {
            get { if (instance == null) instance = new ImportExportDAO(); return ImportExportDAO.instance; }
            private set { ImportExportDAO.instance = value; }
        }

        private ImportExportDAO() { }

        public bool InsertImport(int idIngredient, int quantity)
        {
            string query = string.Format("insert ImportExport( IdIngredient, quantity) values( {0}, {1})",idIngredient, quantity);
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public DataTable GetIngredientListByDate(DateTime DateCheckIn, DateTime DateCheckOut)
        {
            return DataProvider.Instance.ExecuteQuery("exec USP_GetListIngredientByDate @checkIn , @checkOut", new object[] { DateCheckIn, DateCheckOut });
        }

        public DataTable GetIngredientListByDateAndPage(DateTime DateCheckIn, DateTime DateCheckOut, int pageNum)
        {
            return DataProvider.Instance.ExecuteQuery("exec USP_GetListIngredientByDateAndPage @checkIn , @checkOut , @page", new object[] { DateCheckIn, DateCheckOut, pageNum });
        }

        public int GetNumIngredientListByDate(DateTime DateCheckIn, DateTime DateCheckOut)
        {
            return (int)DataProvider.Instance.ExecuteScalar("exec USP_GetNumIngredientByDate @checkIn , @checkOut", new object[] { DateCheckIn, DateCheckOut });
        }
    }
}
