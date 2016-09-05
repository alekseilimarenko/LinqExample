<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClientDetailInfoPage.aspx.cs" Inherits="LinqExample.ClientDetailInfoPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .Header th, .Row td {
            padding: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h3>Заказы выбранного клиента</h3>
    <div>
        <asp:GridView ID="DetailInfo" runat="server" Enabled="False" Font-Names="Trebuchet MS" Font-Size="Small" ForeColor="#333333" GridLines="None"
            RowStyle-CssClass="Row" Height="90px">
            
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#28a4fb" Font-Bold="True" ForeColor="White" CssClass="Header" />
            <AlternatingRowStyle BackColor="White"/> 

        </asp:GridView>
    </div>
    <br/>
    <br/>    
    <div>
            <asp:Button ID="btnBack" runat="server" OnClick="btnBack_OnClick" Text="Back to List" Width="97px" />
    </div>
    </form>
</body>
</html>
