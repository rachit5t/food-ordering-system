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
    public partial class ViewCart : System.Web.UI.Page
    {
        public User currentUser = new User();
        public Cart myCart = new Cart();
        public float subTotal = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["User"] == null)
                {
                     Response.Redirect("Login.aspx");
                }
                currentUser = (User) Session["User"];
                Load_Cart();
            }
            Get_Total();
        }

        protected void BtnRemove_OnClick(object sender, EventArgs e)
        {
            Button btn = (Button) sender;
            int prodId = int.Parse(btn.CommandArgument.ToString());
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString);
            try
            {
                conn.Open();
                string query = "DELETE FROM TblOrder WHERE ProductId=@ProductId";
                SqlCommand command = new SqlCommand(query, conn);

                command.Parameters.AddWithValue("@ProductId", prodId);
                SqlDataReader reader = command.ExecuteReader();
                conn.Close();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + ex.ToString());
                conn.Close();
            }

            Response.Redirect("ViewCart.aspx");
        }

        private void Load_Cart()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString);
            try
            {
                conn.Open();
                string query = "SELECT p.Id AS ProdId, p.Image AS ProdImg, p.Name AS ProdName, p.Price AS ProdPrice, p.Category AS ProdCat, o.Quantity AS OrderQty, (p.Price*o.Quantity) AS Total FROM TblProduct p, TblOrder o WHERE o.UserId=@UserId AND p.Id=o.ProductId";
                SqlCommand command = new SqlCommand(query, conn);

                command.Parameters.AddWithValue("@UserId", currentUser.id);

                CartList.DataSource = command.ExecuteReader();
                CartList.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + ex.ToString());
                conn.Close();
            }
        }

        private void Get_Total()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString);
            try
            {
                conn.Open();
                string query = "SELECT (p.Price*o.Quantity) AS Total FROM TblProduct p, TblOrder o WHERE o.UserId=@UserId AND p.Id=o.ProductId";
                SqlCommand command = new SqlCommand(query, conn);

                command.Parameters.AddWithValue("@UserId", currentUser.id);

                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read() == true)
                {
                    subTotal += float.Parse(reader["Total"].ToString());
                }
                Session["SubTotal"] = subTotal;
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