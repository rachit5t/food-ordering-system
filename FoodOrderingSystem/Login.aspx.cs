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
    public partial class Login : System.Web.UI.Page
    {
        public User currentUser = new User();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString);
            try
            {
                conn.Open();

                string query = "SELECT * FROM TblUser WHERE Email=@Email AND Password=@Password";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                command.Parameters.AddWithValue("@Password", txtPassword.Text);
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read() == true)
                {
                    currentUser.id = (int) reader["UserId"];
                    currentUser.name = reader["FName"].ToString() + " " + reader["LName"].ToString();
                    currentUser.password = reader["Password"].ToString();
                    currentUser.email = reader["Email"].ToString();
                    currentUser.contact = reader["Contact"].ToString();
                    currentUser.address = reader["Address"].ToString();
                    currentUser.role = reader["Role"].ToString();
                    Session["User"] = currentUser;
                    if (checkRemember.Checked)
                    {
                        currentUser.isRemembered = true;
                    }
                    Response.Redirect("Home.aspx", false);
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine("Account Does Not Exist!");
                }

                conn.Close();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + ex.ToString());
                conn.Close();
            }
        }

        public bool check_credentials(string email, string password)
        {
            if (email == "" || email.Equals(null))
            {
                return false;
            }

            if (password == "" || password.Equals(null))
            {
                return false;
            }

            return true;
        }
    }
}