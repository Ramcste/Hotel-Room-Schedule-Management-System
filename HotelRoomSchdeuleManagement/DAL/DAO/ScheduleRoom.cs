using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HotelRoomSchdeuleManagement.DAL.DAO
{
    public class ScheduleRoom
    {
        public int Id { get; set; }

        public int CategoryId { get; set; }

        public int RoomId { get; set; }

        public string BookedDate { get; set; }

        public string BookedBy { get; set; }
        public string Address { get; set; }

    }
}