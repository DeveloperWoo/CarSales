using System;
using System.Collections.Generic;
using System.Linq;
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
    }
}