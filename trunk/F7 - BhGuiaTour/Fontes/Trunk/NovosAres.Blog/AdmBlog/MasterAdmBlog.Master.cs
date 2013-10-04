using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NovosAres.Blog.AdmBlog
{
    public partial class MasterAdmBlog : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbtnVoltarSite_Click(object sender, EventArgs e)
        {
            limpaSessãoLogoff();
        }

        protected void imgBtnVoltarSite_Click(object sender, ImageClickEventArgs e)
        {
            limpaSessãoLogoff();
        }

        protected void imgBtnLinkBlog_Click(object sender, ImageClickEventArgs e)
        {
            limpaSessãoLogoff();
        }

        private void limpaSessãoLogoff()
        {
            Session.RemoveAll();
            Response.Redirect("~/Default.aspx");
        }

        protected void lbtnCadPost_Click(object sender, EventArgs e)
        {
            Response.Redirect("admBlog.aspx");
        }

        protected void imgBtnCadPost_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("admBlog.aspx");
        }
    }
}