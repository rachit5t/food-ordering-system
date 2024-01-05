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
    public partial class ManageOrder : System.Web.UI.Page
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

        public string FetchOrderData()
        {
            string htmlStr = "";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString);
            try
            {
                conn.Open();

                string query = "SELECT * FROM TblDeliver";
                SqlCommand command = new SqlCommand(query, conn);

                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    htmlStr +=
                        "<tr>" +
                        "   <td>" + reader["UserId"] + "</td>" +
                        "   <td>" + reader["ProductName"] + "</td>" +
                        "   <td>" + reader["Quantity"] + "</td>" +
                        "   <td>" + reader["Date"] + "</td>" +
                        "   <td>" + reader["Total"] + "</td>" +
                           
 
                        "   <td style='widtd:70px;'>" + "<a style='color: black;' href='DeleteOrderrSuccess.aspx?id=" + reader["DeliverId"] +"'><span class='fa fa-ban'></span> Delete</a>" + "</td>" +
                        "</tr>";
                }
                /*
                htmlStr +=
                    "<tr>" +
                    "   <td colspan='11'><a class='btn btn-secondary btn-block' href='#'>Add New User</a></td>" +
                    "</tr>";
                */

                conn.Close();
                return htmlStr;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + ex.ToString());
                conn.Close();
                return null;
            }
        }
    }
}