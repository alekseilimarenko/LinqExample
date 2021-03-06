﻿using System;
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

            var user = (from u in dbContext.Users
                       where u.UserId == int.Parse(Request.QueryString["UserId"])
                       select u).SingleOrDefault();
            try
            {
                if (user != null)
                {
                    user.UserName = Session["name"].ToString();
                    user.UserEmail = Session["address"].ToString();
                }

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