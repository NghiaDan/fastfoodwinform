using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BanHang.DTO
{
    public class Recipe
    {
        public Recipe(int id, int idFood, int idIngredient, int quantity)
        {
            this.ID = id;
            this.IDFood = idFood;
            this.IDIngredient = idIngredient;
            this.Quantity = quantity;
        }

        public Recipe(DataRow row)
        {
            this.ID = (int)row["id"];
            this.IDFood =(int)row["idFood"];
            this.IDIngredient = (int)row["idIngredient"];
            this.Quantity = (int)row["quantity"];
        }
        private int id;
        public int ID
        {
            get { return this.id; }
            set { this.id = value; }
        }
        private int idFood;
        public int IDFood
        {
            get { return this.idFood; }
            set { this.idFood = value; }
        }
        private int idIngredient;
        public int IDIngredient
        {
            get { return this.idIngredient; }
            set { this.idIngredient = value; }

        }
        private int quantity;
        public int Quantity
        { 
            get { return this.quantity; }
            set  { this.quantity = value; }
            
         }

    }
}
