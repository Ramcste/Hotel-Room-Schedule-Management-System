using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelRoomSchdeuleManagement.BAL;
using HotelRoomSchdeuleManagement.DAL.DAO;

namespace HotelRoomSchdeuleManagement.UI
{
    public partial class ScheduleRoomUI : System.Web.UI.Page
    {
        CategoryManager categoryManager=new CategoryManager();

        RoomManager roomManager=new RoomManager();
        
        ScheduleRoom scheduleRoom=new ScheduleRoom();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetCategoryDropDownlistLoaded();
                GetRoomNoDropDownListLoaded();
            }
        }

        protected void SaveScheduleInformationButton_OnClick(object sender, EventArgs e)
        {
            scheduleRoom.CategoryId = int.Parse(CategoryDropDownList.SelectedValue);
            scheduleRoom.RoomId = int.Parse(RoomNoDropDownList.SelectedValue);
            scheduleRoom.BookedDate = DateTime.Today.ToString();
            scheduleRoom.BookedBy = NameTextBox.Text;
            scheduleRoom.Address = AddressTextBox.Text;

            string message = roomManager.InsertSchedule(scheduleRoom);

            label2.Text = message;

            GetTextBoxesClear();
        }

        public void GetCategoryDropDownlistLoaded()
        {
            CategoryDropDownList.DataSource = categoryManager.GetAllCategoryList();
            CategoryDropDownList.DataTextField = "Name";
            CategoryDropDownList.DataValueField = "Id";
            CategoryDropDownList.DataBind();
        }

        public void GetRoomNoDropDownListLoaded()
        {
            RoomNoDropDownList.DataSource = roomManager.GetAllRoomList();
            RoomNoDropDownList.DataTextField = "RoomNo";
            RoomNoDropDownList.DataValueField = "Id";
            RoomNoDropDownList.DataBind();
            
        }


        public void GetTextBoxesClear()
        {

            NameTextBox.Text = "";
            AddressTextBox.Text = "";
        }

    }
}