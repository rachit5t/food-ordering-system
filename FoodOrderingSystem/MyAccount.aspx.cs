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
    public partial class MyAccount : System.Web.UI.Page
    {
        public User currentUser = new User();
        public Delivery delivery;
        public List<Delivery> listOfDelivery = new List<Delivery>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if ( Session["User"] == null )
            {
                Response.Redirect("Home.aspx");
            }

            currentUser = (User) Session["User"];
            Get_Delivery_Id();
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Home.aspx");
        }

        private void Get_Delivery_Id()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString);
            try
            {
                conn.Open();

                string query = "SELECT * FROM TblDeliver WHERE UserId=@UserId";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@UserId", currentUser.id);

                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read() == true)
                {
                    delivery = new Delivery();
                    int orderId = int.Parse(reader["DeliverId"].ToString());
                    delivery.id = orderId;
                    delivery.date = reader["Date"].ToString();
                    delivery.status = reader["Status"].ToString();
                    delivery.total = float.Parse(reader["Total"].ToString());
                    if (listOfDelivery.Count == 0)
                    {
                        listOfDelivery.Add(delivery);
                    }
                    else
                    {

                        if (!Check_List(orderId))
                        {
                            listOfDelivery.Add(delivery);
                        }
                    }
                }

                conn.Close();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + ex.ToString());
                conn.Close();
            }
        }

        private bool Check_List(int orderId)
        {
            foreach (Delivery d in listOfDelivery)
            {
                if (d.id == orderId)
                {
                    return true;
                }
            }
            return false;
        }

        public string Get_Deliveries()
        {
            string htmlStr = "";
            foreach (Delivery d in listOfDelivery)
            {
                htmlStr += 
                    "<tr>" +
                    "   <td>" + d.id + "</td>" +
                    "   <td>" + d.date + "</td>" +
                    "   <td>" + d.status + "</td>" +
                    "   <td>Rs " + d.total + "</td>" +
                    "</tr>";
            }
            return htmlStr;
        }
    }
}