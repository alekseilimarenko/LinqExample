<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LinqExample.Default" EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            width: 280px;
        }
        .auto-style1 {
            width: 442px;
        }
    </style>
</head>
<body style="width: 289px; height: 199px;">
    <form id="form1" runat="server" class="auto-style1">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AddCustomer.aspx">Add Customer</asp:HyperLink>
        <br />
        <br />
        <br />
        
        <asp:GridView ID="myGridView" runat="server" 
            OnSelectedIndexChanged="myGridView_SelectedIndexChanged" 
            Width="268px" OnRowCreated="myGridView_RowCreated">
        </asp:GridView>
        
    </form>
    </body>
</html>
