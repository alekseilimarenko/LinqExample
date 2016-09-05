<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LinqExample.Default" EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            width: 600px;
        }
        .auto-style1 {
            width: 670px;
        }
        .aling {
            border-width: thick;
            border-style: double;
            color: black;
            vertical-align: central;
        }
        
        .Header th, .Row td {
            padding: 10px;
            text-align: center;
        }
    
        .auto-style2 {
            margin-left: 120px;
        }
    
    </style>
</head>
<body style="width: 601px; height: 400px;">
    <form id="form1" runat="server" class="auto-style1">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AddCustomer.aspx">Add Client</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="getData" runat="server" NavigateUrl="~/Default.aspx">Получить данные</asp:HyperLink>
        <br />
        <br />
        <table>
            <tr>
                <td>
                    <label>Поиск </label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtSearch" runat="server" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        
        <asp:GridView ID="myGridView" runat="server" 
            OnSelectedIndexChanged="myGridView_SelectedIndexChanged" 
            Width="597px" OnRowCreated="myGridView_RowCreated" AutoGenerateColumns="False" DataKeyNames="UserId" DataSourceID="SqlDataSource1" 
            Font-Names="Trebuchet MS" Font-Size="Small" ForeColor="#333333" GridLines="None"
            RowStyle-CssClass="Row" Height="90px">
            
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#28a4fb" Font-Bold="True" ForeColor="White" CssClass="Header" />
            <AlternatingRowStyle BackColor="White" />

            <Columns>
                <asp:BoundField DataField="UserId" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="UserId"/>
                <asp:BoundField DataField="UserName" HeaderText=" Имя клиента" SortExpression="UserName" />
                <asp:BoundField DataField="UserEmail" HeaderText="Адрес" SortExpression="UserEmail" />
                <asp:BoundField DataField="Amount" HeaderText="Сумма по заказам" ReadOnly="True" SortExpression="Amount" />
                <asp:HyperLinkField DataNavigateUrlFields="UserId" DataNavigateUrlFormatString="UpdateClient.aspx?userId={0}" Text="Edit" />
                <asp:HyperLinkField DataNavigateUrlFields="UserId" DataNavigateUrlFormatString="DeleteConfirmed.aspx?userId={0}" Text="Delete" />
            </Columns>
        </asp:GridView>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UsersListConnectionString %>" 
            SelectCommand="SELECT Users.UserId, Users.UserName, Users.UserEmail, SUM(Orders.Amount) AS Amount 
            FROM Users LEFT OUTER JOIN Orders ON Users.UserId = Orders.UserId GROUP BY Users.UserId, Users.UserName, Users.UserEmail"></asp:SqlDataSource>
        
        <br />
        <asp:Label ID="lblResult" runat="server"></asp:Label>
        
    </form>
    </body>
</html>
