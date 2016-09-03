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
            align-content:center
        }
    </style>
</head>
<body style="width: 601px; height: 234px;">
    <form id="form1" runat="server" class="auto-style1">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AddCustomer.aspx">Add Customer</asp:HyperLink>
        <br />
        <br />
        <br />
        
        <asp:GridView ID="myGridView" runat="server" 
            OnSelectedIndexChanged="myGridView_SelectedIndexChanged" 
            Width="597px" OnRowCreated="myGridView_RowCreated" AutoGenerateColumns="False" DataKeyNames="UserId" DataSourceID="SqlDataSource1" RowStyle="aling">
            <Columns>
                <asp:BoundField DataField="UserId" HeaderText="UserId" InsertVisible="False" ReadOnly="True" SortExpression="UserId"/>
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                <asp:BoundField DataField="UserEmail" HeaderText="UserEmail" SortExpression="UserEmail" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" ReadOnly="True" SortExpression="Amount"/>
                <asp:HyperLinkField DataNavigateUrlFields="UserId" DataNavigateUrlFormatString="UpdateClient.aspx?userId={0}" Text="Edit" />
                <asp:HyperLinkField DataNavigateUrlFields="UserId" DataNavigateUrlFormatString="DeleteClient.aspx?userId={0}" Text="Delete" />
            </Columns>
        </asp:GridView>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UsersListConnectionString %>" SelectCommand="SELECT Users.UserId, Users.UserName, Users.UserEmail, SUM(Orders.Amount) AS Amount FROM Users LEFT OUTER JOIN Orders ON Users.UserId = Orders.UserId GROUP BY Users.UserId, Users.UserName, Users.UserEmail"></asp:SqlDataSource>
        
    </form>
    </body>
</html>
