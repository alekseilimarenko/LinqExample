using System;
using System.Linq;

namespace LinqExample
{
    public partial class ClientDetailInfoPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var dbContext = new DBClassesDataContext();
            if (Request.QueryString["id"] == null) return;
            var q = (from o in dbContext.Orders
                where o.UserId == int.Parse(Request.QueryString["id"])
                select new
                {
                    o.OrderDate,
                    o.Amount
                }).ToList();

            DetailInfo.DataSource = q;
            DetailInfo.DataBind();
        }

        protected void btnBack_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}