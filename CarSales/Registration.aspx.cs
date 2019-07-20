using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarSales
{
   public partial class Registration : System.Web.UI.Page
   {
      readonly DBConnection dbConn = new DBConnection();
      protected void Page_Load(object sender, EventArgs e)
      {
      }

      protected void BtnRegister_Click(object sender, EventArgs e)
      {
         if (Page.IsValid)
         {
            try
            {
               Customer customer = new Customer();
               customer.CustName = txtcName.Text;
               customer.Address = txtcAddress.Text;
               customer.PostalCode = txtcPostalCode.Text;
               customer.PhoneNumber = txtcPhoneNumber.Text;
               customer.Email = txtcEmail.Text;
               customer.Password = txtcPassword.Text;
               if (dbConn.InsertCustomer(customer))
                  Response.Redirect("Default.aspx");
            }
            catch (Exception)
            {
               throw;
            }
         }
      }


   }
}