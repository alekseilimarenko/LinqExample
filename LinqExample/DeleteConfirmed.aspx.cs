using System;
using System.Linq;

namespace LinqExample
{
    public partial class DeleteConfirmed : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            var dbContext = new DBClassesDataContext();

            var userOrders = (from ord in dbContext.Orders
                                    where ord.UserId == int.Parse(Request.QueryString["UserId"])
                                    select ord).ToList();

            var user = (from u in dbContext.Users
                                    where u.UserId == int.Parse(Request.QueryString["UserId"])
                                    select u).SingleOrDefault();

            try
            {
                dbContext.Orders.DeleteAllOnSubmit(userOrders);
                dbContext.Users.DeleteOnSubmit(user);
                dbContext.SubmitChanges();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            Response.Redirect("Default.aspx");
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}