using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HotelRoomSchdeuleManagement.DAL.DAO
{
    public class Room
    {
        public int Id { get; set; }

        public int  RoomNo { get; set; }

        public int CategoryId { get; set; }
        public string Description { get; set; }

        


    }
}