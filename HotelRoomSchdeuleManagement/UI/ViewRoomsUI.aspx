<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewRoomsUI.aspx.cs" Inherits="HotelRoomSchdeuleManagement.UI.ViewRoomsUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Style/reset.css" rel="stylesheet" />
    <link href="../Style/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="wrapper">
        
         <div class="wrapper">
        <nav>
            <ul>
                <li><a href="RoomInformationUI.aspx">Room Information</a></li>
                <li><a href="ScheduleRoomUI.aspx">Schedule Room</a></li>
                <li><a href="ViewRoomsUI.aspx">View Room</a></li>
                <li><a href="AboutUI.aspx">About</a></li>
            </ul>
        </nav>
        
        <div class="container">
            <h1>View Available Rooms on a Specific Date:</h1>
            
            <br/><br/>

            <table >
                
                 <tr>
                    <td>
                    <asp:Label runat="server" >Select date</asp:Label>
                        
                    </td>
                    <td>
                    <asp:Calendar runat="server" ID="DateCalender"  Height="183px" Width="255px"/><br/><br/>
                        
                    </td>
                     <td>&nbsp;&nbsp;<asp:Button runat="server" ID="ShowAvailableRoomsOnSpecificDate" Text="Show" OnClick="ShowAvailableRoomsOnSpecificDate_OnClick"/></td>

                </tr>
               
            </table>
            
            <div>
                <asp:GridView runat="server" ID="ListOfAvailableRooms" CellPadding="2" CellSpacing="2" AllowSorting="True" BorderWidth="1px" AutoGenerateColumns="False" Width="377px">
                    
                      
           <Columns>
               
					<asp:BoundField DataField="RoomNo" HeaderText="Room No"   />
					<asp:BoundField DataField="Name" HeaderText="Room Type"  />
					

           </Columns>
         

                </asp:GridView>
                
                
            </div>
            


        </div>
    

    </div>

    </div>
    </form>
</body>
</html>
