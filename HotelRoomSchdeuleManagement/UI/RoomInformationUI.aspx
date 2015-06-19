<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomInformationUI.aspx.cs" Inherits="HotelRoomSchdeuleManagement.UI.RoomInformationUI" %>

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
        <nav>
            <ul>
                <li><a href="RoomInformationUI.aspx">Room Information</a></li>
                <li><a href="ScheduleRoomUI.aspx">Schedule Room</a></li>
                <li><a href="ViewRoomsUI.aspx">View Room</a></li>
                <li><a href="AboutUI.aspx">About</a></li>
            </ul>
        </nav>
        
        <div class="container">
            <h1>Room Information Details:</h1>
            
            <br/><br/>

            <table >
                <tr>
                    <td>
                    <asp:Label runat="server" >Room No.</asp:Label>
                        
                    </td>
                    <td>
                    <asp:TextBox runat="server" ID="RoomNoTextBox" Width="220"/> <br/><br/>
                        
                    </td>
                </tr>
                
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
                    <asp:Label runat="server" >Description</asp:Label>
                        
                    </td>
                    <td>
                    <asp:TextBox runat="server" ID="DescriptionTextBox" TextMode="MultiLine" Height="30" Width="220"/><br/><br/>
                        
                    </td>
                </tr>
                
                <tr>
                    <td></td>
                    <td><asp:Button runat="server" ID="SaveRoomInformationButton" Text="Save" OnClick="SaveRoomInformationButton_OnClick" /> <br/> </td>
                </tr>
                
                <tr>
                    <td></td>
                    <td><asp:Label runat="server" ID="label1"></asp:Label></td>
                </tr>

            </table>
            

        </div>
    
    </div>
    </form>
</body>
</html>
