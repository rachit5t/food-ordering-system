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
    public partial class ChangePassword : System.Web.UI.Page
    {
        public User currentUser = new User();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Home.aspx");
            }
            currentUser = (User) Session["User"];
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            if (currentUser.password.Equals(txtOldPassword.Text.Trim()))
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString);
                try
                {
                    conn.Open();

                    string query = "UPDATE TblUser SET Password='" + txtNewPassword.Text.Trim() + "' WHERE Id=@UserId";
                    SqlCommand command = new SqlCommand(query, conn);
                    command.Parameters.AddWithValue("@UserId", currentUser.id);

                    currentUser.password = txtNewPassword.Text.Trim();
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
            else
            {
                lblPasswordNotMatch.Visible = true;
            }
        }
    }
}