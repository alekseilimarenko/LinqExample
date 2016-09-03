using System;
using System.Linq;

namespace LinqExample
{
    public partial class UpdateClient : System.Web.UI.Page
    {
        readonly DBClassesDataContext _dbContext = new DBClassesDataContext();
        private string name, address;

        protected void Page_Load(object sender, EventArgs e)
        {
            name = txtName.Text;
            address = txtAddress.Text;

            if (Request.QueryString["UserId"] != null)
            {
                GetData();
            }
        }
        
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Session["name"] = name;
            Session["address"] = address;

            Response.Redirect("ConfirmUpdate.aspx?UserId=" + Request.QueryString["UserId"]);
        }

        private void GetData()
        {
            var q = (from user in _dbContext.Users
                    where user.UserId == int.Parse(Request.QueryString["UserId"])
                    select user).SingleOrDefault();

            txtName.Text = q.UserName;
            txtAddress.Text = q.UserEmail;
        }
    }
}