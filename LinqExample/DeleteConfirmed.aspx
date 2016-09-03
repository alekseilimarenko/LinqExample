<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteConfirmed.aspx.cs" Inherits="LinqExample.DeleteConfirmed" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <h3> Подтверждаете удаление? </h3>
        <div>
            <asp:Button ID="btnYes" runat="server" Text="Да" OnClick="btnYes_Click" Width="60px" />
            &nbsp;
            <asp:Button ID="btnNo" runat="server" Text="Нет" OnClick="btnNo_Click" Width="60px" />
        </div>
    </form>
</body>
</html>
