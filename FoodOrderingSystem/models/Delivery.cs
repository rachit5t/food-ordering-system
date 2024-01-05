using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodOrderingSystem.models
{
    public class Delivery
    {
        public int id { get; set; }
        public string date { get; set; }
        public string status { get; set; }
        public float total { get; set; }
    }
}