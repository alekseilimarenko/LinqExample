<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="LinqExample.AddContact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Добавление клиента</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table>
            <tr>
                <td>
                    Имя
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Адрес
                </td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Дата заказа
                </td>
                <td>
                    <asp:TextBox ID="txtOrderDate" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Сумма заказа
                </td>
                <td>
                    <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr></tr>
            <tr>
                <td>
                    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="ADD" Width="63px" />
                </td>
                <td>
                    <asp:Button ID="backToList" runat="server" Text="Back To List" Width="108px" OnClick="backToList_Click" />
                </td>
            </tr>
        </table>
    </div>
        <p>
            <asp:Label ID="lblResult" runat="server"></asp:Label>
        </p>
    </form>
</body>
</html>
