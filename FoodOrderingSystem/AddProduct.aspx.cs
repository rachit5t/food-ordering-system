using FoodOrderingSystem.models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodOrderingSystem
{
    public partial class AddProduct : System.Web.UI.Page
    {
        public User currentUser = new User();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Home.aspx");
            }
            currentUser = (User)Session["User"];
            if (currentUser.role != "Admin")
            {
                Response.Redirect("Home.aspx");
            }
        }
        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString);
            try
            {
                conn.Open();
                SaveImageToAssetsFolder();
                string query = "INSERT INTO TblProduct (Image, Name, Price, Category)" +
                    "VALUES (@Image, @Name, @Price, @Category)";

                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@Image", Path.GetFileName(productImage.FileName));
                command.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                command.Parameters.AddWithValue("@Price", Convert.ToDouble(txtPrice.Text));
                command.Parameters.AddWithValue("@Category", ddlCategory.SelectedItem.ToString());
                command.ExecuteNonQuery();

                conn.Close();
                lblFeedback.Visible = true;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + ex.ToString());
                conn.Close();
                lblFeedback.Text = "Registration Failed";
                lblFeedback.ForeColor = System.Drawing.Color.Red;
                lblFeedback.Visible = true;
            }
        }


        private string SaveImageToAssetsFolder()
        {
            // Get the physical path of the "assets" folder
            string assetsFolderPath = Server.MapPath("~/assets/");

            // Save the uploaded image to the "assets" folder
            string imageName = Path.GetFileName(productImage.FileName);
            string imagePath = Path.Combine(assetsFolderPath, imageName);
            productImage.SaveAs(imagePath);

            return imagePath;
        }
    }
}