// Author: Hyun Ju Woo (991497524) on July-15-2019

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarSales
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string userName = txtUserName.Text;
            string pw = txtPassword.Text;

            DBConnection dbConn = new DBConnection();
            Authentication auth = dbConn.ConfirmExistingCustomer(userName, pw);
            switch (auth)
            {
                case Authentication.Success:
                    Session["username"] = userName; /* store customer name in session */
                    Session["user"] = dbConn.GetUserByUsername(userName); /* store customer object in session */
                    Response.Redirect("Profile.aspx");
                    break;
                case Authentication.WrongPassword:
                    txtLoginMsg.Text = "Password does not match.";
                    break;
                case Authentication.NoSuchCustomer:
                    txtLoginMsg.Text = "You are not out customer yet. Do you want to join? Click Register button below!";
                    break;
            }
        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }
    }
}