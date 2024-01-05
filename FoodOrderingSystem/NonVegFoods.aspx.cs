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
    public partial class MenuChicken : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string FetchChickenData()
        {
            string htmlStr = "";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString);
            try
            {
                conn.Open();

                string query = "SELECT * FROM TblProduct WHERE Category='Non Veg'";
                SqlCommand command = new SqlCommand(query, conn);

                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    htmlStr +=
                        "<div class='col-md-4 d-flex'>" +
                        "   <div class='product ftco-animate'>" +
                        "       <div class='img d-flex align-items-center justify-content-center' style='background-image: url(assets/" + reader["Image"].ToString() + ");'>" +
                        "           <div class='desc'>" +
                        "               <p class='meta-prod d-flex'>" +
                        "                   <a href='ProductDetails.aspx?id=" + reader["Id"] + "'class='d-flex align-items-center justify-content-center'><span class='flaticon-shopping-bag'></span></a>" +
                        "               </p>" +
                        "           </div>" +
                        "       </div>" +
                        "       <div class='text text-center'>" +
                        "           <span class='category'>" + reader["Category"].ToString() + "</span>" +
                        "           <h2>" + reader["Name"] + "</h2>" +
                        "           <p class='mb-2'>" +
                        "               <span class='price'>Rs " + reader["Price"] + "</span>" +
                        "           </p>" +
                        "           <a href='ProductDetails.aspx?id=" + reader["Id"] + "'class='btn btn-success'><span class='fa fa-plus'></span> Add to cart</a>" +
                        "       </div>" +
                        "   </div>" +
                        "</div>";
                }

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