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
    public partial class UserDetails : System.Web.UI.Page
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

                    string query = "SELECT * FROM TblUser WHERE UserId='" + id + "'";
                    SqlCommand command = new SqlCommand(query, conn);

                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read() == true)
                    {
                        txtFName.Text = reader["FName"].ToString();
                        txtLName.Text = reader["LName"].ToString();
                        txtEmail.Text = reader["Email"].ToString();
                        txtContact.Text = reader["Contact"].ToString();
                        txtAddress.Text = reader["Address"].ToString();
                        ddlRole.Text = reader["Role"].ToString();
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

        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString);
            try
            {
                conn.Open();

                string query = "UPDATE TblUser SET FName=@FName, LName=@LName, Email=@Email, Contact=@ContactNo, " +
                    "Address=@Address, Role=@Role WHERE UserId=@id";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@Id", id);
                command.Parameters.AddWithValue("@FName", txtFName.Text.Trim());
                command.Parameters.AddWithValue("@LName", txtLName.Text.Trim());
                command.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                command.Parameters.AddWithValue("@ContactNo", txtContact.Text.Trim());
                command.Parameters.AddWithValue("@Address", txtAddress.Text);
                command.Parameters.AddWithValue("@Role", ddlRole.Text);

                command.ExecuteNonQuery();

                conn.Close();



                Response.Redirect("ManageUser.aspx", false);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + ex.ToString());
                conn.Close();
            }
        }
    }
}