using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CarSales
{ 
    public enum Authentication
    {
        Success,
        WrongPassword,
        NoSuchCustomer
    }

    public class DBConnection
    {
        //Global declarations
        string connetionString = null;
        SqlConnection conn;
        SqlCommand command;

        public DBConnection()
        {
            try
            {
                /* HJ's DB connection */
                //connetionString = "Data Source=LAPTOP-DG03G47M\\SQLEXPRESS;Initial Catalog = CarSalesDB;Integrated Security = SSPI;Persist Security Info = false";
            /* MJ's DB connection */
            connetionString = "Data Source=MJ-SURFACEBOOK2\\SQLEXPRESS;Initial Catalog = CarSalesDB;Integrated Security = SSPI;Persist Security Info = false";
            conn = new SqlConnection(connetionString);
                Console.WriteLine("CarSalesDB Connected!");
            }
            catch (SqlException ex)
            {
                Console.WriteLine("DB connection failed: " + ex.Message);
            }
        }

        public Authentication ConfirmExistingCustomer(string userName, string pw)
        {
            Authentication auth = Authentication.NoSuchCustomer;
            string sql = "SELECT Password FROM Customers WHERE CustName=@userName;";

            try
            {
                conn.Open();
                using (command = new SqlCommand(sql, conn))
                {
                    command.Parameters.AddWithValue("@userName", userName);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            reader.Read();
                            if (pw.Equals(reader.GetString(0)))
                                auth = Authentication.Success;
                            else
                                auth = Authentication.WrongPassword;
                        }
                        else
                            auth = Authentication.NoSuchCustomer;
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Error in SQL: " + e.Message);
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }
            return auth;
        }

        public Customer GetUserByUsername(string userName)
        {
            string sql = "SELECT * FROM Customers WHERE CustName=@userName;";
            Customer customer = null;

            try
            {
                conn.Open();

                using (command = new SqlCommand(sql, conn))
                {
                    command.Parameters.AddWithValue("@userName", userName);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        reader.Read();
                        customer = new Customer()
                        {
                            /*
                            CustName = reader.GetString(0),
                            Address = reader.GetString(1),
                            PostalCode = reader.GetString(2),
                            PhoneNumber = reader.GetString(3),
                            Email = reader.GetString(4),
                            Password = reader.GetString(5)
                            */

                            CustName = reader["CustName"].ToString(),
                            Address = reader["Address"].ToString(),
                            PostalCode = reader["PostalCode"].ToString(),
                            PhoneNumber = reader["PhoneNumber"].ToString(),
                            Email = reader["Email"].ToString(),
                            Password = reader["Password"].ToString()

                        };
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Error in SQL: " + e.Message);
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }
            return customer;
        }
      public bool InsertCustomer(Customer customer)
      {
         string sql = "INSERT INTO Customers VALUES (@CustName, @Address, @PostalCode, @PhoneNumber, @Email, @Password);";

         try
         {
            conn.Open();

            using (command = new SqlCommand(sql, conn))
            {
               command.Parameters.AddWithValue("@CustName", customer.CustName);
               command.Parameters.AddWithValue("@Address", customer.Address);
               command.Parameters.AddWithValue("@PostalCode", customer.PostalCode);
               command.Parameters.AddWithValue("@PhoneNumber", customer.PhoneNumber);
               command.Parameters.AddWithValue("@Email", customer.Email);
               command.Parameters.AddWithValue("@Password", customer.Password);
               int record = command.ExecuteNonQuery();

               Console.WriteLine(record + " customer added");
            }
         }
         catch (Exception e)
         {
            Console.WriteLine("Error in SQL: " + e.Message);
         }
         finally
         {
            if (conn.State == ConnectionState.Open)
            {
               conn.Close();
            }
         }

         return true;
      }

      public bool InsertOrder(Order order)
        {
            string sql = "INSERT INTO Orders VALUES (@CustName, @Brand, @Model, @Year, @Colour, @Price);";

            try
            {
                conn.Open();

                using (command = new SqlCommand(sql, conn))
                {
                    command.Parameters.AddWithValue("@CustName", order.CustName);
                    command.Parameters.AddWithValue("@Brand", order.Brand);
                    command.Parameters.AddWithValue("@Model", order.Model);
                    command.Parameters.AddWithValue("@Year", order.Year);
                    command.Parameters.AddWithValue("@Colour", order.Colour);
                    command.Parameters.AddWithValue("@Price", order.Price);
                    int record = command.ExecuteNonQuery();

                    Console.WriteLine(record + " order added");
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Error in SQL: " + e.Message);
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }

            return true;
        }

        public List<Order> GetMyOrderList(string userName)
        {
            string sql = "SELECT * FROM Orders WHERE CustName=@userName;";
            List<Order> orderList = null;

            try
            {
                orderList = new List<Order>();

                conn.Open();
                command = new SqlCommand(sql, conn);
                command.Parameters.AddWithValue("@userName", userName);
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    Order order = new Order();
                    order.OrderID = Int32.Parse(reader["OrderID"].ToString());
                    order.CustName = reader["CustName"].ToString();
                    order.Brand = reader["Brand"].ToString();
                    order.Model = reader["Model"].ToString();
                    order.Year = reader["Year"].ToString();
                    order.Colour = reader["Colour"].ToString();
                    order.Price = Double.Parse(reader["Price"].ToString());

                    orderList.Add(order);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Error in SQL: " + e.Message);
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }
            return orderList;
        }
    }
}