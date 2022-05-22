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
                IdCountry = (int)reader["IdCountry"],
                Name = reader["Name"].ToString(),
                IdInformation = (int)reader["IdInformation"],
                IdUsers = reader["IdUsers"] is DBNull ? null : (int)reader["IdUsers"],
                Email = reader["Email"].ToString(),
                EmergencyEmail = reader["EmergencyEmail"].ToString(),
                EmergencyPhone = reader["EmergencyPhone"].ToString(),
                Street = reader["Street"].ToString(),
                StreetNumber = reader["StreetNumber"].ToString(),
                PostCode = reader["PostCode"].ToString(),
                Country = reader["Country"].ToString(),
                Phone = reader["Phone"].ToString(),
                GeneralPhone = reader["GeneralPhone"].ToString(),
            };
        }

        public static Employee ReadToAspData(this SqlDataReader reader)
        {
            
            return new Employee
            {
                Id = (int)reader["IdEmployee"],
                Name = reader["Name"].ToString(),
                FirstName = reader["firstName"].ToString(),
                BirthDate = reader["BirthDate"].ToString(),
                Vehicle = (bool)reader["Vehicle"],
                SecurityCard = reader["SecurityCardNumber"] is DBNull ? null : (int)reader["SecurityCardNumber"],
                EntryService = reader["EntryService"].ToString(),
                RegistreNational = reader["RegistreNational"].ToString(),
                EmployeeCardNumber = reader["EmployeeCardNumber"] is DBNull ? null : reader["EmployeeCardNumber"].ToString(),
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
