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
            string query = "SELECT * from recipe";
             // " r.id,i.name AS ingredient_name, f.name AS food_name, r.quantity FROM Ingredient i INNER JOIN Recipe r ON i.id = r.idingredient INNER JOIN Food f ON f.id = r.idFood";   
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow item in data.Rows)
            {
                Recipe recipe = new Recipe(item);
                list.Add(recipe);
            }
           
            return list;
        }
        public bool InsertRecipe(int idFood, int idIngredient, int quantity)
        {
            string query = string.Format("INSERT dbo.Recipe ( idFood, idIngredient,quantity )VALUES  ( N'{0}', {1}, {2})",Convert.ToString(idFood), Convert.ToString(idIngredient), Convert.ToString(quantity));
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }

    }
}
