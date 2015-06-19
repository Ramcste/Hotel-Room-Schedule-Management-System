using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HotelRoomSchdeuleManagement.DAL;
using HotelRoomSchdeuleManagement.DAL.DAO;

namespace HotelRoomSchdeuleManagement.BAL
{
    public class CategoryManager
    {
        CategoryGateway categoryGateway=new CategoryGateway();

        public List<Category> GetAllCategoryList()
        {
            return categoryGateway.GetCategoryList();
        } 


    }
}