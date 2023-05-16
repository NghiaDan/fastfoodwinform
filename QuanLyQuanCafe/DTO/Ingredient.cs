using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BanHang.DTO
{
    public class Ingredient
    {
        public Ingredient(int id , string name, float price, string expiryDate,int quantity)
        {
            this.ID = id;
            this.Name = name;
            this.Price = price;
            this.ExpiryDate = expiryDate;
            this.Quantity=quantity;
        }
        public Ingredient(DataRow row)
        {
            this.ID = (int)row["id"];
            this.Name = row["name"].ToString();
            this.Price = (float)Convert.ToDouble(row["price"].ToString());
            this.ExpiryDate = row["expiryDate"].ToString();
            this.Quantity = (int)row["quantity"];
        }
        private string expiryDate;

        public string ExpiryDate
        {
            get { return expiryDate; }
            set { expiryDate = value; }
        }

        private float price;

        public float Price
        {
            get { return price; }
            set { price = value; }
        }

        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        private int id;

        public int ID
        {
            get { return id; }
            set { id = value; }
        }
        private int quantity;
        public int Quantity
        { get { return quantity; }
        set {  quantity = value; } }
    }
}
