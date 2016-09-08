<%@ Title="Редактирование данных" Language="C#" AutoEventWireup="true" MasterPageFile="LinqExample.Master" CodeBehind="UpdateClient.aspx.cs" Inherits="LinqExample.UpdateClient" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <form id="form1" runat="server">
            <h3>Редактирование данных о клиенте</h3>
            <hr/>
            <div>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblName" runat="server" CssClass="col-sm-2">Имя</asp:Label> 
                        </td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server" CssClass="col-sm-2, form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblAddress" runat="server" CssClass="col-sm-2">Адрес</asp:Label> 
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="col-sm-2, form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br/>
                            <asp:Button ID="btnUpdate" runat="server" Text="Save" Width="82px" OnClick="btnUpdate_Click" CssClass="form-control" />
                        </td>
                        <td>
                            <br/>
                            <asp:Button ID="backToList" runat="server" Text="Back To List" Width="108px" OnClick="backToList_Click" CssClass="col-md-2, form-control" />
                        </td>
                    </tr>
                </table>
            </div>
        </form>    
    </div>
</asp:Content>