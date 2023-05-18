using BanHang.DAO;
using BanHang.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace BanHang.DAO
{
    public class IngredientDAO
    {
        private static IngredientDAO instance;
        public static IngredientDAO Instance
        {
            get { if (instance == null) instance = new IngredientDAO(); return IngredientDAO.instance; }
            private set { IngredientDAO.instance = value; }
        }
        private IngredientDAO() { }

        public List<Ingredient> LoadIngredientList()
        {
            List<Ingredient> IngredientList = new List<Ingredient>();

            DataTable data = DataProvider.Instance.ExecuteQuery("USP_GetIngredientList");

            foreach (DataRow item in data.Rows)
            {
                Ingredient ingredient = new Ingredient(item);
                IngredientList.Add(ingredient);
            }

            return IngredientList;
        }
        public List<Ingredient> GetlistIngredient()
        {
            List<Ingredient> ingredients = new List<Ingredient>();

            string query = "select * from Ingredient";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow item in data.Rows)
            {
                Ingredient ingredient = new Ingredient(item);
                ingredients.Add(ingredient);
            }
            return ingredients;
        }

        public bool InsertIngredient( string name, float price, int expiryDate, int quantity)
        {
            string query = string.Format("INSERT dbo.Ingredient ( name, price, expiryDate,quantity )VALUES  ( N'{0}', {1}, {2},{3})", name, price, expiryDate, quantity);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }
        public bool DeleteIngredient(int id)
        {
            string query = string.Format("delete dbo.Ingredient  where id = {0}", id);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }

    }
  
}
