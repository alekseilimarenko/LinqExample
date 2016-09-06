using System;
using System.Globalization;

namespace LinqExample
{
    public partial class AddContact : System.Web.UI.Page
    {
        readonly ClientWebService _ws = new ClientWebService();

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                var resIns = _ws.GetClientIdByNameAndAddress(txtName.Text, txtAddress.Text);
                if (resIns > 0)
                {
                    lblResult.Text = "Клиент с данным именем и адресом уже присутствует в базе";
                }
                else
                {
                    var res = _ws.InsertClient(txtName.Text, txtAddress.Text, txtOrderDate.Text, int.Parse(txtAmount.Text));
                    if (res > 0)
                    {
                        txtName.Text = "";
                        txtAddress.Text = "";
                        lblResult.Text = "Данные добавлены в базу успешно";
                    }
                    else
                    {
                        lblResult.Text = "Данные отсутствуют";
                    }
                }

                Response.Redirect("Default.aspx");
            }
            catch (FormatException fex)
            {
                lblResult.Text = "неправильный формат даты или суммы заказа";
            }
        }

        protected void backToList_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}