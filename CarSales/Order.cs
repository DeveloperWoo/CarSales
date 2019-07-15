using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;

namespace CarSales
{
    public class Order
    {
        public int OrderID { get; set; }
        public string CustName { get; set; }
        public string Brand { get; set; }
        public string Model { get; set; }
        public string Year { get; set; }
        public string Colour { get; set; }
        public double Price { get; set; }

        public Order()
        {
            
        }

        public Order(string custName, string brand, string model, string year, string colour, double price)
        {
            CustName = custName;
            Brand = brand;
            Model = model;
            Year = year;
            Colour = colour;
            Price = price;
        }
    }
}