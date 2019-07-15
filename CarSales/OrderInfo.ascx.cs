using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarSales
{
    public partial class OrderInfo : System.Web.UI.UserControl
    {
        public int OrderID { get; set; }
        public string CustName { get; set; }
        public string Brand { get; set; }
        public string Model { get; set; }
        public string Year { get; set; }
        public string Colour { get; set; }
        public double Price { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                valOrderID.Text = OrderID.ToString();
                valCustName.Text = CustName;
                valBrand.Text = Brand;
                valModel.Text = Model;
                valYear.Text = Year;
                valColour.Text = Colour;
                valPrice.Text = "$" + Price.ToString("0,000.00");
            }
        }
    }
}