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
    public partial class Site : System.Web.UI.MasterPage
    {
        public User currentUser = new User();
        public Cart currentCart = new Cart();
        public Product prod;
        public List<Product> tempListProd = new List<Product>();
        public int orderQuantity = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            string appDataFolder = Server.MapPath("~/App_Data");

            // Set the DataDirectory to the App_Data folder
            AppDomain.CurrentDomain.SetData("DataDirectory", appDataFolder);
            if (Session["User"] != null)
            {
                currentUser = (User) Session["User"];
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString);
                try
                {
                    conn.Open();

                    string query = "SELECT p.Id AS ProdId, p.Image AS ProdImg, p.Name AS ProdName, p.Price AS ProdPrice, p.Category AS ProdCat, o.Quantity AS OrderQty FROM TblProduct p, TblOrder o WHERE o.UserId=@UserId AND p.Id=o.ProductId";
                    SqlCommand command = new SqlCommand(query, conn);
                    command.Parameters.AddWithValue("@UserId", currentUser.id);

                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read() == true)
                    {
                        prod = new Product();
                        prod.id = int.Parse(reader["ProdId"].ToString());
                        prod.image = reader["ProdImg"].ToString();
                        prod.name = reader["ProdName"].ToString();
                        prod.price = float.Parse(reader["ProdPrice"].ToString());
                        prod.category = reader["ProdCat"].ToString();
                        prod.quantity = int.Parse(reader["OrderQty"].ToString());
                        tempListProd.Add(prod);
                    }
                    currentCart.products = tempListProd;
                    Session["MyCart"] = currentCart;
                    conn.Close();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine("Error: " + ex.ToString());
                    conn.Close();
                }
            }

            if (Session["MyCart"] != null)
            {
                currentCart = (Cart) Session["MyCart"];
            }
        }

        public string Signed_In()
        {
            string htmlStr = "";
            if ( Check_User() )
            {
                currentUser = (User) Session["User"];
                if (currentUser.role == "Admin")
                {
                    htmlStr = "Welcome " +
                        "<a href='AdminDashboard.aspx'>" + currentUser.name + "</a>";
                }
                else
                {
                    htmlStr = "Welcome " + 
                        "<a href='MyAccount.aspx'>" + currentUser.name + "</a>";
                }
            }
            else
            {
                htmlStr = 
                    "<a href='Register.aspx' class='mr-2'>" + "Sign Up" + "</a>" +
                    "<a href='Login.aspx'>" + "Login" + "</a>";
            }
            return htmlStr;
        }

        public bool Check_User()
        {
            if ( Session["User"] != null )
            {
                return true;
            } 
            else
            {
                return false;
            }
        }

        public int Get_Number_Of_Items()
        {
            return currentCart.Get_Number_Of_Products();       
        }

        public string Get_Current_Cart()
        {
            string htmlStr = "";
            if (currentCart.Get_Number_Of_Products() != 0)
            {
                foreach (Product prod in currentCart.products)
                {
                    htmlStr += 
                        "<div class='dropdown-item d-flex align-items-start' href='#'>" +
                        "   <div class='img' style='background-image: url(assets/" + prod.image + ");'></div>" + 
                        "   <div class='text pl-3'>" + 
                        "       <h4>" + prod.name + "</h4>" +
                        "       <p class='mb-0'>" +
                        "           <p class='price'>Rs " + prod.price + "</p><span class='quantity ml-3'>Quantity: " + prod.quantity + "</span>" +
                        "       </p>" +
                        "   </div>" +
                        "</div>";
                }
                htmlStr += 
                    "<a class='dropdown-item text-center btn-link d-block w-100' href='ViewCart.aspx'>" +
                    "   View my cart" +
                    "   <span class='ion-ios-arrow-around-forward'></span>" +
                    "</a>";
                return htmlStr;
            } 
            else
            {
                htmlStr = "<h4 class='h4 ml-2 mt-2'>Cart is empty!</h4>";
                return htmlStr;
            }
        }
    }
}