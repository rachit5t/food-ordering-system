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
    public partial class DeleteOrderrSuccess : System.Web.UI.Page
    {
        public static int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt16(Request.QueryString["id"]);
            if (!Page.IsPostBack)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString);
                try
                {
                    conn.Open();
                    string query = "DELETE FROM TblDeliver WHERE DeliverId=@Id";
                    SqlCommand command = new SqlCommand(query, conn);
                    command.Parameters.AddWithValue("@Id", id);
                    command.ExecuteNonQuery();

                    conn.Close();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine("Error: " + ex.ToString());
                    conn.Close();
                }
            }
        }
    }
}