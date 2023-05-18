using Banhang.DAO;
using BanHang.DAO;
using BanHang.DTO;
using BanHang.DTO;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Linq;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ProgressBar;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace BanHang
{
    public partial class fAdmin : Form
    {
        BindingSource foodList = new BindingSource();
        BindingSource tablelist = new BindingSource();
        BindingSource accountList = new BindingSource();
        BindingSource IngredientList = new BindingSource();
        BindingSource RecipeList = new BindingSource();
        BindingSource Ingredient = new BindingSource();
        public Account loginAccount;
        public fAdmin()
        {
            InitializeComponent();
            LoadData();
        }
        void LoadData()
        {
            dtgvFood.DataSource = foodList;
            dtgvAccount.DataSource = accountList;
            dtgvTable.DataSource = tablelist;
            dtgvNL.DataSource = IngredientList;
            dtgvRecipe.DataSource = RecipeList;
            dtgvIngredient.DataSource = IngredientList;
            LoadDateTimePickerBill();
            LoadListBillByDate(dtpkFromDate.Value, dtpkToDate.Value);
            LoadDateTimePickerIngredient();
            LoadListIngredientByDate(dtpkFromDateIngredient.Value, dtpkToDateIngredient.Value);
            LoadListFood();
            LoadAccount();
            LoadCategoryIntoCombobox(cbFoodCategory);
            AddFoodBinding();
            AddAccountBinding();
            LoadListTable();
            AddTableBinding();
            LoadListIngredient();
            AddIngredientBinding();
            LoadIngredient();
            LoadListRecipe();
            LoadFood();
            LoadListIngredient1();
            AddIngredientBinding1();
        }

        #region methods

        List<Food> SearchFoodByName(string name)
        {
            List<Food> listFood = FoodDAO.Instance.SearchFoodByName(name);

            return listFood;
        }


        void AddAccountBinding()
        {
            txbUserName.DataBindings.Add(new Binding("Text", dtgvAccount.DataSource, "UserName", true, DataSourceUpdateMode.Never));
            txbDisplayName.DataBindings.Add(new Binding("Text", dtgvAccount.DataSource, "DisplayName", true, DataSourceUpdateMode.Never));
            numericUpDown1.DataBindings.Add(new Binding("Value", dtgvAccount.DataSource, "Type", true, DataSourceUpdateMode.Never));
        }

        void LoadAccount()
        {
            accountList.DataSource = AccountDAO.Instance.GetListAccount();
        }
        void LoadDateTimePickerBill()
        {
            DateTime today = DateTime.Now;
            dtpkFromDate.Value = new DateTime(today.Year, today.Month, 1);
            dtpkToDate.Value = dtpkFromDate.Value.AddMonths(1).AddDays(-1);
        }
        void LoadListBillByDate(DateTime checkIn, DateTime checkOut)
        {
            dtgvBill.DataSource = BillDAO.Instance.GetBillListByDate(checkIn, checkOut);
        }

        void AddFoodBinding()
        {
            txbFoodName.DataBindings.Add(new Binding("Text", dtgvFood.DataSource, "Name", true, DataSourceUpdateMode.Never));
            txbFoodID.DataBindings.Add(new Binding("Text", dtgvFood.DataSource, "ID", true, DataSourceUpdateMode.Never));
            nmFoodPrice.DataBindings.Add(new Binding("Value", dtgvFood.DataSource, "Price", true, DataSourceUpdateMode.Never));
        }

        void LoadCategoryIntoCombobox(ComboBox cb)
        {
            cb.DataSource = CategoryDAO.Instance.GetListCategory();
            cb.DisplayMember = "Name";
        }


        void AddAccount(string userName, string displayName, int type)
        {
            if (AccountDAO.Instance.InsertAccount(userName, displayName, type))
            {
                MessageBox.Show("Thêm tài khoản thành công");
            }
            else
            {
                MessageBox.Show("Thêm tài khoản thất bại");
            }

            LoadAccount();
        }

        void EditAccount(string userName, string displayName, int type)
        {
            if (AccountDAO.Instance.UpdateAccount(userName, displayName, type))
            {
                MessageBox.Show("Cập nhật tài khoản thành công");
            }
            else
            {
                MessageBox.Show("Cập nhật tài khoản thất bại");
            }

            LoadAccount();
        }

        void DeleteAccount(string userName)
        {
            if (loginAccount.UserName.Equals(userName))
            {
                MessageBox.Show("Đừng xóa chính bạn");
                return;
            }
            if (AccountDAO.Instance.DeleteAccount(userName))
            {
                MessageBox.Show("Xóa tài khoản thành công");
            }
            else
            {
                MessageBox.Show("Xóa tài khoản thất bại");
            }

            LoadAccount();
        }

        void ResetPass(string userName)
        {
            if (AccountDAO.Instance.ResetPassword(userName))
            {
                MessageBox.Show("Đặt lại mật khẩu thành công");
            }
            else
            {
                MessageBox.Show("Đặt lại mật khẩu thất bại");
            }
        }
        #endregion
        //trang account
        #region events
        private void btnAddAccount_Click(object sender, EventArgs e)
        {
            string userName = txbUserName.Text;
            string displayName = txbDisplayName.Text;
            int type = (int)numericUpDown1.Value;

            AddAccount(userName, displayName, type);
        }

        private void btnDeleteAccount_Click(object sender, EventArgs e)
        {

            string userName = txbUserName.Text;

            DeleteAccount(userName);
        }

        private void btnEditAccount_Click(object sender, EventArgs e)
        {
            string userName = txbUserName.Text;
            string displayName = txbDisplayName.Text;
            int type = (int)numericUpDown1.Value;

            EditAccount(userName, displayName, type);
        }


        private void btnResetPassword_Click(object sender, EventArgs e)
        {
            string userName = txbUserName.Text;

            ResetPass(userName);
        }

        //Trang thức ăn
        private void btnShowAccount_Click(object sender, EventArgs e)
        {
            LoadAccount();
        }


        private void btnSearchFood_Click(object sender, EventArgs e)
        {
            foodList.DataSource = SearchFoodByName(txbSearchFoodName.Text);
        }
        private void txbFoodID_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (dtgvFood.SelectedCells.Count > 0)
                {
                    int id = (int)dtgvFood.SelectedCells[0].OwningRow.Cells["CategoryID"].Value;

                    Category cateogory = CategoryDAO.Instance.GetCategoryByID(id);

                    cbFoodCategory.SelectedItem = cateogory;

                    int index = -1;
                    int i = 0;
                    foreach (Category item in cbFoodCategory.Items)
                    {
                        if (item.ID == cateogory.ID)
                        {
                            index = i;
                            break;
                        }
                        i++;
                    }

                    cbFoodCategory.SelectedIndex = index;
                }
            }
            catch { }
        }

        private void btnAddFood_Click(object sender, EventArgs e)
        {
            
            string name = txbFoodName.Text;
            int categoryID = (cbFoodCategory.SelectedItem as Category).ID;
            float price = (float)nmFoodPrice.Value;
            List<Food> foods = FoodDAO.Instance.GetListFood();
            
            
            if (foods.Any(food=>food.Name.Equals(name)))
            {
                MessageBox.Show("Món ăn đã tồn tại không thể thêm");
                return;
            }   
            else if (FoodDAO.Instance.InsertFood(name, categoryID, price))
            {
                MessageBox.Show("Thêm món thành công");
                LoadListFood();
                if (insertFood != null) 
                    insertFood(this, new EventArgs());
            }
            else
            {
                MessageBox.Show("Có lỗi khi thêm thức ăn");
                LoadListFood();
            }
        }

        private void btnEditFood_Click(object sender, EventArgs e)
        {
            string name = txbFoodName.Text;
            int categoryID = (cbFoodCategory.SelectedItem as Category).ID;
            float price = (float)nmFoodPrice.Value;
            int id = Convert.ToInt32(txbFoodID.Text);
            
            if (FoodDAO.Instance.UpdateFood(id, name, categoryID, price))
            {
                MessageBox.Show("Sửa món thành công");
                LoadListFood();
                if (updateFood != null)
                    updateFood(this, new EventArgs());
            }
            else
            {
                MessageBox.Show("Có lỗi khi sửa thức ăn");
            }
        }

        private void btnDeleteFood_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(txbFoodID.Text);

            if (FoodDAO.Instance.DeleteFood(id))
            {
                MessageBox.Show("Xóa món thành công");
                LoadListFood();
                if (deleteFood != null)
                    deleteFood(this, new EventArgs());
            }
            else
            {
                MessageBox.Show("Có lỗi khi xóa thức ăn");
            }
        }
        void LoadListFood()
        {
            foodList.DataSource = FoodDAO.Instance.GetListFood();
        }
        private void btnShowFood_Click_1(object sender, EventArgs e)
        {
            LoadListFood();
        }

        private void btnViewBill_Click(object sender, EventArgs e)
        {
            LoadListBillByDate(dtpkFromDate.Value, dtpkToDate.Value);
        }

        private event EventHandler insertFood;
        public event EventHandler InsertFood
        {
            add { insertFood += value; }
            remove { insertFood -= value; }
        }

        private event EventHandler deleteFood;
        public event EventHandler DeleteFood
        {
            add { deleteFood += value; }
            remove { deleteFood -= value; }
        }

        private event EventHandler updateFood;
        public event EventHandler UpdateFood
        {
            add { updateFood += value; }
            remove { updateFood -= value; }
        }

        #endregion              
        //Doanh Thu
        private void btnFristBillPage_Click(object sender, EventArgs e)
        {
            txtPageIngredient.Text = "1";
        }

        private void btnLastBillPage_Click(object sender, EventArgs e)
        {
            int sumRecord = BillDAO.Instance.GetNumBillListByDate(dtpkFromDate.Value, dtpkToDate.Value);

            int lastPage = sumRecord / 10;

            if (sumRecord % 10 != 0)
                lastPage++;

            txbPageBill.Text = lastPage.ToString();
        }

        private void txbPageBill_TextChanged(object sender, EventArgs e)
        {
            dtgvBill.DataSource = BillDAO.Instance.GetBillListByDateAndPage(dtpkFromDate.Value, dtpkToDate.Value, Convert.ToInt32(txbPageBill.Text));
        }

        private void btnPrevioursBillPage_Click(object sender, EventArgs e)
        {
            int page = Convert.ToInt32(txbPageBill.Text);

            if (page > 1)
                page--;

            txbPageBill.Text = page.ToString();
        }

        private void btnNextBillPage_Click(object sender, EventArgs e)
        {
            int page = Convert.ToInt32(txbPageBill.Text);
            int sumRecord = BillDAO.Instance.GetNumBillListByDate(dtpkFromDate.Value, dtpkToDate.Value);

            if (page < sumRecord)
                page++;

            txbPageBill.Text = page.ToString();
        }

        //bàn ăn
        void LoadListTable()
        {
            tablelist.DataSource = TableDAO.Instance.Getlisttable();
        }
        private void btnShowTable_Click(object sender, EventArgs e)
        {
            LoadListTable();
        }

        void AddTableBinding()
        {
            txbTableName.DataBindings.Add(new Binding("Text", dtgvTable.DataSource, "name", true, DataSourceUpdateMode.Never));
            cbTableStatus.DataBindings.Add(new Binding("Text", dtgvTable.DataSource, "status", true, DataSourceUpdateMode.Never));
            textBox3.DataBindings.Add(new Binding("Text", dtgvTable.DataSource, "ID", true, DataSourceUpdateMode.Never));
        }

        public void btnAddTable_Click(object sender, EventArgs e)
        {
            string name = txbTableName.Text;
            string status = cbTableStatus.Text;

            if (TableDAO.Instance.InsertTable(name, status))
            {
                MessageBox.Show("Thêm bàn thành công");
                LoadListTable();
            }
            else
            {
                MessageBox.Show("Thêm không thành công");
            }
        }

        private void btnEditTable_Click(object sender, EventArgs e)
        {
            string name = txbTableName.Text;
            string status = cbTableStatus.Text;
            int id = Convert.ToInt32(textBox3.Text);

            if (TableDAO.Instance.UpdateTable(id, name, status))
            {
                MessageBox.Show("Sửa bàn thành công");
                LoadListTable();
            }
            else
            {
                MessageBox.Show("Sửa không thành công");
            }
        }

        private void btnDeleteTable_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(textBox3.Text);

            if (TableDAO.Instance.DeleteTable(id))
            {
                MessageBox.Show("Xóa bàn thành công");
                LoadListTable();
            }
            else
            {
                MessageBox.Show("Xóa bàn không thành công");
            }
        }

        //Nguyên liệu
        void LoadListIngredient()
        {
            IngredientList.DataSource = IngredientDAO.Instance.GetlistIngredient();
        }

        private void btnShowNL_Click_1(object sender, EventArgs e)
        {
            LoadListIngredient();
        }
        void AddIngredientBinding()
        {
            txbNLID.DataBindings.Add(new Binding("Text", dtgvNL.DataSource, "id", true, DataSourceUpdateMode.Never));
            txtNameNL.DataBindings.Add(new Binding("Text", dtgvNL.DataSource, "name", true, DataSourceUpdateMode.Never));
            nmHsdNL.DataBindings.Add(new Binding("Text", dtgvNL.DataSource, "ExpiryDate", true, DataSourceUpdateMode.Never));
            txtQuantity.DataBindings.Add(new Binding("Text", dtgvNL.DataSource, "quantity", true, DataSourceUpdateMode.Never));
            nmNLPrice.DataBindings.Add(new Binding("Value", dtgvNL.DataSource, "price", true, DataSourceUpdateMode.Never));
        }

        private void btnAddNL_Click(object sender, EventArgs e)
        {
            string name = txtNameNL.Text;
            float price = (float)nmNLPrice.Value;
            int expiryDate = (int)nmHsdNL.Value;
            int quantity = Convert.ToInt32(txtQuantity.Text);
            List<Ingredient> ingredients = IngredientDAO.Instance.GetlistIngredient();

            if (ingredients.Any(Ingredient => Ingredient.Name.Equals(name)))
            {
                MessageBox.Show("Nguyên liệu đã tồn tại không thể thêm");
                return;
            }
            if (IngredientDAO.Instance.InsertIngredient(name, price, expiryDate, quantity))
            {
                MessageBox.Show("Thêm nguyên liệu thành công");
                LoadListIngredient();
            }
            else
            {
                MessageBox.Show("Thêm nguyên liệu không thành công");
            }
        }
        private void btnDeleteNL_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(txbNLID.Text);

            if (IngredientDAO.Instance.DeleteIngredient(id))
            {
                MessageBox.Show("Xóa nguyên liệu thành công");
                LoadListIngredient();
            }
            else
            {
                MessageBox.Show("Xóa nguyên liệu không thành công");
            }
        }
        //Công thức

        void LoadListRecipe()
        {
           RecipeList.DataSource = RecipeDAO.Instance.GetlistRecipe();
        }
        private void btnShowRecipe_Click(object sender, EventArgs e)
        {
            LoadListRecipe();
        }


        void LoadIngredient()
        {
            List<Ingredient> ingredients = IngredientDAO.Instance.GetlistIngredient();
            cbRecipe.DataSource = ingredients;
            cbRecipe.DisplayMember = "name";

        }

        void LoadFood()
        {
            List<Food> foods = FoodDAO.Instance.GetListFood();
            CbFood.DataSource = foods;
            CbFood.DisplayMember = "name";
        }
        private void btnCheck_Click(object sender, EventArgs e)
        {
            int quantity = (int)nmNLCount.Value;
            ListViewItem listView = new ListViewItem(CbFood.Text);
            listView.SubItems.Add(cbRecipe.Text);
            listView.SubItems.Add(quantity.ToString());
            lsvNL.Items.Add(listView);
        }
        private void btnAddNew_Click(object sender, EventArgs e)
        {     
            int idIngredient = (cbRecipe.SelectedItem as Ingredient).ID;
            int foodID = (CbFood.SelectedItem as Food).ID;
            int quantity = (int)nmNLCount.Value;
            RecipeDAO.Instance.InsertRecipe(foodID, idIngredient, quantity);
            {
                MessageBox.Show("Đã thêm thành công");
                LoadListRecipe();
            }
            lsvNL.Items.Clear();
        }
        private void btnDeleteRecipe_Click(object sender, EventArgs e)
        {           
            int id = Convert.ToInt32(dtgvRecipe.SelectedRows[0].Cells["ID"].Value);
            if (RecipeDAO.Instance.DeleteRecipe(id))
            {
                MessageBox.Show("Xóa thành công");
                LoadListRecipe();
            }
            else
            {
                MessageBox.Show("Xóa không thành công");
            }
        }

         //Nhập nguyên liệu
        void LoadListIngredient1()
        {
            IngredientList.DataSource = IngredientDAO.Instance.GetlistIngredient();
        }

        private void btnXem_Click(object sender, EventArgs e)
        {
            LoadListIngredient1();
        }
        void AddIngredientBinding1()
        {
            txtidIngredient.DataBindings.Add(new Binding("Text", dtgvIngredient.DataSource, "id", true, DataSourceUpdateMode.Never));
            txtIngredient.DataBindings.Add(new Binding("Text", dtgvIngredient.DataSource, "name", true, DataSourceUpdateMode.Never));
        }

        private void btnNhap_Click_1(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(txtidIngredient.Text);
            int quantity = Convert.ToInt32(nmquantity.Text);

            if (ImportExportDAO.Instance.InsertImport(id, quantity))
            {
                MessageBox.Show("Nhập thành công");
                LoadListIngredient();
            }
            else
            {
                MessageBox.Show("Nhập không thành công");
            }
        }

        //Danh sách nhập nguyên liệu
        void LoadDateTimePickerIngredient()
        {
            DateTime today = DateTime.Now;
            dtpkFromDateIngredient.Value = new DateTime(today.Year, today.Month, 1);
            dtpkToDateIngredient.Value = dtpkFromDateIngredient.Value.AddMonths(1).AddDays(-1);
        }
        void LoadListIngredientByDate(DateTime DateCheckIn, DateTime DateCheckOut)
        {
            dtgv.DataSource = ImportExportDAO.Instance.GetIngredientListByDate(DateCheckIn, DateCheckOut);
        }
        private void btnViewIngredient_Click(object sender, EventArgs e)
        {
            LoadListIngredientByDate(dtpkFromDateIngredient.Value, dtpkToDateIngredient.Value);
        }

        private void btnFristIngredientPage_Click(object sender, EventArgs e)
        {
            txtPageIngredient.Text = "1";
        }

        private void btnLastIngredientPage_Click(object sender, EventArgs e)
        {
            int sumRecord = ImportExportDAO.Instance.GetNumIngredientListByDate(dtpkFromDateIngredient.Value, dtpkToDateIngredient.Value);
            int lastPage = sumRecord / 10;
            if (sumRecord % 10 != 0)
                lastPage++;
            txtPageIngredient.Text = lastPage.ToString();
        }

        private void txbPageIngredient_TextChanged(object sender, EventArgs e)
        {
            dtgv.DataSource = ImportExportDAO.Instance.GetIngredientListByDateAndPage(dtpkFromDateIngredient.Value, dtpkToDateIngredient.Value, Convert.ToInt32(txtPageIngredient.Text));
        }

        private void btnNextIngredientPage_Click(object sender, EventArgs e)
        {
            int page = Convert.ToInt32(txtPageIngredient.Text);
            int sumRecord = ImportExportDAO.Instance.GetNumIngredientListByDate(dtpkFromDateIngredient.Value, dtpkToDateIngredient.Value);

            if (page < sumRecord)
                page++;

            txtPageIngredient.Text = page.ToString();
        }

        private void btnPrevioursIngredientPage_Click(object sender, EventArgs e)
        {
            int page = Convert.ToInt32(txtPageIngredient.Text);
            if (page > 1)
                page--;
            txtPageIngredient.Text = page.ToString();
        }
        
        //Chấm công
        void LoadDateTimePickerKeeping()
        {
            DateTime today = DateTime.Now;
            dateTimePicker2.Value = new DateTime(today.Year, today.Month, 1);
            
        }
        void LoadTimeKeepingListByDate(DateTime DateCheckIn)
        {
            dtgvTimeKeeping.DataSource= TimeKeepingDAO.Instance.GetTimeKeepingListByDate(DateCheckIn);
        }
        
        private void btnKeeping_Click(object sender, EventArgs e)
        {
            LoadTimeKeepingListByDate(dtpkFromDateIngredient.Value);
        }
    }
}



