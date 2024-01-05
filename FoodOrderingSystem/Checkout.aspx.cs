using FoodOrderingSystem.models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodOrderingSystem
{
    public partial class Checkout : System.Web.UI.Page
    {
        public Random rand = new Random();
        public float subTotal = 0;
        public List<Product> listOfProducts = new List<Product>();
        public User currentUser = new User();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            currentUser = (User) Session["User"];
            subTotal = float.Parse(Session["SubTotal"].ToString());
        }

        protected void PlaceOrder_OnClick(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString);
            int orderId = rand.Next(10000000, 99999999);
            Get_Products();

            foreach (Product prod in listOfProducts)
            {
                try
                {
                    conn.Open();
                    string query = "INSERT INTO TblDeliver (UserId, ProductId, ProductName, Quantity, Status, Date, Total)" +
                        "VALUES (@UserId, @ProductId, @ProductName, @Quantity, @Status, @Date, @Total)";
                    SqlCommand command = new SqlCommand(query, conn);

                    
                    command.Parameters.AddWithValue("@UserId", currentUser.id);
                    command.Parameters.AddWithValue("@ProductId", prod.id);
                    command.Parameters.AddWithValue("@ProductName", prod.name);
                    command.Parameters.AddWithValue("@Quantity", prod.quantity);
                    command.Parameters.AddWithValue("@Status", "Cooking");
                    command.Parameters.AddWithValue("@Date", DateTime.Now.ToString());
                    command.Parameters.AddWithValue("@Total", subTotal+5);
                    command.ExecuteNonQuery();
                    conn.Close();
                    
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine("Error: " + ex.ToString());
                    conn.Close();
                }
            }
            Clear_Order();
            Response.Redirect("MyAccount.aspx");
        }

        private void Get_Products()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString);
            try
            {
                conn.Open();
                string query = "SELECT p.Id AS ProdId, p.Image AS ProdImg, p.Name AS ProdName, p.Price AS ProdPrice, p.Category AS ProdCat, o.Quantity AS OrderQty, (p.Price*o.Quantity) AS Total FROM TblProduct p, TblOrder o WHERE o.UserId=@UserId AND p.Id=o.ProductId";
                SqlCommand command = new SqlCommand(query, conn);

                command.Parameters.AddWithValue("@UserId", currentUser.id);
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read() == true)
                {
                    Product prod = new Product();
                    prod.id = int.Parse(reader["ProdId"].ToString());
                    prod.image = reader["ProdImg"].ToString();
                    prod.name = reader["ProdName"].ToString();
                    prod.price = float.Parse(reader["ProdPrice"].ToString());
                    prod.quantity = int.Parse(reader["OrderQty"].ToString());
                    listOfProducts.Add(prod);
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + ex.ToString());
                conn.Close();
            }
        }

        private void Clear_Order()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString);
            try
            {
                conn.Open();
                string query = "DELETE FROM TblOrder WHERE UserId=@UserId";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@UserId", currentUser.id);
                command.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + ex.ToString());
                conn.Close();
            }
        }
    }
}