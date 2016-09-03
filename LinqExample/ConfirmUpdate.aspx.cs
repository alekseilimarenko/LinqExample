using System;
using System.Linq;

namespace LinqExample
{
    public partial class ConfirmUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            var dbContext = new DBClassesDataContext();

            var user = from u in dbContext.Users
                       where u.UserId == int.Parse(Request.QueryString["UserId"])
                       select u;

            foreach (User item in user)
            {
                item.UserName = Session["name"].ToString();
                item.UserEmail = Session["address"].ToString();
            }

            dbContext.SubmitChanges();

            Response.Redirect("Default.aspx");
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}