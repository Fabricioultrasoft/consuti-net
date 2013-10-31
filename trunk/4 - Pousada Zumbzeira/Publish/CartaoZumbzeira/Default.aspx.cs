using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pousadaZ.VeraoQuente
{
    public partial class Default1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Title = ".:Pousada Zumbzeira:.";
            if (!IsPostBack)
            {
                Session["abriuModal"] = "sim";
            }
        }

        protected void SairImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/");
        }
    }
}