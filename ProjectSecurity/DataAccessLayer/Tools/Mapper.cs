﻿using DataAccessLayer.Models;
using DataAccessLayer.Models.Auth;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DataAccessLayer.Tools
{
    public static class Mapper
    {
        public static JwtCustomer ReadToDataJwtCustomer(this SqlDataReader reader)
        {
            return new JwtCustomer
            {
                IdCust = (int)reader["IdCustomer"],
                Name = Convert.ToString(reader["Name"]),
                Login = Convert.ToString(reader["Login"]),
                IdLanguage = (int)reader["IdLanguages"],
                Role = Convert.ToString(reader["Classe"]),
            };
        }

        public static JwtUser ReadJwtUserToBll(this SqlDataReader reader)
        {
            return new JwtUser
            {
                IdUser = (int)reader["IdEmployee"],
                Name = (string)reader["Name"],
                FirstName = Convert.ToString(reader["FirstName"]),
                IdLanguage = (int)reader["IdLanguage"],
                Role = Convert.ToString(reader["Classe"]),
                Login = Convert.ToString(reader["Login"]),

            };
        }

        public static Customer ReadCustomerToBLL(this SqlDataReader reader)
        {
            return new Customer
            {
                IdCustomer = reader["IdCustomer"] is DBNull ? null : (int)reader["IdCustomer"],
                Name = Convert.ToString(reader["Name"]),
                Email = Convert.ToString(reader["Email"]),
                EmergencyEmail = Convert.ToString(reader["EmergencyEmail"]),
                EmergencyPhone = Convert.ToString(reader["EmergencyPhone"]),
                Street = Convert.ToString(reader["Street"]),
                StreetNumber = Convert.ToString(reader["StreetNumber"]),
                PostCode = Convert.ToString(reader["PostCode"]),
                Country = Convert.ToString(reader["Country"]),
                Phone = Convert.ToString(reader["Phone"]),
                GeneralPhone = Convert.ToString(reader["GeneralPhone"]),
                Role = Convert.ToString(reader["ClasseName"]), 
                Language = Convert.ToString(reader["Language"])
    };
        }
        public static AllCustomer ReadAllCustomerToBll(this SqlDataReader reader)
        {
            return new AllCustomer
            {
                IdCustomer = (int)reader["IdCustomer"],
                Name = Convert.ToString(reader["Name"]),
                EmergencyEmail = Convert.ToString(reader["EmergencyEmail"]),
                EmergencyPhone = Convert.ToString(reader["EmergencyPhone"]),
                GeneralPhone = Convert.ToString(reader["GeneralPhone"]),
                Email = Convert.ToString(reader["Email"]),
                Phone = Convert.ToString(reader["Phone"]),
                PostCode = Convert.ToString(reader["PostCode"]),
                Street = Convert.ToString(reader["Street"]),
                StreetNumber = Convert.ToString(reader["StreetNumber"]),
                Language = Convert.ToString(reader["Language"]),
                Country = Convert.ToString(reader["Country"]),
                Role = Convert.ToString(reader["ClasseName"]),

            };
        }

        public static Employee ReadToAspData(this SqlDataReader reader)
        {
            
            return new Employee
            {
                Id = (int)reader["IdEmployee"],
                Name = Convert.ToString(reader["Name"]),
                FirstName = Convert.ToString(reader["firstName"]),
                BirthDate = Convert.ToString(reader["BirthDate"]),
                Vehicle = (bool)reader["Vehicle"],
                SecurityCard = reader["SecurityCardNumber"] is DBNull ? null : (int)reader["SecurityCardNumber"],
                EntryService = Convert.ToString(reader["EntryService"]),
                EmployeeCardNumber = reader["EmployeeCardNumber"] is DBNull ? null : Convert.ToString(reader["EmployeeCardNumber"]),
                RegistreNational = Convert.ToString(reader["RegistreNational"]),
                Role = Convert.ToString(reader["ClasseName"]),
                Language = Convert.ToString(reader["Language"]),
                street = Convert.ToString(reader["Street"]),
                Postcode = Convert.ToString(reader["PostCode"]),
                StreetNumber = Convert.ToString(reader["StreetNumber"]),
                Phone = Convert.ToString(reader["Phone"]),
                Email = Convert.ToString(reader["Email"]),
                Country = Convert.ToString(reader["Country"]),
                Departement = Convert.ToString(reader["NameDepartement"])
            };
        }
        public static Planning ReadToAccessPlanning(this SqlDataReader reader)
        {
            return new Planning
            {
                StartTime = (DateTime)reader["StartTime"],
                EndTime = (DateTime)reader["EndTime"],
                IdCustomer = reader["IdCustomer"] is DBNull ? null : (int)reader["IdCustomer"]

            };
        }
    }
}
