using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using HotelRoomSchdeuleManagement.DAL.DAO;

namespace HotelRoomSchdeuleManagement.DAL
{
    public class RoomGateway
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["HRSMConString"].ConnectionString;


        public int Insert(Room room)
        {
            SqlConnection connection=new SqlConnection(connectionString);

            string query = "INSERT INTO Room VALUES('"+room.RoomNo+"','"+room.CategoryId+"','"+room.Description+"')";

            SqlCommand command=new SqlCommand(query,connection);

            connection.Open();
            int rowsAffected = command.ExecuteNonQuery();

            connection.Close();
            return rowsAffected;

        }

        public bool HasThisRoomExists(int roomno)
        {
            bool roomexists = false;
            SqlConnection connection = new SqlConnection(connectionString);

            string query="SELECT RoomNo FROM Room WHERE RoomNo='"+roomno+"' ";

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                roomexists = true;
                break;
            }

            reader.Close();
            connection.Close();
            
            return roomexists;
        }


        public List<Room> GetRoomList()
        {
            List<Room> rooms = new List<Room>();

            SqlConnection connection = new SqlConnection(connectionString);

            string query = "SELECT * FROM Room";

            connection.Open();

            SqlCommand command = new SqlCommand(query, connection);

            SqlDataReader reader = command.ExecuteReader();


            while (reader.Read())
            {
                Room room=new Room();

                room.Id = int.Parse(reader["Id"].ToString());
                
                room.RoomNo = int.Parse(reader["RoomNo"].ToString());

                room.CategoryId = int.Parse(reader["CategoryId"].ToString());

                room.Description = reader["Description"].ToString();

               rooms.Add(room);
            }

            reader.Close();
            connection.Close();

            return rooms;
        } 
    

        public int InsertSchedule(ScheduleRoom scheduleRoom)
        {
            SqlConnection connection = new SqlConnection(connectionString);

            string query = "INSERT INTO ScheduleRoom VALUES('"+scheduleRoom.CategoryId+"','"+scheduleRoom.RoomId+"','"+scheduleRoom.BookedDate+"','"+scheduleRoom.BookedBy+"','"+scheduleRoom.Address+"')";

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            int rowsAffected = command.ExecuteNonQuery();

            connection.Close();
            return rowsAffected;
    
        }

        public bool HasThisAlreadyBooked(int roomid,string date)
        {
            bool hasAlreadybooked = false;


            SqlConnection connection = new SqlConnection(connectionString);

            string query = "SELECT Room_Id,BookedDate FROM ScheduleRoom WHERE Room_Id='"+roomid+"' AND BookedDate='"+date+"'";

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
               hasAlreadybooked = true;
                break;
            }

            reader.Close();
            connection.Close();

            return hasAlreadybooked;
        }


        public ScheduleRoom GetScheduleRoomListByDate(string date)
        {

            ScheduleRoom scheduleRoom=new ScheduleRoom();

            SqlConnection connection = new SqlConnection(connectionString);

            string query = "SELECT * FROM ScheduleRoom WHERE BookedDate='"+date+"'";

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                scheduleRoom.Id = int.Parse(reader["Id"].ToString());
                scheduleRoom.CategoryId = int.Parse(reader["Category_Id"].ToString());
                scheduleRoom.RoomId = int.Parse(reader["Room_Id"].ToString());
                scheduleRoom.BookedDate = reader["BookedDate"].ToString();
                scheduleRoom.BookedBy = reader["BookedBy"].ToString();
                scheduleRoom.Address = reader["Address"].ToString();

            }

            reader.Close();
            connection.Close();

            return scheduleRoom;
        }


        public DataSet GetAvailableRooms(string date)
        {
            SqlConnection connection=new SqlConnection(connectionString);

            string query = "SELECT r.RoomNo,c.Name FROM Room as r join Category as c on r.CategoryId=c.Id join ScheduleRoom as s on r.Id=s.Room_Id WHERE s.BookedDate!='"+date+"'";

            SqlCommand command=new SqlCommand(query,connection);

            connection.Open();

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter();

            adapter.SelectCommand = command;
            adapter.Fill(ds);
            adapter.Dispose();
            command.Dispose();
            connection.Close();


            return ds;
        }
}
}
        


    
