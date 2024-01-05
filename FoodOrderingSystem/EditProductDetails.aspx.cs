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
    public partial class ProductDetails : System.Web.UI.Page
    {
        public static int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
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
                        txtProductImage.Text = reader["Image"].ToString();
                        txtName.Text = reader["Name"].ToString();
                        txtPrice.Text = reader["Price"].ToString();
                        ddlCategory.Text = reader["Category"].ToString();
                    }
                    conn.Close();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine("Error: " + ex.ToString());
                    conn.Close();
                }
            }
        }

        public string GetImage()
        {
            return "<div class='img' style='background-image: url(assets/" + txtProductImage.Text + ");'>" + "</div>";
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString);
            try
            {
                conn.Open();

                string query = "UPDATE TblProduct SET Name=@Name, Price=@Price, Category=@Category WHERE Id=@id";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@Id", id);
                command.Parameters.AddWithValue("@Name", txtName.Text);
                command.Parameters.AddWithValue("@Price", txtPrice.Text);
                command.Parameters.AddWithValue("@Category", ddlCategory.Text);

                command.ExecuteNonQuery();

                conn.Close();
                Response.Redirect("ManageProduct.aspx", false);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + ex.ToString());
                conn.Close();
            }
        }
    }
}