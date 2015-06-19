using System.Collections.Generic;
using System.Data;
using HotelRoomSchdeuleManagement.DAL;
using HotelRoomSchdeuleManagement.DAL.DAO;

namespace HotelRoomSchdeuleManagement.BAL
{
    public class RoomManager
    {
        RoomGateway roomGateway=new RoomGateway();


        public string Insert(Room room)
        {
            if (room.RoomNo.ToString() == "")
            {
                return "Enter a room no ";
            }
        
        
            else if (room.CategoryId.ToString()=="")
            {
                return "Select a category";
            }

            else if (roomGateway.HasThisRoomExists(room.RoomNo))
            {
                return "Room number must be unique";
            }

            else
            {
                int value = roomGateway.Insert(room);

                if (value > 0)
                {
                    return "Room Saved Successfully";
                }
                else
                {
                    return "Operation Failed";
                }
            }
        
        }



        public string InsertSchedule(ScheduleRoom scheduleRoom)
        {
            if (scheduleRoom.CategoryId.ToString() == "")
            {
                return "Select a category";
            }

            else if (scheduleRoom.RoomId.ToString() == "")
            {
                return "Select a room";
            }

            else if (scheduleRoom.BookedDate.ToString()=="")
            {
                return "Select a date";
            }

            else if (scheduleRoom.BookedBy == "")
            {
                return "Enter a person name";
            }
            else if (scheduleRoom.Address == "")
            {
                return "Enter a person permenet address";
            }

            else if (roomGateway.HasThisAlreadyBooked(scheduleRoom.RoomId,scheduleRoom.BookedDate))
            {
                return "This room is already booked on given date";
            }


            else
            {
                int value = roomGateway.InsertSchedule(scheduleRoom);

                if (value > 0)
                {
                    return "Room booked Successfully";
                }
                else
                {
                    return "Operation Failed";
                }
            }
            
        }


        public List<Room> GetAllRoomList()
        {
            return roomGateway.GetRoomList();
        } 

        public DataSet GetAllAvailableRoomList(string date)
        {
            return roomGateway.GetAvailableRooms(date);
        }
    
         
    
    }
}