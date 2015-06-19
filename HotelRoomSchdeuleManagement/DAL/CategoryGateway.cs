using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using HotelRoomSchdeuleManagement.DAL.DAO;

namespace HotelRoomSchdeuleManagement.DAL
{
    public class CategoryGateway
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["HRSMConString"].ConnectionString;


        public List<Category> GetCategoryList()
        {
            List<Category> categories=new List<Category>();

            SqlConnection connection=new SqlConnection(connectionString);

            string query = "SELECT * FROM Category";

            connection.Open();

            SqlCommand command=new SqlCommand(query,connection);

            SqlDataReader reader = command.ExecuteReader();


            while (reader.Read())
            {
                Category category=new Category();

                category.Id = int.Parse(reader["Id"].ToString());
                category.Name = reader["Name"].ToString();
            
                categories.Add(category);
            }

            reader.Close();
            connection.Close();

            return categories;
        } 
    
    
    }
}