using System;
using System.Linq;

namespace LinqExample
{
    public partial class UpdateClient : System.Web.UI.Page
    {
        readonly DBClassesDataContext _dbContext = new DBClassesDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            GetData();
        }
        
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            var user = from u in _dbContext.Users
                where u.UserId == int.Parse(Request.QueryString["UserId"])
                select u;

            foreach (User item in user)
            {
                item.UserName = txtName.Text;
                item.UserEmail = txtAddress.Text;
            }

            _dbContext.SubmitChanges();

            GetData();
        }

        private void GetData()
        {
            var q = from user in _dbContext.Users
                    where user.UserId == int.Parse(Request.QueryString["UserId"])
                    select user;

            foreach (User user in q)
            {
                txtName.Text = user.UserName;
                txtAddress.Text = user.UserEmail;
            }
        }
    }
}