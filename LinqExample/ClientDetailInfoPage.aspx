<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClientDetailInfoPage.aspx.cs" Inherits="LinqExample.ClientDetailInfoPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h3>Заказы выбранного клиента</h3>
    <div>
        <asp:GridView ID="DetailInfo" runat="server" Enabled="False"></asp:GridView>
    </div>
    <br/>
    <br/>    
    <div>
            <asp:Button ID="btnBack" runat="server" OnClick="btnBack_OnClick" Text="Back to List" Width="97px" />
    </div>
    </form>
</body>
</html>
