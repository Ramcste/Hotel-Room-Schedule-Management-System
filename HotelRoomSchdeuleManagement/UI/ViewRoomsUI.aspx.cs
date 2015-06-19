using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelRoomSchdeuleManagement.BAL;

namespace HotelRoomSchdeuleManagement.UI
{
    public partial class ViewRoomsUI : System.Web.UI.Page
    {
        RoomManager roomManager=new RoomManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void ShowAvailableRoomsOnSpecificDate_OnClick(object sender, EventArgs e)
        {
            string date = DateCalender.SelectedDate.ToString();


            ListOfAvailableRooms.DataSource = roomManager.GetAllAvailableRoomList(date);
            ListOfAvailableRooms.DataBind();
        }
    }
}