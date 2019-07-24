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

         for (int i = 2000; i <= DateTime.Now.Year + 1; i++)
            ddYear.Items.Add(i.ToString());

         gridItem3.Visible = false;

         CreateCarBrandModel();

      }

      public void CreateCarBrandModel ()
      {
         Dictionary<string, List<string>> cars = new Dictionary<string, List<string>>() {
            { "BMW", new List<string> { "Mini", "M"} },
            { "Nissan", new List<string> { "Sentra", "Silvia", "Versa"} },
            { "Ford", new List<string> { "Custom", "Edge"} },
         };
         foreach (string key in cars.Keys)
            ddBrand.Items.Add(key);
      }

      protected void BtnOrder_Click(object sender, EventArgs e)
      {
         if (Page.IsValid)
         {
            try
            {
               Order order = new Order();

               order.CustName = (string)Session["username"];
             //  order.Brand = txtBrand.Text;
              // order.Model = txtModel.Text;
               order.Year = ddYear.Text;
               order.Colour = txtColour.Text;
               order.Price = Double.Parse(txtPrice.Text);

               if (dbConn.InsertOrder(order))
               {
                 // txtBrand.Text = "";
                //  txtModel.Text = "";
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

      protected void BtnLogOut_Click(object sender, EventArgs e)
      {
         Response.Redirect("Default.aspx");
         Session.Abandon();
      }

      protected void BtnShowOrders_Click(object sender, EventArgs e)
      {
         if (BtnShowOrders.Text != "HIDE ALL THE ORDER LIST")
         {
            gridItem3.Visible = true;
            BtnShowOrders.Text = "HIDE ALL THE ORDER LIST";
         }else
         {
            gridItem3.Visible = false;
            BtnShowOrders.Text = "VIEW ALL ORDER LIST";
         }
         
      }

      protected void ddBrand_SelectedIndexChanged(object sender, EventArgs e)
      {

      }
   }
}