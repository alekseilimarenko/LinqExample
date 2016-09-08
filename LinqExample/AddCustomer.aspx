<%@ Title="Добавление клиента" Language="C#" AutoEventWireup="true" MasterPageFile="LinqExample.Master" CodeBehind="AddCustomer.aspx.cs" Inherits="LinqExample.AddContact" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <form id="form1" runat="server">
            <h3>Добавление нового клиента</h3>
            <hr/>
            <div>
                <table>
                    <tr>
                        <td class="col-sm-3">
                            <asp:Label ID="lblName" runat="server">Имя</asp:Label>
                        </td>
                        <td class="col-sm-4">
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td class="col-sm-5">
                            <asp:Label ID="lblNameError" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-sm-3">
                            <asp:Label ID="lblAddress" runat="server">Адрес</asp:Label>
                        </td>
                        <td class="col-sm-4">
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td class="col-sm-5">
                            <asp:Label ID="lblAddressError" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-sm-3">
                            <asp:Label ID="lblOrderDate" runat="server">Дата заказа</asp:Label>
                        </td>
                        <td class="col-sm-4">
                            <asp:TextBox AutoPostBack="True" ID="txtOrderDate" OnTextChanged="txtOrderDate_OnTextChanged" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td class="col-sm-5">
                            <asp:Label ID="lblDateError" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-sm-3">
                            <asp:Label ID="lblAmount" runat="server">Сумма заказа</asp:Label>
                        </td>
                        <td class="col-sm-4">
                            <asp:TextBox AutoPostBack="True" ID="txtAmount" OnTextChanged="txtAmount_OnTextChanged" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td class="col-sm-5">
                            <asp:Label ID="lblAmountError" runat="server" CssClass="col-md-4"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br/>
                            <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="ADD" Width="63px" CssClass="col-md-2, form-control" />
                        </td>
                        <td>
                            <br/>
                            <asp:Button ID="backToList" runat="server" Text="Back To List" Width="108px" OnClick="backToList_Click" CssClass="col-md-2, form-control" />
                        </td>
                    </tr>
                </table>
            </div>
            <p class="col-sm-2">
                <asp:Label ID="lblResult" runat="server"></asp:Label>
            </p>
        </form>
    </div>    
</asp:Content>
