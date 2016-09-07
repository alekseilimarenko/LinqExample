using System;

namespace LinqExample
{
    public partial class AddContact : System.Web.UI.Page
    {
        private readonly ClientWebService _ws = new ClientWebService();

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            lblName.Text = "";
            lblAddress.Text = "";

            if (txtName.Text == "")
            {
                lblName.Text = "поле не может быть пустым";
                return;
            }

            if (txtAddress.Text == "")
            {
                lblAddress.Text = "поле не может быть пустым";
                return;
            }

            var orderDate  = txtOrderDate.Text ?? "";
            var amount = txtAmount.Text == "" ? 0 : int.Parse(txtAmount.Text);

            try
            {
                var resIns = _ws.GetClientIdByNameAndAddress(txtName.Text, txtAddress.Text);
                if (resIns > 0)
                {
                    lblResult.Text = "Клиент с данным именем и адресом уже присутствует в базе";
                }
                else
                {
                    var res = _ws.InsertClient(txtName.Text, txtAddress.Text, orderDate, amount);
                    if (res < 0)
                    {
                        lblResult.Text = "Данные отсутствуют";
                        return;
                    }
                }

                Response.Redirect("Default.aspx");
            }
            catch (FormatException)
            {
                lblResult.Text = "неправильный формат даты или суммы заказа";
            }
        }

        protected void txtOrderDate_OnTextChanged(object sender, EventArgs e)
        {
            lblDate.Text = "";

            DateTime dt;
            if (!DateTime.TryParse(txtOrderDate.Text, out dt))
            {
                lblDate.Text = "неверный формат даты";
            }
        }

        protected void txtAmount_OnTextChanged(object sender, EventArgs e)
        {
            lblAmount.Text = "";

            if (txtOrderDate.Text != "" && txtAmount.Text == "")
            {
                lblAmount.Text = "поле не может быть пустым";
                return;
            }

            if (!char.IsDigit(txtAmount.Text, 0))
            {
                lblAmount.Text = "ошибка ввода числа";
            }
        }

        protected void backToList_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}