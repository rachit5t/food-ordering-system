using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodOrderingSystem.models
{
    public class Cart
    {
        public int id { get; set; }
        public int userId { get; set; }
        public List<Product> products { get; set; } = new List<Product>();

        public void Add_Product(Product product)
        {
            if (products.Count != 0)
            {
                // If product exists in cart already
                // Add the quantity together
                if (!Add_Product_Quantity(product))
                {
                    // If not exists, just add it
                    products.Add(product);
                }
            }
            else
            {
                products.Add(product);
            }
        }

        public int Get_Number_Of_Products()
        {
            if (products.Count.Equals(0))
            {
                return 0;
            }
            return products.Count;
        }
        private bool Add_Product_Quantity(Product product)
        {
            foreach (Product p in products)
            {
                if (p.name == product.name) 
                {
                    p.quantity = p.quantity + product.quantity;
                    return true;
                }
            }
            return false;
        }
    }
} 