<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScheduleRoomUI.aspx.cs" Inherits="HotelRoomSchdeuleManagement.UI.ScheduleRoomUI" %>

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
            <h1>Schedule Room:</h1>
            
            <br/><br/>

            <table >
                
                 <tr>
                    <td>
                    <asp:Label runat="server" >Select category</asp:Label>
                        
                    </td>
                    <td>
                    <asp:DropDownList runat="server" ID="CategoryDropDownList" AutoPostBack="True" Width="220"/><br/><br/>
                        
                    </td>
                </tr>
                
                
                <tr>
                    <td>
                    <asp:Label runat="server" >Room No.</asp:Label>
                        
                    </td>
                    <td>
                    <asp:DropDownList runat="server" ID="RoomNoDropDownList" AutoPostBack="True" Width="220"/> <br/><br/>
                        
                    </td>
                </tr>
                
                
                 <tr>
                    <td>
                    <asp:Label runat="server" >Select date</asp:Label>
                        
                    </td>
                    <td>
                    <asp:Calendar runat="server" ID="DateCalender"  SelectedDate="<%# DateTime.Today %>" Height="50" Width="250"/><br/><br/>
                        
                    </td>
                </tr>
                
                 <tr>
                    <td>
                    <asp:Label runat="server" >Booked by</asp:Label>
                        
                    </td>
                    <td>
                    <asp:TextBox runat="server" ID="NameTextBox" Width="220"/> <br/><br/>
                        
                    </td>
                </tr>
                

                 <tr>
                    <td>
                    <asp:Label runat="server" >Address</asp:Label>
                        
                    </td>
                    <td>
                    <asp:TextBox runat="server" ID="AddressTextBox" Width="220"/> <br/><br/>
                        
                    </td>
                </tr>
                

                <tr>
                    <td></td>
                    <td><asp:Button runat="server" ID="SaveScheduleInformationButton" Text="Save" OnClick="SaveScheduleInformationButton_OnClick" /> <br/> </td>
                </tr>
                
                <tr>
                    <td></td>
                    <td><asp:Label runat="server" ID="label2"></asp:Label></td>
                </tr>

            </table>
            

        </div>
    
    </div>

    </div>
    </form>
</body>
</html>
