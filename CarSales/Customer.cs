using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CarSales
{
    public class Customer
    {
        public string CustName { get; set; }
        public string Address { get; set; }
        public string PostalCode { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }

      public Customer()
      {

      }
      public Customer(string custName, string address, string postalCode, string phoneNumber, string email, string password)
      {
         CustName = custName;
         Address = address;
         PostalCode = postalCode;
         PhoneNumber = phoneNumber;
         Email = email;
         Password = password;
      }      
   }
}