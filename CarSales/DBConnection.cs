using System;
using System.Collections.Generic;
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
                connetionString = "Data Source=LAPTOP-DG03G47M\\SQLEXPRESS;" +
                                  "Initial Catalog = CarSalesDB; " +
                                  "Integrated Security = SSPI; " +
                                  "Persist Security Info = false";
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
            conn.Open();
            Authentication auth;

            string sql = "SELECT Password FROM Customers WHERE CustName=@userName;";
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

            conn.Close();
            return auth;
        }

        public Customer GetUserByUsername(string userName)
        {
            Customer customer;
            conn.Open();
            string sql = "SELECT * FROM Customers WHERE CustName=@userName;";
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

            conn.Close();
            return customer;
        }

        public bool InsertOrder(Order order)
        {
            conn.Open();

            string sql = "INSERT INTO Orders VALUES (@CustName, @Brand, @Model, @Year, @Colour, @Price);";
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

            conn.Close();
            return true;
        }

        public List<Order> GetOrderList()
        {
            conn.Open();

            List<Order> orderList = new List<Order>();

            string sql = "SELECT * FROM Orders;";

            conn.Close();
            return orderList;
        }
    }
}