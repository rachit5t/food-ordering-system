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
    public partial class ManageProduct : System.Web.UI.Page
    {
        public User currentUser = new User();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Home.aspx");
            }
            currentUser = (User) Session["User"];
            if (currentUser.role != "Admin")
            {
                Response.Redirect("Home.aspx");
            }
        }

        public string FetchProductData()
        {
            string htmlStr = "";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString);
            try
            {
                conn.Open();

                string query = "SELECT * FROM TblProduct";
                SqlCommand command = new SqlCommand(query, conn);

                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    htmlStr +=
                        "<tr>" +
                        "   <td>" + reader["Id"] + "</td>" +
                        "   <td> <div class='img' style='background-image: url(assets/" + reader["Image"].ToString() + ");'>" + "</div> </td>" +
                        "   <td>" + reader["Name"] + "</td>" +
                        "   <td>Rs " + reader["Price"] + "</td>" +
                        "   <td>" + reader["Category"] + "</td>" +
                        "   <td style='widtd:70px;'>" + "<a style='color: black;' href='EditProductDetails.aspx?id=" + reader["Id"] + "'><span class='fa fa-pencil'></span> Edit</a>" + "</td>" +
                        "   <td style='widtd:70px;'>" + "<a style='color: black;' href='DeleteProductSuccess.aspx?id=" + reader["Id"] + "'><span class='fa fa-ban'></span> Delete</a>" + "</td>" +
                        "</tr>";
                }
                htmlStr +=
                    "<tr>" +
                    "   <td colspan='11'><a class='btn btn-secondary btn-block' href='AddProduct.aspx'>Add New Product</a></td>" +
                    "</tr>";

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