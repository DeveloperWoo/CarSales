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
         cPostalCode.ValidationExpression = @"^[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1} *\d{1}[A-Z]{1}\d{1}$";
         /*
          ValidationExpression=""
          */
      }

      protected void BtnRegister_Click(object sender, EventArgs e)
      {
         if (Page.IsValid)
         {
            try
            {
               /*
                 function SetTxtcPhoneNumber() {
            var phoneNum = document.getElementById("txtcPhoneNumber").value;
            if (phoneNum.length == 10)
                txtcPhoneNumber.value = "(" + phoneNum.substr(0, 3) + ") " + phoneNum.substr(3, 3) + "-" + phoneNum.substr(6);
        }
        function SetTxtcPostalCode() {
            var postalCode = document.getElementById("txtcPostalCode").value;
           if (postalCode.charAt(3) != " ")
                postalCode = postalCode.substr(0, 3) + " " + postalCode.substr(3);
            txtcPostalCode.value = postalCode.toUpperCase();
        }
                */
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