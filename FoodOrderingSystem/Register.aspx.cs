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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString);
            try
            {
                conn.Open();

                string query = "INSERT INTO TblUser (FName, LName, Email, Contact, Password, Address, Role, Active, DtRegistered)" +
                    "VALUES (@FName, @LName, @Email, @Contact, @Password, @Address, @Role, @Active, @DtRegistered)";

                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@FName", txtFName.Text.Trim());
                command.Parameters.AddWithValue("@LName", txtLName.Text.Trim());
                command.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                command.Parameters.AddWithValue("@Contact", txtPrefix.Text.Trim() + txtContact.Text.Trim());
                command.Parameters.AddWithValue("@Password", txtPassword.Text);
                command.Parameters.AddWithValue("@Address", txtAddress.Text);
                command.Parameters.AddWithValue("@Role", "Customer");
                command.Parameters.AddWithValue("@Active", 0);
                command.Parameters.AddWithValue("@DtRegistered", DateTime.Now.ToString());
                command.ExecuteNonQuery();

                Response.Redirect("Login.aspx");
                conn.Close();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + ex.ToString());
                conn.Close();
            }
        }

        private string GetDateTime()
        {
            return DateTime.Now.ToString();
        }
    }
}