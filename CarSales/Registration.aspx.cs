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
               customer.PostalCode = SetPostalCode(txtcPostalCode);
               customer.PhoneNumber = SetPhoneNumber(txtcPhoneNumber);
               customer.Email = txtcEmail.Text.ToLower();
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
      protected string SetPhoneNumber (TextBox tb)
      {
         string phoneNum = tb.Text;
         if (phoneNum.Length == 10)
            phoneNum = "(" + phoneNum.Substring(0, 3) + ") " + phoneNum.Substring(3, 3) + "-" + phoneNum.Substring(6);
         return phoneNum;
      }
      protected string SetPostalCode (TextBox tb)
      {
         string postalCode = tb.Text;
         if (postalCode.IndexOf(" ") != 3)
            postalCode = postalCode.Substring(0, 3) + " " + postalCode.Substring(3);
         return postalCode.ToUpper();
      }
      protected void BtnLogIn_Click(object sender, EventArgs e)
      {
         Response.Redirect("Default.aspx");
      }
   }
}