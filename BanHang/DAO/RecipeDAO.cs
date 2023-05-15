using BanHang.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace  BanHang.DAO
{
    public class RecipeDAO
    {
        private static RecipeDAO instance;

        public static RecipeDAO Instance
        {
            get { if (instance == null) instance = new RecipeDAO(); return RecipeDAO.instance; }
            private set { RecipeDAO.instance = value; }
        }

        private RecipeDAO() { }

        public List<Recipe> GetlistRecipe()
        {
            List<Recipe> list = new List<Recipe>();
            string query = "select * from Recipe";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow item in data.Rows)
            {
                Recipe recipe = new Recipe(item);
                list.Add(recipe);
            }
            return list;
        }
        public void InsertRecipe(int idFood, int idIngredient, int quantity)
        {
            DataProvider.Instance.ExecuteNonQuery("USP_InsertRecipe @idFood , @idIngredient , @quantity", new object[] { idFood, idIngredient, quantity });
        }
        public bool DeleteRecipe(int id)
        {
            string query = string.Format("delete dbo.Recipe  where id = {0}", id);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }
    }
}
