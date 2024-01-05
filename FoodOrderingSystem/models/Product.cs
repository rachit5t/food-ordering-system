using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodOrderingSystem.models
{
    public class Product
    {
        public int id { get; set; }
        public string image { get; set; }
        public string name { get; set; }
        public string category { get; set; }
        public int quantity { get; set; }
        public float price { get; set; }
        public bool cutlery { get; set; }
    }
}