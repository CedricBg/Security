using DataAccessLayer.Models;
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
        public static Customer ReadCustomerToBLL(this SqlDataReader reader)
        {
            return new Customer
            {
                IdCustomer = reader["IdCustomer"] is DBNull ? null : (int)reader["IdCustomer"],
                Name = Convert.ToString(reader["Name"]),
                IdInformation = (int)reader["IdInformation"],
                IdUsers = reader["IdUsers"] is DBNull ? null : (int)reader["IdUsers"],
                Email = Convert.ToString(reader["Email"]),
                EmergencyEmail = Convert.ToString(reader["EmergencyEmail"]),
                EmergencyPhone = Convert.ToString(reader["EmergencyPhone"]),
                Street = Convert.ToString(reader["Street"]),
                IdCountry = reader["IdCountry"] is DBNull ? null : (int)reader["IdCountry"],
                StreetNumber = Convert.ToString(reader["StreetNumber"]),
                PostCode = Convert.ToString(reader["PostCode"]),
                Country = Convert.ToString(reader["Country"]),
                Phone = Convert.ToString(reader["Phone"]),
                GeneralPhone = Convert.ToString(reader["GeneralPhone"]),
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
                RegistreNational = Convert.ToString(reader["RegistreNational"]),
                EmployeeCardNumber = reader["EmployeeCardNumber"] is DBNull ? null : Convert.ToString(reader["EmployeeCardNumber"]),
                IdStatut = (int)reader["IdStatut"],
                IdInformation = (int)reader["IdInformation"],
                IdLanguage = (int)reader["IdLanguage"],
                IdUsers = reader["IdUsers"] is DBNull ? null : (int)reader["IdUsers"]
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
