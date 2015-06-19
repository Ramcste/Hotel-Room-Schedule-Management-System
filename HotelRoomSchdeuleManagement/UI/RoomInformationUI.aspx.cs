using System;
using HotelRoomSchdeuleManagement.BAL;
using HotelRoomSchdeuleManagement.DAL.DAO;

namespace HotelRoomSchdeuleManagement.UI
{
    public partial class RoomInformationUI : System.Web.UI.Page
    {
        RoomManager roomManager=new RoomManager();
        
        Room room=new Room();

        CategoryManager categoryManager=new CategoryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              GetDropDownlistLoaded();

            }

        }

        protected void SaveRoomInformationButton_OnClick(object sender, EventArgs e)
        {
            room.RoomNo = int.Parse(RoomNoTextBox.Text);
            room.CategoryId = int.Parse(CategoryDropDownList.SelectedValue);
            room.Description = DescriptionTextBox.Text;
            string message = roomManager.Insert(room);
            label1.Text = message;
            GetTextBoxesClear();
        }


        public void GetTextBoxesClear()
        {
            RoomNoTextBox.Text = "";
            DescriptionTextBox.Text = "";
        }
        public void GetDropDownlistLoaded()
        {
            CategoryDropDownList.DataSource = categoryManager.GetAllCategoryList();
            CategoryDropDownList.DataTextField = "Name";
            CategoryDropDownList.DataValueField = "Id";
            CategoryDropDownList.DataBind();
        }
    }
}