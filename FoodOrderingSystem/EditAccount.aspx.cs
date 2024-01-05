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
    public partial class EditAccount : System.Web.UI.Page
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
                string[] separateName = currentUser.name.Split(' '); // separateName[0] = FName, separateName[1] = LName 
                txtFName.Text = separateName[0];
                txtLName.Text = separateName[1];
                txtContact.Text = currentUser.contact;
            }
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString);
            try
            {
                conn.Open();

                string query = "UPDATE TblUser SET FName='" + txtFName.Text.Trim() + "', LName='"+ txtLName.Text.Trim() + 
                    "', Contact='"+ txtContact.Text.Trim() + "' WHERE Id=@UserId";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@UserId", currentUser.id);
                //command.Parameters.AddWithValue("@FName", txtFName.Text.Trim());
                //command.Parameters.AddWithValue("@LName", txtLName.Text.Trim());
                //command.Parameters.AddWithValue("@ContactNo", txtContact.Text.Trim());

                currentUser.name = txtFName.Text.Trim() + " " + txtLName.Text.Trim();
                currentUser.contact = txtContact.Text.Trim();
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

        protected void ChangePassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassword.aspx");
        }
    }
}