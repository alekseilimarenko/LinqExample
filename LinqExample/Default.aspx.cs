using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace LinqExample
{
    public partial class Default : System.Web.UI.Page
    {
        readonly DBClassesDataContext _dbContext = new DBClassesDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void myGridView_SelectedIndexChanged(object sender, EventArgs eventArgs)
        {
            GridViewRow row = myGridView.SelectedRow;
            if (row != null)
            {
                Response.Redirect( "ClientDetailInfoPage.aspx?id=" + int.Parse(row.Cells[0].Text));
            }
        }

        protected void myGridView_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor='pointer';";
                e.Row.ToolTip = "Click to select row";
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(myGridView, "Select$" + e.Row.RowIndex);
            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            var q = (from c in _dbContext.Users
                     join o in _dbContext.Orders
                     on c.UserId equals o.UserId into orders
                     where c.UserName.StartsWith(txtSearch.Text)
                     select new
                     {
                         c.UserId,
                         c.UserName,
                         c.UserEmail,
                         Amount = (from ord in _dbContext.Orders
                                         where c.UserId == ord.UserId
                                         select ord.Amount).Sum()
    
                     }).ToList();

            myGridView.DataSourceID = null;
            myGridView.DataSource = q;
            myGridView.DataBind();
        }
    }
}