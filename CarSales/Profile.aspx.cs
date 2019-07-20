using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarSales
{
    public partial class Profile : System.Web.UI.Page
    {
        readonly DBConnection dbConn = new DBConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            string userName = (string)Session["username"];
            welcomeUserName.Text = userName;

            DisplayCustomerInfo(userName);

            if (!IsPostBack)
            {
                //Display Order history
                RepeaterOrders.DataSource = dbConn.GetMyOrderList(userName);
                RepeaterOrders.DataBind();
            }
        }

        protected void BtnOrder_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    Order order = new Order();

                    order.CustName = (string)Session["username"];
                    order.Brand = txtBrand.Text;
                    order.Model = txtModel.Text;
                    order.Year = ddYear.Text;
                    order.Colour = txtColour.Text;
                    order.Price = Double.Parse(txtPrice.Text);

                    if (dbConn.InsertOrder(order))
                    {
                        txtBrand.Text = "";
                        txtModel.Text = "";
                        txtColour.Text = "";
                        txtPrice.Text = "";
                        Response.Redirect(Request.RawUrl); //refresh the current page
                    }
                }
                catch (Exception)
                {
                    lblMessage.Text = "Sorry, cannot place an order";
                }
            }
        }

        protected void Repeater_Orders(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
                e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var order = e.Item.DataItem as Order;
                if (e.Item.FindControl("OrderRow") is OrderInfo control)
                {
                    control.OrderID = order.OrderID;
                    control.CustName = order.CustName;
                    control.Brand = order.Brand;
                    control.Model = order.Model;
                    control.Year = order.Year;
                    control.Colour = order.Colour;
                    control.Price = order.Price;
                }
            }
        }

        protected void DisplayCustomerInfo(string userName)
        {
            Customer customer = dbConn.GetUserByUsername(userName);
            valName.Text = customer.CustName;
            valAddress.Text = customer.Address;
            valPostalCode.Text = customer.PostalCode;
            valPhoneNumber.Text = customer.PhoneNumber;
            valEmail.Text = customer.Email;
        }
    }
}