<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateClient.aspx.cs" Inherits="LinqExample.UpdateClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    
        <h3>Редактирование данных о клиенте</h3>
        
        <div class="table">
            <table>
                <tr>
                    <td>
                        Client Name
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server"  class="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Address
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server"  class="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnUpdate" runat="server" Text="Save" Width="82px" OnClick="btnUpdate_Click" CssClass="form-control"/>
                    </td>       
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
