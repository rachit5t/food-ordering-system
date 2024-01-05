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
    public partial class EditAddress : System.Web.UI.Page
    {
        public User currentUser = new User();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Home.aspx");
            }
            currentUser = (User)Session["User"];
            if (!Page.IsPostBack)
            {
                txtAddress.Text = currentUser.address;
            }
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString);
            try
            {
                conn.Open();

                string query = "UPDATE TblUser SET Address='" + txtAddress.Text + "' WHERE Id=@UserId";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@UserId", currentUser.id);
                //command.Parameters.AddWithValue("@FName", txtFName.Text.Trim());
                //command.Parameters.AddWithValue("@LName", txtLName.Text.Trim());
                //command.Parameters.AddWithValue("@ContactNo", txtContact.Text.Trim());

                currentUser.address = txtAddress.Text;
                Session["User"] = currentUser;

                command.ExecuteNonQuery();

                conn.Close();
                Response.Redirect("MyAccount.aspx", false);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + ex.ToString());
                conn.Close();
            }
        }
    }
}