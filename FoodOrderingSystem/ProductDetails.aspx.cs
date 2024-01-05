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
    public partial class ProductDetails1 : System.Web.UI.Page
    {
        public static int id = 0;
        public static string category = "";
        public static string productImage = "";

        public User currentUser = new User();
        public Product prod = new Product();
        public Cart myCart = new Cart();
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt16(Request.QueryString["id"]);
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString);
            try
            {
                conn.Open();

                string query = "SELECT * FROM TblProduct WHERE Id='" + id + "'";
                SqlCommand command = new SqlCommand(query, conn);

                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read() == true)
                {
                    prod.id = (int) reader["Id"];
                    prod.image = reader["Image"].ToString();
                    prod.name = reader["Name"].ToString();
                    prod.category = reader["Category"].ToString();
                    prod.price = float.Parse(reader["Price"].ToString());

                    productImage = prod.image;
                    category = prod.category;
                    lblProductName.Text = prod.name;
                    lblProductPrice.Text = "Rs " + prod.price.ToString();
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + ex.ToString());
                conn.Close();
            }
        }

        protected void btnAdd_OnClick(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                currentUser = (User) Session["User"];
                int quantity = int.Parse(qty.Text);
                
                prod.quantity = quantity;
                prod.cutlery = cbCutlery.Checked ? true : false;


                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString);
                try
                {
                    conn.Open();
                    string query = "INSERT INTO TblOrder (UserId, ProductId, Quantity, Cutlery)" +
                        "VALUES (@UserId, @ProductId, @Quantity, @Cutlery)";

                    SqlCommand command = new SqlCommand(query, conn);
                    command.Parameters.AddWithValue("@UserId", currentUser.id);
                    command.Parameters.AddWithValue("@ProductId", prod.id);
                    command.Parameters.AddWithValue("@Quantity", prod.quantity);
                    command.Parameters.AddWithValue("@Cutlery", prod.cutlery.ToString());
                    command.ExecuteNonQuery();

                    Response.Redirect("Menu.aspx");
                    conn.Close();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine("Error: " + ex.ToString());
                    conn.Close();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            
        }

        public string GetImage()
        {
            return "<div class='img' style='background-image: url(assets/" + productImage + ");'>" + "</div>";
        }
    }
}